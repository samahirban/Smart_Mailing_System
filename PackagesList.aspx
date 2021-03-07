<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="PackagesList.aspx.cs" Inherits="SmartMailingSystem.PackagesList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            text-align: left;
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
                <span class="auto-style2">SHIPMENTS LIST</span>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="auto-style3"></td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px"></td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
                Packages are not delivered yet: <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="4">
                <asp:GridView ID="CourierList" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="PackageID" DataSourceID="SqlDataPckgNotDel" GridLines="Horizontal" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;" Width="736px">
                    <Columns>
                        <asp:BoundField DataField="CourierID" HeaderText="Courier ID" SortExpression="CourierID" />
                        <asp:BoundField DataField="RecipientID" HeaderText="Recipient ID" SortExpression="RecipientID" />
                        <asp:BoundField DataField="weight" HeaderText="Weight" SortExpression="weight" />
                        <asp:BoundField DataField="PackageID" HeaderText="Package ID" SortExpression="PackageID" ReadOnly="True" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataPckgNotDel" runat="server" ConnectionString="<%$ ConnectionStrings:databaseConnection %>" SelectCommand="SELECT [PackageID], [weight], [CourierID], [RecipientID] FROM [PACKAGE] WHERE (([CourierID] IS NOT NULL) AND ([Status] IS NULL))"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
                Packages are delivered:
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px">
                <asp:GridView ID="PckgDelivered" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="PackageID" DataSourceID="SqlDataPckgDel" GridLines="Horizontal" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;" Width="736px" OnSelectedIndexChanged="PckgDelivered_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField SelectText="More Info" ShowSelectButton="True" />
                        <asp:BoundField DataField="PackageID" HeaderText="PackageID" SortExpression="PackageID" ReadOnly="True" />
                        <asp:BoundField DataField="weight" HeaderText="weight" SortExpression="weight" />
                        <asp:BoundField DataField="RecipientID" HeaderText="RecipientID" SortExpression="RecipientID" />
                        <asp:BoundField DataField="CourierID" HeaderText="CourierID" SortExpression="CourierID" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataPckgDel" runat="server" ConnectionString="<%$ ConnectionStrings:databaseConnection %>" SelectCommand="SELECT [PackageID], [weight], [RecipientID], [CourierID] FROM [PACKAGE] WHERE ([Status] IS NOT NULL)"></asp:SqlDataSource>
                </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style4">
                Packages are not assigned yet:
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="PackageID" DataSourceID="SqlDataSource1" GridLines="Horizontal" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;" Width="736px">
                    <Columns>
                        <asp:BoundField DataField="CourierID" HeaderText="Courier ID" SortExpression="CourierID" />
                        <asp:BoundField DataField="RecipientID" HeaderText="Recipient ID" SortExpression="RecipientID" />
                        <asp:BoundField DataField="weight" HeaderText="Weight" SortExpression="weight" />
                        <asp:BoundField DataField="PackageID" HeaderText="Package ID" SortExpression="PackageID" ReadOnly="True" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:databaseConnection %>" SelectCommand="SELECT [CourierID], [RecipientID], [weight], [PackageID] FROM [PACKAGE] WHERE ([CourierID] IS NULL)"></asp:SqlDataSource>
           </td>
        </tr>
    </table>
</asp:Content>
