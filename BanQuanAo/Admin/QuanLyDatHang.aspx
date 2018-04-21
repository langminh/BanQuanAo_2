<%@ Page Title="Quản lý danh sách đặt hàng" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyDatHang.aspx.cs" Inherits="BanQuanAo.Admin.QuanLyDatHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-inline {
            margin-top: 20px;
            margin-bottom: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">

        <div class="form-inline">
            <div class="form-group mx-sm-3 mb-2">
                <label for="inputPassword2" class="sr-only">Mã hóa đơn</label>
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="Mã hóa đơn"></asp:TextBox>
            </div>
            <asp:Button runat="server" ID="btnSearch" CssClass="btn btn-primary mb-2" OnClick="btnSearch_Click" Text="Tìm kiếm"></asp:Button>
        </div>

        <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Order_ID" HeaderText="Mã hóa đơn" />
                <asp:BoundField DataField="Date" HeaderText="Ngày mua" />
                <asp:BoundField DataField="Name_Received" HeaderText="Người nhận" />
                <asp:BoundField DataField="Name_Pay" HeaderText="Người thanh toán" />
                <asp:BoundField DataField="SumMoney" HeaderText="Tổng tiền" />
                <asp:HyperLinkField HeaderText="Chi tiết" DataNavigateUrlFields="Order_ID" DataNavigateUrlFormatString="ChitietHD.aspx?Order_ID={0}" Text="Chi tiết" />
                <asp:HyperLinkField HeaderText="Hoá đơn" DataNavigateUrlFields="Order_ID" DataNavigateUrlFormatString="Xemhoadon.aspx?Order_ID={0}" Text="Xem hóa đơn" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
