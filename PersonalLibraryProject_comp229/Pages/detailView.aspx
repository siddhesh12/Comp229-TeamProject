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
                    <asp:GridView ID="detailGridView" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="detailGridView_SelectedIndexChanged" Width="724px">
                    <Columns>
                <asp:BoundField HeaderText="Title" DataField="book_name">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Details" DataField="book_detail">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>
            </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="XX-Large" Font-Strikeout="False" style="text-align: left" Text="Reviews"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="reviewGrid" runat="server" AutoGenerateColumns="False" Width="328px">
                         <Columns>
                <asp:BoundField HeaderText="Reviews" DataField="reviews_msg">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField HeaderText="User" DataField="name">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>
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
        <asp:Button ID="Button1" runat="server" Text="Submit" onClick="submitButtonClicked"/>
</div>
</asp:Content>
