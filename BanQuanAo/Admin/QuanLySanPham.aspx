<%@ Page Title="Quản lý sản phẩm" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLySanPham.aspx.cs" Inherits="BanQuanAo.Admin.QuanLySanPham" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btn{
            width: 70px;
            margin-bottom: 10px;
        }
        .cls{
            width: 90px;
            margin-top: 10px;
            
        }
        .in{
            margin-left: 20px;
        }
    </style>
    <script src="ckeditor/ckeditor.js"></script>
    <script src="ckfinder/ckfinder.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<%--    <div class="form-inline">
        <div class="form-group mx-sm-3 mb-2">
            <label for="inputPassword2" class="sr-only">Mã/Tên sản phẩm</label>
            <asp:TextBox runat="server" ID="txtName" CssClass="form-control in" placeholder="Mã/Tên sản phẩm"></asp:TextBox>
        </div>
        <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-primary mb-2 cls" OnClick="btnSearch_Click" Text="Tìm kiếm"></asp:Button>
    </div>--%>

    <div style="width: 300px; float: left; margin-left: 20px;">
        Mã sản phẩm <asp:TextBox runat="server" ID="txtIDSanPham"  CssClass="form-control" Enabled="False" ></asp:TextBox>
        Tên sản phẩm <asp:TextBox runat="server"   ID="txtTenSanPham" CssClass="form-control" ></asp:TextBox>
        Kiểu  <asp:DropDownList runat="server" CssClass ="form-control" ID="drKieu" AppendDataBoundItems="True" AutoPostBack="false"></asp:DropDownList>
        Style <asp:DropDownList runat="server" CssClass ="form-control" ID="drStyle" AppendDataBoundItems="True" AutoPostBack="false" ></asp:DropDownList>
        Nhà sản xuất <asp:DropDownList runat="server" CssClass ="form-control" ID="drNhaXanXuat" AppendDataBoundItems="True" AutoPostBack="false" ></asp:DropDownList>
        Nhà cung cấp <asp:DropDownList runat="server" CssClass ="form-control" ID="drNhaCC" AppendDataBoundItems="True" AutoPostBack="false" ></asp:DropDownList>
        <div>
            <div style="float: left; width: 200px;">
                 Ảnh <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
            </div>
             <div style="float: left; width: 70px">
                 <br />
                  <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-primary" OnClick="btnUpload_Click" />
             </div>
           <div style="clear: both;"></div>
           
        </div>
        
        <asp:Image ID="Image1" runat="server" Height="159px" Width="131px" />
    </div>
    <div style="width: 300px; float: left; margin-left: 20px;">
        Màu <asp:DropDownList runat="server" CssClass ="form-control" ID="drMau" AppendDataBoundItems="True" AutoPostBack="false" >
            <asp:ListItem>Xanh</asp:ListItem>
            <asp:ListItem>Đỏ</asp:ListItem>
            <asp:ListItem>Tím</asp:ListItem>
            <asp:ListItem>Vàng</asp:ListItem>
            <asp:ListItem>Nâu</asp:ListItem>
            <asp:ListItem>Đen</asp:ListItem>
            <asp:ListItem>Trắng</asp:ListItem>
            <asp:ListItem>Kẻ đen</asp:ListItem>
            <asp:ListItem>Xám</asp:ListItem>
            <asp:ListItem>Hồng</asp:ListItem>
        </asp:DropDownList>
        Chất liệu <asp:DropDownList runat="server" CssClass ="form-control" ID="drChatLieu" AppendDataBoundItems="True" AutoPostBack="false" >
            <asp:ListItem>Vải</asp:ListItem>
            <asp:ListItem>Nhung</asp:ListItem>
            <asp:ListItem>Len</asp:ListItem>
            <asp:ListItem>Tuyn</asp:ListItem>
        </asp:DropDownList>
        Size<asp:DropDownList runat="server" CssClass ="form-control" ID="drSize" AppendDataBoundItems="True" AutoPostBack="false" >
        </asp:DropDownList>
        Giá nhập <asp:TextBox runat="server" TextMode="Number"  ID="txtGianhap" CssClass="form-control" ></asp:TextBox>
        Giá xuất <asp:TextBox runat="server"  TextMode="Number"  ID="txtGiaXuat" CssClass="form-control" ></asp:TextBox>
        Số lượng <asp:TextBox runat="server" TextMode="Number"   ID="txtSoLuong" CssClass="form-control" ></asp:TextBox>
        Trọng lượng <asp:TextBox runat="server" TextMode="Number"   ID="txtKhoiLuong" CssClass="form-control" ></asp:TextBox>
        Ưu tiên <asp:TextBox runat="server"   ID="txtOrder" TextMode="Number" CssClass="form-control" ></asp:TextBox>
        Mô tả <asp:TextBox runat="server"   ID="txtDes" CssClass="form-control" ></asp:TextBox>
        
    </div>
    <div style="width: 70px; float: left; margin-left: 20px;">
        <br />
        <asp:Button runat="server" ID="btnThem" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" />
        <br />
         <asp:Button runat="server" ID="btnSua" Text="Sửa" CssClass="btn btn-primary" OnClick="btnSua_Click" />
        <br />
        <asp:Button runat="server" ID="Button1" Text="Thêm ảnh" CssClass="btn btn-primary" OnClick="Button1_Click" />
         <%--<asp:Button runat="server" ID="btnXoa" Text="Xóa" CssClass="btn btn-primary" OnClick="btnXoa_Click" />--%>
        <br />
         <asp:Button runat="server" ID="btnReset" Text="Reset" CssClass="btn btn-primary" OnClick="btnReset_Click" />
        <br />
    </div>
    <div style="clear: both;"></div>
    <div class="row">
        <div class="col-md-12">
            <div class="form-group">
                <label for="txtContent">Bài viết</label>
                <asp:TextBox runat="server" ID="txtContent" TextMode="MultiLine" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
    </div>
    <asp:Label runat="server" ID="lbThongBao" ></asp:Label>
    <br />
    
    <script>
        
        CKEDITOR.replace('txtContent', {
            customConfig: '../ckeditor/config.js'
        });
    </script>
</asp:Content>
