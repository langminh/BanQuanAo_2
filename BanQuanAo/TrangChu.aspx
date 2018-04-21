<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="BanQuanAo.TrangChu1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .slide {
            margin-top: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Slider -->
    <div class="slide">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <% for (int i = 0; i < listSlide.Count; i++)
                    { %>
                <li data-target="#carouselExampleIndicators" data-slide-to="<%= i %>" class="<%= i == 0 ? "active" : "" %>"></li>
                <%} %>
            </ol>
            
            <div class="carousel-inner" role="listbox">
                <% for (int i = 0; i < listSlide.Count; i++)
                    { %>
                <div class="carousel-item <%= i == 0 ? "active" : "" %>">
                    <img class="d-block img-fluid" src="../Images/slides/<%= listSlide[i].Image %>" alt="First slide" />
                    <div class="carousel-caption d-none d-md-block">
                        <h3><%= listSlide[i].Title %></h3>
                        <p><%= listSlide[i].Content %></p>
                    </div>
                </div>
                <%} %>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <!-- Banner -->

    <div class="banner">
        <div class="container">
            <div class="row">
                <asp:ListView runat="server" ID="type">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="banner_item align-items-center" style="background-image: url('../Images/type/<%#Eval("Image") %>')">
                                <div class="banner_category">
                                    <a href="SanPham.aspx?catalog=<%# Eval("Type_ID") %>"><%# Eval("Type_Name") %></a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>

    <!-- New Arrivals -->

    <div class="new_arrivals">
        <div class="container">
            <div class="row">
                <div class="col text-center">
                    <div class="section_title new_arrivals_title">
                        <h2>
                            <asp:Literal ID="Literal3" runat="server" Text="<%$Resources: bqa.language, titleNew%>"></asp:Literal></h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="product-grid" data-isotope='{ "itemSelector": ".product-item", "layoutMode": "fitRows" }'>
                        <asp:DataList ID="sanpham" runat="server" HorizontalAlign="Center"
                            RepeatColumns="4" Width="100%" DataKeyField="Product_ID" RepeatDirection="Horizontal">
                            <ItemTemplate>

                                <div class="product-item <%# DataBinder.Eval(Container.DataItem, "Color") %>">
                                    <div class="product discount product_filter">

                                        <div class="product_image">
                                            <a href="<%# "ChiTietSanPham.aspx?Product_ID="+DataBinder.Eval(Container.DataItem, "Product_ID") %>">
                                                <asp:Image ID="Image1" runat="server" Height="224px" ImageUrl='<%# "./Images/"+DataBinder.Eval(Container.DataItem, "Image") %>' />
                                            </a>
                                        </div>

                                        <div class="favorite favorite_left"></div>
                                        <div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-$20</span></div>
                                        <div class="product_info">
                                            <h6 class="product_name"><a href="<%# "ChiTietSanPham.aspx?Product_ID="+DataBinder.Eval(Container.DataItem, "Product_ID") %>"><%#  DataBinder.Eval(Container.DataItem, "Product_Name") %></a></h6>
                                            <div class="product_price"><%#  int.Parse(DataBinder.Eval(Container.DataItem, "Price_Export").ToString()) - 10 %><span><%#  DataBinder.Eval(Container.DataItem, "Price_Export") %></span></div>
                                        </div>
                                    </div>
                                    <div class="red_button add_to_cart_button">
                                        <a href="<%# "GioHang.aspx?id="+DataBinder.Eval(Container.DataItem, "Product_ID") %>">
                                            <asp:Literal ID="Literal13" runat="server" Text="<%$Resources: bqa.language, addCart%>"></asp:Literal></a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>
            </div>
        </div>
        <!-- Deal of the week -->

        <div class="deal_ofthe_week">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <div class="deal_ofthe_week_img">
                            <img src="../Images/deal_ofthe_week.png" alt="" />
                        </div>
                    </div>
                    <div class="col-lg-6 text-right deal_ofthe_week_col">
                        <div class="deal_ofthe_week_content d-flex flex-column align-items-center float-right">
                            <div class="section_title">
                                <h2>
                                    <asp:Literal ID="Literal4" runat="server" Text="<%$Resources: bqa.language, actionSale%>"></asp:Literal></h2>
                            </div>
                            <ul class="timer">
                                <li class="d-inline-flex flex-column justify-content-center align-items-center">
                                    <div id="day" class="timer_num">03</div>
                                    <div class="timer_unit">
                                        <asp:Literal ID="Literal5" runat="server" Text="<%$Resources: bqa.language, day%>"></asp:Literal>
                                    </div>
                                </li>
                                <li class="d-inline-flex flex-column justify-content-center align-items-center">
                                    <div id="hour" class="timer_num">15</div>
                                    <div class="timer_unit">
                                        <asp:Literal ID="Literal6" runat="server" Text="<%$Resources: bqa.language, hours%>"></asp:Literal>
                                    </div>
                                </li>
                                <li class="d-inline-flex flex-column justify-content-center align-items-center">
                                    <div id="minute" class="timer_num">45</div>
                                    <div class="timer_unit">
                                        <asp:Literal ID="Literal7" runat="server" Text="<%$Resources: bqa.language, minute%>"></asp:Literal>
                                    </div>
                                </li>
                                <li class="d-inline-flex flex-column justify-content-center align-items-center">
                                    <div id="second" class="timer_num">23</div>
                                    <div class="timer_unit">
                                        <asp:Literal ID="Literal8" runat="server" Text="<%$Resources: bqa.language, second%>"></asp:Literal>
                                    </div>
                                </li>
                            </ul>
                            <div class="red_button deal_ofthe_week_button"><a href="KhuyenMai.aspx">Mua ngay</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Best Sellers -->

        <div class="best_sellers">
            <div class="container">
                <div class="row">
                    <div class="col text-center">
                        <div class="section_title new_arrivals_title">
                            <h2>
                                <asp:Literal ID="Literal9" runat="server" Text="<%$Resources: bqa.language, titleBuy%>"></asp:Literal></h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="product-grid" data-isotope='{ "itemSelector": ".product-item", "layoutMode": "fitRows" }'>
                            <!-- Slide 1 -->
                            <asp:DataList runat="server" ID="listBan" HorizontalAlign="Center"
                                RepeatColumns="4" Width="100%" DataKeyField="Product_ID" RepeatDirection="Horizontal">
                                <ItemTemplate>

                                    <div class="product-item <%# DataBinder.Eval(Container.DataItem, "Color") %>">
                                        <div class="product discount product_filter">

                                            <div class="product_image">
                                                <a href="<%# "ChiTietSanPham.aspx?Product_ID="+DataBinder.Eval(Container.DataItem, "Product_ID") %>">
                                                    <asp:Image ID="Image1" runat="server" Height="224px" ImageUrl='<%# "./Images/"+DataBinder.Eval(Container.DataItem, "Image") %>' />
                                                </a>
                                            </div>

                                            <div class="favorite favorite_left"></div>
                                            <div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-$20</span></div>
                                            <div class="product_info">
                                                <h6 class="product_name"><a href="<%# "ChiTietSanPham.aspx?Product_ID="+DataBinder.Eval(Container.DataItem, "Product_ID") %>"><%#  DataBinder.Eval(Container.DataItem, "Product_Name") %></a></h6>
                                                <div class="product_price"><%#  int.Parse(DataBinder.Eval(Container.DataItem, "Price_Export").ToString()) - 10 %><span><%#  DataBinder.Eval(Container.DataItem, "Price_Export") %></span></div>
                                            </div>
                                        </div>
                                        <div class="red_button add_to_cart_button">
                                            <a href="<%# "GioHang.aspx?id="+DataBinder.Eval(Container.DataItem, "Product_ID") %>">
                                                <asp:Literal ID="Literal11" runat="server" Text="<%$Resources: bqa.language, addCart%>"></asp:Literal></a>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                            <!-- Slider Navigation -->

                            <div class="product_slider_nav_left product_slider_nav d-flex align-items-center justify-content-center flex-column">
                                <i class="fa fa-chevron-left" aria-hidden="true"></i>
                            </div>
                            <div class="product_slider_nav_right product_slider_nav d-flex align-items-center justify-content-center flex-column">
                                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="best_sellers">
        <div class="container">
            <div class="row">
                <div class="col text-center">
                    <div class="section_title new_arrivals_title">
                        <h2>
                            <asp:Literal ID="Literal10" runat="server" Text="<%$Resources: bqa.language, titleSale%>"></asp:Literal></h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="product-grid" data-isotope='{ "itemSelector": ".product-item", "layoutMode": "fitRows" }'>
                        <!-- Slide 1 -->
                        <asp:DataList runat="server" ID="listMoi" HorizontalAlign="Center"
                            RepeatColumns="4" Width="100%" DataKeyField="Product_ID" RepeatDirection="Horizontal">
                            <ItemTemplate>

                                <div class="product-item <%# DataBinder.Eval(Container.DataItem, "Color") %>">
                                    <div class="product discount product_filter">

                                        <div class="product_image">
                                            <a href="<%# "ChiTietSanPham.aspx?Product_ID="+DataBinder.Eval(Container.DataItem, "Product_ID") %>">
                                                <asp:Image ID="Image1" runat="server" Height="224px" ImageUrl='<%# "./Images/"+DataBinder.Eval(Container.DataItem, "Image") %>' />
                                            </a>
                                        </div>
                                        <div class="favorite favorite_left"></div>
                                        <div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center"><span>-$20</span></div>
                                        <div class="product_info">
                                            <h6 class="product_name"><a href="<%# "ChiTietSanPham.aspx?Product_ID="+DataBinder.Eval(Container.DataItem, "Product_ID") %>"><%#  DataBinder.Eval(Container.DataItem, "Product_Name") %></a></h6>
                                            <div class="product_price"><%#  int.Parse(DataBinder.Eval(Container.DataItem, "Price_Export").ToString()) - 10 %><span><%#  DataBinder.Eval(Container.DataItem, "Price_Export") %></span></div>
                                        </div>
                                    </div>
                                    <div class="red_button add_to_cart_button">
                                        <a href="<%# "GioHang.aspx?id="+DataBinder.Eval(Container.DataItem, "Product_ID") %>">
                                            <asp:Literal ID="Literal12" runat="server" Text="<%$Resources: bqa.language, addCart%>"></asp:Literal></a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>

                        <!-- Slider Navigation -->

                        <div class="product_slider_nav_left product_slider_nav d-flex align-items-center justify-content-center flex-column">
                            <i class="fa fa-chevron-left" aria-hidden="true"></i>
                        </div>
                        <div class="product_slider_nav_right product_slider_nav d-flex align-items-center justify-content-center flex-column">
                            <i class="fa fa-chevron-right" aria-hidden="true"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
