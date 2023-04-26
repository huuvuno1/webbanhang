<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="management-list-order.aspx.cs" Inherits="WebBanLaptop.management_list_order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý</title>
    <link rel="stylesheet" href="/assets/css/style.css" />
    <link rel="stylesheet" href="/assets/css/admin.css" />
    <link rel="stylesheet" href="/assets/css/order.css" />
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
                <h2>Quản lý đơn hàng</h2>
            </div>
            <div class="header-search-order flex item-center relative">
                <input id="txtSearch" oninput="search()" name="txtSearch" />
                <img class="header-search-order-icon absolute cursor-pointer" src="/assets/images/search.svg" />
                <div class="search"></div>
            </div>
            <script>
                function search() {
                    // change url
                    const value = document.getElementById('txtSearch').value;

                    const xhr = new XMLHttpRequest()
                    xhr.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            document.querySelector('.content_order').innerHTML = xhr.responseText;
                        }
                    }
                    xhr.open('get', '/Api/searchOrder.aspx?input=' + value)
                    xhr.send()
                }

            </script>
            <div class="content_order">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" CssClass="table" AllowPaging="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <a href="management-order-details.aspx?order_id=<%# Eval("Id") %>"><%# Eval("Id") %></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tên khách hàng">
                            <ItemTemplate>
                                <asp:Label ID="lb_name" runat="server" Text='<%# Eval("CustomerName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lb_email" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Số điện thoại">
                            <ItemTemplate>
                                <asp:Label ID="lb_phone" runat="server" Text='<%# Eval("NumberPhone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Địa chỉ">
                            <ItemTemplate>
                                <asp:Label ID="lb_address" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ghi chú">
                            <ItemTemplate>
                                <asp:Label ID="lb_note" runat="server" Text='<%# Eval("Note") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Thời gian">
                            <ItemTemplate>
                                <asp:Label ID="lb_createdAt" runat="server" Text='<%# Eval("CreatedAt") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Trạng thái">
                            <ItemTemplate>
                                <asp:Label ID="lb_status" class="lb_status" runat="server" Text='<%# Eval("Status").ToString().Equals ("0") ? "Chưa thanh toán" : "Đã thanh toán" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <div class="btn">
                                <asp:LinkButton CssClass="btnEdit" ID="LinkButton1" runat="server" Text="Confirm" CommandArgument='<%# Bind("Id") %>' OnClick="Confirm_Click" OnClientClick="return Xacnhan()" Visible='<%# ShowButton(Convert.ToString(Eval("Status"))) %>'></asp:LinkButton>
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
    </div>
    </form>
</body>
    <script type="text/javascript" src="/assets/js/admin.js"></script>
    <script type="text/javascript">
        function Xacnhan(){
            var ok = confirm("Xác nhận đã thanh toán đơn hàng này thành công?")
            return ok
        }
        let status = document.getElementsByClassName('lb_status');

        for (var i = 0; i < status.length; i++) {
            if (status[i].innerHTML == "Chưa thanh toán") {
                status[i].style.color = 'red';
            }
            else {
                status[i].style.color = "green";
            }
        }
    </script>
</html>