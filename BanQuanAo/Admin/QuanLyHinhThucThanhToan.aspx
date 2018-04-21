<%@ Page Title="Quản lý hình thức thanh toán" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyHinhThucThanhToan.aspx.cs" Inherits="BanQuanAo.Admin.QuanLyHinhThucThanhToan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container-fluid{
            margin-top: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
            <div style="width: 300px; ">
        Mã hình thức thanh toán
        <asp:TextBox runat="server" ID="txtMaVanChuyen" CssClass="form-control" Enabled="false"></asp:TextBox>
        Tên hình thức thanh toán
        <asp:TextBox runat="server" ID="txtTenVanChuyen" CssClass="form-control" ></asp:TextBox>
        Chiết khấu
        <asp:TextBox runat="server" ID="txtCK" min="0" step="1" TextMode="Number" CssClass="form-control" ></asp:TextBox>
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
            <asp:BoundField DataField="Pay_ID" HeaderText="ID" />
            <asp:BoundField DataField="Pay_Name" HeaderText="Tên phương thức thanh toán" />
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
    </div>
</asp:Content>
