<%@ Page Title="Quản lý hình thức giao hàng" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyHinhThucGiaoHang.aspx.cs" Inherits="BanQuanAo.Admin.QuanLyHinhThucGiaoHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 300px; ">
        Mã hình thức vận chuyến
        <asp:TextBox runat="server" ID="txtMaVanChuyen" CssClass="form-control" Enabled="false"></asp:TextBox>
        Tên hình thức vận chuyển
        <asp:TextBox runat="server" ID="txtTenVanChuyen" CssClass="form-control" ></asp:TextBox>
        Phí(%)
        <asp:TextBox runat="server" ID="txtPhi" min="0" step="1" TextMode="Number" CssClass="form-control" ></asp:TextBox>
    </div>
    <br />
    <br />
    <div>
        <asp:Button runat="server" ID="btnThem" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" />
        <asp:Button runat="server" ID="btnSua" Text="Sửa" CssClass="btn btn-primary" OnClick="btnSua_Click" />
        <asp:Button runat="server" ID="btnXoa" Text="Xóa" CssClass="btn btn-primary" OnClick="btnXoa_Click" />
        <asp:Button runat="server" ID="btnReset" Text="Reset" CssClass="btn btn-primary" OnClick="btnReset_Click" />
    </div>
    <div style="clear: both;"></div>
    <br />

    <asp:Label runat="server" ID="lbThongBao" ></asp:Label>
    <br />
    <hr />
    <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Transport_ID" HeaderText="ID" />
            <asp:BoundField DataField="Transport_Name" HeaderText="Tên phương thức vận chuyển" />
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
