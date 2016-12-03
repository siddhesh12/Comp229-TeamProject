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
        
   <p>Your name:<br />
<asp:TextBox ID="YourName" runat="server" Width="150px" /><br />
Your email address:<br />
<asp:TextBox ID="YourEmail" runat="server" Width="150px" /><br />
Your comments:<br />
<asp:TextBox ID="Comments" runat="server" TextMode="MultiLine" Rows="10" Width="400px"/>
</p>
<p>
<asp:Button ID="Button1" runat="server" Text="Send" OnClick="emailSendButton" />
</p> 
      


</asp:Content>