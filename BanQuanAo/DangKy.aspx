<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="BanQuanAo.DangKy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .khungdk{
            margin-top: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="khungdk"></div>
    <div class="col-md-4"></div>
    <div  class="col-md-4" >
    Tài Khoản
    <asp:TextBox runat="server" Text="" ID="txtUsername" CssClass="form-control"></asp:TextBox>
    Mật khẩu
    <asp:TextBox runat="server" Text="" ID="txtPassword" CssClass="form-control" TextMode="Password"></asp:TextBox>
    Họ và tên
    <asp:TextBox runat="server" Text="" ID="txtHoTen" CssClass="form-control"></asp:TextBox>
    Email
    <asp:TextBox runat="server" Text="" ID="txtEmail" CssClass="form-control"></asp:TextBox>
    Địa chỉ
    <asp:TextBox runat="server" Text="" ID="txtDiaChi" CssClass="form-control"></asp:TextBox>
    Số điện thoại
    <asp:TextBox runat="server" Text="" ID="txtSoDienThoai" CssClass="form-control"></asp:TextBox>
        </div>
    <div  class="col-md-4">
        <asp:Label ID="lbThongBao" runat="server"></asp:Label>
        <asp:Button ID="btnDangKy" runat="server" Text="Đăng ký" CssClass="btn btn-primary" OnClick="btnDangKy_Click" />
    </div>
</asp:Content>
