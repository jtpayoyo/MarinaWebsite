<%@ Page Title="Lease a Slip" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaseSlip.aspx.cs" Inherits="Marina.GUI.Secure.LeaseSlip" %>

<%@ Register Src="~/Controls/DockSelector.ascx" TagPrefix="uc1" TagName="DockSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="text-center">
            <h2 class="top-text">Lease a Slip</h2>
            <p style="margin-bottom: 40px;">
                Select a dock to get more information on the slips available.
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

        <!-- Slip Selection -->
        <div class="text-center">
            <h4 style="padding: 40px 0 30px 0;">Select a slip</h4>
            <asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300"></asp:Label>
            <br />
            <asp:Button ID="btnLease" runat="server" Text="Lease" style="margin:20px 0;" OnClick="btnLease_Click" />
        </div>
        <!-- Grid View -->
        <div class="d-flex justify-content-center">
                <asp:GridView ID="gvAvailableSlips" runat="server" AutoGenerateColumns="False"
                    DataSourceID="ObjectDataSource2" OnRowCreated="gvAvailableSlips_RowCreated"
                    AlternatingRowStyle-BackColor="#F2F8FF" HeaderStyle-BackColor="#ECF4FF">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Literal ID="RadioButtonMarkup" runat="server"></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" HeaderStyle-Width="100px"
                            ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" HeaderStyle-Width="100px"
                            ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" HeaderStyle-Width="100px"
                            ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                        <%--<asp:BoundField DataField="DockID" HeaderText="DockID" SortExpression="DockID" />--%>
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetAvailableSlipsByDock" TypeName="Marina.Data.MarinaManager">
                    <SelectParameters>
                        <asp:SessionParameter Name="selectedDockID" SessionField="SelectedDock" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
    </div>
    <!-- End of container -->

</asp:Content>
