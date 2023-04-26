<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="management-order-details.aspx.cs" Inherits="WebBanLaptop.management_order_details" %>

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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        <style>
        .order_lookup_container {
            background: white;
            min-height: 500px;
        }

        .order_lookup_search {
            width: 400px;
        }

        .order_status_item {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 120px;
        }

        .order_status_item_round {
            width: 30px;
            height: 30px;
            border-radius: 999px;
            border: 1px solid gray;
            background-color: #C5C5C5;
            margin-top: 10px;
        }

        .order_status_line {
            border: 2px dashed gray;
            height: 1px;
            width: 130px;
            display: flex;
            position: relative;
            top: 15px;
            right: 30px;
        }

        .order_status__move_to_left {
            position: relative;
            right: 60px;
        }

        #customers {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

            #customers td, #customers th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #customers tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            #customers tr:hover {
                background-color: #ddd;
            }

            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: center;
                background-color: #45B08C;
                color: white;
            }
    </style>
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="management-list-category.aspx" class="">Phân loại</a>
        <a href="management-list-product.aspx" class="">Sản phẩm</a>
        <a href="management-list-order.aspx" class="">Đơn hàng</a>
        <a href="management-list-user.aspx" class="">Người dùng</a>
    </div>
    <div class="container body-content" id="main">
        <span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;</span>
        <div class="tbl-list">
            <div class="txt-heading">
                <h2>Quản lý đơn hàng</h2>
            </div>
            <div class="flex justify-center" id="oderLookupContainer" style="justify-content: flex-end; padding: 20px 0 20px 35px;">
                <%--<img src="assets/images/delivery.png" />--%>
                <div class="flex justify-between item-center" style="position: relative; left: -60px">
                    <div class="order_status_item">
                        Chờ xác nhận
                    <div class="order_status_item_round"></div>
                    </div>
                    <div class="order_status_line"></div>
                    <div class="order_status_item order_status__move_to_left">
                        Gọi xác nhận
                    <div class="order_status_item_round"></div>
                    </div>
                    <div class="order_status_line" style="right: 90px;"></div>
                    <div class="order_status_item order_status__move_to_left" style="right: 120px;">
                        Đang giao
                    <div class="order_status_item_round"></div>
                    </div>
                    <div class="order_status_line" style="right: 150px;"></div>
                    <div class="order_status_item order_status__move_to_left" style="right: 180px;">
                        Đã giao
                    <div class="order_status_item_round"></div>
                    </div>
                    <div class="order_status_line" style="right: 210px;"></div>
                    <div class="order_status_item order_status__move_to_left" style="right: 240px;">
                        Đã hoàn thành
                    <div class="order_status_item_round"></div>
                    </div>
                </div>
            </div>
            <script>
                (function () {
                    const queryString = window.location.search;
                    const urlParams = new URLSearchParams(queryString);
                    const orderId = urlParams.get('order_id');
                    console.log(orderId)
                    if (orderId) {
                        orderLookup(orderId)
                    }
                })()

                function orderLookup(orderId) {
                    const xhr = new XMLHttpRequest()
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            const urlParams = new URLSearchParams(xhr.responseText);
                            const status = urlParams.get('status');
                            if (status >= 0) {
                                const roundIcons = document.querySelectorAll('.order_status_item_round')
                                for (let i = 0; i <= status; i++) {
                                    roundIcons[i].style = `border: 1px solid green;
                                    background-color: #00FF00;`
                                }
                            }
                        }
                    }

                    xhr.open('get', '/Api/getStatusOrderId.aspx?order_id=' + orderId)
                    xhr.send()
                }
            </script>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="ID Hóa đơn">
                        <ItemTemplate>
                            <asp:Label ID="lb_order" runat="server" Text='<%# Eval("OrderId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tên sản phẩm">
                        <ItemTemplate>
                            <asp:Label ID="lb_product" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Số lượng">
                        <ItemTemplate>
                            <asp:Label ID="lb_quantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gía tiền">
                        <ItemTemplate>
                            <asp:Label ID="lb_price" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
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
            <div class="txt_sum">
                <h3 style="padding-right: 5px;">Tổng hóa đơn: </h3>
                <asp:Label ID="lb_sum" runat="server"></asp:Label>
            </div>
        </div>
    </div>
    </form>
</body>
    <script type="text/javascript" src="/assets/js/admin.js"></script>
</html>