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
      
<asp:GridView ID="recentlyAddedGrid" runat="server" BorderStyle="None" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" HorizontalAlign="Left" OnRowCommand="GridView1_RowCommand">
    <Columns>
        <asp:BoundField HeaderText="Title" DataField="book_name" ShowHeader="False" >
        <HeaderStyle HorizontalAlign="Left" />
        <ItemStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:ImageField HeaderText="image">
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle HorizontalAlign="Left" />
        </asp:ImageField>
        <asp:BoundField HeaderText="Book Details" DataField="book_detail" ShowHeader="False">
        <HeaderStyle HorizontalAlign="Left" />
        <ItemStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:ButtonField Text="Details" CommandName="detailCommand" />
    </Columns>

</asp:GridView></div>
    <br/>
    <div class="auto-style8">
        <asp:Label ID="Label2" runat="server" Text="Available Books"></asp:Label></div
    <br/><br/>
    <div>
        <asp:GridView ID="availabaleGrid" runat="server" GridLines="None" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField HeaderText="Title" DataField="book_name">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:ImageField HeaderText="Image">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:ImageField>
                <asp:BoundField HeaderText="Details" DataField="book_detail">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:ButtonField Text="Book Details" />
            </Columns>
        </asp:GridView>
    </div>
    <br/>
    <div class="auto-style8">
        <asp:Label ID="Label3" runat="server" Text="Borrowed Books"></asp:Label></div>
    <br/>
    <asp:GridView ID="borrowedGrid" runat="server" GridLines="None" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField HeaderText="Title" DataField="book_name">
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:ImageField HeaderText="Image">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:ImageField>
            <asp:BoundField HeaderText="Details" DataField="book_detail">
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:ButtonField Text="Books Detail" />
        </Columns>
    </asp:GridView>
    <br/>
    <div>
        <asp:Button ID="Button1" runat="server" Text="Insert Book" onClick="insertButtonClicked"/></div>

</asp:Content>
