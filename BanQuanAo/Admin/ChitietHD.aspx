<%@ Page Title="Chi tiết hóa đơn" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ChitietHD.aspx.cs" Inherits="BanQuanAo.Admin.ChitietHD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="btnBack" CssClass="btn btn-primary" runat="server" Text="Trở lại" OnClick="btnBack_Click" />
    <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Order_ID" HeaderText="Mã hóa đơn" />
            <asp:BoundField DataField="Product_ID" HeaderText="Mã sản phẩm" />
            <asp:BoundField DataField="Price_Export" HeaderText="Giá bán" />
            <asp:BoundField DataField="Amount" HeaderText="Số lượng" />
            <asp:BoundField DataField="Money" HeaderText="Thành tiền" />
            <asp:BoundField DataField="State" HeaderText="Trạng thái" />
            <asp:CommandField SelectText="Xử lý" ShowSelectButton="True" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
</asp:Content>
