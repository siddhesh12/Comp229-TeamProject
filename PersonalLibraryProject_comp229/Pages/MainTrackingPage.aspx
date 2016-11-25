<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/ProjectSiteMaster.Master" AutoEventWireup="true" CodeBehind="MainTrackingPage.aspx.cs" Inherits="PersonalLibraryProject_comp229.Pages.MainTrackingPage" %>

<%--******************************* Main Tracking Page ******************************
    Personal Library Managemnet
    Author: @ Siddhesh Mahadeshwar: 300915971
    Folder: Pages
    Project Script: BootStrap.css
    Created Dt: 18th Nov, Friday 

    Version: 1.0
    Page Discription: This serve as a home page.--%>
    

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br/>
    <h5 style="text-align: center">Welcome To Personal Library Management </h5> <br/>
    Life&#39;s best moments Start with best stories, Enjoy in this world of Books.<br/>
    a component that gives you the ability to manage your personal book library or a public library.
    Personal Library is an Open Source.
<br />
<br />
   <div class="auto-style8"> <asp:Label ID="Label1" runat="server" Text="Recently Added"></asp:Label></div>
    <br/><br/>
 <div>  
      
<asp:GridView ID="GridView1" runat="server" BorderStyle="None" GridLines="None">
    <Columns>
        <asp:BoundField HeaderText="Title" />
        <asp:ImageField HeaderText="image">
        </asp:ImageField>
        <asp:TemplateField HeaderText="Details">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:ButtonField Text="Select" />
    </Columns>

</asp:GridView></div>
    <br/>
    <div class="auto-style8">
        <asp:Label ID="Label2" runat="server" Text="Available Books"></asp:Label></div
    <br/><br/>
    <div>
        <asp:GridView ID="GridView2" runat="server" GridLines="None">
            <Columns>
                <asp:BoundField HeaderText="Title" />
                <asp:ImageField HeaderText="Image">
                </asp:ImageField>
                <asp:BoundField HeaderText="Details" />
                <asp:ButtonField Text="Select" />
            </Columns>
        </asp:GridView>
    </div>
    <br/>
    <div class="auto-style8">
        <asp:Label ID="Label3" runat="server" Text="Borrowed Books"></asp:Label></div>
    <br/>
    <asp:GridView ID="GridView3" runat="server" GridLines="None">
        <Columns>
            <asp:BoundField HeaderText="Title" />
            <asp:ImageField HeaderText="Image">
            </asp:ImageField>
            <asp:BoundField HeaderText="Details" />
            <asp:ButtonField Text="Select" />
        </Columns>
    </asp:GridView>
    <br/>
    <div>
        <asp:Button ID="Button1" runat="server" Text="Insert" /></div>

</asp:Content>
