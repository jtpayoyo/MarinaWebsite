<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Marina.GUI.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center" style="margin-bottom:60px;">
        <h2 class="top-text">Login</h2>
        <div class="d-flex justify-content-center">
            <div class="col-sm-4">
                <table class="table">
                    <tr>
                        <td style="width:200px;">Username</td>
                        <td>
                            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:200px;">Password</td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnAuthenticate" runat="server" Text="Authenticate" OnClick="btnAuthenticate_Click" />
                        </td>                
                    </tr>
                    <tr>
                        <td colspan="2">
                            <a runat="server" href="~/Registration">Don't have a login? Register here.</a>                                             
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Text="&nbsp"></asp:Label>   
            </div>
        </div>

    </div>
</asp:Content>
