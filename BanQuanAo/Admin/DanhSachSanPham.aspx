<%@ Page Title="Danh sách sản phẩm" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DanhSachSanPham.aspx.cs" Inherits="BanQuanAo.Admin.DanhSachSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container-fluid {
            margin-top: 20px;
        }

        img {
            max-width: 75px;
        }

        .form-group {
            margin-top: 15px;
            margin-left: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="form-group">
                <asp:Button runat="server" ID="btnAdd" OnClick="btnAdd_Click" CssClass="btn btn-primary" Text="Thêm mới sản phẩm" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Product_ID" HeaderText="ID" />
                        <asp:BoundField DataField="Product_Name" HeaderText="Name" HtmlEncode="false" />
                        <asp:BoundField DataField="Type_ID" HeaderText="Type" HtmlEncode="false" />
                        <asp:BoundField DataField="Style_ID" HeaderText="Style" HtmlEncode="false" />
                        <asp:BoundField DataField="Producer_ID" HeaderText="NSX" HtmlEncode="false" />
                        <asp:BoundField DataField="Supplier_ID" HeaderText="NCC" HtmlEncode="false" />
                        <asp:BoundField DataField="Color" HeaderText="Màu" HtmlEncode="false" />
                        <asp:BoundField DataField="Material" HeaderText="Chất liệu" HtmlEncode="false" />
                        <asp:BoundField DataField="Size" HeaderText="Size" HtmlEncode="false" />
                        <asp:BoundField DataField="Price_Import" HeaderText="Giá nhập" HtmlEncode="false" />
                        <asp:BoundField DataField="Price_Export" HeaderText="Giá xuất" HtmlEncode="false" />
                        <asp:BoundField DataField="Amount" HeaderText="Số lượng" HtmlEncode="false" />
                        <asp:BoundField DataField="Weight" HeaderText="Trọng lượng" HtmlEncode="false" />
                        <asp:ImageField DataImageUrlField="Image" HeaderText="Ảnh" DataImageUrlFormatString="../Images/{0}" />
                        <asp:BoundField DataField="Order" HeaderText="Ưu tiên" HtmlEncode="false" Visible="false" />
                        <asp:BoundField DataField="Description" HeaderText="Mô tả" HtmlEncode="false" Visible="false" />
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
        </div>
    </div>
</asp:Content>
