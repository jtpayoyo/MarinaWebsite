<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="Marina.GUI.Secure.MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin-bottom: 60px;">
        <h2 class="top-text text-center">My Profile</h2>
        <div class="d-flex justify-content-center">
            <div class="col-sm-6">
                <h4>Personal Information</h4>
                <table class="table">
                    <tr>
                        <td style="width: 200px;">ID</td>
                        <td>
                            <asp:Label ID="lblCustomerID" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>First Name</td>
                        <td>
                            <asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td>
                            <asp:Label ID="lblLastName" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td>
                            <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td>
                            <asp:Label ID="lblCity" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <h4>Slip Information</h4>
                <br />
                <asp:Button ID="btnLeaseSlips" runat="server" Text="Lease a Slip" OnClick="btnLeaseSlips_Click" />
                <br />
                <br />
                <asp:GridView ID="gvMyLeases" runat="server" DataSourceID="ObjectDataSource3"
                    AlternatingRowStyle-BackColor="#F2F8FF" HeaderStyle-BackColor="#ECF4FF" Width="500px">
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="GetLeasesPerCustomer" TypeName="Marina.Data.MarinaManager">
                    <SelectParameters>
                        <asp:SessionParameter Name="custID" SessionField="CustomerID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
        <!-- End of flex -->

    </div>
    <!-- End of container -->


</asp:Content>
