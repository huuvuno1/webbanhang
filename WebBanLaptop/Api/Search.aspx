<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="WebBanLaptop.Api.Search" %>

<asp:Repeater id="searchRepeter" runat="server">
    <itemtemplate>
        <a href="product-detail.aspx?id=<%# Eval("Id") %>">
            
            <div class="name mb-10">
                <h1 class="searchName"><%# Eval("Name") %></h1>
            </div>
            
            
        </a>
    </itemtemplate>

</asp:Repeater>
