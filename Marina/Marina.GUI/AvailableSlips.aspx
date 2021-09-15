<%@ Page Title="Available Slips" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AvailableSlips.aspx.cs" Inherits="Marina.GUI.AvailableSlips" %>

<%@ Register Src="~/Controls/DockSelector.ascx" TagPrefix="uc1" TagName="DockSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="text-center">
            <h2 class="top-text">Available Slips</h2>
            <p style="margin-bottom: 40px;">
                Select a dock to get more information on the slips available. 
                <br />
                To lease a slip, register for an account or login to an existing account.
            </p>
            <uc1:DockSelector runat="server" ID="DockSelector" />
        </div>
        <div class="d-flex justify-content-center">
            <div class="col-sm-4">
                <table class="table" style="margin: 40px 0;">
                    <tr>
                        <td style="width: 200px;">Dock ID</td>
                        <td>
                            <asp:Label ID="lblDockId" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td>
                            <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Water Service</td>
                        <td>
                            <asp:Label ID="lblWaterService" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Electrical Service</td>
                        <td>
                            <asp:Label ID="lblElectricalService" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="d-flex justify-content-center">
            <asp:GridView ID="gvAvailableSlips" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" AlternatingRowStyle-BackColor="#F2F8FF" HeaderStyle-BackColor="#ECF4FF">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAvailableSlipsByDock" TypeName="Marina.Data.MarinaManager">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="selectedDockID" SessionField="SelectedDock" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>

    </div>
    <!-- End of container -->
</asp:Content>
