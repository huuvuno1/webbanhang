<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateCart.aspx.cs" Inherits="WebBanLaptop.Api.UpdateCart" %>

<tr class="table-header">
    <td class="tdFirst">Sản phẩm</td>
    <td>Đơn giá</td>
    <td>Số lượng</td>
    <td>Thành tiền</td>
</tr>
<asp:Repeater ID="RepeaterProductCart" runat="server">
    <itemtemplate>
        <tr>
            <td class="modal-prod--des">
                <img src="/assets/images/laptop1.jpg" width="100px">
                <p><%# Eval("Name") %></p>
            </td>
            <td><span class="modal-price"><%# WebBanLaptop.Utils.Util.FormatVND(int.Parse(Eval("Price").ToString())) %></span>₫</td>
            <td>
                <div class="modal_quan__select">
                    <input hidden="hidden" class="quan__row_modal" value='<%# Eval("Id") %>' />
                    <span onclick="handleSub(this)" class="modal_quan__select-sub">-</span>
                    <input type="text" class="modal_quan__select-value" value='<%# Eval("Quantity") %>' onchange="handleModalQuantityChange(this)" onkeydown="handleValidateInput(this)">
                    <span onclick="handleAdd(this)" class="modal_quan__select-add">+</span>
                </div>
            </td>
            <td><span class="modal-totalPrice1"><%#  WebBanLaptop.Utils.Util.FormatVND(int.Parse(Eval("TotalPrice").ToString())) %></span> ₫</td>
        </tr>
    </itemtemplate>
</asp:Repeater>
|
Thành tiền: <span class="modal-totalPrice2" id="totalMoney" runat="server">0</span> ₫
|
<span runat="server" id="txtCount"></span>
