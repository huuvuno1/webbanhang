<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getLaptop.aspx.cs" Inherits="WebBanLaptop.Api.getLaptop" %>

<asp:Repeater id="productsRepeater" runat="server">
    <itemtemplate>
        <a href="product-detail.aspx" class="product product__normal">
            <div class="product__img product__img--link flex justify-center">
                <img class="categoryProduct__img--src" src="<%#Eval("Image") %>" alt="laptop">
            </div>
            <div class="product__name mb-10">
                <h1 class="product__name--link"><%# Eval("Name") %></h1>
            </div>
            <div class="product__des flex flex-col">
                <div class="product__cpu">
                    <span class="product__cpu--name">CPU</span>
                    <span class="product__cpu--des"><%#Eval("Cpu")%></span>
                </div>
                <div class="product__ram">
                    <span class="product__ram--name">RAM</span>
                    <span class="product__ram--des"><%#Eval("Ram")%></span>
                </div>
                <div class="product__ssd">
                    <span class="product__ssd--name">Ổ cứng</span>
                    <span class="product__ssd--des"><%#Eval("Gpu")%></span>
                </div>
                
            </div>
            <div class="product__price flex flex-col">
                <div class="price-top">
                                <span class="oldPrice"><%#Eval("OldPrice")%></span>
                                <span class="sale">21%</span>
                            </div>
                <div class="price-bottom">
                    <h1 class="price-link"><%#Eval("Price")%></h1>
                </div>
            </div>

        </a>
    </itemtemplate>

</asp:Repeater>