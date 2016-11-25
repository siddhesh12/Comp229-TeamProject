<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/ProjectSiteMaster.Master" AutoEventWireup="true" CodeBehind="insertBook.aspx.cs" Inherits="PersonalLibraryProject_comp229.Pages.insertBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <table class="auto-style11">
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="Label1" runat="server" Text="ISBN NO"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="Label2" runat="server" Text="TITLE"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>

    </div>
    <br/>
    <asp:Button ID="Submit" runat="server" Text="Submit" />
</asp:Content>