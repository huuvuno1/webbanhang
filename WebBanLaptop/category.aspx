<%@ Page Title="" Language="C#" MasterPageFile="~/Common.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="WebBanLaptop.category" %>

<asp:Content ID="header1" runat="server" ContentPlaceHolderID="HeaderPlaceHolder">
    <link rel="stylesheet" href="/assets/css/category.css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="category">
        <h1 class="py-20">LAPTOP GAMING</h1>
        <hr />
        <div class="flex py-10">
            <h2 class="text-red" style="width: 100px;">Tìm theo:</h2>
            <div>
                <div>
                    <h3 class="mb-10">Mức giá sản phẩm</h3>
                    <div class="price_range">
                        <label class="price_range-item">
                            <input type="checkbox" name="priceRange" value="1"/>
                            <span>Giá dưới 5 Triệu</span>
                        </label>
                        <label class="price_range-item">
                            <input type="checkbox" name="priceRange" value="2"/>
                            <span>5 Triệu - 10 Triệu</span>
                        </label>
                        <label class="price_range-item">
                            <input type="checkbox" name="priceRange" value="3"/>
                            <span>10 Triệu - 15 Triệu</span>
                        </label>
                        <label class="price_range-item">
                            <input type="checkbox" name="priceRange" value="4"/>
                            <span>15 Triệu - 20 Triệu</span>
                        </label>
                        <label class="price_range-item">
                            <input type="checkbox" name="priceRange" value="5"/>
                            <span>Trên 20 Triệu</span>
                        </label>
                    </div>
                </div>
                <div class="mt-20">
                    <h3 class="mb-10">Tên Thương Hiệu</h3>
                    <div class="price_range">
                        <asp:Repeater ID="RepeaterBrand" runat="server">
                            <ItemTemplate>
                                <label class="price_range-item">
                                    <input type="checkbox" name="brand" value='<%#  Eval("Value") %>' >
                                    <span>
                                        <%# Eval("Value") %>
                                    </span>
                                </label>
                            </ItemTemplate>
                        </asp:Repeater>


                    </div>
                </div>
            </div>
        </div>
        <hr />
        <%-- sort by --%>
        <div class="flex item-center mt-10 mb-10">
            <h2 class="text-red" style="width: 100px;">Xếp theo: </h2>
            <%--<label class="price_range-item">
                <input type="radio" name="sortBy" value="latest"/>
                <span>Mới nhất</span>
            </label>--%>
            <label class="price_range-item">
                <input type="radio" name="sortBy" value="price_asc" />
                <span>Giá tăng dần</span>
            </label>
            <label class="price_range-item">
                <input type="radio" name="sortBy" value="price_desc" />
                <span>Giá giảm dần</span>
            </label>
        </div>

        <%-- list product --%>
        <div class="frame__product">
            <div class="frame__list--product flex" id="list__products">
            </div>
        </div>

        <div class="paging flex">
            <div class="paging-item"><<</div>
            <div class="paging-item">1</div>
            <div class="paging-item">2</div>
            <div class="paging-item">3</div>
            <div class="paging-item">4</div>
            <div class="paging-item">5</div>
            <div class="paging-item">>></div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="jscript" runat="server" ContentPlaceHolderID="ScriptPlaceHolder">
    <script src="/assets/js/category.js"></script>
</asp:Content>
