<%@ Page Language="C#" MasterPageFile="~/GWMMaster.Master" AutoEventWireup="true" CodeBehind="EventsPage.aspx.cs" Inherits="GWMPortal.EventsPage" EnableEventValidation="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="align-content: center" class="form-group">
        <table class="table" align="center" border="0" style="width: 60%">
            <thead>
                <tr align="center">
                    <td colspan="3" class="text-primary btn-lg">Events</td>
                </tr>
            </thead>
             <tr style="height:30px">
                <td colspan="3"><asp:Label runat="server" id="lblMessage" CssClass="alert-success"></asp:Label></td>
            </tr>
            <tr class="hidden">
                <td>
                    <asp:Label runat="server" Visible="false">Event Id</asp:Label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="EventId" ReadOnly="true" Visible="false"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 200px">
                    <asp:Label runat="server">Event Name</asp:Label></td>
                <td style="width: 400px">
                    <asp:TextBox runat="server" ID="EventName" placeholder="Please specify event name" CssClass="form-control" TabIndex="1" Width="350px"></asp:TextBox></td>
                <td style="width: 550px">
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="EventName" ForeColor="Red" Text="Please specify event name"></asp:RequiredFieldValidator></td>

            </tr>
            <tr>
                <td style="width: 200px">
                    <asp:Label runat="server">Description</asp:Label></td>
                <td style="width: 400px">
                    <asp:TextBox runat="server" ID="Description" placeholder="Please Give Event Description" CssClass="form-control" TabIndex="1" Width="350px"></asp:TextBox></td>
                <td style="width: 550px">
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Description" ForeColor="Red" Text="Please Give Event Description"></asp:RequiredFieldValidator></td>

            </tr>
            <tr>
                <td>
                    <asp:Label runat="server">Date From</asp:Label></td>
                <td>
                    <div class="input-group date" id="datetimepickerfrom">
                        <asp:TextBox ID="DateFrom" runat="server" CssClass="form-control" TabIndex="2" Width="350px" placeholder="Please specify date from"></asp:TextBox>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="DateFromRequiredValidator"
                        ControlToValidate="DateFrom" runat="server" ErrorMessage="Please specify date from">
                    </asp:RequiredFieldValidator>
                </td>

            </tr>
            <tr>
                <td>
                    <asp:Label runat="server">Date To</asp:Label></td>
                <td>
                    <div class='input-group date' id='datetimepickerto'>
                        <asp:TextBox ID="DateTo" runat="server" CssClass="form-control" TabIndex="3" Width="350px" placeholder="Please specify date to"></asp:TextBox>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="DatetoRequiredValidator"
                        ControlToValidate="DateTo" runat="server" ErrorMessage="Please specify date to">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="hidden">
                <td>
                    <asp:Label runat="server" Visible="false">Days</asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="Days" PlaceHolder="Specify the End date of the event" TabIndex="1" Visible="false"></asp:TextBox></td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server">Location</asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="Location" CssClass="form-control" TabIndex="4" Width="350px" placeholder="Please specify location" ></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Location" ForeColor="Red" Text="Please specify location"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <asp:Button CssClass="btn bg-primary" runat="server" Style="margin-left: 100px" Text="Add Event" OnClick="AddEvent_Click" ID="AddEvent" TabIndex="5" /></td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        $(function () {
            $('#datetimepickerfrom').datetimepicker();
        });
        $(function () {
            $('#datetimepickerto').datetimepicker();
        });
    </script>
</asp:Content>
