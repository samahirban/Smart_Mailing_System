<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddCourier.aspx.cs" Inherits="SmartMailingSystem.AddCourier" %>
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
    <table style="width: 800px;" align="center">
        <tr>
            <td colspan="6" style="text-align: center">
                <asp:Label ID="titlePage" runat="server" Text="ADD NEW COURIER" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size: large;"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="6" class="auto-style3">Personal Information</td>
        </tr>
        <tr>
            <td colspan="6" class="auto-style3"></td>
        </tr>
        <tr>
            <td colspan="6" style="height:10px"></td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:TextBox ID="CourLnameBox" runat="server" CssClass="textboxcurve" style="text-align: left" required="true"></asp:TextBox>
            </td>
            <td style="text-align: center">
                <asp:Label ID="CourLnameLabel" runat="server" Text="Last Name" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; "></asp:Label>
            </td>
            <td style="text-align: center">
                <asp:TextBox ID="CourMnameBox" runat="server" CssClass="textboxcurve" style="text-align: left"></asp:TextBox>
            </td>
            <td style="text-align: center">
                <asp:Label ID="CourMnameLabel" runat="server" Text="Middle Name" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; "></asp:Label>
            </td>
            <td style="text-align: center">
                <asp:TextBox ID="CourFnameBox" runat="server" CssClass="textboxcurve" style="text-align: left" required="true"></asp:TextBox>
            </td>
            <td style="text-align: center">
                <asp:Label ID="CourFnameLabel" runat="server" Text="First Name" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; "></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="6" style="height:10px"></td>
        </tr>
        <tr>
            <td colspan="6" class="auto-style3">Contact Information</td>
        </tr>
        <tr>
            <td colspan="6" class="auto-style3"></td>
        </tr>
        <tr>
            <td colspan="6" style="height:10px"></td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:TextBox ID="CourPhoneBox" runat="server" CssClass="textboxcurve" style="text-align: left" required="true" MaxLength="10" TextMode="Phone"></asp:TextBox>
            </td>
            <td style="text-align: left">
                <asp:Label ID="CourPhoneLabel" runat="server" Text="Phone" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; "></asp:Label>
            </td>
            <td style="text-align: center">
                <asp:TextBox ID="PSWDBox" runat="server" TextMode="Password" CssClass="textboxcurve" style="text-align: left" required="true"></asp:TextBox>
            </td>
            <td style="text-align: left">
                <asp:Label ID="BSWDLabel" runat="server" Text="Password" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; "></asp:Label>
            </td>
            <td style="text-align: center">
                <asp:TextBox ID="CourIDBox" runat="server" CssClass="textboxcurve" style="text-align: left" required="true"></asp:TextBox>
            </td>
            <td style="text-align: left">
                <asp:Label ID="CourIDLabel" runat="server" Text="Courier ID" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; "></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="6" style="height:10px"></td>
        </tr>
        <tr>
            <td colspan="6" align="center">
                <asp:Label ID="Label1" runat="server" style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; color: #FF0000" Text="Label" Visible="False"></asp:Label>
                <asp:Button ID="Enter" runat="server" OnClick="Enter_Click" CssClass="button" Text="ADD" style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif" />
            </td>
        </tr>
    </table>
</asp:Content>
