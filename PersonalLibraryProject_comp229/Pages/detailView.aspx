<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/ProjectSiteMaster.Master" AutoEventWireup="true" CodeBehind="detailView.aspx.cs" Inherits="PersonalLibraryProject_comp229.Pages.detailView" %>

<%--******************************* Main Tracking Page ******************************
    Personal Library Managemnet
    Author: @ Aakash Chirstian: 300808436
    Folder: Pages
    Project Script: BootStrap.css
    Created Dt: 18th Nov, Friday 

    Version: 1.0
    Page Discription: This serve as a home page.--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../ProjectScripts/stylesheet1.css"/>
    <div>
        
        <table style="width: 100%" align="center">
            <tr>
                <td>
                    <asp:Image ID="Image1" runat="server" />
                </td>
                <td>
                    <asp:GridView ID="detailGridView" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="detailGridView_SelectedIndexChanged" HorizontalAlign="Center" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
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
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="XX-Large" Font-Strikeout="False" style="text-align: left" Text="Reviews"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="reviewGrid" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
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
                         <FooterStyle BackColor="#CCCCCC" />
                         <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                         <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                         <RowStyle BackColor="White" />
                         <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                         <SortedAscendingCellStyle BackColor="#F1F1F1" />
                         <SortedAscendingHeaderStyle BackColor="#808080" />
                         <SortedDescendingCellStyle BackColor="#CAC9C9" />
                         <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        
    </div>
    <br />
<asp:Label ID="Label1" runat="server" Text="Your Review Here"></asp:Label>
    <br/>
    
    <div>
        <asp:TextBox id="TextArea1" Columns="50" Rows="10" runat="server" TextMode="MultiLine"/><br />
<%--        <textarea id="TextArea1" cols="50" rows="5"></textarea><br />--%>
        <br />
        <asp:Button ID="bottomButton" runat="server" Text="Return" OnClick="bottomButton_Click" />
&nbsp;<br />
        <br />
        <asp:Button ID="submitButton" runat="server" Text="Submit review" onClick="submitButtonClicked" ForeColor="Black"/>
</div>
</asp:Content>
