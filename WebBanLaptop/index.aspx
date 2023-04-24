<%@ Page Title="" Language="C#" MasterPageFile="~/Common.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebBanLaptop.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="trademark">
        <div class="trademark__title">THƯƠNG HIỆU LAPTOP</div>
        <div class="flex justify-between">
            <asp:Repeater ID="RepeaterBrand" runat="server">
                <ItemTemplate>
                    <a href='category.aspx?brands=<%# Eval("Name") %>' class="trademark__item flex flex-col item-center">
                        <img src='<%# Eval("Image") %>' alt="" class="trademark__item--image" />
                        <h1 class="trademark__item--name"><%# Eval("Name") %></h1>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <div class="trademark">
        <div class="trademark__title">LAPTOP THEO GIÁ</div>
        <div class="flex justify-between">
            <asp:Repeater ID="RepeaterPriceRange" runat="server">
                <ItemTemplate>
                    <a href='/category.aspx?priceRange=<%# Eval("Value") %>' class="trademark__item flex flex-col item-center">
                        <div class="trademark__item--image-wrapper round-full border-1">
                            <img src='<%# Eval("Image") %>' alt="" class="trademark__item--image" />
                        </div>
                        <h1 class="trademark__item--name"><%# Eval("Name") %></h1>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <div class="frame__product">
        <div class="frame__title flex justify-between">
            <a href="" class="frame__title--name">LAPTOP MỚI</a>
            <a class="frame__title--link" href="/category.aspx?type=laptop-moi">Xem tất cả</a>
        </div>
        <div class="frame__list--product flex">
            <asp:Repeater ID="RepeaterProductNew" runat="server">
                <ItemTemplate>
                    <div class="product">
                        <div class="product__img">
                            <a href="#" class="product__img--link flex justify-center">
                                <img class="product__img--src" src="/assets/images/laptop1.jpg" alt="laptop" />
                            </a>
                        </div>
                        <div class="product__name">
                            <a href="#" class="product__name--link">[New 100%] Dell XPS 13 9315-F4GH8 Mới - i5-1230U | 13.4" Full
                HD+</a>
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
                            <div class="price-top">
                                <span class="oldPrice">19.900.000Đ</span>
                                <span class="sale">21%</span>
                            </div>
                            <div class="price-bottom">
                                <a href="product-detail.aspx" class="price-link">15.900.000Đ</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>

    <div class="frame__product">
        <div class="frame__title flex justify-between">
            <a href="" class="frame__title--name">LAPTOP GAMING</a>
            <a class="frame__title--link" href="/category.aspx?type=laptop-gaming">Xem tất cả</a>
        </div>
        <div class="frame__list--product flex">
            <asp:Repeater ID="RepeaterProductGaming" runat="server">
                <ItemTemplate>
                    <div class="product">
                        <div class="product__img">
                            <a href='/product-detail.aspx?id=<%# Eval("Id") %>' class="product__img--link flex justify-center">
                                <img class="product__img--src" src="/assets/images/laptop1.jpg" alt="laptop" />
                            </a>
                        </div>
                        <div class="product__name">
                            <a href='/product-detail.aspx?id=<%# Eval("Id") %>' class="product__name--link">[New 100%] Dell XPS 13 9315-F4GH8 Mới - i5-1230U | 13.4" Full
                HD+</a>
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
                            <div class="price-top">
                                <span class="oldPrice">19.900.000Đ</span>
                                <span class="sale">21%</span>
                            </div>
                            <div class="price-bottom">
                                <a href='/product-detail.aspx?id=<%# Eval("Id") %>' class="price-link">15.900.000Đ</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>

    <div class="frame__product">
        <div class="frame__title flex justify-between">
            <a href="" class="frame__title--name">LAPTOP ĐỒ HỌA</a>
            <a class="frame__title--link" href="/category.aspx?type=laptop-do-hoa">Xem tất cả</a>
        </div>
        <div class="frame__list--product flex">
            <asp:Repeater ID="RepeaterProductGraphics" runat="server">
                <ItemTemplate>
                    <div class="product">
                        <div class="product__img">
                            <a href='/product-detail.aspx?id=<%# Eval("Id") %>' class="product__img--link flex justify-center">
                                <img class="product__img--src" src="/assets/images/laptop1.jpg" alt="laptop" />
                            </a>
                        </div>
                        <div class="product__name">
                            <a href='/product-detail.aspx?id=<%# Eval("Id") %>' class="product__name--link">[New 100%] Dell XPS 13 9315-F4GH8 Mới - i5-1230U | 13.4" Full
                HD+</a>
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
                            <div class="price-top">
                                <span class="oldPrice">19.900.000Đ</span>
                                <span class="sale">21%</span>
                            </div>
                            <div class="price-bottom">
                                <a href='/product-detail.aspx?id=<%# Eval("Id") %>' class="price-link">15.900.000Đ</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>

</asp:Content>
