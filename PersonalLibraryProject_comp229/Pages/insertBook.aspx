<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/ProjectSiteMaster.Master" AutoEventWireup="true" CodeBehind="insertBook.aspx.cs" Inherits="PersonalLibraryProject_comp229.Pages.insertBook" %>

<%--******************************* Contact us Page ******************************
    Personal Library Managemnet
    Author: @ Siddhesh Mahadeshwar: 300915971
    Folder: Pages
    Project Script: BootStrap.css
    Created Dt: 24th Nov 

    Version: 1.0
    Page Discription: This serves contact information about the company.--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <table class="auto-style11">
            <tr>
                <td class="auto-style13" style="height: 26px">
                    <asp:Label ID="Label1" runat="server" Text="ISBN NO"></asp:Label>
                </td>
                <td style="height: 26px">
                    <asp:TextBox ID="isbnNoTextField" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="Label2" runat="server" Text="TITLE"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="titleTextField" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td class="auto-style13">
                    <asp:Label ID="Label3" runat="server" Text="DETAIL"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="bookDetailsTextField" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>

    </div>
    <br/>
    <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="submitButtonClicked" />
</asp:Content>

