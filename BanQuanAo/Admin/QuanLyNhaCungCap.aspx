<%@ Page Title="Quản lý nhà cung cấp" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyNhaCungCap.aspx.cs" Inherits="BanQuanAo.Admin.QuanLyNhaCungCap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .txt{
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="width: 300px; float: left;">
        Mã nhà cung cấp
        <asp:TextBox ID="txtMaNhaCungCap" runat="server" CssClass="form-control txt" Enabled="false"></asp:TextBox>
        <br />
        Tên nhà cung cấp
        <asp:TextBox ID="txtTenNhaCungCap" runat="server" CssClass="form-control txt"></asp:TextBox>
         <br />
        Địa chỉ nhà cung cấp
        <asp:TextBox ID="txtDiaChiNhaCungCap" runat="server" CssClass="form-control txt"></asp:TextBox>

         <br /></div>
    <div style="width: 300px; float: left;">
        Số điện thoại
        <asp:TextBox ID="txtSoDienThoai" runat="server" CssClass="form-control txt"></asp:TextBox>
         <br />
        Email
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control txt"></asp:TextBox>
         <br />
        </div>
    <div style="clear: both;"></div>
         <br />
        <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" />
        <asp:Button ID="btnSua" runat="server" Text="Sửa" CssClass="btn btn-primary" OnClick="btnSua_Click" />
        <asp:Button ID="btnXoa" runat="server" Text="Xóa" CssClass="btn btn-primary" OnClick="btnXoa_Click" />
        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-primary" OnClick="btnReset_Click" />
    
    <br />
    <asp:Label ID="lbThongBao" runat="server" Text=""></asp:Label>
    <hr />

    <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Supplier_ID" HeaderText="Mã nhà cung cấp" />
            <asp:BoundField DataField="Supplier_Name" HeaderText="Tên nhà cung cấp" HtmlEncode="false"/>
            <asp:BoundField DataField="Address" HeaderText="Địa chỉ" HtmlEncode="false"/>
            <asp:BoundField DataField="Phone" HeaderText="Phone" HtmlEncode="false"/>
            <asp:BoundField DataField="Email" HeaderText="Email" HtmlEncode="false"/>
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
