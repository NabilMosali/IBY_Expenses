using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class test : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IBY_ExpensesConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        //Checking Connection State and opening if closed
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        if (!Page.IsPostBack)
        {
            //Call countries DropDownList on page load event
            BindContriesDropDownList();
        }
    }
    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int CountryId = Convert.ToInt32(ddlCountry.SelectedValue);
            //Select all States corresponding to the selected Country
            SqlDataAdapter adp = new SqlDataAdapter("select * from Expenses where EXPNS_ID=" + CountryId, con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            ddlState.DataSource = ds;
            ddlState.DataTextField = "EXPNS_account";
            ddlState.DataValueField = "EXPNS_ID";
            ddlState.DataBind();
            ddlState.Items.Insert(0, new ListItem("--Select--", "0"));
            //If State is not selected then clear City DropDownList also
            if (ddlState.SelectedValue == "0")
            {
                ddlCity.Items.Clear();
                ddlCity.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }
        catch (Exception ex)
        {
            //Printing any exception if occcured.
            Response.Write("Error occured: " + ex.Message.ToString());
        }
        finally
        {
            //Close the connection
            con.Close();
        }
    }
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int StateId = Convert.ToInt32(ddlState.SelectedValue);
            //Select all Cities corresponding to the selected State
            SqlDataAdapter adp = new SqlDataAdapter("select * from Expenses where EXPNS_ID=" + StateId, con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            ddlCity.DataSource = ds;
            ddlCity.DataTextField = "EXPNS_ID";
            ddlCity.DataValueField = "EXPNS_ID";
            ddlCity.DataBind();
            ddlCity.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        catch (Exception ex)
        {
            Response.Write("Error occured : " + ex.Message.ToString());
        }
        finally
        {
            con.Close();
        }
    }


    //protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        int StateId = Convert.ToInt32(ddlState.SelectedValue);
    //        //Select all Cities corresponding to the selected State
    //        SqlDataAdapter adp = new SqlDataAdapter("select * from Expenses where EXPNS_ID=" + StateId, con);
    //        DataSet ds = new DataSet();
    //        adp.Fill(ds);
    //        ddlCity.DataSource = ds;
    //      //  Label2.Text = ds;
           
    //        ddlCity.DataTextField = "EXPNS_ID";
    //        ddlCity.DataValueField = "EXPNS_ID";
    //        ddlCity.DataBind();
    //        ddlCity.Items.Insert(0, new ListItem("--Select--", "0"));
    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write("Error occured : " + ex.Message.ToString());
    //    }
    //    finally
    //    {
    //        con.Close();
    //    }
    //}

    protected void BindContriesDropDownList()
    {
        try
        {
            SqlDataAdapter adp = new SqlDataAdapter("select * from Expenses", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            ddlCountry.DataSource = ds;
            ddlCountry.DataTextField = "EXPNS_Type";
            ddlCountry.DataValueField = "EXPNS_ID";
            ddlCountry.DataBind();
            ddlCountry.Items.Insert(0, new ListItem("--Select--", "0"));
            ddlState.Items.Insert(0, new ListItem("--Select--", "0"));
            ddlCity.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        catch (Exception ex)
        {
            Response.Write("Error occured : " + ex.Message.ToString());
        }
        finally
        {
            con.Close();
        }
    }

}