<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="management-list-product.aspx.cs" Inherits="WebBanLaptop.management_list_product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý</title>
    <link rel="stylesheet" href="/assets/css/style.css" />
    <link rel="stylesheet" href="/assets/css/admin.css" />
    <link rel="stylesheet" href="/assets/css/management-list-productCSS.css" />
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
        <div class="header">
        <span style="font-size: 30px; cursor: pointer" class="iconOpen" onclick="openNav()">&#9776;</span>

        </div>
        <div class="tbl-list">
            <div class="txt-heading">
                <h2 class="txtTitle">Quản lý sản phẩm</h2>
            </div>
            <div class="dvAddNew">
                    <a class="btnAdd" href="add-product.aspx" class="link-add-new">&#43; Thêm mới</a>
                </div>
            <asp:GridView ID="GridView1"  runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" ForeColor="#333333" GridLines="None" Height="200px" OnPageIndexChanging="GridView1_PageIndexChanging" Width="1000px" CssClass="table">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderStyle-CssClass="headerCss" ItemStyle-CssClass="contentCss" HeaderText="Ảnh tiêu đề">
                        <ItemTemplate>
                            <asp:Image CssClass="item-image" ID="imageReview" ImageUrl='<%# Eval("ImageSrc") %>' runat="server"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="headerCss" ItemStyle-CssClass="contentCss" HeaderText="Tên sản phẩm">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="headerCss" ItemStyle-CssClass="contentCss" HeaderText="Mô tả">
                        <ItemTemplate>
                            <asp:Label ID="Label2" CssClass="des" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="headerCss" ItemStyle-CssClass="contentCss" HeaderText="Brand">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Brand") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="headerCss" ItemStyle-CssClass="contentCss" HeaderText="Gía nhập">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("OldPrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="headerCss" ItemStyle-CssClass="contentCss" HeaderText="Cân nặng">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Weight") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="headerCss" ItemStyle-CssClass="contentCss" HeaderText="Màn hình">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Screen") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="headerCss" ItemStyle-CssClass="contentCss" HeaderText="Loại">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="headerCss" ItemStyle-CssClass="contentCss" HeaderText="Giá tiền">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="headerCss" ItemStyle-CssClass="contentCss" HeaderText="Số lượng">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="headerCss" ItemStyle-CssClass="contentCss" HeaderText="Trạng thái">
                        <ItemTemplate>
                            <asp:Label ID="Label5" class="lb_status" runat="server" Text='<%# Eval("Status").ToString().Equals ("1") ? "Active" : "Inactive" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="headerCss" ItemStyle-CssClass="contentCss" HeaderText="Action">
                        <ItemTemplate>
                            <div class="btn">
                            <a class="btnEdit" href="edit-product.aspx?id=<%# Eval("Id") %>">Edit</a>
                            <asp:LinkButton ID="LinkButton1" CssClass="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Bind("Id") %>' 
                                OnClick="Delete_Click" OnClientClick="return Xacnhan()" Visible='<%# ShowButton(Convert.ToString(Eval("Status"))) %>'></asp:LinkButton>
                        </div>
                        </ItemTemplate>
                    </asp:TemplateField>
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
        </div>
    </div>
    </form>
</body>
    <script type="text/javascript" src="/assets/js/admin.js"></script>
    <script type="text/javascript">
        function Xacnhan(){
            var ok = confirm("Xác nhận muốn xóa sản phẩm này?")
            return ok
        }
        let status = document.getElementsByClassName('lb_status');

        for (var i = 0; i < status.length; i++) {
            if (status[i].innerHTML == "Inactive") {
                status[i].style.color = 'red';
            }
            else {
                status[i].style.color = "green";
            }
        }
    </script>
</html>