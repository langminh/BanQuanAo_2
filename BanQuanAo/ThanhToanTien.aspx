<%@ Page Title="Thanh toán tiền" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="ThanhToanTien.aspx.cs" Inherits="BanQuanAo.ThanhToan" %>

<%@ Import Namespace="BanQuanAo.Helper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        input#ContentPlaceHolder1_btnDatHang {
            margin-top: 20px;
        }

        input#ContentPlaceHolder1_Button1 {
            margin-bottom: 20px;
        }

        .cls {
            margin-left: 10px;
        }

        table.shop_table.cart {
            border-bottom: 1px solid #ddd;
            border-right: 1px solid #ddd;
            margin-bottom: 50px;
            width: 100%;
        }

        table.shop_table th {
            background: none repeat scroll 0 0 #f4f4f4;
            font-size: 15px;
            text-transform: uppercase;
        }

        table.shop_table th, table.shop_table td {
            border-left: 1px solid #ddd;
            border-top: 1px solid #ddd;
            padding: 15px;
            text-align: center;
        }

        .cart_totals table {
            border-bottom: 1px solid #ddd;
            border-right: 1px solid #ddd;
            width: 100%;
        }

        .product-content-right {
            padding: 0 15px;
        }

        .woocommerce-info {
            background: none repeat scroll 0 0 #f4f4f4;
            font-size: 18px;
            margin-bottom: 20px;
            padding: 15px;
        }

        div#login-form-wrap {
            background: none repeat scroll 0 0 #f4f4f4;
            margin-bottom: 30px;
            padding: 25px;
        }

        #login-form-wrap label {
            display: block;
            margin-bottom: 5px;
        }

        #login-form-wrap input[type="text"], #login-form-wrap input[type="password"] {
            margin-bottom: 10px;
            width: 250px;
        }

        input[type="text"], input[type="password"], input[type="email"], textarea {
            border: 1px solid #ddd;
            padding: 10px;
        }

        #login-form-wrap input[type="submit"] {
            margin-bottom: 15px;
        }

        input[type="submit"], button[type=submit] {
            background: none repeat scroll 0 0 #5a88ca;
            border: medium none;
            color: #fff;
            padding: 11px 20px;
            text-transform: uppercase;
        }

        #login-form-wrap label {
            /* float: right; */
            line-height: 50px;
            margin: 0 15px;
        }

        p.form-row.form-row-first {
            float: left;
            margin: 0 15px;
        }

        #login-form-wrap input[type="submit"] {
            margin-left: 35px;
        }

        p.lost_password {
            margin-left: 35px;
        }

        .cart_totals {
            float: right;
            margin-bottom: 50px;
            width: 40%;
        }

            .cart_totals table th {
                background: none repeat scroll 0 0 #f4f4f4;
            }

            .cart_totals table th, .cart_totals table td {
                border-left: 1px solid #ddd;
                border-top: 1px solid #ddd;
                padding: 10px;
            }

        .col2-set {
            margin-left: -30px;
            overflow: hidden;
        }

        abbr.required {
            margin-left: 5px;
        }

        div#customer_details {
            padding: 10px;
        }

        .woocommerce {
            margin-top: 20px;
        }
        .img-thumb{
                max-height: 335px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 150px;"></div>

    <div class="row">
        <div class="col-md-12">
            <% if (items != null && items.Count > 0)
                { %>
            <div class="product-content-right">
                <div class="woocommerce">
                    <div>
                        <% if (Session[CommonContanst.USER_SESSION] == null)
                            { %>
                        <div class="woocommerce-info">
                            <asp:Literal ID="Literal3" runat="server" Text="<%$Resources: bqa.language, hasAcount%>"></asp:Literal>
                            <a class="showlogin" data-toggle="collapse" href="#login-form-wrap" aria-expanded="false" aria-controls="login-form-wrap">
                                <asp:Literal ID="Literal5" runat="server" Text="<%$Resources: bqa.language, clickLogin%>"></asp:Literal></a>
                        </div>

                        <div id="login-form-wrap" class="login collapse">


                            <p>
                                <asp:Literal ID="Literal6" runat="server" Text="<%$Resources: bqa.language, lbNote%>"></asp:Literal>
                            </p>

                            <p class="form-row form-row-first">
                                <label for="username">
                                    <asp:Literal ID="Literal7" runat="server" Text="<%$Resources: bqa.language, txtEmail%>"></asp:Literal><span class="required">*</span>
                                </label>
                                <asp:TextBox runat="server" TextMode="SingleLine" ID="txtusername" name="username" CssClass="input-text"></asp:TextBox>
                            </p>
                            <p class="form-row form-row-last">
                                <label for="password">
                                    <asp:Literal ID="Literal8" runat="server" Text="<%$Resources: bqa.language, txtPass%>"></asp:Literal><span class="required">*</span>
                                </label>
                                <asp:TextBox TextMode="Password" runat="server" ID="txt_pass" name="password" CssClass="input-text"></asp:TextBox>
                            </p>
                            <div class="clear"></div>


                            <p class="form-row">
                                <asp:Button runat="server" type="submit" OnClick="Unnamed_Click" Text="<%$Resources: bqa.language, btnOkLogin%>" name="login" CssClass="button" />
                                <label class="inline" for="rememberme">
                                    <asp:CheckBox runat="server" ID="ckb_remember" name="rememberme" />
                                    <asp:Literal ID="Literal9" runat="server" Text="<%$Resources: bqa.language, rememberMe%>"></asp:Literal>
                                </label>
                            </p>
                            <p class="lost_password">
                                <a href="#">
                                    <asp:Literal ID="Literal10" runat="server" Text="<%$Resources: bqa.language, lbFogotPass%>"></asp:Literal></a>
                            </p>

                            <div class="clear"></div>
                        </div>
                        <%} %>
                        <p>
                            <asp:Label runat="server" ID="msg" Text=""></asp:Label>
                        </p>
                    </div>
                    <div class="checkout">

                        <h3 id="order_review_heading">
                            <asp:Literal ID="Literal11" runat="server" Text="<%$Resources: bqa.language, yourOrder%>"></asp:Literal></h3>
                        <div id="order_review" style="position: relative;">

                            <asp:ListView runat="server" ID="ListCart">
                                <LayoutTemplate>
                                    <table cellspacing="0" class="shop_table cart">
                                        <thead>
                                            <tr>
                                                <th class="product-thumbnail">&nbsp;</th>

                                                <th class="product-name">
                                                    <asp:Literal ID="Literal3" runat="server" Text="<%$Resources: bqa.language, nameProduct%>"></asp:Literal></th>
                                                <th class="product-price">
                                                    <asp:Literal ID="Literal1" runat="server" Text="<%$Resources: bqa.language, costProduct%>"></asp:Literal></th>
                                                <th class="product-quantity">
                                                    <asp:Literal ID="Literal2" runat="server" Text="<%$Resources: bqa.language, lbQuanti%>"></asp:Literal></th>
                                                <th class="product-subtotal">
                                                    <asp:Literal ID="Literal4" runat="server" Text="<%$Resources: bqa.language, lbTotal%>"></asp:Literal></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:PlaceHolder runat="server" ID="ItemPlaceHolder"></asp:PlaceHolder>
                                        </tbody>
                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr class="cart_item">

                                        <td class="product-thumbnail">
                                            <a href="ChiTietSanPham.aspx?Product_ID=<%# Eval("Product_ID") %>">
                                                <img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="../Images/<%# Eval("Image") %>" /></a>
                                        </td>

                                        <td class="product-name">
                                            <a href="ChiTietSanPham.aspx?Product_ID=<%# Eval("Product_ID") %>"><%# Eval("Product_Name") %></a>
                                        </td>

                                        <td class="product-price">
                                            <span class="amount"><%#String.Format("{0:n0}", float.Parse(Eval("Price_Export").ToString()))%> VNĐ</span>
                                        </td>

                                        <td class="product-quantity">
                                            <div class="quantity buttons_added">
                                                <asp:TextBox runat="server" ID="txtQuanti" ReadOnly="true" TextMode="Number" size="4" CssClass="input-text qty text" title="Số lượng mua" Text='<%# Bind("SoLuongMua")%>' min="0" step="1" />
                                            </div>
                                        </td>

                                        <td class="product-subtotal">
                                            <span class="amount"><%#String.Format("{0:n0}", float.Parse(Eval("TongTien").ToString()))%> VNĐ</span>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <div class="cart_totals ">
                                <h2>
                                    <asp:Literal ID="Literal25" runat="server" Text="<%$Resources: bqa.language, totalCart%>"></asp:Literal></h2>

                                <table cellspacing="0">
                                    <tbody>
                                        <tr class="shipping">
                                            <th>
                                                <asp:Literal ID="Literal12" runat="server" Text="<%$Resources: bqa.language, titleBuy2%>"></asp:Literal></th>
                                            <td>
                                                <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="drVC_SelectedIndexChanged" CssClass="form-control" ID="drVC" DataTextField="Transport_Name" DataValueField="Transport_ID"></asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Literal ID="Literal13" runat="server" Text="<%$Resources: bqa.language, detailTranport%>"></asp:Literal></td>
                                            <td>
                                                <asp:Label runat="server" ID="lbPhiVC"></asp:Label></td>
                                        </tr>
                                        <tr class="shipping">
                                            <th>
                                                <asp:Literal ID="Literal14" runat="server" Text="<%$Resources: bqa.language, titleBuy1%>"></asp:Literal></th>
                                            <td>
                                                <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="drTT_SelectedIndexChanged" CssClass="form-control" ID="drTT" DataTextField="Pay_Name" DataValueField="Pay_ID"></asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Literal ID="Literal15" runat="server" Text="<%$Resources: bqa.language, detailPay%>"></asp:Literal></td>
                                            <td>
                                                <asp:Label runat="server" ID="lbPhiTT"></asp:Label></td>
                                        </tr>
                                        <tr class="order-total">
                                            <th>
                                                <asp:Literal ID="Literal16" runat="server" Text="<%$Resources: bqa.language, totalCart%>"></asp:Literal></th>
                                            <td><strong><span class="amount">
                                                <asp:Label runat="server" ID="lbTong"></asp:Label></span></strong> </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="customer_details" class="col2-set">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="txtHoTen">
                                                <asp:Literal ID="Literal17" runat="server" Text="<%$Resources: bqa.language, txtName%>"></asp:Literal><abbr title="required" class="required">*</abbr></label>
                                            <asp:TextBox runat="server" placeholder="<%$Resources: bqa.language, txtName%>" ID="txtHoTen" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="txtDiaChi">
                                                <asp:Literal ID="Literal18" runat="server" Text="<%$Resources: bqa.language, txtAddress%>"></asp:Literal><abbr title="required" class="required">*</abbr></label>
                                            <asp:TextBox placeholder="<%$Resources: bqa.language, txtAddress%>" runat="server" ID="txtDiaChi" ClientIDMode="Static" CssClass="form-control "></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="txtEmail">
                                            <asp:Literal ID="Literal19" runat="server" Text="<%$Resources: bqa.language, Email%>"></asp:Literal><abbr title="required" class="required">*</abbr></label>
                                        <asp:TextBox placeholder="<%$Resources: bqa.language, Email%>" runat="server" ClientIDMode="Static" ID="txtEmail" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="txtSoDienThoai">
                                            <asp:Literal ID="Literal20" runat="server" Text="<%$Resources: bqa.language, txtPhone%>"></asp:Literal><abbr title="required" class="required">*</abbr></label>
                                        <asp:TextBox runat="server" ID="txtSoDienThoai" TextMode="Number" CssClass="form-control" />
                                    </div>
                                </div>

                                <div class="woocommerce-billing-fields">
                                    <div class="clear"></div>
                                    <p id="btn" class="form-row form-row-last validate-required validate-phone">
                                        <asp:Button runat="server" ID="btnBooking" Text="<%$Resources: bqa.language, btnConfirm%>" OnClick="btnDatHang_Click" />
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <%}
                else
                { %>
            <div class="text-center">
                <p>
                    <asp:Literal ID="Literal21" runat="server" Text="<%$Resources: bqa.language, noThing%>"></asp:Literal><a href="TrangChu.aspx">&nbsp;<asp:Literal ID="Literal22" runat="server" Text="<%$Resources: bqa.language, clickHere%>"></asp:Literal></a>&nbsp;<asp:Literal ID="Literal26" runat="server" Text="<%$Resources: bqa.language, toBack%>"></asp:Literal>
                    <a href="TrangChu.aspx">
                        <asp:Literal ID="Literal23" runat="server" Text="<%$Resources: bqa.language, menuHome%>"></asp:Literal>trang
                            chủ</a>
                </p>
                <a href="SanPham.aspx" class="btn btn-primary">
                    <asp:Literal ID="Literal24" runat="server" Text="<%$Resources: bqa.language, btnContinue%>"></asp:Literal></a>
            </div>
            <%} %>
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
                                        <asp:Image ID="Image1" runat="server" CssClass="img-thumb" ImageUrl='<%# "./Images/"+DataBinder.Eval(Container.DataItem, "Image") %>' />
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
</asp:Content>
