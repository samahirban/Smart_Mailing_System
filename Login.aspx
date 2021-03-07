<%@ Page Title="" Language="C#" MasterPageFile="~/SystemTamplet.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SmartMailingSystem.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            text-align: left;
            font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
            background-color: #8DA9A7;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 675px;" align="center">
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Label ID="titlePage" runat="server" Text="USER LOGIN" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; "></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="auto-style3"></td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px"></td>
        </tr>
        <tr>
            <td colspan="4"></td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align: center">
                <asp:TextBox ID="UserIDBox" runat="server" CssClass="textboxcurve" style="text-align: left"></asp:TextBox>
            </td>
            <td style="text-align: left">
                <asp:Label ID="UserIDLabel" runat="server" Text="USER ID" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; "></asp:Label>
            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align: center">
                <asp:TextBox ID="PSWDBox" runat="server" TextMode="Password" CssClass="textboxcurve" style="text-align: left"></asp:TextBox>
            </td>
            <td style="text-align: left">
                <asp:Label ID="BSWDLabel" runat="server" Text="USER PASSWORD" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; "></asp:Label>
            </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <asp:Label ID="Label1" runat="server" style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; color: #FF0000" Text="Label" Visible="False"></asp:Label>
                <asp:Button ID="Enter" runat="server" OnClick="Enter_Click" CssClass="button" Text="ENTER" style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif" />
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:LinkButton ID="ForgetPSWD" runat="server" visible=false OnClick="ForgetPSWD_Click" style="color:red; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif">?Forget Password</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>