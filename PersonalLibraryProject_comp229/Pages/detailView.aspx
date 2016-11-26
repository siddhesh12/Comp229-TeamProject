<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/ProjectSiteMaster.Master" AutoEventWireup="true" CodeBehind="detailView.aspx.cs" Inherits="PersonalLibraryProject_comp229.Pages.detailView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        
        <table style="width: 100%">
            <tr>
                <td style="text-align: left">
                    <asp:Image ID="Image1" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="detailGridView" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="detailGridView_SelectedIndexChanged">
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnectionString %>" SelectCommand="select * from Comp229TeamProject.dbo.Books"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView2" runat="server">
                    </asp:GridView>
                </td>
            </tr>
        </table>
        
    </div>
    <br />
<asp:Label ID="Label1" runat="server" Text="Your Review Here"></asp:Label>
    <br/>
    <div>
        <textarea id="TextArea1" cols="50" rows="5"></textarea><br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" />
</div>
</asp:Content>
