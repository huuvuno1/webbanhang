<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="management-list-category.aspx.cs" Inherits="WebBanLaptop.management_list_category" %>

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
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet"/>
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
        <div class="header">

        <span style="font-size: 30px; cursor: pointer" class="iconOpen" onclick="openNav()">&#9776;</span>
        </div>
        <div class="tbl-list">
            <div class="txt-heading">
                <h2>Quản lý phân loại</h2>
            </div>
            <div class="add-new">
                    <a href="add-category.aspx" class="link-add-new">&#43; Thêm mới</a>
                </div>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" Height="30px"
                OnPageIndexChanging="GridView1_PageIndexChanging" Width="500px">
                <Columns>
                    <asp:TemplateField HeaderStyle-CssClass="headerCss" ItemStyle-CssClass="contentCss" HeaderText="Tên loại">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="headerCss" ItemStyle-CssClass="contentCss" HeaderText="Action">
                        <ItemTemplate>
                            <div class="btn">

                            <a class="btnEdit" href="edit-category.aspx?id=<%# Eval("Id") %>">Edit</a>
                          
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="center">
                <div class="pagination">
                    <asp:LinkButton ID="lbtnPrev" runat="server" Visible="false">&laquo;</asp:LinkButton>
                    <a href="#" class="active">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">6</a>
                    <a href="#">&raquo;</a>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
    <script type="text/javascript" src="/assets/js/admin.js"></script>
</html>