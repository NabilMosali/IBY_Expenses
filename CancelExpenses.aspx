<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="CancelExpenses.aspx.cs" Inherits="CancelExpenses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style37 {
        width: 80%;
    }
        .auto-style19 {
            color: #000000;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="auto-style37">
    <tr>
        <td dir="rtl" style="border: thin solid #800000; color: #FFFFFF; background-color: #990000;">عمل كنسل للمصاريف المطلوبة</td>
    </tr>
    <tr>
        <td dir="rtl" style="border: thin solid #800000">
                <asp:ImageButton ID="ImageButtonReject" runat="server" Height="75px" ImageUrl="~/Images/reject.jpg" OnClick="ImageButtonReject_Click" Width="75px" />

                            </td>
    </tr>
    <tr>
        <td dir="rtl" style="border: thin solid #800000">عمل كنسل للمصروف</td>
    </tr>
    <tr>
        <td dir="rtl" style="border: thin solid #800000">
                    <span class="auto-style19" __designer:mapid="2964">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" ShowFooter="True"  AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Req_ID,Main_Bdgt_ID,EXPN_AMT" DataSourceID="SqlDataSource2" PageSize="20" style="font-size: small" Width="100%">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="True" OnCheckedChanged="chkAll_CheckedChanged" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chekactive" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Req_sqe" HeaderText="رقم الطلب" InsertVisible="False" ReadOnly="True" SortExpression="Req_sqe"  />
                            <asp:BoundField DataField="Branch_code" HeaderText="الفرع" SortExpression="Branch_code" />
                            <asp:BoundField DataField="Main_Bdgt_ID" HeaderText="كود الميزاينة" SortExpression="كود الميزانية" />
                            <asp:BoundField DataField="EXPN_ID" HeaderText="كود المصروف" SortExpression="كود المصروف" />
                            <asp:BoundField DataField="NoteBdgt" HeaderText="المصروف" SortExpression="NoteBdgt" />
                            <asp:BoundField DataField="EXPN_TYpe" HeaderText="نوع المصروف" SortExpression="EXPN_TYpe" />
                            <%--<asp:BoundField DataField="EXPN_Account" HeaderText="رقم الحساب" SortExpression="EXPN_Account" />--%>


                                 <asp:TemplateField HeaderText="رقم الحساب">
                                <ItemTemplate>
                                    <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("EXPN_Account") %>' />
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lbltxttotal" runat="server" Text="اجمالي المصروف" />
                                </FooterTemplate>
                            </asp:TemplateField>





                   

                            <asp:TemplateField HeaderText="المبلغ">
                                <ItemTemplate>
                                    <asp:Label ID="lblamount" runat="server" Text='<%# Eval("EXPN_AMT") %>' />
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" />
                                </FooterTemplate>
                            </asp:TemplateField>



                         <%--   <asp:BoundField DataField="EXPN_AMT" HeaderText="المبلغ " SortExpression="EXPN_AMT">
                            <ItemStyle BackColor="Yellow" />
                            </asp:BoundField>--%>

                            <asp:BoundField DataField="EXPN_Currency" HeaderText="العملة" SortExpression="EXPN_Currency" />
                            <asp:BoundField DataField="EXPN_DESC" HeaderText="البيان" SortExpression="EXPN_DESC" />
                            <asp:BoundField DataField="EXPN_date" DataFormatString="{0:MM/dd/yyyy}" HeaderText="تاريخ الطلب" SortExpression="EXPN_date" />
                            <asp:BoundField DataField="EXPN_Statuse" HeaderText="حالة الطلب" SortExpression="EXPN_Statuse">
                            <ItemStyle BackColor="Yellow" />
                            </asp:BoundField>
                            <asp:BoundField DataField="User_ID" HeaderText="موظف الفرع" SortExpression="User_ID" />
                            <asp:TemplateField HeaderText="المرفقات" SortExpression="EXPN_Attchments">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EXPN_Attchments") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("EXPN_Attchments") %>'>المرفق</asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="notes" HeaderText="ملاحظات" SortExpression="notes" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                    </span>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IBY_ExpensesConnectionString %>" SelectCommand="select * from GeneralEXP_RECO where EXPN_Statuse=@EXPN_Statuse and Branch_code=@Branch_code">
       
          
        
    <%--      <FilterParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="%" Name="Branch_code" PropertyName="SelectedValue" />
        </FilterParameters>
       --%>
          
        
        <SelectParameters>
            <asp:Parameter DefaultValue="HD_Reject" Name="EXPN_Statuse" Type="String" ConvertEmptyStringToNull="false" />

             
            <asp:SessionParameter DefaultValue="" Name="Branch_code" SessionField="Branch_code" />

             
        </SelectParameters>
       
       
    </asp:SqlDataSource>

                            </td>
    </tr>
    <tr>
        <td dir="rtl" style="border: thin solid #800000">&nbsp;</td>
    </tr>
    <tr>
        <td dir="rtl" style="border: thin solid #800000">&nbsp;</td>
    </tr>
    <tr>
        <td dir="rtl" style="border: thin solid #800000">&nbsp;</td>
    </tr>
</table>
</asp:Content>

