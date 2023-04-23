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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container body-content" id="main">
        <form id="form1" class="layout-form" method="post" runat="server" enctype="multipart/form-data">
            <div>
                <div class="header-form">
                    <h3>Thêm mới sản phẩm</h3>
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
                            <asp:TextBox ID="price" runat="server" placeholder="Nhập giá tiền" TextMode="Number"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Số lượng:</td>
                        <td>
                            <asp:TextBox ID="quantity" runat="server" placeholder="Nhập số lượng" TextMode="Number"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="label-login">Mô tả:</td>
                        <td>
                            <textarea id="description" name="description" runat="server" style="width: 240px;"></textarea>
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
                            <asp:Button ID="Button1" runat="server" Text="Thêm" OnClick="Add_Click"/>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
</body>
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
