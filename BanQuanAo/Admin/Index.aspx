<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="BanQuanAo.Admin.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Asset/Admin/vendor/linearicons/style.css" rel="stylesheet" />
    <script src="../Asset/Admin/vendor/bootstrap/js/bootstrap.min.js"></script>

    <style>
        button.btn-toggle-collapse {
            padding: 0;
            margin-left: 5px;
            background-color: transparent;
            border: none;
            outline: none;
        }

        button.btn-remove {
            padding: 0;
            margin-left: 5px;
            background-color: transparent;
            border: none;
            outline: none;
        }

        .right {
            position: absolute;
            right: 20px;
            top: 32%;
        }

        .metric {
            min-height: 115px;
                padding: 0 90px 0 0;
        }

            .metric .icon {
                -webkit-border-radius: 50%;
                -moz-border-radius: 50%;
                border-radius: 50%;
                float: left;
                width: 50px;
                height: 50px;
                line-height: 50px;
                background-color: #0081c2;
                text-align: center;
            }

        .metric .icon i {
            font-size: 18px;
            color: #fff;
        }

        .metric p {
            margin-bottom: 0;
            line-height: 1.2;
            text-align: right;
        }

        .metric .title {
            font-size: 16px;
        }

        .metric .number {
            display: block;
            font-size: 28px;
            font-weight: 300;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- MAIN CONTENT -->
    <div class="main-content">
        <div class="container-fluid">
            <h1>Trang chủ</h1>
            <!-- OVERVIEW -->
            <div class="panel panel-headline">
                <div class="panel-heading">
                    <h3 class="panel-title">Tình trạng trong tuần</h3>
                    <p class="panel-subtitle">
                        <asp:Label runat="server" ID="time"></asp:Label>
                    </p>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="metric">
                                <span class="icon"><i class="fa fa-eye"></i></span>
                                <p>
                                    <asp:Label runat="server" ID="lbTruyCap" Text="" CssClass="number"></asp:Label>
                                    <span class="title">Lượt truy cập</span>
                                </p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="metric">
                                <span class="icon"><i class="fa fa-comment"></i></span>
                                <p>
                                    <asp:Label runat="server" ID="lbComment" Text="" CssClass="number"></asp:Label>
                                    <span class="title">Online</span>
                                </p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="metric">
                                <span class="icon"><i class="fa fa-shopping-bag"></i></span>
                                <p>
                                    <asp:Label runat="server" ID="lbSoild" Text="" CssClass="number"></asp:Label>
                                    <span class="title">sản phẩm đã bán</span>
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">Lượt sản phẩm trong tháng</h3>
                            
                        </div>
                        <div class="panel-body no-padding">
                            <div class="row">
                                <div class="col-md-4 cls">
                                    <asp:Label runat="server" ID="lbTotalSoild" Text="120" CssClass="number"></asp:Label>
                                    <span class="info-label">Tổng lượng bán</span>
                                </div>
                                <div class="col-md-4 cls">
                                    <asp:Label runat="server" ID="lbTotalMonth" Text="" CssClass="number"></asp:Label>
                                    <span class="info-label">Trong tháng qua</span>
                                </div>
                                <div class="col-md-4 cls">
                                    <asp:Label Text="" runat="server" ID="lbTotalWeek" CssClass="number"></asp:Label>
                                    <span class="info-label">Trong tuần này</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">Lượt người dùng trong tháng</h3>
                           
                        </div>
                        <div class="panel-body no-padding">
                            <div class="row">
                                <div class="col-md-4 cls">
                                    <asp:Label runat="server" ID="Label1" Text="" CssClass="number"></asp:Label>
                                    <span class="info-label">Tổng lượt người truy cập</span>
                                </div>
                                <div class="col-md-4 cls">
                                    <asp:Label runat="server" ID="Label2" Text="" CssClass="number"></asp:Label>
                                    <span class="info-label">Trong tháng qua</span>
                                </div>
                                <div class="col-md-4 cls">
                                    <asp:Label Text="" runat="server" ID="Label3" CssClass="number"></asp:Label>
                                    <span class="info-label">Trong tuần này</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- END OVERVIEW -->
        <div class="row">
            <div class="col-md-12">
                <!-- RECENT PURCHASES -->
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">Yêu cầu hóa đơn mới</h3>
                       
                    </div>
                    <div class="panel-body no-padding">
                        <asp:ListView runat="server" ID="listDH" OnItemCommand="listDH_ItemCommand">
                            <LayoutTemplate>
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Mã hóa đơn</th>
                                            <th>Tên khách hàng</th>
                                            <th>Số lượng</th>
                                            <th>Thời gian</th>
                                            <th>Trạng thái</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                                    </tbody>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:LinkButton runat="server" CommandName="See" CommandArgument='<%#Eval("MaDH") %>' ID="LinkButton2"><%#Eval("MaDH") %></asp:LinkButton></td>
                                    <td><%# Eval("HoTen") %></td>
                                    <td><%# Eval("SoLuong") %></td>
                                    <td><%# Eval("ThoiGian") %></td>
                                    <td><%# Eval("TrangThai") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                    <div class="panel-footer">
                        <div class="row">
                            <div class="col-md-6"><span class="panel-note"><i class="fa fa-clock-o"></i>Trong vòng 24h qua</span></div>
                            <div class="col-md-6 text-right">
                                <a href="/Admin/QuanLyDatHang.aspx" class="btn btn-primary">Xem tất cả đơn hàng</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END RECENT PURCHASES -->
            </div>
        </div>
    </div>
</asp:Content>
