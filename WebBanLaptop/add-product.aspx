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
        <form id="form1" class="layout-form" method="post" runat="server" enctype="multipart/form-data">
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
                        <td class="label-login">Hình ảnh:</td>
                        <td>
                            <asp:FileUpload runat="server" ID="UploadImages" AllowMultiple="true" />
                            <asp:Label ID="listofuploadedfiles" runat="server" />
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Gía tiền:</td>
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
                        <td class="label-login">Brand:</td>
                        <td>
                            <asp:DropDownList ID="brand" runat="server" DataTextField="Value" DataValueField="Value" Height="48px"></asp:DropDownList>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Gía ban đầu:</td>
                        <td>
                            <asp:TextBox ID="oldPrice" runat="server" CssClass="txtQuan" placeholder="Nhập giá ban đầu" TextMode="Number"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">CPU:</td>
                        <td>
                            <asp:TextBox ID="cpu" runat="server" CssClass="txtQuan" placeholder="Nhập CPU"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">RAM:</td>
                        <td>
                            <asp:TextBox ID="ram" runat="server" CssClass="txtQuan" placeholder="Nhập RAM"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Hard Drive:</td>
                        <td>
                            <asp:TextBox ID="hardDrive" runat="server" CssClass="txtQuan" placeholder="Nhập Hard Drive"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Cân nặng:</td>
                        <td>
                            <asp:TextBox ID="weight" runat="server" CssClass="txtQuan" placeholder="Nhập cân nặng" TextMode="Number"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Màn hình:</td>
                        <td>
                            <asp:TextBox ID="screen" runat="server" CssClass="txtQuan" placeholder="Nhập màn hình"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Loại:</td>
                        <td>
                            <asp:TextBox ID="type" runat="server" CssClass="txtQuan" placeholder="Nhập loại"></asp:TextBox>
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
<<<<<<< HEAD
</html>
=======
    <script type="text/javascript">
        function addFileUploadBox() {
            if (!document.getElementById || !document.createElement)
                return false;
            var uploadArea = document.getElementById("upload-area");
            if (!uploadArea)
                return;

            var newLine = document.createElement("br");
            uploadArea.appendChild(newLine);

            var newUploadBox = document.createElement("input");
            newUploadBox.type = "file";
            newUploadBox.size = "60";

            if (!addFileUploadBox.lastAssignedId) {
                addFileUploadBox.lastAssignedId = 100;
            }
            newUploadBox.setAttribute("id", "FileField" + addFileUploadBox.lastAssignedId)
            newUploadBox.setAttribute("name", "FileField" + addFileUploadBox.lastAssignedId)
            uploadArea.appendChild(newUploadBox);
            addFileUploadBox.lastAssignedId++;

        }
    </script>
</html>
>>>>>>> 2caa0b7 (add management user and order)
