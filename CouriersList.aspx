<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="CouriersList.aspx.cs" Inherits="SmartMailingSystem.CouriersList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            text-align: center;
            font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif;
            background-color: #8DA9A7;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 675px;" align="center">
        <tr>
            <td colspan="4" style="text-align: center">
                <span class="auto-style2">COURIERS LIST</span>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="auto-style3"></td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px"></td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Button ID="newCourier" runat="server" Text="ADD NEW COURIER" OnClick="newCourier_Click" CssClass="button" style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif"/>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style3">
               Assigned Courier To District List: <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="auto-style3"></td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:GridView ID="AssignedCourierList" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="CourierID" DataSourceID="SqlDataSource1" GridLines="Horizontal" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;" Width="736px" AllowSorting="True" EmptyDataText="There is no courier" OnSelectedIndexChanged="AssignedCourierList_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Change" />
                        <asp:BoundField DataField="Distrect" HeaderText="Distrect" SortExpression="Distrect" />
                        <asp:BoundField DataField="CouPhone" HeaderText="Phone" SortExpression="CouPhone" />
                        <asp:BoundField DataField="CouLName" HeaderText="Last Name" SortExpression="CouLName" />
                        <asp:BoundField DataField="CouMName" HeaderText="Middle Name" SortExpression="CouMName" />
                        <asp:BoundField DataField="CouFName" HeaderText="First Name" SortExpression="CouFName" />
                        <asp:BoundField DataField="CourierID" HeaderText="ID" ReadOnly="True" SortExpression="CourierID" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:databaseConnection %>" SelectCommand="SELECT [Distrect], [CouPhone], [CouLName], [CouMName], [CouFName], [CourierID] FROM [COURIER] WHERE ([Distrect] IS NOT NULL)"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <p style="direction: ltr">
                <asp:DropDownList ID="DropDownList1" runat="server" Visible="False"></asp:DropDownList>
                </p>
            </td>
            <td style="text-align: center">
                <asp:Label ID="District" runat="server" Text="District" Visible="False"></asp:Label>
            </td>
            <td style="text-align: center">
                <asp:TextBox ID="UserIDBox" runat="server" CssClass="textboxcurve" style="text-align: left" ReadOnly="True" Visible="False"></asp:TextBox>
            </td>
            <td style="text-align: center">
                <asp:Label ID="CourID" runat="server" Text="Courier ID" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Label ID="Label3" runat="server" style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; color: #FF0000" Text="Label" Visible="False"></asp:Label>
                <asp:Button ID="saveChanges" runat="server" Text="SAVE CHANGES" OnClick="saveChanges_Click" CssClass="button" style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif" Visible="False"/>           
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px">            
                &nbsp;
                <asp:Label ID="testLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height:10px" class="auto-style3">
               Not Assigned Courier To District List: <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="auto-style3"></td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:GridView ID="CourierList" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="CourierID" DataSourceID="SqlDataCourierList" GridLines="Horizontal" style="text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;" Width="736px" AllowSorting="True" OnRowDataBound="CourierList_RowDataBound" EmptyDataText="There is no courier">
                    <Columns>
                        <asp:TemplateField HeaderText="District">
                            <ItemTemplate>
                                <asp:DropDownList ID="DistrictList" runat="server"></asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CouPhone" HeaderText="Phone" SortExpression="CouPhone" />
                        <asp:BoundField DataField="CouLName" HeaderText="Last Name" SortExpression="CouLName" />
                        <asp:BoundField DataField="CouMName" HeaderText="Middle Name" SortExpression="CouMName" />
                        <asp:BoundField DataField="CouFName" HeaderText="First Name" SortExpression="CouFName" />
                        <asp:BoundField DataField="CourierID" HeaderText="ID" ReadOnly="True" SortExpression="CourierID" />
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
                <asp:SqlDataSource ID="SqlDataCourierList" runat="server" ConnectionString="<%$ ConnectionStrings:databaseConnection %>" SelectCommand="SELECT [CouPhone], [CouLName], [CouMName], [CouFName], [CourierID] FROM [COURIER] WHERE ([Distrect] IS NULL)"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Label ID="Label2" runat="server" style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; color: #FF0000" Text="Label" Visible="False"></asp:Label>
                <asp:Button ID="saveAssigning" runat="server" Text="SAVE" OnClick="saveAssigning_Click" CssClass="button" style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif"/>           
            </td>
        </tr>
    </table>
</asp:Content>
