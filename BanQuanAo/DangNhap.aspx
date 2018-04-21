<%@ Page Title="Đăng nhập" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="BanQuanAo.DangNhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <div class="container">
        <div id="loginbox" style="margin-top: 50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="panel-title">
                        <h3>
                            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources: bqa.language, lbLogin%>"></asp:Literal></h3>
                    </div>
                    <div style="float: right; font-size: 80%; position: relative; top: -10px"><a href="#">
                        <asp:Literal ID="Literal2" runat="server" Text="<%$Resources: bqa.language, lbForgotPass%>"></asp:Literal></a></div>
                </div>

                <div style="padding-top: 30px" class="panel-body">

                    <div style="display: none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                    <div id="loginform" class="form-horizontal" role="form">
                        <asp:Label runat="server" ID="msg" CssClass="text-center text-danger" Visible="false"></asp:Label>
                        <div style="margin-bottom: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox runat="server" ID="txtusername" TextMode="SingleLine" CssClass="form-control" placeholder="<%$Resources: bqa.language, txtEmail%>"></asp:TextBox>
                        </div>

                        <div style="margin-bottom: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <asp:TextBox runat="server" ID="txt_pass" TextMode="Password" CssClass="form-control" placeholder="<%$Resources: bqa.language, txtPass%>"></asp:TextBox>
                        </div>



                        <div class="input-group">
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="ckb_remember" runat="server" Text="<%$Resources: bqa.language, rememberMe%>"></asp:CheckBox>
                                </label>
                            </div>
                        </div>
                        <div style="margin-top: 10px" class="form-group">
                            <!-- Button -->

                            <div class="col-sm-12 controls">
                                <asp:Button runat="server" ID="btn_login" CssClass="btn btn-success" Text="<%$Resources: bqa.language, btnOkLogin%>" OnClick="btnLogin_Click"></asp:Button>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12 control">
                                <div style="border-top: 1px solid#888; padding-top: 15px; font-size: 85%">
                                    <asp:Literal ID="Literal3" runat="server" Text="<%$Resources: bqa.language, lbNoAccount%>"></asp:Literal>
                                       
                                    <a href="#" onclick="$('#loginbox').hide(); $('#signupbox').show()">
                                        <asp:Literal ID="Literal4" runat="server" Text="<%$Resources: bqa.language, lbRegisterNow%>"></asp:Literal>
                                        </a>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>
            </div>
        </div>
        <div id="signupbox" style="display: none; margin-top: 50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="panel-title">
                        <h3>
                            <asp:Literal ID="Literal5" runat="server" Text="<%$Resources: bqa.language, lbRegister%>"></asp:Literal></h3>
                    </div>
                    <div style="float: right; font-size: 85%; position: relative; top: -10px"><a id="signinlink" href="#" onclick="$('#signupbox').hide(); $('#loginbox').show()">
                        <asp:Literal ID="Literal6" runat="server" Text="<%$Resources: bqa.language, lbLogin%>"></asp:Literal></a></div>
                </div>
                <div class="panel-body">
                    <div id="signupform" class="form-horizontal" role="form">

                        <div id="signupalert" style="display: none" class="alert alert-danger">
                            <p>Lỗi:</p>
                            <span></span>
                        </div>



                        <div class="form-group">
                            <label for="email" class="col-md-9 control-label">
                                <asp:Literal ID="Literal7" runat="server" Text="<%$Resources: bqa.language, txtEmail%>"></asp:Literal></label>
                            <div class="col-md-9">
                                <asp:TextBox runat="server" ID="txt_userNameReg" CssClass="form-control" TextMode="SingleLine" placeholder="<%$Resources: bqa.language, txtEmail%>"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-md-3 control-label">
                                <asp:Literal ID="Literal8" runat="server" Text="<%$Resources: bqa.language, txtName%>"></asp:Literal></label>
                            <div class="col-md-9">
                                <asp:TextBox runat="server" ID="txt_NameReg" CssClass="form-control" TextMode="SingleLine" placeholder="<%$Resources: bqa.language, txtName%>"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-md-3 control-label">
                                <asp:Literal ID="Literal9" runat="server" Text="<%$Resources: bqa.language, txtEmail%>"></asp:Literal></label>
                            <div class="col-md-9">
                                <asp:TextBox runat="server" ID="txt_EmailReg" CssClass="form-control" TextMode="SingleLine" placeholder="<%$Resources: bqa.language, txtEmail%>"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="password" class="col-md-3 control-label">
                                <asp:Literal ID="Literal10" runat="server" Text="<%$Resources: bqa.language, txtPass%>"></asp:Literal></label>
                            <div class="col-md-9">
                                <asp:TextBox runat="server" ID="txt_PassReg" CssClass="form-control" TextMode="Password" placeholder="<%$Resources: bqa.language, txtPass%>"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password" class="col-md-9 control-label">Nhập lại mật khẩu</label>
                            <div class="col-md-9">
                                <asp:TextBox runat="server" ID="txt_RePassReg" CssClass="form-control" TextMode="Password" placeholder="Nhập lại mật khẩu"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-md-9 control-label">
                                <asp:Literal ID="Literal11" runat="server" Text="<%$Resources: bqa.language, txtAddress%>"></asp:Literal></label>
                            <div class="col-md-9">
                                <asp:TextBox runat="server" ID="txtAddressReg" CssClass="form-control" placeholder="<%$Resources: bqa.language, txtAddress%>"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-md-9 control-label">
                                <asp:Literal ID="Literal12" runat="server" Text="<%$Resources: bqa.language, txtPhone%>"></asp:Literal></label>
                            <div class="col-md-9">
                                <asp:TextBox runat="server" ID="txtPhonReg" CssClass="form-control" TextMode="Number" placeholder="<%$Resources: bqa.language, txtPhone%>"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <!-- Button -->
                            <div class="col-md-offset-3 col-md-9">
                                <asp:Button ID="btn_signup" runat="server" CssClass="btn btn-info" Text="<%$Resources: bqa.language, btnRegister%>" OnClick="btn_signup_Click"></asp:Button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
