<%@ Page Title="Xem hóa đơn" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Xemhoadon.aspx.cs" Inherits="BanQuanAo.Admin.Xemhoadon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .invoice-title h2, .invoice-title h3 {
            display: inline-block;
        }

        .table > tbody > tr > .no-line {
            border-top: none;
        }

        .table > thead > tr > .no-line {
            border-bottom: none;
        }

        .table > tbody > tr > .thick-line {
            border-top: 2px solid;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="invoice-title">
                    <h2>Hoá đơn</h2>
                    <h3 class="pull-right">MÃ HÓA ĐƠN:<asp:Label ID="lbMaHoaDon" runat="server" Text=""></asp:Label>
                    </h3>
                </div>
                <hr>
                <div class="row">
                    <div class="col-xs-6">
                        <address>
                            <strong>Khách hàng:
                                <asp:Label ID="lbKhachHang" runat="server" Text=""></asp:Label></strong><br>
                        </address>
                        <hr />
                    </div>
                    <div class="col-xs-6 text-right">
                        <address>
                            <strong></strong>
                            <br>
                        </address>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <strong>Số điện thoại thanh toán: </strong>
                        <asp:Label ID="lbSDTPay" runat="server" Text=""></asp:Label>
                        <br />
                        <br>
                        <strong>Địa chỉ: </strong>
                        <asp:Label ID="lbDiaChi" runat="server" Text=""></asp:Label>
                        <br />
                        <br>
                        <strong>Ngày đặt:</strong>
                        <asp:Label ID="lbNgayDat" runat="server" Text=""></asp:Label><br>
                        <br />
                        <strong>Phương thức vận chuyển:</strong>
                        <asp:Label ID="lbPtvanchuyen" runat="server" Text=""></asp:Label><br />
                        <br />
                        <strong>Hình thức thanh toán:</strong>
                        <asp:Label ID="lbPtthanhtoan" runat="server" Text=""></asp:Label><br />
                        <br />
                        <strong>Người nhận:</strong>
                        <asp:Label ID="lbNguoiNhan" runat="server" Text=""></asp:Label><br />
                        <br />


                    </div>
                    <div class="col-xs-6 text-left">
                        <address>
                            <strong>Địa chỉ nhận:</strong>
                            <asp:Label ID="lbDiaChiNhan" runat="server" Text=""></asp:Label><br />
                            <br />
                            <strong>Số điện thoại nhận:</strong>
                            <asp:Label ID="lbSodienThoaiNhan" runat="server" Text=""></asp:Label><br />
                            <br />
                            <strong>Tin nhắn:</strong>
                            <asp:Label ID="lbTinNhan" runat="server" Text=""></asp:Label><br />
                            <br />
                            <strong>Phụ phí:</strong>
                            <asp:Label ID="lbPhuPhi" runat="server" Text=""></asp:Label><br />
                            <br />
                            <strong>Tổng khối lượng:</strong>
                            <asp:Label ID="lbKhoiLuong" runat="server" Text=""></asp:Label><br />
                            <br />
                            <strong>Phí vận chuyển:</strong>
                            <asp:Label ID="lbPhiVanChuyen" runat="server" Text=""></asp:Label><br />
                            <br />
                            <strong>Tổng tiền:</strong>
                            <asp:Label ID="lbTongTien" runat="server" Text=""></asp:Label><br />
                            <br />
                        </address>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><strong>Danh sách mặt hàng</strong></h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" CssClass="table table-condensed" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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

                        <asp:Button ID="btlBack" runat="server" CssClass="btn btn-primary" Text="Trở lại" OnClick="btlBack_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
