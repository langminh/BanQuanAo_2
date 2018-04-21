<%@ Page Title="Quản lý kiểu sản phẩm" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyKieuSanPham.aspx.cs" Inherits="BanQuanAo.Admin.QuanLyKieuSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .div1 {
            width: 500px;
            display: inline-block;
        }

        .div2 {
            width: 300px;
        }

        .div3 {
            clear: both;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div1">
        ID<asp:TextBox ID="txtIDKieu" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
        Kiểu sản phẩm<asp:TextBox ID="txtKieu" runat="server" CssClass="form-control"></asp:TextBox>
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
    <br />
    <br />
    <div class="div2">
        <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" />
        <asp:Button ID="btnSua" runat="server" Text="Sửa" CssClass="btn btn-primary" OnClick="btnSua_Click" />
        <asp:Button ID="btnXoa" runat="server" Text="Xóa" CssClass="btn btn-primary" OnClick="btnXoa_Click" />
        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-primary" OnClick="btnReset_Click" />

    </div>
    <div class="div3">

    </div>
    <asp:Label ID="lbThongBao" runat="server" Text=""></asp:Label>
    <br />
    <hr />
    <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Type_ID" HeaderText="ID" />
            <asp:BoundField DataField="Type_Name" HeaderText="Kiểu" HtmlEncode="false" />
            <asp:BoundField DataField="Image" HeaderText="Ảnh" HtmlEncode="false" />
            <asp:CommandField SelectText="chọn" ShowSelectButton="True" />
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
