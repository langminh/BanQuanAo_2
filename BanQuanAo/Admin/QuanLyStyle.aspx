<%@ Page Title="Quản lý style" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyStyle.aspx.cs" Inherits="BanQuanAo.Admin.QuanLyStyle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 300px;">
        ID style
        <asp:TextBox ID="txtID" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
        Style name
        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ></asp:TextBox>

    </div>
    <br />
    <div>
        <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" />
        <asp:Button ID="btnSua" runat="server" Text="Sửa" CssClass="btn btn-primary" OnClick="btnSua_Click" />
        <asp:Button ID="btnXOa" runat="server" Text="Xóa" CssClass="btn btn-primary" OnClick="btnXOa_Click" />
        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-primary" OnClick="btnReset_Click" />

    </div>
    <asp:Label runat="server" ID="lbThongBao" ></asp:Label>
    <br />
    <hr />
    
    <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Style_ID" HeaderText="Style_ID" />
            <asp:BoundField DataField="Style_Name" HeaderText="Style_Name" />
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
</asp:Content>
