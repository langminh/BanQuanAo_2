<%@ Page Title="Chi tiết sản phẩm" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="ChiTietSanPham.aspx.cs" Inherits="BanQuanAo.ChiTietSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Asset/Client/styles/single_styles.css" rel="stylesheet" />

    <link href="Asset/Client/styles/single_responsive.css" rel="stylesheet" />
    <style>
        input#ContentPlaceHolder1_Button4 {
            margin-top: 10px;
        }

        body {
            font-family: Arial;
            margin: 0;
        }

        * {
            box-sizing: border-box;
        }

        img {
            vertical-align: middle;
        }

        /* Position the image container (needed to position the left and right arrows) */
        .container {
            position: relative;
        }

        /* Hide the images by default */
        .mySlides {
            display: none;
        }

        /* Add a pointer when hovering over the thumbnail images */
        .cursor {
            cursor: pointer;
        }

        /* Next & previous buttons */
        .prev,
        .next {
            cursor: pointer;
            position: absolute;
            top: 40%;
            width: auto;
            padding: 16px;
            margin-top: -50px;
            color: white;
            font-weight: bold;
            font-size: 20px;
            border-radius: 0 3px 3px 0;
            user-select: none;
            -webkit-user-select: none;
        }

        /* Position the "next button" to the right */
        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

            /* On hover, add a black background color with a little bit see-through */
            .prev:hover,
            .next:hover {
                background-color: rgba(0, 0, 0, 0.8);
            }

        /* Number text (1/3 etc) */
        .numbertext {
            color: #f2f2f2;
            font-size: 12px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
        }

        /* Container for image text */
        .caption-container {
            text-align: center;
            background-color: #222;
            padding: 2px 16px;
            color: white;
        }

        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Six columns side by side */
        .column {
            float: left;
            width: 16.66%;
            margin: 0 5px;
        }

        /* Add a transparency effect for thumnbail images */
        .demo {
            opacity: 0.6;
        }

            .active,
            .demo:hover {
                opacity: 1;
            }

        .row.cls {
            /* top: 10%; */
            margin-top: 190px;
        }

        .row.thum {
            margin: 0 auto;
            margin-top: 15px;
            /* left: 15%; */
        }

        .container {
            /* max-width: 450px; */
        }

            .container.images {
                max-width: 450px;
            }

        img.demo.cursor {
            max-height: 75px;
            /* margin: 0 5px; */
        }
        img.product-preview {
    height: 575px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="container single_product_container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="single_product_pics">
                        <div class="row">
                            <div class="col-lg-9 image_col order-lg-2 order-1">
                                <div class="single_product_image">
                                    <div class="single_product_image_background">
                                        <div class="container">
                                            <% if (images != null && images.Count > 0)
                                                { %>
                                            <% for (int i = 0; i < images.Count; i++)
                                                {
                                                    int j = i; %>
                                            <div class="mySlides">
                                                <div class="numbertext"><%= j+1 %> / <%= images.Count %></div>
                                                <img class="product-preview" src="../Images/<%= images[i].Src %>" style="width: 100%" />
                                            </div>
                                            <%} %>
                                            <%} %>

                                            <a class="prev" onclick="plusSlides(-1)">❮</a>
                                            <a class="next" onclick="plusSlides(1)">❯</a>


                                            <div class="row thum">
                                                <% if (images != null && images.Count > 0)
                                                    { %>
                                                <% for (int i = 0; i < images.Count; i++)
                                                    {
                                                        int j = i; %>

                                                <div class="column">
                                                    <img class="demo cursor" src="../Images/<%= images[i].Src %>" style="width: 100%" onclick="currentSlide(<%= j+1 %>)" alt="The Woods">
                                                </div>

                                                <%} %>
                                                <%} %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="product_details">
                        <div class="product_details_title">
                            <h2>
                                <asp:Label ID="lbTenSp" runat="server" Text=""></asp:Label>

                            </h2>
                            <asp:Label ID="lbDes" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="free_delivery d-flex flex-row align-items-center justify-content-center">
                            <span class="ti-truck"></span><span>free ship</span>
                        </div>
                        <div class="product_price">
                            <asp:Label ID="lbPrice" runat="server" Text=""></asp:Label>
                        </div>
                        <ul class="star_rating">
                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                            <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                        </ul>
                        <div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
                            <span>
                                <asp:Literal ID="Literal2" runat="server" Text="<%$Resources: bqa.language, lbQuanti%>"></asp:Literal></span>

                            <br />
                            <div class="quantity_selector">
                                <asp:Button ID="Button3" runat="server" CssClass="btn btn-primary" Text="-" OnClick="Button3_Click" />
                                <asp:TextBox ID="TextBox1" CssClass="form-control" Text="1" runat="server"></asp:TextBox>
                                <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="+" OnClick="Button2_Click" />
                            </div>

                        </div>
                        <div class="text-center">
                            <asp:Label runat="server" ID="msg" Visible="false"></asp:Label>
                        </div>
                        <asp:Button ID="Button4" runat="server" CssClass="btn btn-primary" Text="<%$Resources: bqa.language, addCart%>" OnClick="Button4_Click" />
                    </div>
                </div>
            </div>
            <div class="row cls">
                <div class="col-md-12">
                    <h3><asp:Literal ID="Literal1" runat="server" Text="<%$Resources: bqa.language, productDetail%>"></asp:Literal></h3>
                    <p>

                        <asp:Literal ID="txtContent" runat="server"></asp:Literal>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <script>
        var slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("demo");
            var captionText = document.getElementById("caption");
            if (n > slides.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = slides.length }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
            captionText.innerHTML = dots[slideIndex - 1].alt;
        }
    </script>
</asp:Content>
