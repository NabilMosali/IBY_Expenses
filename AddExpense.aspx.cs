using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddExpense : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IBY_ExpensesConnectionString"].ConnectionString);
    string S;
    string S1;
    //Get file type by Extension  
    private string GetFileExtension(string fileExtension)
    {
        switch (fileExtension.ToLower())
        {
            case ".docx":
            case ".doc":
                return "Microsoft Word Document";
            case ".xlsx":
            case ".xls":
                return "Microsoft Excel Document";
            case ".txt":
                return "Text Document";
            case ".pdf":
                return "PDF";
            case ".jpg":
            case ".png":
            case ".gif":
                return "Image";
            default:
                return "غير معروف";
        }
    }


    ////////////////////////////////////////////////////////
    protected void Page_Load(object sender, EventArgs e)
    {






        GridView1.DataBind();
        BranchLabel.Text = Session["Branch_code"].ToString();
        UseridLabel.Text = Session["User_id"].ToString();
        DateExpnTextBox.Text = DateTime.Now.ToString("yyyy-MM-dd");
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
        // GridView1.DataBind();


        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IBY_ExpensesConnectionString"].ConnectionString);
        SqlCommand cmd8 = new SqlCommand(string.Format(@"select CONVERT(int,isnull(MAX(Req_sqe)+1,1)) from GeneralEXP_RECO
                                                          where EXPN_date like '%' +  CONVERT(nvarchar,(select year(getdate()  )))+ '%' "), conn);
        conn.Open();
        SqlDataReader sdr4 = cmd8.ExecuteReader();
        while (sdr4.Read() == true)
            ReqsqeLabel.Text = sdr4[0].ToString();



        conn.Close();


    }



    protected void NoteBdgt_IDdrop_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int EXPNSType = Convert.ToInt32(NoteBdgt_IDdrop.SelectedValue);
            //Select all States corresponding to the selected Country
            SqlDataAdapter adp = new SqlDataAdapter("select * from BudgetExpenses where Branch_code='" + Session["Branch_code"].ToString() + "'  and Main_Bdgt_ID=" + EXPNSType, con);
            //SqlDataAdapter adp2 = new SqlDataAdapter("select Expenses.*,Main_Budgate.* from Expenses,Main_Budgate where Expenses.EXPNS_ID=Main_Budgate.EXPNS_I=" + EXPNSType +" andMain_Budgate , con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            EXPNS_Type.DataSource = ds;
            EXPNS_Type.DataTextField = "EXPNS_Type";
            EXPNS_Type.DataValueField = "Main_Bdgt_ID";

            EXPNS_Type.DataBind();
            EXPNS_Type.Items.Insert(0, new ListItem("--Select--", "0"));
            //If State is not selected then clear City DropDownList also
            if (EXPNS_Type.SelectedValue == "0")
            {
                EXPNS_account.Items.Clear();
                EXPNS_account.Items.Insert(0, new ListItem("--Select--", "0"));
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
    protected void EXPNS_Type_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int EXPNSaccount = Convert.ToInt32(EXPNS_Type.SelectedValue);
            //Select all States corresponding to the selected Country
            SqlDataAdapter adp = new SqlDataAdapter("select * from BudgetExpenses where Branch_code='" + Session["Branch_code"].ToString() + "'  and Main_Bdgt_ID=" + EXPNSaccount, con);
            //SqlDataAdapter adp2 = new SqlDataAdapter("select Expenses.*,Main_Budgate.* from Expenses,Main_Budgate where Expenses.EXPNS_ID=Main_Budgate.EXPNS_I=" + EXPNSType +" andMain_Budgate , con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            EXPNS_account.DataSource = ds;
            EXPNS_account.DataTextField = "EXPNS_account";
            EXPNS_account.DataValueField = "Main_Bdgt_ID";

            EXPNS_account.DataBind();
            EXPNS_account.Items.Insert(0, new ListItem("--Select--", "0"));
            //If State is not selected then clear City DropDownList also
            if (EXPNS_Type.SelectedValue == "0")
            {
                EXPNS_account.Items.Clear();
                EXPNS_account.Items.Insert(0, new ListItem("--Select--", "0"));
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

    protected void EXPNS_account_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int MainBdgtID = Convert.ToInt32(EXPNS_account.SelectedValue);
            //Select all States corresponding to the selected Country
            SqlDataAdapter adp = new SqlDataAdapter("select * from BudgetExpenses where Branch_code='" + Session["Branch_code"].ToString() + "'  and Main_Bdgt_ID=" + MainBdgtID, con);
            //SqlDataAdapter adp2 = new SqlDataAdapter("select Expenses.*,Main_Budgate.* from Expenses,Main_Budgate where Expenses.EXPNS_ID=Main_Budgate.EXPNS_I=" + EXPNSType +" andMain_Budgate , con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            MainBdgt_IDdrop.DataSource = ds;
            MainBdgt_IDdrop.DataTextField = "Main_Bdgt_ID";
            MainBdgt_IDdrop.DataValueField = "Main_Bdgt_ID";

            MainBdgt_IDdrop.DataBind();
            MainBdgt_IDdrop.Items.Insert(0, new ListItem("--Select--", "0"));
            //If State is not selected then clear City DropDownList also
            if (EXPNS_account.SelectedValue == "0")
            {
                MainBdgt_IDdrop.Items.Clear();
                MainBdgt_IDdrop.Items.Insert(0, new ListItem("--Select--", "0"));
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


    //protected void MainBdgt_IDdrop_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        int ExpID = Convert.ToInt32(MainBdgt_IDdrop.SelectedValue);
    //        //Select all States corresponding to the selected Country
    //        SqlDataAdapter adp = new SqlDataAdapter("select * from BudgetExpenses where Branch_code='" + Session["Branch_code"].ToString() + "'  and Main_Bdgt_ID=" + ExpID, con);
    //        //SqlDataAdapter adp2 = new SqlDataAdapter("select Expenses.*,Main_Budgate.* from Expenses,Main_Budgate where Expenses.EXPNS_ID=Main_Budgate.EXPNS_I=" + EXPNSType +" andMain_Budgate , con);
    //        DataSet ds = new DataSet();
    //        adp.Fill(ds);
    //        MainBdgt_IDdrop.DataSource = ds;
    //        MainBdgt_IDdrop.DataTextField = "Exp_ID";
    //        MainBdgt_IDdrop.DataValueField = "Main_Bdgt_ID";

    //        MainBdgt_IDdrop.DataBind();
    //        MainBdgt_IDdrop.Items.Insert(0, new ListItem("--Select--", "0"));
    //        //If State is not selected then clear City DropDownList also
    //        if (MainBdgt_IDdrop.SelectedValue == "0")
    //        {
    //            EXPNS_ID.Items.Clear();
    //            EXPNS_ID.Items.Insert(0, new ListItem("--Select--", "0"));
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        //Printing any exception if occcured.
    //        Response.Write("Error occured: " + ex.Message.ToString());
    //    }
    //    finally
    //    {
    //        //Close the connection
    //        con.Close();
    //    }
    //}


    protected void MainBdgt_IDdrop_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int ExpID = Convert.ToInt32(MainBdgt_IDdrop.SelectedValue);
            //Select all Cities corresponding to the selected State
            SqlDataAdapter adp = new SqlDataAdapter("select * from BudgetExpenses where Branch_code='" + Session["Branch_code"].ToString() + "'  and Main_Bdgt_ID=" + ExpID, con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            EXPNS_ID.DataSource = ds;
            EXPNS_ID.DataTextField = "Exp_ID";
            EXPNS_ID.DataValueField = "Main_Bdgt_ID";
            EXPNS_ID.DataBind();
            EXPNS_ID.Items.Insert(0, new ListItem("--Select--", "0"));
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



    protected void BindContriesDropDownList()
    {
        try
        {
            SqlDataAdapter adp = new SqlDataAdapter("select * from BudgetExpenses where Branch_code='" + Session["Branch_code"].ToString() + "' ", con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            NoteBdgt_IDdrop.DataSource = ds;
            NoteBdgt_IDdrop.DataTextField = "Note";
            NoteBdgt_IDdrop.DataValueField = "Main_Bdgt_ID";
            NoteBdgt_IDdrop.DataBind();

            NoteBdgt_IDdrop.Items.Insert(0, new ListItem("--Select--", "0"));
            EXPNS_Type.Items.Insert(0, new ListItem("--Select--", "0"));
            EXPNS_account.Items.Insert(0, new ListItem("--Select--", "0"));
            MainBdgt_IDdrop.Items.Insert(0, new ListItem("--Select--", "0"));
            EXPNS_ID.Items.Insert(0, new ListItem("--Select--", "0"));

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
    protected void SaveButton_Click(object sender, EventArgs e)
    {
        try
        {

            string FileName = string.Empty;
            //string FileSize = string.Empty;
            string extension = string.Empty;
            string FilePath = string.Empty;

            if (FileUpload1.HasFile)
            {
                extension = Path.GetExtension(FileUpload1.FileName);
                FileName = FileUpload1.PostedFile.FileName;
                //FileSize = FileName.Length.ToString() + " Bytes";
                //strFileName = DateTime.Now.ToString("yyyyMMddHHmmss") + FileUpload1.FileName;  
                FileUpload1.PostedFile.SaveAs(Server.MapPath(@"~/Filess/" + FileName.Trim()));
                FilePath = @"~/Filess/" + FileName.Trim().ToString();
            }
            else
            {
                msgLabel.Text = "Plase upload the file";
                msgLabel.ForeColor = Color.Red;
                return;
            }


            //Query to Check Budget

            // SqlCommand cmd0 = new SqlCommand(string.Format(@"SELECT Branch_code,EXPN_AMT, Available_Balance, CASE WHEN Available_Balance < = '" + this.AmountTextBox.Text + "'  THEN 'رصيدك المتاح لايسمح الرجاء التواصل مع الخدمات المركزية' WHEN  Available_Balance > =  '" + this.AmountTextBox.Text + "' THEN 'رصيدك المتاح يسمح '  END msg FROM GenralExpenses Where Branch_code='0002' "), con);

            //   SqlCommand cmd0 = new SqlCommand(string.Format(@"SELECT Branch_code,Available_Balance, CASE WHEN Available_Balance < = '" + this.AmountTextBox.Text + "'  THEN '-1' WHEN  Available_Balance > =  '" + this.AmountTextBox.Text + "' THEN '1 '  END msg FROM Main_Budgate Where Branch_code='0003' "), con);

            SqlCommand cmd0 = new SqlCommand(string.Format(@"SELECT Branch_code,Available_Balance,Year_Limit,Used_balance,Auth_balance, CASE WHEN(Year_Limit-(Used_balance+Auth_balance))  < ='" + this.AmountTextBox.Text + "'  THEN '-1' WHEN (Year_Limit-(Used_balance+Auth_balance)) >   '" + this.AmountTextBox.Text + "' THEN '1 '  END msg FROM Main_Budgate Where  Main_Bdgt_ID=@Main_Bdgt_ID and  Branch_code='" + Session["Branch_code"].ToString() + "'  "), con);
            cmd0.Parameters.AddWithValue("@Main_Bdgt_ID", MainBdgt_IDdrop.SelectedItem.ToString());
            //float monthLimit = float.Parse(GridView1.DataKeys[row.RowIndex].Values[2].ToString());

            SqlDataReader sdr2 = cmd0.ExecuteReader();
            DataTable dtt = new DataTable();
            // sdr2.Fill(dtt);

            // sdr2.Close();

            if (sdr2.HasRows)
            {
                while (sdr2.Read() == true)
                    S = sdr2["msg"].ToString();

                //ok
                sdr2.Close();
                if (S == "-1")
                {
                    msgLabel.Text = " رصيدك المتاح لايسمح الرجاء التواصل مع الخدمات المركزية";

                    return;
                }
            //     SqlCommand cmd1 = new SqlCommand(string.Format(@"SELECT Branch_code,Available_Balance,month_Limit,Used_balance,Auth_balance, CASE WHEN(month_Limit-(Used_balance+Auth_balance))  < '" + this.AmountTextBox.Text + "'  THEN '-1' WHEN (month_Limit-(Used_balance+Auth_balance)) >=   '" + this.AmountTextBox.Text + "' THEN '1 '  END msg1 FROM Main_Budgate Where Main_Bdgt_ID=@Main_Bdgt_ID and Branch_code='" + Session["Branch_code"].ToString() + "'  "), con);


           // SELECT  Branch_code,Available_Balance,Year_Limit,month_Limit, CASE WHEN(Year_Limit/12 )  < '" + this.AmountTextBox.Text + "'   THEN '-1' WHEN(Year_Limit/12 )  > = '" + this.AmountTextBox.Text + "' THEN '1 '  END msg1 

           SqlCommand cmd1 = new SqlCommand(string.Format(@"SELECT Main_Bdgt_ID,Branch_code,Available_Balance,Year_Limit,month_Limit, CASE WHEN(Year_Limit/12 ) * MONTH(GETDATE())- Used_balance <  '" + this.AmountTextBox.Text + "'  THEN '-1' WHEN(Year_Limit/12 )* MONTH(GETDATE())-Used_balance > = '" + this.AmountTextBox.Text + "' THEN '1 '  END msg1 FROM Main_Budgate Where  Main_Bdgt_ID=@Main_Bdgt_ID and  Branch_code='" + Session["Branch_code"].ToString() + "'  "), con);

       
            //    THEN WHEN '" + this.AmountTextBox.Text + "' > =  Available_Balance



       






                //////    Limt monthly

                cmd1.Parameters.AddWithValue("@Main_Bdgt_ID", MainBdgt_IDdrop.SelectedItem.ToString());
                SqlDataReader sdr6 = cmd1.ExecuteReader();
                DataTable dttt = new DataTable();
                // sdr2.Fill(dtt);

                // sdr2.Close();

                if (sdr6.HasRows)
                {
                    while (sdr6.Read() == true)
                        S1 = sdr6["msg1"].ToString();

                    //ok
                    sdr6.Close();
                    if (S1 == "-1")
                    {
                        msgLabel.Text = " رصيدك الشهري المتاح لايسمح الرجاء التواصل مع الخدمات المركزية";

                        return;
                    }






                    //msgLabel.Text = " رصيدك المتاح لايسمح الرجاء التواصل مع الخدمات المركزية";

                    ///// Insert


                    SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["IBY_ExpensesConnectionString"].ConnectionString);
                    SqlCommand cmd9 = new SqlCommand(string.Format(@"select CONVERT(int,isnull(MAX(Req_sqe)+1,1)) from GeneralEXP_RECO
where EXPN_date like '%' +  CONVERT(nvarchar,(select year(getdate()  )))+ '%' "), connn);
                    connn.Open();
                    SqlDataReader sdr5 = cmd9.ExecuteReader();
                    while (sdr5.Read() == true)
                        ReqsqeLabel.Text = sdr5[0].ToString();

                    //  GridView1.DataBind();


                    connn.Close();


                    SqlCommand cmd = new SqlCommand(@"INSERT INTO GeneralEXP_RECO(Req_sqe,Main_Bdgt_ID,NoteBdgt,EXPN_ID,EXPN_TYpe,Branch_code,EXPN_AMT,EXPN_Currency,EXPN_Account,EXPN_DESC,EXPN_Statuse,EXPN_date,User_ID,Entry_date,EXPN_Attchments,notes,Last_Req_date)
                                                                     VALUES (@Req_sqe,@Main_Bdgt_ID,@NoteBdgt,@EXPN_ID,@EXPN_TYpe,@Branch_code,@EXPN_AMT,@EXPN_Currency,@EXPN_Account,@EXPN_DESC ,@EXPN_Statuse,@EXPN_date,@User_ID,@Entry_date,@EXPN_Attchments,@notes,@Last_Req_date)", con);

                    cmd.Parameters.AddWithValue("@Req_sqe", ReqsqeLabel.Text);
                    cmd.Parameters.AddWithValue("@Main_Bdgt_ID", MainBdgt_IDdrop.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@NoteBdgt", NoteBdgt_IDdrop.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@EXPN_ID", EXPNS_ID.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@EXPN_TYpe", EXPNS_Type.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@EXPN_AMT", AmountTextBox.Text);


                    cmd.Parameters.AddWithValue("@EXPN_Currency", CurncyDropDownList.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@EXPN_Account", EXPNS_account.SelectedItem.ToString());

                    cmd.Parameters.AddWithValue("@EXPN_DESC", DescripTextBox.Text);
                    cmd.Parameters.AddWithValue("@EXPN_Statuse", StateLabel.Text);
                    cmd.Parameters.AddWithValue("@EXPN_date", DateExpnTextBox.Text);
                    cmd.Parameters.AddWithValue("@Entry_date", DateExpnTextBox.Text);
                    cmd.Parameters.AddWithValue("@Last_Req_date", DateExpnTextBox.Text);


                    cmd.Parameters.AddWithValue("@EXPN_Attchments", FilePath);

                    cmd.Parameters.AddWithValue("@notes", NoteTextBox.Text);





                    cmd.Parameters.AddWithValue("@Branch_Code", Session["Branch_code"].ToString());
                    cmd.Parameters.AddWithValue("@User_ID", Session["User_id"].ToString());




                    cmd.ExecuteNonQuery();

                    //  SqlCommand cmd1 = new SqlCommand(string.Format(@"SELECT Branch_code,Available_Balance,month_Limit,Used_balance,Auth_balance, CASE WHEN(month_Limit-(Used_balance+Auth_balance))
                    //
                    SqlCommand cmd_Budget = new SqlCommand(@"update Main_Budgate set Auth_balance=Auth_balance+ '" + this.AmountTextBox.Text + "' Where Main_Bdgt_ID=@Main_Bdgt_ID and  Branch_code=@Branch_code", con);
                    cmd_Budget.Parameters.AddWithValue("@Main_Bdgt_ID", MainBdgt_IDdrop.SelectedItem.ToString());
                    cmd_Budget.Parameters.AddWithValue("@Branch_code", Session["Branch_code"].ToString());
                    cmd_Budget.ExecuteNonQuery();

                    // con.Close();
                    msgLabel.Text = "تمت عملية الاضافة بنجاح";
                    Response.Redirect("ViewExpense.aspx");
                    GridView1.DataBind();
                    //User_NOTextBox.AutoPostBack = true;

                }

            }

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