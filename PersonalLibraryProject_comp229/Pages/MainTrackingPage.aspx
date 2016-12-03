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
    <%--<link rel="stylesheet" type="text/css" href="../Scripts/mainPageStyle.css"/>--%>
    <br/>
    <h5 style="text-align: center">Welcome To Personal Library Management </h5> <br/>
    Life&#39;s best moments Start with best stories, Enjoy in this world of Books.<br/>
    a component that gives you the ability to manage your personal book library or a public library.
    Personal Library is an Open Source.
<br />
<br />
   <div class="auto-style8"> <asp:Label ID="Label1" runat="server" Text="Recently Added"></asp:Label></div>
    <br/><br/>
 <div style="margin-right: auto; margin-left: auto">  
      
<asp:GridView ID="recentlyAddedGrid" runat="server" BorderStyle="None" GridLines="Horizontal" AutoGenerateColumns="False"  OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" CellPadding="4" ForeColor="Black" HorizontalAlign="Center" OnSelectedIndexChanged="recentlyAddedGrid_SelectedIndexChanged">
    <Columns>
        <asp:BoundField HeaderText="Title" dataField="book_name"/>
      <%--  <asp:TemplateField >
        <ItemTemplate>     
            <asp:Label runat="server"
                ID="reviewLabel"
                Text='<%#Eval("review") %>'
                 />      
             <asp:Label runat="server"
                ID="review"
                Text= 'reviews'
                 />  
        </ItemTemplate>  
      </asp:TemplateField>--%>
         <asp:TemplateField>
        <ItemTemplate>                
          <asp:Button runat="server" 
            ID="Details"
            Text="Book Detail"
            CommandName="detailCommand"
            CommandArgument='<%#Eval("isbn_no") %>' />
        </ItemTemplate>  
      </asp:TemplateField>

    </Columns>

    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F7F7F7" />
    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
    <SortedDescendingCellStyle BackColor="#E5E5E5" />
    <SortedDescendingHeaderStyle BackColor="#242121" />

</asp:GridView></div>
    <br/>
    <div class="auto-style8">
        <asp:Label ID="Label2" runat="server" Text="Available Books"></asp:Label>
    </div>
    <br/>
    <div>
        <asp:GridView ID="availabaleGrid" runat="server" AutoGenerateColumns="False"  OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField HeaderText="Title" dataField="book_name"/>
                 <asp:TemplateField>
        <ItemTemplate>                
          <asp:Button runat="server" 
            ID="Details"
            Text="BookDetail"
            CommandName="detailCommand"
            CommandArgument='<%#Eval("isbn_no") %>' />
        </ItemTemplate>
      </asp:TemplateField>
                <%--<asp:ButtonField Text="Book Detail" CommandName="detailCommand" />--%>
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
    </div>
    <br/>
    <div class="auto-style8">
        <asp:Label ID="Label3" runat="server" Text="Borrowed Books"></asp:Label></div>
    <br/>
    <asp:GridView ID="borrowedGrid" runat="server" GridLines="Vertical" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField HeaderText="Title" dataField="book_name"/>
             <asp:TemplateField>
        <ItemTemplate>                
          <asp:Button runat="server" 
            ID="Details"
            Text="BookDetail"
            CommandName="detailCommand"
            CommandArgument='<%#Eval("isbn_no") %>' />
        </ItemTemplate>
      </asp:TemplateField>
            <%--<asp:ButtonField Text="Book Detail" CommandName="detailCommand" />--%>
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <br/>
    <div>
        <asp:Button ID="insertButton" runat="server" Text="Insert" onClick="insertButtonClicked"/></div>

</asp:Content>
