using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CancelExpenses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void chkAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox ch = (CheckBox)sender;
        foreach (GridViewRow row in GridView1.Rows)
        {

            CheckBox c = (CheckBox)GridView1.Rows[row.RowIndex].FindControl("chekactive");
            c.Checked = ch.Checked;
        }
    }


    protected void ImageButtonReject_Click(object sender, ImageClickEventArgs e)
    {

        foreach (GridViewRow row in GridView1.Rows)
        {

            CheckBox c = (CheckBox)GridView1.Rows[row.RowIndex].FindControl("chekactive");
            string id = GridView1.DataKeys[row.RowIndex].Value.ToString();
            if (c.Checked)
            {
                //code update 
                string r = "Cancel";
                // string o = "قيد المعالجة";
                //string t = "الخدمات المركزية";
                //string n = "تم التسليم";
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["IBY_ExpensesConnectionString"].ConnectionString;


                using (SqlConnection connection = new SqlConnection(connectionString))
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = @"UPDATE [GeneralEXP_RECO] SET [EXPN_Statuse]=@EXPN_Statuse ,[Auth_userServies]=@Auth_userServies,[ConfirmDateServies]=Getdate()
                                       WHERE [Req_ID] = @Req_ID";






                    command.Parameters.AddWithValue("@EXPN_Statuse", r);
                    command.Parameters.AddWithValue("@Auth_userServies", Session["User_Name"].ToString());
                    command.Parameters.AddWithValue("@ConfirmDateServies", DateTime.Now.ToString("MM/dd/yyyy"));
                    command.Parameters.AddWithValue("@Req_ID", GridView1.DataKeys[row.RowIndex].Value.ToString());

                    connection.Open();

                    command.ExecuteNonQuery();


                    float EXPNEAMT = float.Parse(GridView1.DataKeys[row.RowIndex].Values[2].ToString());

                    //    SqlCommand Auth_balance_apv = new SqlCommand(@"update Main_Budgate SET Used_balance= Used_balance + " + EXPNEAMT + " WHERE Main_Bdgt_ID=@Main_Bdgt_ID   ", connection);

                    //  Auth_balance.Parameters.AddWithValue("@Branch_code", Session["Branch_code"].ToString());
                    //   Auth_balance_apv.Parameters.AddWithValue("@Main_Bdgt_ID", GridView1.DataKeys[row.RowIndex].Values[1].ToString());


                    //  Auth_balance_apv.ExecuteNonQuery();


                    //    SqlCommand cmd_Used_balance = new SqlCommand(@"UPDATE  Main_Budgate SET Auth_balance =Auth_balance-" + EXPNEAMT + " WHERE Main_Bdgt_ID=@Main_Bdgt_ID", connection);

                    // cmd_Used_balance.Parameters.AddWithValue("@Branch_code", Session["Branch_code"].ToString());
                    //  cmd_Used_balance.Parameters.AddWithValue("@Main_Bdgt_ID", GridView1.DataKeys[row.RowIndex].Values[1].ToString());




                    // cmd_Used_balance.ExecuteNonQuery();

                    SqlCommand cmd_Cancel = new SqlCommand(@"UPDATE  Main_Budgate SET Auth_balance =Auth_balance -" + EXPNEAMT + " WHERE Main_Bdgt_ID=@Main_Bdgt_ID and  Branch_code=@Branch_code", connection);

                    cmd_Cancel.Parameters.AddWithValue("@Branch_code", Session["Branch_code"].ToString());
                    cmd_Cancel.Parameters.AddWithValue("@Main_Bdgt_ID", GridView1.DataKeys[row.RowIndex].Values[1].ToString());




                    cmd_Cancel.ExecuteNonQuery();




                    connection.Close();
                }

            }



        }

        GridView1.DataBind();
    }
}