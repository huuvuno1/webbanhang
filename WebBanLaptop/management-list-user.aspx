﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="management-list-user.aspx.cs" Inherits="WebBanLaptop.management_list_user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý</title>
    <link rel="stylesheet" href="/assets/css/style.css" />
    <link rel="stylesheet" href="/assets/css/admin.css" />
    <link rel="stylesheet" href="/assets/css/management-list-categoryCSS.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="management-list-category.aspx" class="">Phân loại</a>
        <a href="management-list-product.aspx" class="">Sản phẩm</a>
        <a href="management-list-order.aspx" class="">Đơn hàng</a>
        <a href="management-list-user.aspx" class="">Người dùng</a>
        <a href="index.aspx" class="">Quay lại trang chủ</a>
    </div>
    <div class="container body-content" id="main">
        <span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;</span>
        <div class="tbl-list">
            <div class="txt-heading">
                <h2>Quản lý người dùng</h2>
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Tên đăng nhập">
                        <ItemTemplate>
                            <asp:Label ID="lb_name" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Họ tên khách hàng">
                        <ItemTemplate>
                            <asp:Label ID="lb_phone" runat="server" Text='<%# Eval("Fullname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <div class="btn">
                            <asp:LinkButton CssClass="btnDelete" ID="LinkButton1" runat="server" Text="Delete" CommandArgument='<%# Bind("Id") %>' OnClick="Delete_Click"></asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </div>
    </div>
    </form>
</body>
    <script type="text/javascript" src="/assets/js/admin.js"></script>
</html>
