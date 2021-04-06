<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="True"
                onselectedindexchanged="ddlCountry_SelectedIndexChanged" Width="187px"></asp:DropDownList>

    <br />

    <br />
    <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True"
                onselectedindexchanged="ddlState_SelectedIndexChanged" Width="187px"></asp:DropDownList>
    <br />
    <br />
    <asp:DropDownList ID="ddlCity" runat="server" 
                onselectedindexchanged="ddlState_SelectedIndexChanged" Width="187px"></asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <br />
</asp:Content>

