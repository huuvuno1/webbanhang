<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilterProduct.aspx.cs" Inherits="WebBanLaptop.Api.FilterProduct" %>

<asp:Repeater id="productsRepeater" runat="server">
    <ItemTemplate>
        <a href="product-detail.aspx" class="product product__normal">
            <div class="product__img product__img--link flex justify-center">
                <img class="product__img--src " src="/assets/images/laptop1.jpg" alt="laptop">
            </div>
            <div class="product__name mb-10">
                <h1><%# Eval("Name") %></h1>
            </div>
            <div class="product__des flex flex-col">
                <div class="product__cpu">
                    <span class="product__cpu--name">CPU</span>
                    <span class="product__cpu--des">i5 - 1230U</span>
                </div>
                <div class="product__ram">
                    <span class="product__ram--name">RAM</span>
                    <span class="product__ram--des">8GB LPDDR5</span>
                </div>
                <div class="product__ssd">
                    <span class="product__ssd--name">Ổ cứng</span>
                    <span class="product__ssd--des">SSD 512GB NMVe</span>
                </div>
                <div class="product__card">
                    <span class="product__card--name">CPU</span>
                    <span class="product__card--des">i5 - 1230U</span>
                </div>
            </div>
            <div class="product__price flex flex-col">
                <div class="price-bottom">
                    <h1 class="price-link"><%# Eval("Price") %></h1>
                </div>
            </div>
        </a>
    </ItemTemplate>

</asp:Repeater>
