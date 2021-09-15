<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Marina.GUI.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2 class="top-text">Registration</h2>
        <p style="padding-bottom: 30px;">
            Register a new account below.           
        </p>
    </div>
    <asp:Wizard ID="uxRegistration" runat="server" ActiveStepIndex="0" OnFinishButtonClick="uxRegistration_FinishButtonClick">
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" Title="Personal Information">

                <table class="table">
                    <tr>
                        <td style="width: 150px">First Name:</td>
                        <td>
                            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name is required." ControlToValidate="txtFirstName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Last Name:</td>
                        <td>
                            <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is required." ControlToValidate="txtLastName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Phone:</td>
                        <td>
                            <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Phone is required." ControlToValidate="txtPhone" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>City:</td>
                        <td>
                            <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="City is required." ControlToValidate="txtCity" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>

            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep2" runat="server" Title="Login Credentials">
                <table class="table">
                    <tr>
                        <td style="width: 150px">Username:</td>
                        <td>
                            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Username is required." ControlToValidate="txtUsername" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Password is required." ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</asp:Content>
