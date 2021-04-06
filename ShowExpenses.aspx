<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="ShowExpenses.aspx.cs" Inherits="ShowExpenses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style35 {
        width: 90%;
    }
        .auto-style19 {
            color: #000000;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="auto-style35" dir="rtl" style="border: thin solid #800000">
    <tr>
        <td style="color: #FFFFFF; background-color: #800000">متابعة المصاريف المعتمدة من الخدمات المركزية</td>
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
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" ShowFooter="true" AutoGenerateColumns="False" CellPadding="4" OnDataBound="OnDataBound"  onrowdatabound="GridView3_RowDataBound"  OnRowUpdated="GridView3_RowUpdated" DataKeyNames="Req_ID" DataSourceID="SqlDataSource2" Width="100%" ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Req_ID" HeaderText="Req_ID" InsertVisible="False" ReadOnly="True" SortExpression="Req_ID" Visible="False" />
                        <asp:BoundField DataField="EXPN_ID" HeaderText="رقم المصروف" SortExpression="EXPN_ID" />
                        <asp:BoundField DataField="Branch_code" HeaderText="الفرع" SortExpression="Branch_code" />
                        <asp:BoundField DataField="EXPN_TYpe" HeaderText="نوع المصروف" SortExpression="EXPN_TYpe" />

                           <asp:BoundField DataField="EXPN_date" HeaderText="تاريخ الطلب" SortExpression="EXPN_date" DataFormatString="{0:MM/dd/yyyy}"/>


                 <%--       <asp:BoundField DataField="EXPN_Account" HeaderText="رقم الحساب" SortExpression="EXPN_Account" />
                     
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
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IBY_ExpensesConnectionString %>" DeleteCommand="DELETE FROM [GeneralEXP_RECO] WHERE [Req_ID] = @Req_ID" InsertCommand="INSERT INTO [GeneralEXP_RECO] ([EXPN_ID], [EXPN_TYpe], [Branch_code], [EXPN_AMT], [EXPN_Currency], [EXPN_Account], [EXPN_DESC], [EXPN_Statuse], [EXPN_date], [User_ID], [Entry_date], [Auth_user], [EXPN_Attchments], [notes]) VALUES (@EXPN_ID, @EXPN_TYpe, @Branch_code, @EXPN_AMT, @EXPN_Currency, @EXPN_Account, @EXPN_DESC, @EXPN_Statuse, @EXPN_date, @User_ID, @Entry_date, @Auth_user, @EXPN_Attchments, @notes)" SelectCommand="SELECT * FROM [GeneralEXP_RECO] where (EXPN_Statuse=@EXPN_Statuse ) AND  Branch_code=@Branch_code" UpdateCommand="UPDATE [GeneralEXP_RECO] SET [EXPN_ID] = @EXPN_ID, [EXPN_TYpe] = @EXPN_TYpe, [Branch_code] = @Branch_code, [EXPN_AMT] = @EXPN_AMT, [EXPN_Currency] = @EXPN_Currency, [EXPN_Account] = @EXPN_Account, [EXPN_DESC] = @EXPN_DESC, [EXPN_Statuse] = @EXPN_Statuse, [EXPN_date] = @EXPN_date, [User_ID] = @User_ID, [Entry_date] = @Entry_date, [Auth_user] = @Auth_user, [EXPN_Attchments] = @EXPN_Attchments, [notes] = @notes WHERE [Req_ID] = @Req_ID">
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
                        <asp:Parameter DefaultValue="HD_Approved" Name="EXPN_Statuse" />
                        <%--<asp:Parameter DefaultValue="UnderProcess" Name="EXPN_Statuse1" />--%>
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
        <td style="color: #FFFFFF; background-color: #990000">متابعة المصاريف المرفوضة من الخدمات المركزية</td>
    </tr>
    <tr>
        <td>
                <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Req_ID" DataSourceID="SqlDataSource3" Width="100%" ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Req_ID" HeaderText="Req_ID" InsertVisible="False" ReadOnly="True" SortExpression="Req_ID" Visible="False" />
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
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("EXPN_Attchments") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                             
                                <asp:HyperLink ID="HyperLink4" runat="server" Target = "_Blank" NavigateUrl='<%# Eval("EXPN_Attchments","DownloadFile.aspx?PDFFile={0}") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="notes" HeaderText="ملاحظات" SortExpression="notes" />
                        <asp:CommandField ButtonType="Button" CancelText="الغاء" DeleteText="حذف" EditText="تحرير" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تحديث" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:IBY_ExpensesConnectionString %>" DeleteCommand="DELETE FROM [GeneralEXP_RECO] WHERE [Req_ID] = @Req_ID" InsertCommand="INSERT INTO [GeneralEXP_RECO] ([EXPN_ID], [EXPN_TYpe], [Branch_code], [EXPN_AMT], [EXPN_Currency], [EXPN_Account], [EXPN_DESC], [EXPN_Statuse], [EXPN_date], [User_ID], [Entry_date], [Auth_user], [EXPN_Attchments], [notes]) VALUES (@EXPN_ID, @EXPN_TYpe, @Branch_code, @EXPN_AMT, @EXPN_Currency, @EXPN_Account, @EXPN_DESC, @EXPN_Statuse, @EXPN_date, @User_ID, @Entry_date, @Auth_user, @EXPN_Attchments, @notes)" SelectCommand="SELECT * FROM [GeneralEXP_RECO] Where EXPN_Statuse=@EXPN_Statuse  AND  Branch_code=@Branch_code" UpdateCommand="UPDATE [GeneralEXP_RECO] SET [EXPN_ID] = @EXPN_ID, [EXPN_TYpe] = @EXPN_TYpe, [Branch_code] = @Branch_code, [EXPN_AMT] = @EXPN_AMT, [EXPN_Currency] = @EXPN_Currency, [EXPN_Account] = @EXPN_Account, [EXPN_DESC] = @EXPN_DESC, [EXPN_Statuse] = @EXPN_Statuse, [EXPN_date] = @EXPN_date, [User_ID] = @User_ID, [Entry_date] = @Entry_date, [Auth_user] = @Auth_user, [EXPN_Attchments] = @EXPN_Attchments, [notes] = @notes WHERE [Req_ID] = @Req_ID">
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
                        <asp:Parameter DefaultValue="HD_Reject" Name="EXPN_Statuse" />
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

