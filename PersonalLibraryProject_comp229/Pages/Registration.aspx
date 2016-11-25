<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/ProjectSiteMaster.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="PersonalLibraryProject_comp229.Pages.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <h4>Registration</h4>

         <table class="auto-style11" style="width: 853px; height: 229px;">
            <tr>
                <td class="auto-style13" style="width: 744px; height: 28px;">
                    <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
                </td>
                <td class="auto-style12" style="width: 426px; height: 28px;">
                    <asp:TextBox ID="TextBox1" runat="server" style="margin-left: 0px"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox1" ErrorMessage="First Name Required" runat="server"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style13" style="width: 744px; height: 28px;">
                    <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td class="auto-style12" style="width: 426px; height: 28px;">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBox2" runat="server" ErrorMessage="Last Name Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style13" style="width: 744px; height: 28px;">
                    <asp:Label ID="Label3" runat="server" Text="DoB"></asp:Label>
                </td>
                <td class="auto-style12" style="width: 426px; height: 28px;">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBox3" runat="server" ErrorMessage="DoB Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style13" style="width: 744px; height: 29px;">
                    <asp:Label ID="Label4" runat="server" Text="Gender"></asp:Label>
                </td>
                <td class="auto-style12" style="width: 426px; height: 29px;">
                    <asp:RadioButton ID="RadioButton1" runat="server" GroupName="genderGroup" Text="Male" />
&nbsp;<asp:RadioButton ID="RadioButton2" runat="server" GroupName="genderGroup" Text="Female" />
                </td>
            </tr>
            <tr>
                <td class="auto-style13" style="width: 744px; height: 29px;">
                    <asp:Label ID="Label7" runat="server" Text="Email"></asp:Label>
                </td>
                <td class="auto-style12" style="width: 426px; height: 29px;">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBox5" ValidationExpression="^\S+@\S+\.\S+$" runat="server" ErrorMessage="Email Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style13" style="width: 744px; height: 29px;">
                    <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="auto-style12" style="width: 426px; height: 29px;">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox6" ErrorMessage="Password Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style13" style="width: 744px; height: 29px;">
                    <asp:Label ID="Label6" runat="server" Text="Confirm Password"></asp:Label>
                </td>
                <td class="auto-style12" style="width: 426px; height: 29px;">
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox6"  ControlToValidate="TextBox7" ErrorMessage="Password Does not match!"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8" colspan="2" style="height: 29px">
                    <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" style="margin-left: 193px" Width="86px" />
                </td>
            </tr>
        </table>
    </div>
    
    

</asp:Content>

