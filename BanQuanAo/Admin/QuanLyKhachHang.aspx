<%@ Page Title="Quản lý người dùng" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyKhachHang.aspx.cs" Inherits="BanQuanAo.Admin.QuanLyKhachHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        .txtbox {
            width: 250px;
        }

        .div1 {
            width: 300px;
            float: left;
        }

        .div2 {
            width: 300px;
            float: left;
        }
        .div3{
            width: 80px;
            float: left;
            margin-top: 20px;
            margin-bottom: 10px;
        }
        .clearfloat {
            clear: both;
        }
        .btn{
            width: 90px;
            margin-bottom: 10px;
        }
        .dr-quyen {
            width: 250px;
        }
        .cls{
            margin-top: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-inline">
        <div class="form-group mx-sm-3 mb-2">
            <label for="inputPassword2" class="sr-only">Mã/Tên khách hàng</label>
            <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="Mã/Tên khách hàng"></asp:TextBox>
        </div>
        <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-primary mb-2 cls" OnClick="btnSearch_Click" Text="Tìm kiếm"></asp:Button>
    </div>

    <div>
        <div class="div1">
            <asp:HiddenField runat="server" ID="txtMaUser" />
            Tài khoản
        <asp:TextBox ID="txtTaiKhoan" runat="server" CssClass="form-control txtbox"></asp:TextBox>
            Mật khẩu<asp:TextBox ID="txtMatkhau" runat="server" TextMode="Password" CssClass="form-control txtbox"></asp:TextBox>
            Họ tên
            <asp:TextBox ID="txtHoten" runat="server" CssClass="form-control txtbox"></asp:TextBox>
            Quyền
            <asp:DropDownList ID="drQuyen" runat="server" CssClass="form-control dr-quyen" DataTextField="Name" DataValueField="RoleID"></asp:DropDownList>
        </div>
        <div class="div2">
            Email
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control txtbox"></asp:TextBox>
            Địa chỉ<asp:TextBox ID="txtDiachi" runat="server" CssClass="form-control txtbox"></asp:TextBox>
            Số điện thoại<asp:TextBox ID="txtSodienthoai" runat="server" CssClass="form-control txtbox"></asp:TextBox>
            
        </div>
        <div class="div3">
            <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-primary cls" OnClick="btnThem_Click" />
            <asp:Button ID="btnSua" runat="server" Text="Sửa" CssClass="btn btn-primary cls" OnClick="btnSua_Click" />
            <asp:Button ID="btnXoa" runat="server" Text="Xóa" CssClass="btn btn-primary cls" OnClick="btnXoa_Click" />
            <asp:Button ID="btnReset" runat="server" Text="Reset text" CssClass="btn btn-primary cls" OnClick="btnReset_Click"  />
        </div>
    </div>
    <div class="clearfloat"></div>
    <asp:Label ID="lbThongBao" runat="server" Text=""></asp:Label>
    <br />
    <hr />
    <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField HeaderText="Tài khoản" DataField="Usermame" HtmlEncode="false"/>
            <asp:BoundField HeaderText="Mật khẩu" DataField="Password" Visible="false" HtmlEncode="false"/>
            <asp:BoundField HeaderText="Họ tên" DataField="FullName" HtmlEncode="false"/>
            <asp:BoundField HeaderText="Email" DataField="Email" HtmlEncode="false"/>
            <asp:BoundField HeaderText="Địa chỉ" DataField="Address" HtmlEncode="false" />
            <asp:BoundField HeaderText="Số điện thoại" DataField="Phone" HtmlEncode="false" />
            <asp:BoundField HeaderText="Quyen" DataField="RoleID" Visible="false" HtmlEncode="false"/>
            <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
</asp:Content>
