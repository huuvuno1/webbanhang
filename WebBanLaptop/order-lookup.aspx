<%@ Page Title="" Language="C#" MasterPageFile="~/Common.Master" AutoEventWireup="true" CodeBehind="order-lookup.aspx.cs" Inherits="WebBanLaptop.order_lookup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <%--<meta http-equiv="refresh" content="1">--%>
    <link rel="stylesheet" href="/assets/css/checkout.css">
    <title>Tra cứu đơn hàng</title>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="order_lookup_container">
        <div class="checkout_wrapper_input order_lookup_search flex justify-center flex-col mx-auto">
            <div data-msg="fullname" class="text-red" style="margin-bottom: 5px; font-style: italic;"></div>
            <div class="flex">
                <input id="inpOrderId" class="checkout_input" placeholder="Nhập vào mã đơn hàng cần tra cứu..." />
                <input id="btnSearchOrder" style="cursor: pointer; width: 90px; margin-left: 15px; background: #24a0ed; color: white;" value="Tra cứu" class="checkout_input" type="button" />
            </div>
        </div>
        <div class="flex justify-center" id="orderDefault" >
            <img src="assets/images/delivery.png" />
        </div>
        <div class="flex justify-center flex-col" id="orderNotFound" style="display: none;">
                        <h1 style="text-align: center; margin-top: 45px; margin-bottom: 25px; font-size: 20px;">Không tìm thấy đơn hàng này</h1>
            <img src="assets/images/notfound_order.webp" />
        </div>
        <div id="orderFound" style="display: none;">
            <h1 style="text-align: center; margin-top: 45px; margin-bottom: 25px; font-size: 20px;">Thông tin đơn hàng của bạn</h1>
            <div class="flex justify-center" id="oderLookupContainer" style="justify-content: flex-end; padding: 20px 0 20px 35px;">
                <%--<img src="assets/images/delivery.png" />--%>
                <div class="flex justify-between item-center" style="position: relative; left: 60px;">
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

            <div style="padding: 20px 40px;">
                <table id="customers">
                    <tr>
                        <th>Mã đơn hàng</th>
                        <th>Tên khách hàng</th>
                        <th>Thời gian đặt</th>
                        <th>Trạng thái</th>
                    </tr>
                    <tr>
                        <td id="order_id"></td>
                        <td id="order_name"></td>
                        <td id="order_createdAt"></td>
                        <td id="order_status"></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
    <script>
        (function () {
            const queryString = window.location.search;
            const urlParams = new URLSearchParams(queryString);
            const orderId = urlParams.get('order_id');
            document.getElementById('inpOrderId').value = orderId;

            if (orderId) {
                orderLookup(orderId)
            }
        })()

        function orderLookup(orderId) {
            const xhr = new XMLHttpRequest()
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    document.getElementById('orderFound').style.display = 'block';
                    document.getElementById('orderNotFound').style.display = 'none';
                    document.getElementById('orderDefault').style.display = 'none';

                    const urlParams = new URLSearchParams(xhr.responseText);
                    const status = urlParams.get('statusCode');
                    if (status >= 0) {
                        const roundIcons = document.querySelectorAll('.order_status_item_round')
                        for (let i = 0; i <= status; i++) {
                            roundIcons[i].style = `border: 1px solid green;
                                    background-color: #00FF00;`
                        }
                    }

                    for (const key of urlParams.keys()) {
                        (document.getElementById(`order_${key}`) || {}).innerText = urlParams.get(key);
                    }


                } else if (xhr.readyState === 4 && xhr.status !== 200) {
                    document.getElementById('orderFound').style.display = 'none';
                    document.getElementById('orderNotFound').style.display = 'flex';
                    document.getElementById('orderDefault').style.display = 'none';
                } else {
                    document.getElementById('orderFound').style.display = 'none';
                    document.getElementById('orderNotFound').style.display = 'none';
                    document.getElementById('orderDefault').style.display = 'flex';
                }
            }

            xhr.open('get', '/Api/OrderLookup.aspx?orderId=' + orderId)
            xhr.send()
        }

        document.getElementById('btnSearchOrder')?.addEventListener('click', () => {
            const orderId = document.getElementById('inpOrderId').value;
            if (!orderId) return;

            orderLookup(orderId)

            const url = new URL(location);
            url.searchParams.set('order_id', orderId);
            history.pushState({}, "", url);
        })
    </script>
</asp:Content>
