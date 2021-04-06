<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="ViewExpense.aspx.cs" Inherits="ViewExpense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style35 {
            width: 95%;
        }
        .auto-style19 {
            color: #000000;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="auto-style35" dir="rtl">
        <tr>
            <td style="color: #FFFFFF; background-color: #990000">عرض مصاريف الفرع </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True"  AutoGenerateColumns="False" BackColor="White" BorderColor="#999999"  BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Req_ID" DataSourceID="SqlDataSource1" GridLines="Vertical" Width="100%">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="Req_ID" HeaderText="Req_ID" InsertVisible="False" ReadOnly="True" SortExpression="Req_ID" Visible="False" />
                        <asp:BoundField DataField="Req_sqe" HeaderText="رقم الطلب" SortExpression="Req_sqe" />
                        <asp:BoundField DataField="EXPN_ID" HeaderText="رقم المصروف" SortExpression="EXPN_ID" />
                        <asp:BoundField DataField="Branch_code" HeaderText="الفرع" SortExpression="Branch_code" />
                        <asp:BoundField DataField="EXPN_TYpe" HeaderText="نوع المصروف" SortExpression="EXPN_TYpe" />
                        <asp:BoundField DataField="EXPN_Account" HeaderText="رقم الحساب" SortExpression="EXPN_Account" />
                        <asp:BoundField DataField="EXPN_date" HeaderText="تاريخ الطلب" SortExpression="EXPN_date" DataFormatString="{0:MM/dd/yyyy}"/>
                        <asp:BoundField DataField="EXPN_AMT" HeaderText="المبلغ" SortExpression="EXPN_AMT" />
                        <asp:BoundField DataField="EXPN_Currency" HeaderText="العملة" SortExpression="EXPN_Currency" />
                        <asp:BoundField DataField="EXPN_DESC" HeaderText="البيان" SortExpression="EXPN_DESC" />
                        <asp:BoundField DataField="EXPN_Statuse" HeaderText="حالة الطلب" SortExpression="EXPN_Statuse" />
                        <asp:BoundField DataField="User_ID" HeaderText="موظف الفرع" SortExpression="User_ID" />
                        <asp:BoundField DataField="Entry_date" HeaderText="تاريخ الادخال" SortExpression="Entry_date" DataFormatString="{0:MM/dd/yyyy}"/>
                        <asp:BoundField DataField="Auth_user" HeaderText="المدير المباشر" SortExpression="Auth_user" />
                        <asp:TemplateField HeaderText="المرفقات" SortExpression="EXPN_Attchments">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EXPN_Attchments") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                             
                                <asp:HyperLink ID="HyperLink2" runat="server" Target = "_Blank" NavigateUrl='<%# Bind("EXPN_Attchments") %>'>المرفق</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="notes" HeaderText="ملاحظات" SortExpression="notes" />
                        <asp:CommandField ButtonType="Button" CancelText="الغاء" DeleteText="حذف" EditText="تحرير" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تحديث" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IBY_ExpensesConnectionString %>" DeleteCommand="DELETE FROM [GeneralEXP_RECO] WHERE [Req_ID] = @Req_ID" InsertCommand="INSERT INTO [GeneralEXP_RECO] ([EXPN_ID], [EXPN_TYpe], [Branch_code], [EXPN_AMT], [EXPN_Currency], [EXPN_Account], [EXPN_DESC], [EXPN_Statuse], [EXPN_date], [User_ID], [Entry_date], [Auth_user], [EXPN_Attchments], [notes]) VALUES (@EXPN_ID, @EXPN_TYpe, @Branch_code, @EXPN_AMT, @EXPN_Currency, @EXPN_Account, @EXPN_DESC, @EXPN_Statuse, @EXPN_date, @User_ID, @Entry_date, @Auth_user, @EXPN_Attchments, @notes)" SelectCommand="SELECT * FROM [GeneralEXP_RECO] where EXPN_Statuse=@EXPN_Statuse   and Branch_code=@Branch_code" UpdateCommand="UPDATE [GeneralEXP_RECO] SET [EXPN_ID] = @EXPN_ID, [EXPN_TYpe] = @EXPN_TYpe, [Branch_code] = @Branch_code, [EXPN_AMT] = @EXPN_AMT, [EXPN_Currency] = @EXPN_Currency, [EXPN_Account] = @EXPN_Account, [EXPN_DESC] = @EXPN_DESC, [EXPN_Statuse] = @EXPN_Statuse, [EXPN_date] = @EXPN_date, [User_ID] = @User_ID, [Entry_date] = @Entry_date, [Auth_user] = @Auth_user, [EXPN_Attchments] = @EXPN_Attchments, [notes] = @notes WHERE [Req_ID] = @Req_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="Req_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="EXPN_ID" Type="Int32" />
                        <asp:Parameter Name="EXPN_TYpe" Type="String" />
                        <asp:Parameter Name="Branch_code" Type="String" />
                        <asp:Parameter Name="EXPN_AMT" Type="Decimal" />
                        <asp:Parameter Name="EXPN_Currency" Type="String" />
                        <asp:Parameter Name="EXPN_Account" Type="String" />
                        <asp:Parameter Name="EXPN_DESC" Type="String" />
                        <asp:Parameter Name="EXPN_Statuse" Type="String" />
                        <asp:Parameter DbType="Date" Name="EXPN_date" />
                        <asp:Parameter Name="User_ID" Type="String" />
                        <asp:Parameter DbType="Date" Name="Entry_date" />
                        <asp:Parameter Name="Auth_user" Type="String" />
                        <asp:Parameter Name="EXPN_Attchments" Type="String" />
                        <asp:Parameter Name="notes" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="Branch_code" SessionField="Branch_code" />
                        <asp:Parameter DefaultValue="NEW" Name="EXPN_Statuse" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="EXPN_ID" Type="Int32" />
                        <asp:Parameter Name="EXPN_TYpe" Type="String" />
                        <asp:Parameter Name="Branch_code" Type="String" />
                        <asp:Parameter Name="EXPN_AMT" Type="Decimal" />
                        <asp:Parameter Name="EXPN_Currency" Type="String" />
                        <asp:Parameter Name="EXPN_Account" Type="String" />
                        <asp:Parameter Name="EXPN_DESC" Type="String" />
                        <asp:Parameter Name="EXPN_Statuse" Type="String" />
                        <asp:Parameter DbType="Date" Name="EXPN_date" />
                        <asp:Parameter Name="User_ID" Type="String" />
                        <asp:Parameter DbType="Date" Name="Entry_date" />
                        <asp:Parameter Name="Auth_user" Type="String" />
                        <asp:Parameter Name="EXPN_Attchments" Type="String" />
                        <asp:Parameter Name="notes" Type="String" />
                        <asp:Parameter Name="Req_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="color: #FFFFFF; background-color: #990000">
                عرض مصاريف الفرع المعتمدة والمرفوضة من المدير المباشر</td>
        </tr>
        <tr>
            <td style="color: #000000; background-color: #FFFFFF">
                    <span class="auto-style19" __designer:mapid="24bc">التاريخ : &nbsp;
                    <asp:Label ID="DateLabel" runat="server" style="color: #FF0000"></asp:Label>
                    &nbsp; |&nbsp; الفرع :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="BranchLabel" runat="server" style="color: #FF0000"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblTotal" runat="server" style="color: #FF0000"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; اجمالي مصروف الفرع&nbsp; :&nbsp;&nbsp;
                    <asp:Label ID="TLabe" runat="server" style="color: #FF0000"></asp:Label>
                    </span>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" ShowFooter="true" OnDataBound="OnDataBound"  onrowdatabound="GridView2_RowDataBound"  OnRowUpdated="GridView2_RowUpdated"  AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Req_ID" DataSourceID="SqlDataSource2" Width="100%" ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Req_ID" HeaderText="Req_ID" InsertVisible="False" ReadOnly="True" SortExpression="Req_ID" Visible="False" />
                        <asp:BoundField DataField="Req_sqe" HeaderText="رقم الطلب" SortExpression="Req_sqe" />
                        <asp:BoundField DataField="EXPN_ID" HeaderText="رقم المصروف" SortExpression="EXPN_ID" />
                        <asp:BoundField DataField="Branch_code" HeaderText="الفرع" SortExpression="Branch_code" />
                        <asp:BoundField DataField="EXPN_TYpe" HeaderText="نوع المصروف" SortExpression="EXPN_TYpe" />

                         <asp:BoundField DataField="EXPN_date" HeaderText="تاريخ الطلب" SortExpression="EXPN_date" DataFormatString="{0:MM/dd/yyyy}"/>

             <%--           <asp:BoundField DataField="EXPN_Account" HeaderText="رقم الحساب" SortExpression="EXPN_Account" />
                       
                        <asp:BoundField DataField="EXPN_AMT" HeaderText="المبلغ" SortExpression="EXPN_AMT" />--%>


                        
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






                        <asp:BoundField DataField="EXPN_Currency" HeaderText="العملة" SortExpression="EXPN_Currency" />
                        <asp:BoundField DataField="EXPN_DESC" HeaderText="البيان" SortExpression="EXPN_DESC" />
                        <asp:BoundField DataField="EXPN_Statuse" HeaderText="حالة الطلب" SortExpression="EXPN_Statuse" />
                        <asp:BoundField DataField="User_ID" HeaderText="موظف الفرع" SortExpression="User_ID" />
                        <asp:BoundField DataField="Entry_date" HeaderText="تاريخ الادخال" SortExpression="Entry_date" DataFormatString="{0:MM/dd/yyyy}"/>
                        <asp:BoundField DataField="Auth_user" HeaderText="المدير المباشر" SortExpression="Auth_user" />
                        <asp:TemplateField HeaderText="المرفقات" SortExpression="EXPN_Attchments">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EXPN_Attchments") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                             
                                <asp:HyperLink ID="HyperLink3" runat="server" Target = "_Blank" NavigateUrl='<%# Bind("EXPN_Attchments") %>'>المرفق</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="notes" HeaderText="ملاحظات" SortExpression="notes" />
                        <asp:CommandField ButtonType="Button" CancelText="الغاء" DeleteText="حذف" EditText="تحرير" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تحديث" />
                    </Columns>
                    <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IBY_ExpensesConnectionString %>" DeleteCommand="DELETE FROM [GeneralEXP_RECO] WHERE [Req_ID] = @Req_ID" InsertCommand="INSERT INTO [GeneralEXP_RECO] ([EXPN_ID], [EXPN_TYpe], [Branch_code], [EXPN_AMT], [EXPN_Currency], [EXPN_Account], [EXPN_DESC], [EXPN_Statuse], [EXPN_date], [User_ID], [Entry_date], [Auth_user], [EXPN_Attchments], [notes]) VALUES (@EXPN_ID, @EXPN_TYpe, @Branch_code, @EXPN_AMT, @EXPN_Currency, @EXPN_Account, @EXPN_DESC, @EXPN_Statuse, @EXPN_date, @User_ID, @Entry_date, @Auth_user, @EXPN_Attchments, @notes)" SelectCommand="SELECT * FROM [GeneralEXP_RECO] where ((Branch_code=@Branch_code) and  (EXPN_Statuse=@EXPN_Statuse OR  EXPN_Statuse=@EXPN_Statuse1))  " UpdateCommand="UPDATE [GeneralEXP_RECO] SET [EXPN_ID] = @EXPN_ID, [EXPN_TYpe] = @EXPN_TYpe, [Branch_code] = @Branch_code, [EXPN_AMT] = @EXPN_AMT, [EXPN_Currency] = @EXPN_Currency, [EXPN_Account] = @EXPN_Account, [EXPN_DESC] = @EXPN_DESC, [EXPN_Statuse] = @EXPN_Statuse, [EXPN_date] = @EXPN_date, [User_ID] = @User_ID, [Entry_date] = @Entry_date, [Auth_user] = @Auth_user, [EXPN_Attchments] = @EXPN_Attchments, [notes] = @notes WHERE [Req_ID] = @Req_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="Req_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="EXPN_ID" Type="Int32" />
                        <asp:Parameter Name="EXPN_TYpe" Type="String" />
                        <asp:Parameter Name="Branch_code" Type="String" />
                        <asp:Parameter Name="EXPN_AMT" Type="Decimal" />
                        <asp:Parameter Name="EXPN_Currency" Type="String" />
                        <asp:Parameter Name="EXPN_Account" Type="String" />
                        <asp:Parameter Name="EXPN_DESC" Type="String" />
                        <asp:Parameter Name="EXPN_Statuse" Type="String" />
                        <asp:Parameter DbType="Date" Name="EXPN_date" />
                        <asp:Parameter Name="User_ID" Type="String" />
                        <asp:Parameter DbType="Date" Name="Entry_date" />
                        <asp:Parameter Name="Auth_user" Type="String" />
                        <asp:Parameter Name="EXPN_Attchments" Type="String" />
                        <asp:Parameter Name="notes" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="Branch_code" SessionField="Branch_code" />
                        <asp:Parameter DefaultValue="BR_Reject" Name="EXPN_Statuse" />
                        <asp:Parameter DefaultValue="BR_Aproved" Name="EXPN_Statuse1" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="EXPN_ID" Type="Int32" />
                        <asp:Parameter Name="EXPN_TYpe" Type="String" />
                        <asp:Parameter Name="Branch_code" Type="String" />
                        <asp:Parameter Name="EXPN_AMT" Type="Decimal" />
                        <asp:Parameter Name="EXPN_Currency" Type="String" />
                        <asp:Parameter Name="EXPN_Account" Type="String" />
                        <asp:Parameter Name="EXPN_DESC" Type="String" />
                        <asp:Parameter Name="EXPN_Statuse" Type="String" />
                        <asp:Parameter DbType="Date" Name="EXPN_date" />
                        <asp:Parameter Name="User_ID" Type="String" />
                        <asp:Parameter DbType="Date" Name="Entry_date" />
                        <asp:Parameter Name="Auth_user" Type="String" />
                        <asp:Parameter Name="EXPN_Attchments" Type="String" />
                        <asp:Parameter Name="notes" Type="String" />
                        <asp:Parameter Name="Req_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        </table>
</asp:Content>

