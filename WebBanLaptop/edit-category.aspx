<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit-category.aspx.cs" Inherits="WebBanLaptop.edit_category" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chỉnh sửa</title>
    <link rel="stylesheet" href="/assets/css/style.css" />
    <link rel="stylesheet" href="/assets/css/admin.css" />
    <link rel="stylesheet" href="/assets/css/add-categoryCss.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container body-content" id="main">
        <form id="form1" class="layout-form" method="post" runat="server">
            <div>
                <div class="header-form">
                    <h3>Chỉnh sửa phân loại</h3>
                </div>
                <table style="width: 100%;">
                    <tr>
                        <td class="label-login">Tên loại:</td>
                        <td>
                            <asp:TextBox ID="name" runat="server"></asp:TextBox>
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
                            <asp:Button ID="Button1" CssClass="btnEdit" runat="server" Text="Sửa" OnClick="Button1_Click" />
                            <asp:Button ID="Button2" CssClass="btnback" runat="server" Text="Quay lại"  PostBackUrl="~/management-list-category.aspx" />

                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
</body>
</html>
