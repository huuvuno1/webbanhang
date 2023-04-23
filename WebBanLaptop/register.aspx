<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebBanLaptop.register" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng ký</title>
    <link rel="stylesheet" href="/assets/css/style.css" />
    <link rel="stylesheet" href="/assets/css/product.css" />
    <link rel="stylesheet" href="/assets/css/login.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container container-form">
        <div class="bg-form"></div>
        <form id="form1" class="form-login" runat="server" method="post" onsubmit="return submitFormRegister()">
            <div>
                <div class="header-form">
                    <h2 class="txtHeader">Đăng Ký</h2>
                </div>
                <table style="width: 100%;">

                    <tr>
                        <td class=""></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Fullname:</td>
                        <td>
                            <asp:TextBox ID="fullname" runat="server" placeholder="Nhập họ tên của bạn"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Username:</td>
                        <td>
                            <asp:TextBox ID="username" runat="server" placeholder="Nhập tên đăng nhập"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Password:</td>
                        <td>
                            <asp:TextBox ID="password" TextMode="password" runat="server" placeholder="Nhập mật khẩu"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class=""></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Confirm Password:</td>
                        <td>
                            <asp:TextBox ID="confirm" TextMode="password" runat="server" placeholder="Nhập xác nhận mật khẩu"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class=""></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2">
                            <div class="text-error">
                                <asp:Label ID="Label1" runat="server"></asp:Label></div>
                        </td>
                    </tr>
                    <tr>
                        
                        <td colspan="2" class="btn">
                            <asp:Button ID="Button1" runat="server" Text="Đăng ký" OnClick="Register_Click" />
                            <a href="login.aspx" class="bonus-option">Bạn đã có tài khoản?</a>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
    </form>
    </div>
</body>
    <script type="text/javascript" src="/assets/js/form.js"></script>
</html>
