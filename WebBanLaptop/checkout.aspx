<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="WebBanLaptop.checkout" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/css/checkout.css">
    <title>Thanh toán</title>

</head>

<body>
    <form id="form" runat="server" method="post" onsubmit="return validateForm()">
        <div class="flex checkout_container">
            <div class="checkout_left">
                <h1 class="checkout_title">LAPTOP GAME</h1>
                <div class="flex justify-between mt-20">
                    <div style="flex-grow: 1; padding-right: 25px;">
                        <h2 class="checkout_title_label">Thông tin nhận hàng</h2>

                        <div class="checkout_wrapper_input">
                            <div class="checkout_label_input">Họ tên</div>
                            <div data-msg="fullname" class="text-red" style="margin-bottom: 5px; font-style: italic;"></div>
                            <input name="fullname" class="checkout_input" placeholder="Nhập vào họ tên..." />
                        </div>
                        <div class="checkout_wrapper_input">
                            <div class="checkout_label_input">Email</div>
                            <div data-msg="email" class="text-red" style="margin-bottom: 5px; font-style: italic;"></div>

                            <input name="email" class="checkout_input" placeholder="Nhập vào email..." />
                        </div>

                        <div class="checkout_wrapper_input">
                            <div class="checkout_label_input">Số điện thoại</div>
                            <div data-msg="phoneNumber" class="text-red" style="margin-bottom: 5px; font-style: italic;"></div>

                            <input name="phoneNumber" class="checkout_input" placeholder="Nhập vào số điện thoại..." />
                        </div>
                        <div class="checkout_wrapper_input">
                            <div class="checkout_label_input">Địa chỉ</div>
                            <div data-msg="address" class="text-red" style="margin-bottom: 5px; font-style: italic;"></div>

                            <input name="address" class="checkout_input" placeholder="Nhập vào địa chỉ của bạn.." />
                        </div>
                        <div class="checkout_wrapper_input">
                            <div class="checkout_label_input">Ghi chú</div>
                            <textarea name="note" class="checkout_input checkout_textare"
                                placeholder="Để lại ghi chú cho đơn hàng..."></textarea>
                        </div>
                    </div>
                    <div style="width: 45%;">
                        <h2 class="checkout_title_label">Thanh toán</h2>
                        <div class="checkout_input flex item-center mt-20 justify-between">
                            <div class="flex item-center">
                                <input style="margin-right: 10px;" type="radio" checked />
                                <span>Thanh toán khi giao hàng (COD)</span>
                            </div>
                            <img src="/assets/images/money.png" style="height: 25px; margin-top: 6px;" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="checkout_right">
                <h1 class="checkout_right_title">Đơn hàng (<span id="count" runat="server">0</span> sản phẩm)
                </h1>
                <div style="max-height: 500px; overflow-y: scroll;">

                    <asp:Repeater ID="RepeaterProducts" runat="server">
                        <ItemTemplate>
                            <div class="checkout_products">
                                <div class="flex">
                                    <div class="flex item-center justify-center checkout_product_image_wrapper relative">
                                        <img src='<%# Eval("Image") %>' class="checkout_product_image" />
                                        <span class="absolute checkout_product_count flex item-center justify-center"><%# Eval("Quantity") %></span>
                                    </div>
                                    <div class="checkout_product_name">
                                        <%# Eval("Name") %>
                                    </div>
                                    <div class="checkout_product_price">
                                        <%# WebBanLaptop.Utils.Util.FormatVND(int.Parse(Eval("TotalPrice").ToString())) %> ₫
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>


                <div class="checkout_products" style="border: none; margin-top: 35px;">
                    <!-- sum money -->
                    <div class="">
                        <div class="flex justify-between mb-20 item-center">
                            <div class="checkout_sum_label">Tổng cộng</div>
                            <div id="sum_money" class="checkout_summoney" runat="server"></div>
                        </div>
                        <div class="flex justify-between item-center">
                            <a href="/index.aspx" class="checkout_sum_label" style="font-size: 16px; color: gray;">< Quay về trang chủ </a>

                            <asp:Button ID="BtnOrderSubmit" OnClick="BtnOrderSubmit_Click" CssClass="checkout_btn_submit" runat="server" Text="Đặt hàng" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="/assets/js/checkout.js"></script>
</body>

</html>
