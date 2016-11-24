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
      
<asp:GridView ID="GridView1" runat="server">
</asp:GridView></div>
    <br/>
    <div class="auto-style8">
        <asp:Label ID="Label2" runat="server" Text="Available Books"></asp:Label></div
    <br/><br/>
    <div>
        <asp:GridView ID="GridView2" runat="server"></asp:GridView>
    </div>
    <br/>
    <div class="auto-style8">
        <asp:Label ID="Label3" runat="server" Text="Borrowed Books"></asp:Label></div>
    <br/>
    <asp:GridView ID="GridView3" runat="server"></asp:GridView>

</asp:Content>
