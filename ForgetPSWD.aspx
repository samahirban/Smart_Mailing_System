<%@ Page Title="" Language="C#" MasterPageFile="~/SystemTamplet.Master" AutoEventWireup="true" CodeBehind="ForgetPSWD.aspx.cs" Inherits="SmartMailingSystem.ForgetPSWD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 675px;" align="center">
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Label ID="titlePage" runat="server" Text="RE-SET USER PASSWORD" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; "></asp:Label>
            </td>
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
                <asp:Label ID="UserIDLabel" runat="server" Text="E-MAIL" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; "></asp:Label>
            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align: center">
                <asp:TextBox ID="PSWDBox" runat="server" TextMode="Password" CssClass="textboxcurve" style="text-align: left"></asp:TextBox>
            </td>
            <td style="text-align: left">
                <asp:Label ID="BSWDLabel" runat="server" Text="NEW PASSWORD" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; "></asp:Label>
            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align: center">
                <asp:TextBox ID="PSWDBox2" runat="server" TextMode="Password" CssClass="textboxcurve" style="text-align: left"></asp:TextBox>
            </td>
            <td style="text-align: left">
                <asp:Label ID="PSWDLabel2" runat="server" Text="CONFIRM NEW PASSWORD" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; "></asp:Label>
            </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <asp:Label ID="Label1" runat="server" style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; color: #FF0000" Text="Label" Visible="False"></asp:Label>
                <asp:Button ID="Enter" runat="server" OnClick="Enter_Click" CssClass="button" Text="ENTER" style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif" />
            </td>
        </tr>
    </table>
</asp:Content>
