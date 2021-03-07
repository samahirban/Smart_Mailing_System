<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="DeliveryInfo.aspx.cs" Inherits="SmartMailingSystem.DeliveryInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            text-align: center;
            font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
            background-color: #8DA9A7;
        }
        .auto-style4 {
            text-align: center;
            font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 675px;" align="center">
        <tr>
            <td style="text-align: center" colspan="4">
                <span class="auto-style2">Delivery Information</span>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="auto-style3"></td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px"></td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style3">
               Receiver Information
            </td>
        </tr>
        <tr>
            <td colspan="4" class="auto-style3"></td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
                Receiver Name
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
               <asp:TextBox ID="RecNameBox" runat="server" CssClass="textboxcurve" style="text-align: center" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
                Contact Info
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height:10px" class="auto-style4">
                Email
            </td>
            <td colspan="2" style="height:10px" class="auto-style4">
                .Phone No
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height:10px" class="auto-style4">
               <asp:TextBox ID="RecPhoneBox" runat="server" CssClass="textboxcurve" style="text-align: center" ReadOnly="True"></asp:TextBox>
            </td>
            <td colspan="2" style="height:10px" class="auto-style4">
               <asp:TextBox ID="RecEmailBox" runat="server" CssClass="textboxcurve" style="text-align: center" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px">            
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style3">
                Courier Info
            </td>
        </tr>
        <tr>
            <td colspan="4" class="auto-style3"></td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
                Courier Name
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
               <asp:TextBox ID="CourNameBox" runat="server" CssClass="textboxcurve" style="text-align: center" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
                Contact Info
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
                .Phone No
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
               <asp:TextBox ID="CourPhoneBox" runat="server" CssClass="textboxcurve" style="text-align: center" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px">            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style3">
                Package Info
            </td>
        </tr>
        <tr>
            <td colspan="4" class="auto-style3"></td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
                Package ID
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
               <asp:TextBox ID="PckgIDBox" runat="server" CssClass="textboxcurve" style="text-align: center" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
                Package Weight
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
               <asp:TextBox ID="PckgWeightBox" runat="server" CssClass="textboxcurve" style="text-align: center" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px">            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style3">
                Delivery Info
            </td>
        </tr>
        <tr>
            <td colspan="4" class="auto-style3"></td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
                Delivery Time
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
               <asp:TextBox ID="DelTimeBox" runat="server" CssClass="textboxcurve" style="text-align: center" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
                Delivery Date
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
               <asp:TextBox ID="DelDateBox" runat="server" CssClass="textboxcurve" style="text-align: center" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>
