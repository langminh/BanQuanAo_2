<%@ Page Title="Giỏ hàng" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="BanQuanAo.GioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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

        .cart_totals {
            float: none !important;
            margin-bottom: 50px;
            width: 40%;
        }

            .cart_totals table {
                border-bottom: 1px solid #ddd;
                border-right: 1px solid #ddd;
                width: 100%;
            }

        .product-content-right {
            left: 18%;
        }
        .img-thumb{
                max-height: 335px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <asp:HiddenField runat="server" ID="product_id" />
    <div class="row">
        <div class="col-md-8">
            <div class="row">
                <div class="product-content-right">
                    <div class="woocommerce">
                        <asp:ListView runat="server" ID="ListCart" OnItemCommand="ListCart_ItemCommand">
                            <LayoutTemplate>
                                <table cellspacing="0" class="shop_table cart">
                                    <thead>
                                        <tr>
                                            <th class="product-remove">&nbsp;</th>
                                            <th class="product-thumbnail">&nbsp;</th>
                                            <th class="product-name"><asp:Literal ID="Literal3" runat="server" Text="<%$Resources: bqa.language, nameProduct%>"></asp:Literal></th>
                                            <th class="product-price"><asp:Literal ID="Literal1" runat="server" Text="<%$Resources: bqa.language, costProduct%>"></asp:Literal></th>
                                            <th class="product-quantity"><asp:Literal ID="Literal2" runat="server" Text="<%$Resources: bqa.language, lbQuanti%>"></asp:Literal></th>
                                            <th class="product-subtotal"><asp:Literal ID="Literal4" runat="server" Text="<%$Resources: bqa.language, lbTotal%>"></asp:Literal></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:PlaceHolder runat="server" ID="ItemPlaceHolder"></asp:PlaceHolder>
                                    </tbody>
                                    <%--                                        <tfoot>
                                            <tr>
                                                <td class="actions" colspan="6">
                                                    <div class="coupon">
                                                        <asp:HiddenField runat="server" ID="txtChange" />
                                                        <label for="coupon_code">Thay đổi số lượng:</label>
                                                        <asp:TextBox runat="server" type="text" placeholder="Số lượng" min="1" step="1" title="Thay đổi số lượng mua" value="" id="txtCoupon_code" CssClass="input-text" name="coupon_code" ></asp:TextBox>
                                                    </div>
                                                    <input type="submit" runat="server" value="Cập nhật" id="btnUpdateCart" name="update_cart" class="button" />
                                                    <input type="submit" runat="server" id="btnCheckOut" value="Thanh Toán" name="proceed" class="checkout-button button alt wc-forward" />
                                                </td>
                                            </tr>
                                        </tfoot>--%>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr class="cart_item">
                                    <td class="product-remove">
                                        <asp:LinkButton title="<%$Resources: bqa.language, titleDelete%>" runat="server" CommandName="DeleteItem" CommandArgument='<%# Eval("Product_ID") %>' CssClass="remove">×</asp:LinkButton>
                                        <asp:LinkButton runat="server" title="<%$Resources: bqa.language, titleChangeAmount%>" CommandName="UpdateItem" CommandArgument='<%# Eval("Product_ID") %>' CssClass="fa fa-edit text-success"></asp:LinkButton>
                                    </td>

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
                        <% if (items != null && items.Count > 0)
                            { %>
                        <div>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:HiddenField runat="server" ID="txtChange" />
                                    <label for="coupon_code"><asp:Literal ID="Literal3" runat="server" Text="<%$Resources: bqa.language, lbChangeAmount%>"></asp:Literal>:</label>
                                    <asp:TextBox runat="server" TextMode="Number" placeholder="<%$Resources: bqa.language, lbQuanti%>" min="1" step="1" title="<%$Resources: bqa.language, lbChangeAmount%>" value="" ID="txtCoupon_code" CssClass="input-text" name="coupon_code"></asp:TextBox>
                                    <asp:Button runat="server" Text="<%$Resources: bqa.language, btnUpdate%>" ID="btnUpdate" name="update_cart" OnClick="btnUpdate_Click" class="button" />
                                    <asp:Button runat="server" ID="Button3" Text="<%$Resources: bqa.language, btnPay%>" OnClick="btnThanhToan_Click" name="proceed" CssClass=" button alt wc-forward btn-success" />
                                </div>
                            </div>
                        </div>
                        <div class="cart_totals ">
                            <h2><asp:Literal ID="Literal6" runat="server" Text="<%$Resources: bqa.language, totalCart%>"></asp:Literal></h2>

                            <table cellspacing="0">
                                <tbody>
                                    <tr class="order-total">
                                        <th><asp:Literal ID="Literal5" runat="server" Text="<%$Resources: bqa.language, lbTotal%>"></asp:Literal></th>
                                        <td><strong><span class="amount">
                                            <asp:Label runat="server" ID="lbTong"></asp:Label></span></strong> </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <%}
                            else
                            {%>
                        <div class="text-center">
                            <p>
                                Không có sản phẩm nào trong giỏ hàng của bạn. Hãy tiếp tục tìm kiếm chiếc xe 
                            bạn yêu thích, hoặc <a href="TrangChu.aspx">&nbsp;Bấm vào đây</a>&nbsp;để quay lại <a href="TrangChu.aspx">trang
                            chủ</a>
                            </p>
                            <a href="SanPham.aspx" class="btn btn-primary">Tiếp tục mua hàng</a>
                        </div>
                        <%} %>
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
                                <asp:Literal ID="Literal9" runat="server" Text="<%$Resources: bqa.language, titleBuy%>"></asp:Literal></h2>
                        </div>
                    </div>
                </div>
                
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
