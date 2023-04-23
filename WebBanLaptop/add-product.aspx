<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add-product.aspx.cs" Inherits="WebBanLaptop.add_product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thêm mới</title>
    <link rel="stylesheet" href="/assets/css/style.css" />
    <link rel="stylesheet" href="/assets/css/admin.css" />
    <link rel="stylesheet" href="/assets/css/add-productCss.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container body-content" id="main">
        <form id="form1" class="layout-form" method="post" runat="server">
            <div>
                <div class="header-form">
                    <h3 class="head-Text">Thêm mới sản phẩm</h3>
                </div>
                <table style="width: 100%;">
                    <tr>
                        <td class="label-login">Tên sản phẩm:</td>
                        <td>
                            <asp:TextBox ID="name" runat="server" placeholder="Nhập tên"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Phân loại:</td>
                        <td><asp:DropDownList ID="category" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id" Height="48px"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebLaptopConnection %>" SelectCommand="SELECT * FROM [tbl_category]"></asp:SqlDataSource>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">GIÁ TIỀN:</td>
                        <td>
                            <asp:TextBox ID="price" runat="server" CssClass="txtPrice" placeholder="Nhập giá tiền" TextMode="Number"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Số lượng:</td>
                        <td>
                            <asp:TextBox ID="quantity" runat="server" CssClass="txtQuan" placeholder="Nhập số lượng" TextMode="Number"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Mô tả:</td>
                        <td>
                            <textarea id="description" class="txtDes" name="description" runat="server" ></textarea>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2">
                            <div class="text-error">
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        
                        <td colspan="2" class="tdBtnAdd">
                            <asp:Button ID="Button1" CssClass="btnAdd" runat="server" Text="Thêm" OnClick="Add_Click"/>
                            <asp:Button ID="Button2" CssClass="btnback" runat="server" Text="Quay lại"  PostBackUrl="~/management-list-product.aspx" />

                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
</body>
</html>