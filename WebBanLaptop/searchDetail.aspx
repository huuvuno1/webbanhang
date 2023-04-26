<%@ Page Title="" Language="C#" MasterPageFile="~/Common.Master" AutoEventWireup="true" CodeBehind="searchDetail.aspx.cs" Inherits="WebBanLaptop.searchDetail" %>


<asp:Content ID="header1" runat="server" ContentPlaceHolderID="HeaderPlaceHolder">
    <link rel="stylesheet" href="/assets/css/category.css" />
    <title>Sản phẩm theo danh mục</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="category">
        
                    

        <%-- list product --%>
        <div class="frame__product">
            <div class="frame__list--product flex justify-center" id="list__products">
                <asp:Repeater ID="RepeaterProductSearch" runat="server">
                <ItemTemplate>
                    <div class="product">
                        <div class="product__img">
                            <a href="product-detail.aspx?id=<%# Eval(" Id") %>" class="product__img--link flex
                                    justify-center">
                                <img class="product__img--src" src='<%# Eval("Image") %>' alt="laptop" />
                            </a>
                        </div>
                        <div class="product__name">
                            <a href="product-detail.aspx?id=<%# Eval(" Id") %>" class="product__name--link"><%#
                                        Eval("Name") %></a>
                        </div>
                        <div class="product__des flex flex-col">
                            <div class="product__cpu">
                                <span class="product__cpu--name">CPU</span>
                                <span class="product__cpu--des">
                                    <%# Eval("Cpu") %>
                                </span>
                            </div>
                            <div class="product__ram">
                                <span class="product__ram--name">RAM</span>
                                <span class="product__ram--des">
                                    <%# Eval("Ram") %>
                                </span>
                            </div>
                            <div class="product__ssd">
                                <span class="product__ssd--name">Ổ cứng</span>
                                <span class="product__ssd--des">
                                    <%# Eval("Gpu") %>
                                </span>
                            </div>

                        </div>
                        <div class="product__price flex flex-col">
                            <div class="price-top">
                                <span class="oldPrice">
                                    <%# WebBanLaptop.Utils.Util.FormatVND(int.Parse(Eval("OldPrice").ToString())) %>
                                </span>
                                <span class="sale">21%</span>
                            </div>
                            <div class="price-bottom">
                                <a href="product-detail.aspx?id=<%# Eval("Id") %>" class="price-link">
                                    <%# WebBanLaptop.Utils.Util.FormatVND(int.Parse(Eval("Price").ToString())) %></a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            </div>
        </div>

        <div class="paging flex" id="paging">
            
        </div>
    </div>
</asp:Content>
<asp:Content ID="jscript" runat="server" ContentPlaceHolderID="ScriptPlaceHolder">
    <script src="/assets/js/searchDetail.js"></script>

</asp:Content>

