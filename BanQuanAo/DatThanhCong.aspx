<%@ Page Title="Đặt hàng thành công" Language="C#" MasterPageFile="~/TrangChu.Master" AutoEventWireup="true" CodeBehind="DatThanhCong.aspx.cs" Inherits="BanQuanAo.DatThanhCong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 200px;"></div>
    <div>
        <h4>
            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources: bqa.language, lbOk%>"></asp:Literal></h4>
    </div>
</asp:Content>
