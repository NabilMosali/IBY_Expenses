using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserNameTextBox.Focus();




    }
    protected void btnSubmi_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IBY_ExpensesConnectionString"].ConnectionString);

        SqlCommand cmd = new SqlCommand("select * from EXP_USERS where USER_ID=@USER_ID and USER_PASS=@USER_PASS ", con);

        cmd.Parameters.AddWithValue("@USER_ID", UserNameTextBox.Text);
        cmd.Parameters.AddWithValue("@USER_PASS", PasswordTextBox.Text);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        con.Open();

        cmd.ExecuteNonQuery();

        con.Close();
        if (dt.Rows.Count > 0)
        {
            if ((dt.Rows[0].Field<string>(1) == PasswordTextBox.Text) && (dt.Rows[0].Field<Boolean>(7) == true))
            {

                Session["User_id"] = dt.Rows[0].Field<string>(0);
                Session["User_Name"] = dt.Rows[0].Field<string>(2);
                //Session["id"] = dt.Rows["User_ID"];
                Session["Branch_code"] = dt.Rows[0].Field<string>(3);
              
                Session["Privlage_id"] = dt.Rows[0].Field<Int32>(6);

                //Session["User_Privlage"] = dt.Rows[0].Field<string>(4);
                //Session["Privlage_Name"] = dt.Rows[0].Field<Int32>(4);

              // Session["ManagmentName"] = dt.Rows[0].Field<string>(4);
                //if (dt.Rows[0].Field<string>(3).Equals("0001"))
                //{

                //    if (!string.IsNullOrEmpty(Session["ManagmentName"] as string))
                //    {
                       
                //    }
                 
                //}

               
                    //if (dt.Rows[0].Field<string>(4) != null)
                    //{
                    //    Session["ManagmentName"] = " ";
                    //}
                 
       
                //Users Privlage 


                if (Session["Privlage_id"].Equals(5))
                {
                    Response.Redirect("Admin/Branchies.aspx");
                }
                else if
                  (Session["Privlage_id"].Equals(1))
                {
                    Response.Redirect("AddExpense.aspx");
                }
                else

                    if (Session["Privlage_id"].Equals(2))
                    {
                        Response.Redirect("Manager/Approve_Expenses.aspx");
                    }

                    else if
                     (Session["Privlage_id"].Equals(3))
                    {
                        Response.Redirect("Serivies/AllExpenses.aspx");
                    }

                    //else if
                    //  (Session["Privlage_id"].Equals(5))
                    //{
                    //    Response.Redirect("Stores/Close_Orders.aspx");
                    //}
                  





            }
        }
        else
        {
            msgLabel.Text = "اسم المستخدم او كلمة المرور خاطئه";
            msgLabel.ForeColor = System.Drawing.Color.Red;

        }
    }
}