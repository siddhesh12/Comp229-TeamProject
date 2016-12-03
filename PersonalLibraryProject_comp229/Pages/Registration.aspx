<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/ProjectSiteMaster.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="PersonalLibraryProject_comp229.Pages.Registration" %>
<%--******************************* Contact us Page ******************************
    Personal Library Managemnet
    Author: @ Aakash  Chirtian: 300808436
    Folder: Pages
    Project Script: BootStrap.css
    Created Dt: 24th Nov 

    Version: 1.0
    Page Discription: This serves contact information about the company.--%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <h4>Registration</h4>

         <table class="auto-style11" style="width: 853px; height: 229px;">
            <tr>
                <td class="auto-style13" style="width: 744px; height: 28px;">
                    <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
                </td>
                <td class="auto-style12" style="width: 426px; height: 28px;">
                    <asp:TextBox ID="nameTextField" runat="server" style="margin-left: 0px"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="nameTextField" ErrorMessage="First Name Required" runat="server"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style13" style="width: 744px; height: 28px;">
                    <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td class="auto-style12" style="width: 426px; height: 28px;">
                    <asp:TextBox ID="lastNameTextFeild" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="lastNameTextFeild" runat="server" ErrorMessage="Last Name Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style13" style="width: 744px; height: 28px;">
                    <asp:Label ID="Label3" runat="server" Text="DoB"></asp:Label>
                </td>
                <td class="auto-style12" style="width: 426px; height: 28px;">
                    <asp:TextBox ID="dateTF" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="dateTF" runat="server" ErrorMessage="DoB Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
            <tr>
                <td class="auto-style13" style="width: 744px; height: 29px;">
                    <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="auto-style12" style="width: 426px; height: 29px;">
                    <asp:TextBox ID="passwordTF" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="passwordTF" ErrorMessage="Password Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style13" style="width: 744px; height: 29px;">
                    <asp:Label ID="Label6" runat="server" Text="Confirm Password"></asp:Label>
                </td>
                <td class="auto-style12" style="width: 426px; height: 29px;">
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="passwordTF"  ControlToValidate="TextBox7" ErrorMessage="Password Does not match!"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8" colspan="2" style="height: 29px">
                    <asp:Button ID="Button1" runat="server" Text="Register" OnClick="reginstrationClicked" style="margin-left: 193px" Width="86px" />
                </td>
            </tr>
             <tr>
                <td class="auto-style8" colspan="2" style="height: 29px">
                    <asp:Label ID="errorMSG" runat="server" Text="Failed to registered"  style="margin-left: 193px" />
                </td>
            </tr>
        </table>
    </div>
    
    

</asp:Content>