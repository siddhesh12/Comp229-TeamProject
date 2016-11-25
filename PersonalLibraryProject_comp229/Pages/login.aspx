<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/ProjectSiteMaster.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PersonalLibraryProject_comp229.Pages.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="Button2" runat="server" OnClick="insertBookButtonClicked" Text="InsertBook" />
    <br/><br/>
    <asp:Login ID="Login1" runat="server">
        <LayoutTemplate>
            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0">
                            <tr>
                                <td align="center" colspan="2">Log In</td>
                            </tr>
                            <tr>
                                <td class="auto-style13">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                </td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="UserName" runat="server" placeHolder="userName"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8" colspan="2">
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" OnClick="loginButtonPressed" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:Login>
    <div>
        <asp:Button ID="Button1" runat="server" Text="Register" OnClick="registrationButtonClicked" /></div>
    <br/>
</asp:Content>
