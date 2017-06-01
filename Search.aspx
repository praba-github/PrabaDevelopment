<%@ Page Title="" Language="C#" MasterPageFile="~/GWMMaster.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="GWMPortal.Search" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" type="text/javascript">
        $('.nav.navbar-nav > li').on('click', function () {
            //    $(this).addClass('bg-success');
            //$(this).siblings().removeClass('bg-success');
        });
    </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="align-content: center" class="form-group">
        <table class="table" align="center" border="0" style="width: 70%">
            <thead>
                <tr align="center">
                    <td colspan="3" class="text-primary btn-lg">Search Criteria Form</td>
                </tr>
            </thead>
            <tr style="height: 30px">
                <td colspan="3">
                    <asp:Label runat="server" ID="lblMessage" CssClass="alert-success"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 300px">
                    <asp:TextBox ID="txtSearchCriteria" runat="server" placeholder="Enter the keyword to search..." CssClass="form-control" Width="300px"></asp:TextBox></td>               
                <td>
                    <asp:Button ID="btnSearch" CssClass="btn bg-primary" runat="server" Text="Search" Style="margin-left: 100px" Width="100px" OnClick="btnSearch_Click" /></td>
                 <td>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSearchCriteria" Text="Please provide the search criteria" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
        </table>
    </div>
    <div id="tabs" style="margin: 10px 0px 0px 15px;">
        <div class="tab-content">
            <div id="Reference" class="tab-pane fade in active">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GrdSearchResults" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered"
                            HeaderStyle-CssClass="navbar-default" AllowPaging="True" EmptyDataText="No Documents Available" PagerStyle-CssClass="grdviewPagerStyle" Width="1271px" OnPageIndexChanging="GrdSearchResults_PageIndexChanging1">
                            <Columns>
                                <asp:BoundField HeaderText="Document Ref" DataField="id"
                                    HeaderStyle-Width="150">
                                    <HeaderStyle Width="150px"></HeaderStyle>
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Name" DataField="Name" />
                                <asp:BoundField HeaderText="Published Date" DataField="CreatedOn" DataFormatString="{0:dd/MMM/yyyy}" />
                                <asp:BoundField HeaderText="Description" DataField="Description" />
                                <asp:HyperLinkField HeaderText="URL" DataTextField="URLName" DataNavigateUrlFields="URL"
                                    Target="_blank" />
                            </Columns>
                            <HeaderStyle CssClass="navbar-default"></HeaderStyle>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>

