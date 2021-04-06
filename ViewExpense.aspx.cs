using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewExpense : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BranchLabel.Text = Session["Branch_code"].ToString();
        DateLabel.Text = DateTime.Now.ToString("dd/MM/yyyy");
    }


    protected void GridView2_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        GridView2.DataBind();

    }

    protected void OnDataBound(object sender, EventArgs e)
    {

        DataTable dt = ((DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty)).Table;
        lblTotal.Text = "عدد المصاريف المطلوبة من الفرع : " + GridView2.Rows.Count;
    }






    double total = 0;

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            GridView2.AllowPaging = false;
            // gvEmp.DataBind();
            //  total += DataBinder.Eval(e.Row.DataItem, "GtAmount");

            total += (double)(DataBinder.Eval(e.Row.DataItem, "EXPN_AMT"));




        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblamount = (Label)e.Row.FindControl("lblTotal");
            lblamount.Text = total.ToString();
            TLabe.Text = total.ToString();
            //   CLabel.Text = DropDownList1.SelectedItem.ToString();

            //  TextBox1.Text = total.ToString();
        }
    }
}