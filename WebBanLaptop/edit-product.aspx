<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit-product.aspx.cs" Inherits="WebBanLaptop.edit_product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chỉnh sửa sản phẩm</title>
    <link rel="stylesheet" href="/assets/css/style.css" />
    <link rel="stylesheet" href="/assets/css/admin.css" />
    <link rel="stylesheet" href="/assets/css/add-productCss.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container body-content" id="main">
        <form id="form1" class="layout-form" method="post" runat="server" enctype="multipart/form-data" >
            <div>
                <div class="header-form">
                    <h3>Chỉnh sửa sản phẩm</h3>
                </div>
                <table style="width: 100%;">
                    <tr>
                        <td class="label-login">Tên sản phẩm:</td>
                        <td>
                            <asp:TextBox ID="name" runat="server"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Ảnh nổi bật:</td>
                        <td>
                            <asp:FileUpload runat="server" ID="FileUploadTitle"/>
                            <asp:Label ID="imagetitle" runat="server" />
                            <asp:Image class="Image" ID="imageReview" runat="server"/>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Hình ảnh:</td>
                        <td>
                            <asp:FileUpload runat="server" ID="UploadImages" AllowMultiple="true" />
                            <div class="list-image">
                                <asp:Repeater ID="RepeaterImages" runat="server">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" CssClass="item-image" ImageUrl='<%# Eval("Value") %>' />
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Gía tiền:</td>
                        <td>
                            <asp:TextBox ID="price" CssClass="txtPrice" runat="server" TextMode="Number"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Số lượng:</td>
                        <td>
                            <asp:TextBox ID="quantity" CssClass="txtQuan" runat="server" TextMode="Number"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Mô tả:</td>
                        <td>
                            <textarea id="description" class="txtDes" name="description" runat="server" style="height: 240px;"></textarea>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Brand:</td>
                        <td>
                            <asp:DropDownList ID="brand" runat="server" DataTextField="Value" DataValueField="Value" Height="48px"></asp:DropDownList>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Gía ban đầu:</td>
                        <td>
                            <asp:TextBox ID="oldPrice" runat="server" CssClass="txtQuan"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">CPU:</td>
                        <td>
                            <asp:TextBox ID="cpu" runat="server" CssClass="txtQuan"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">RAM:</td>
                        <td>
                            <asp:TextBox ID="ram" runat="server" CssClass="txtQuan"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Hard Drive:</td>
                        <td>
                            <asp:TextBox ID="hardDrive" runat="server" CssClass="txtQuan"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Cân nặng:</td>
                        <td>
                            <asp:TextBox ID="weight" runat="server" CssClass="txtQuan"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Màn hình:</td>
                        <td>
                            <asp:TextBox ID="screen" runat="server" CssClass="txtQuan"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Loại:</td>
                        <td>
                            <asp:TextBox ID="type" runat="server" CssClass="txtQuan"></asp:TextBox>
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
                        <td class=""></td>
                        <td>
                            <div class="btn">

                            <asp:Button ID="Button2" CssClass="btnEdit" runat="server" Text="Sửa" OnClick="Edit_Click" />
                            <asp:Button ID="Button1" CssClass="btnback" runat="server" Text="Quay lại"  PostBackUrl="~/management-list-product.aspx" />
                            </div>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
</body>
</html>
