<%@ Page Title="Quản lý hãng sản xuất" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyHangSanXuat.aspx.cs" Inherits="BanQuanAo.Admin.QuanLyHangSanXuat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Quản lý hãng sản xuất</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    mã nhà sản xuất
    <asp:TextBox runat="server" ID="txtMaNhaSX" CssClass="form-control" Width="200px" Enabled="false"></asp:TextBox>
    Tên nhà sản xuất
    <asp:TextBox runat="server" ID="txtTenNhaSX" CssClass="form-control" Width="200px" ></asp:TextBox>

    <br />

    <asp:Button runat="server" ID="btnThem" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" />
    <asp:Button runat="server" ID="btnSua" Text="Sửa" CssClass="btn btn-primary" OnClick="btnSua_Click" />
    <asp:Button runat="server" ID="btnXoa" Text="Xóa" CssClass="btn btn-primary" OnClick="btnXoa_Click" />
    <asp:Button runat="server" ID="btnReset" Text="Reset" CssClass="btn btn-primary" OnClick="btnReset_Click" />
    <br />
    <asp:Label ID="lbThongBao" runat="server" Text=""></asp:Label>
    <hr />
    <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Producer_ID" HeaderText="Mã NSX" />
            <asp:BoundField DataField="Producer_Name" HeaderText="Tên NSX" />
            <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
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
