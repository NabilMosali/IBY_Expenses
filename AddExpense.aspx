<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="AddExpense.aspx.cs" Inherits="AddExpense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style35 {
            width: 80%;
        }
     
        .auto-style37 {
            text-align: center;
        }
        .auto-style38 {
            width: 50%;
        }
    .auto-style39 {
        width: 60%;
        text-align: right;
    }
    .auto-style40 {
            width: 50%;
            text-align: center;
        }
        .auto-style41 {
            width: 60%;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="auto-style35" dir="rtl">
        <tr>
            <td colspan="7" style="border: thin solid #800000; color: #FFFFFF; background-color: #408080;">الموازنة الحالية للفرع</td>
        </tr>
        <tr>
            <td colspan="7" style="border: thin solid #800000">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Vertical" Width="100%" PageSize="15" DataKeyNames="Main_Bdgt_ID">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="Req_ID" HeaderText="Main_Bdgt_ID" SortExpression="Main_Bdgt_ID" Visible="False" />
                        <asp:BoundField DataField="Branch_code" HeaderText="الفرع" SortExpression="Branch_code" />
                        <asp:BoundField DataField="Note" HeaderText="المصروف" SortExpression="Note" />
                        <asp:BoundField HeaderText="نوع المصروف" DataField="EXPNS_Type" SortExpression="EXPNS_Type" />
                        <asp:BoundField DataField="EXPNS_account" HeaderText="رقم الحساب" SortExpression="EXPNS_account" />
                        <asp:BoundField DataField="Year_Limit" HeaderText="السقف السنوي" SortExpression="Year_Limit" />
                        <asp:BoundField DataField="Quart_Limit" HeaderText="السقف الربعي" SortExpression="Quart_Limit" />
                        <asp:BoundField DataField="Month_Limit" HeaderText="السقف الشهري" SortExpression="Month_Limit" />
                        <asp:BoundField DataField="Used_balance" HeaderText="الرصيد المستخدم" SortExpression="Used_balance" />
                        <asp:BoundField DataField="Auth_balance" HeaderText="الرصيد المعلق" SortExpression="Auth_balance" />
                        <asp:BoundField DataField="Available_Balance" HeaderText="المبلغ المتاح" SortExpression="Available_Balance" />
                        <asp:BoundField DataField="Last_Req_date" HeaderText="تاريخ اخر طلب" SortExpression="Last_Req_date" DataFormatString="{0:MM/dd/yyyy}" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IBY_ExpensesConnectionString %>" SelectCommand="SELECT Main_Budgate.Main_Bdgt_ID,Main_Budgate.Year_Limit, Main_Budgate.Quart_Limit, Main_Budgate.Month_Limit, Main_Budgate.Used_balance, Main_Budgate.Auth_balance,(Main_Budgate.Year_Limit-( Main_Budgate.Used_balance+Main_Budgate.Auth_balance)) AS Available_Balance , Main_Budgate.Feq_requst, Main_Budgate.Last_Req_date, Main_Budgate.Branch_code 
,Main_Budgate.Note, Expenses.EXPNS_account,Expenses.EXPNS_Type
FROM  Main_Budgate RIGHT OUTER JOIN Expenses ON Main_Budgate.Exp_ID = Expenses.EXPNS_ID
WHERE Branch_code=@Branch_code">
                    <SelectParameters>
                        <asp:SessionParameter Name="Branch_code" SessionField="Branch_code" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="7" style="border: thin solid #800000; color: #FFFFFF; background-color: #990000;">اضافة مصروف جديد</td>
        </tr>
        <tr class="auto-style33">
            <td style="border: thin solid #800000" colspan="7">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" style="color: #FF0000" />
            </td>
        </tr>
        <tr class="auto-style33">
            <td style="border: thin solid #800000" colspan="7">
                <asp:Label ID="msgLabel" runat="server" style="color: #FF0000" ></asp:Label>
            </td>
        </tr>
        <tr class="auto-style33">
            <td style="border: thin solid #800000" colspan="2">
                الفرع :&nbsp;&nbsp;
                <asp:Label ID="BranchLabel" runat="server"  style="color: #FF0000"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; موظف الفرع :
                <asp:Label ID="UseridLabel" runat="server" style="color: #FF0000" ></asp:Label>
            </td>
            <td style="border: thin solid #800000" colspan="3">
                حالة الطلب :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="StateLabel" runat="server" style="color: #FF0000" Text="NEW"></asp:Label>
            </td>
            <td style="border: thin solid #800000" colspan="2">
                رقم المصروف&nbsp; :&nbsp;&nbsp;
                <asp:Label ID="ReqsqeLabel" runat="server" style="color: #FF0000" ></asp:Label>
            </td>
        </tr>
        <tr class="auto-style33">
            <td style="border: thin solid #800000" class="auto-style38" colspan="3">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style37">المصروف</td>
                                <td class="auto-style41">
                                    <asp:DropDownList ID="NoteBdgt_IDdrop" runat="server" AutoPostBack="True" onselectedindexchanged="NoteBdgt_IDdrop_SelectedIndexChanged" Width="187px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="NoteBdgt_IDdrop" ErrorMessage="الرجاء اختيار المصروف" InitialValue="--Select--" style="color: #FF0000">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style37">نوع المصروف</td>
                                <td class="auto-style41">
                                    <asp:DropDownList ID="EXPNS_Type" runat="server" AutoPostBack="True" onselectedindexchanged="EXPNS_Type_SelectedIndexChanged" Width="187px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="EXPNS_Type" ErrorMessage="الرجاء اختيار نوع المصروف" InitialValue="--Select--" style="color: #FF0000">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style37">رقم الحساب</td>
                                <td class="auto-style41">
                                    <asp:DropDownList ID="EXPNS_account" runat="server" AutoPostBack="True" onselectedindexchanged="EXPNS_account_SelectedIndexChanged" Width="187px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="EXPNS_account" ErrorMessage="الرجاء اختيار رقم الحساب" InitialValue="--Select--" style="color: #FF0000">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style37">كود ميزانية الفرع</td>
                                <td class="auto-style41">
                                    <asp:DropDownList ID="MainBdgt_IDdrop" runat="server" AutoPostBack="True" onselectedindexchanged="MainBdgt_IDdrop_SelectedIndexChanged" Width="187px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="MainBdgt_IDdrop" ErrorMessage="الرجاء اختيار كود الميزانية" InitialValue="--Select--" style="color: #FF0000">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style37">كود المصروف</td>
                                <td class="auto-style41">
                                    <asp:DropDownList ID="EXPNS_ID" runat="server" Width="187px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="EXPNS_ID" ErrorMessage="الرجاء اختيار كود المصروف" InitialValue="--Select--" style="color: #FF0000">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td style="border: thin solid #800000" class="auto-style38">
                البيان</td>
            <td style="border: thin solid #800000; text-align: right;" class="auto-style38" colspan="3">
                <asp:TextBox ID="DescripTextBox" runat="server" Height="150px" Rows="6" TextMode="MultiLine" Width="450px"></asp:TextBox>
            </td>
        </tr>
        <tr class="auto-style33">
            <td style="border: thin solid #800000" class="auto-style40">مبلغ المصروف</td>
            <td class="auto-style36" style="border: thin solid #800000; text-align: right;" colspan="2">
                <asp:TextBox ID="AmountTextBox" runat="server" style="margin-bottom: 0px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="AmountTextBox" ErrorMessage="الرجاء ادخال المبلغ" style="color: #FF0000">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style36" style="border: thin solid #800000" colspan="3">
                تاريخ المصروف </td>
            <td class="auto-style36" style="border: thin solid #800000">
                <asp:TextBox ID="DateExpnTextBox" runat="server" TextMode="Date"  ></asp:TextBox>
            </td>
        </tr>
        <tr class="auto-style33">
            <td style="border: thin solid #800000" class="auto-style40">العملة :
                </td>
            <td class="auto-style36" style="border: thin solid #800000; text-align: right;" colspan="2">
                <asp:DropDownList ID="CurncyDropDownList" runat="server" style="font-weight: 700">
                    <asp:ListItem>اختار العملة</asp:ListItem>
                    <asp:ListItem>YER</asp:ListItem>
                    <asp:ListItem>USD</asp:ListItem>
                </asp:DropDownList>
                &nbsp;
                </td>
            <td class="auto-style36" style="border: thin solid #800000" colspan="4">
                المرفقات :
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr class="auto-style33">
            <td style="border: thin solid #800000" class="auto-style40">ملاحظات<td class="auto-style39" style="border: thin solid #800000" colspan="6">
                <asp:TextBox ID="NoteTextBox" runat="server" Height="85px" Rows="4" TextMode="MultiLine" Width="750px"></asp:TextBox>
            </td>
        </tr>
        <tr class="auto-style33">
            <td colspan="7" style="border: thin solid #800000">
                <asp:Button ID="SaveButton" runat="server" style="font-weight: 700; color: #FFFFFF; background-color: #408080;" Text="اضافة" Width="120px" OnClick="SaveButton_Click" />
                <asp:Button ID="Button2" runat="server" CausesValidation="False" style="font-weight: 700; color: #FFFFFF; background-color: #990000;" Text="الغاء" Width="120px" />
            </td>
        </tr>
    </table>
</asp:Content>

