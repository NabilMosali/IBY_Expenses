using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateLabel.Text = DateTime.Now.ToString("dd/MM/yyyy");
        UserNameLabel.Text = Session["User_id"].ToString();
        NameLabel.Text = Session["User_Name"].ToString();
        L_Branch.Text = Session["Branch_code"].ToString();
        PrivlageLabel.Text = Session["Privlage_id"].ToString();



        //if (string.IsNullOrEmpty(Session["ManagmentName"] as string))
        //{
        //    Session["ManagmentName"] = L_Branch.Text ;
        //}



        //else
        //{
        //    Session["ManagmentName"] = Session["ManagmentName"].ToString();
        //}
        
 

 
    

      
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Login.aspx");
    }

 
}