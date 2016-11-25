<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/ProjectSiteMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="PersonalLibraryProject_comp229.Pages.ContactUs" %>
<%--******************************* Contact us Page ******************************
    Personal Library Managemnet
    Author: @ Siddhesh Mahadeshwar: 300915971
    Folder: Pages
    Project Script: BootStrap.css
    Created Dt: 24th Nov 

    Version: 0.2
    Page Discription: This serves contact information about the company.--%>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br/>
       <h5>Aakash Christian</h5> achristian3778@rediffmail.com<br/>
        <h5>Siddhesh Mahadeshwer</h5> siddheshmahadeshwer334@gmail.com<br/><br/>
    <asp:Label ID="Label1" runat="server" Text="Your FeedBack"></asp:Label><br/><br/>
    <textarea id="TextArea1" cols="30" rows="5"></textarea><br/><br/>

    <asp:Button ID="Button1" runat="server" Text="Submit" /><br/><br/>


</asp:Content>