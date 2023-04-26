<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="searchOrder.aspx.cs" Inherits="WebBanLaptop.Api.searchOrder" %>
<form runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" ForeColor="#333333"
        GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" CssClass="table" AllowPaging="True" OnRowDataBound="GridView1_OnRowDataBound">
        <alternatingrowstyle backcolor="White" />
        <columns>
            <asp:TemplateField HeaderText="ID">
                <itemtemplate>
                    <a href="management-order-details.aspx?order_id=<%# Eval("Id") %>"><%# Eval("Id") %></a>
                </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tên khách hàng">
                <itemtemplate>
                    <asp:Label ID="lb_name" runat="server" Text='<%# Eval("CustomerName") %>'></asp:Label>
                </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <itemtemplate>
                    <asp:Label ID="lb_email" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Số điện thoại">
                <itemtemplate>
                    <asp:Label ID="lb_phone" runat="server" Text='<%# Eval("NumberPhone") %>'></asp:Label>
                </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Địa chỉ">
                <itemtemplate>
                    <asp:Label ID="lb_address" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ghi chú">
                <itemtemplate>
                    <asp:Label ID="lb_note" runat="server" Text='<%# Eval("Note") %>'></asp:Label>
                </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Thời gian">
                <itemtemplate>
                    <asp:Label ID="lb_createdAt" runat="server" Text='<%# Eval("CreatedAt") %>'></asp:Label>
                </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Trạng thái">
                <itemtemplate>
                    <asp:Label ID="lb_status" class="lb_status" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                </itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action">
                <itemtemplate>
                    <div class="btn">
                        <asp:LinkButton CssClass="btnConfirm" ID="LinkButton1" runat="server" Text="Xác nhận" CommandArgument='<%# Bind("Id") %>'
                            OnClick="Confirm_Click" OnClientClick="return Xacnhan()" Visible='<%# ShowButtonConfirm(Convert.ToString(Eval("Status"))) %>'>
                        </asp:LinkButton>

                        <asp:LinkButton CssClass="btnGiaoHang" ID="LinkButton2" runat="server" Text="Giao hàng" CommandArgument='<%# Bind("Id") %>'
                            OnClick="GiaoHang_Click" OnClientClick="return Xacnhan()" Visible='<%# ShowButtonGiaoHang(Convert.ToString(Eval("Status"))) %>'>
                        </asp:LinkButton>

                        <asp:LinkButton CssClass="btnSuccess" ID="LinkButton3" runat="server" Text="Giao hàng thành công" CommandArgument='<%# Bind("Id") %>'
                            OnClick="Success_Click" OnClientClick="return Xacnhan()" Visible='<%# ShowButtonSuccess(Convert.ToString(Eval("Status"))) %>'>
                        </asp:LinkButton>

                        <asp:LinkButton CssClass="btnPay" ID="LinkButton4" runat="server" Text="Hoàn thành" CommandArgument='<%# Bind("Id") %>'
                            OnClick="Pay_Click" OnClientClick="return Xacnhan()" Visible='<%# ShowButtonPay(Convert.ToString(Eval("Status"))) %>'>
                        </asp:LinkButton>
                    </div>
                </itemtemplate>
            </asp:TemplateField>
        </columns>
        <editrowstyle backcolor="#7C6F57" />
        <footerstyle backcolor="#1C5E55" font-bold="True" forecolor="White" />
        <headerstyle backcolor="#1C5E55" font-bold="True" forecolor="White" />
        <pagerstyle backcolor="#666666" forecolor="White" horizontalalign="Center" />
        <rowstyle backcolor="#E3EAEB" />
        <selectedrowstyle backcolor="#C5BBAF" font-bold="True" forecolor="#333333" />
        <sortedascendingcellstyle backcolor="#F8FAFA" />
        <sortedascendingheaderstyle backcolor="#246B61" />
        <sorteddescendingcellstyle backcolor="#D4DFE1" />
        <sorteddescendingheaderstyle backcolor="#15524A" />
    </asp:GridView>
    </form>
