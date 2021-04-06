<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>شاشة الدخول</title>
    <link rel="icon" href="images/zz.ico">
    <link href="StyleSheet.css" rel="stylesheet" />
    <style type="text/css">
     
        .auto-style10 {
            color: #FF0000;
        }
        .auto-style13 {
            width:15%;
            font-family:TheSans;
            font-weight: bold;
        }
        .auto-style14 {
            margin-left: 80px;
        }
        .auto-style15 {
            border: thin inset #800000;
            font-size: x-large;
            text-align: center;
            color: #FFFFFF;
            background-color: #990000;
        }
                
        .auto-style21 {
            font-weight: bold;
            text-align: center;
            font-size: small;
        }
        .auto-style22 {
            margin-left: 80px;
            text-align: right;
            font-size: small;
        }
        
        .auto-style23 {
            margin-left: 80px;
            text-align: center;
        }
        
        .auto-style24 {
            font-size: x-small;
            color: #FFFFFF;
        }
        
        .auto-style26 {
            font-size: small;
            font-weight: bold;
        }
        .auto-style27 {
            color: #FF0000;
            font-size: small;
            font-weight: bold;
        }
        .auto-style28 {
            color: #FF0000;
            font-size: small;
        }
        .auto-style29 {
            font-size: small;
        }
      
    </style>
</head>
<body >
    <form id="form1" runat="server">
    <div style="font-weight: 700;">





        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    
        <table align="center" class="auto-style13" style="border: medium inset #800000">
            <tr>
                <td colspan="2" style="border: thin inset #800000; text-align: center;">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/images/log.JPG" Width="350px" Height="100px" style="text-align: center" />
                </td>
            </tr>
            <tr>
                <td class="auto-style15" colspan="2">نظام مصاريف الفروع&nbsp; </td>
            </tr>
            <tr>
                <td colspan="2" style="border: thin inset #800000;">
                    <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/aaaa.jpg" Width="400px" Height="200px" />
                </td>
            </tr>
            <tr>
                <td colspan="2" dir="rtl" style="border: thin inset #800000">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="auto-style10" ShowMessageBox="True" ShowSummary="False" />
                </td>
             
            </tr>
            <tr>
                <td class="auto-style22" style="border: thin inset #800000"><b><span class="auto-style29">&nbsp; </span> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserNameTextBox" CssClass="auto-style28" ErrorMessage="الرجاء ادخال اسم المستخدم" SetFocusOnError="True" ToolTip="الرجاء ادخال اسم المستخدم">*</asp:RequiredFieldValidator>
                    </b>
                    <asp:TextBox ID="UserNameTextBox"  runat="server" Width="180px" CssClass="auto-style26"   placeholder= "اسم المستخدم"  ToolTip="اسم المستخدم" BorderColor="#990000" BorderStyle="Solid"></asp:TextBox>
                    <span class="auto-style26">&nbsp;&nbsp; </span> </td>
                <td class="auto-style21" style="border: thin inset #C0C0C0">اسم المستخدم </td>
            </tr>
            <tr>
                <td class="auto-style22" style="border: thin inset #800000">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PasswordTextBox" CssClass="auto-style27" ErrorMessage="الرجاء ادخال كلمة المرور" SetFocusOnError="True" ToolTip="الرجاء ادخال كلمة المرور">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="PasswordTextBox" runat="server" Width="180px"  TextMode="Password" CssClass="auto-style26" ToolTip="كلمة المرور" placeholder= "كملة المرور" BorderColor="#990000" BorderStyle="Solid"></asp:TextBox>
                    <span class="auto-style26">&nbsp;&nbsp; </span> </td>
                <td class="auto-style21" style="border: thin inset #C0C0C0">كلمة المرور</td>
            </tr>
            <tr>
                <td class="auto-style14" colspan="2" style="border: thin inset #800000">
                    <asp:Button ID="btnSubmi"  runat="server" style="font-weight: 700; color: #FFFFFF; background-color: #990000; font-size: medium;" Width="120" Text="دخول" OnClick="btnSubmi_Click" />
                &nbsp;<asp:Label ID="msgLabel" runat="server" style="font-weight: 700; color: #FF0000; font-size: small;"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td class="auto-style23" colspan="2" style="border: thin inset #800000; background-color: #990000;"><span class="auto-style24" style="font-family: Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: bold; letter-spacing: normal; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(153, 0, 0); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"> 
                    
                    Development &amp; Research© 2020 | Developer by : Nabil Mosali </span></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
