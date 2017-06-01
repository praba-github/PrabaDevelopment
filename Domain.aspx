<%@ Page Language="C#" MasterPageFile="~/GWMMaster.Master" AutoEventWireup="true"
    CodeBehind="Domain.aspx.cs" Inherits="GWMPortal.Domain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <script language="javascript" type="text/javascript">
        $('.nav.navbar-nav > li').on('click', function () {
            //    $(this).addClass('bg-success');
            //$(this).siblings().removeClass('bg-success');
        });
    </script>
     <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div style="margin: 10px 0px 0px 15px;">
        <ul class="nav nav-pills nav-stackeds">
            <li class="active" id="limain"><a data-toggle="tab" href="#Reference" style="width: 150px">CoP Sessions</a></li>
            <li><a data-toggle="tab" href="#Templates" style="width: 150px">WhitePapers</a></li>
            <li><a data-toggle="tab" href="#ReportsArticles" style="width: 150px">ReportsAndArticles</a></li>
        </ul>
        <div class="tab-content">
            <div id="Reference" class="tab-pane fade in active">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GrdCoPSessions" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered"
                            HeaderStyle-CssClass="navbar-default" AllowPaging="True" OnPageIndexChanging="GrdCoPSessions_PageIndexChanging" PagerStyle-CssClass="grdviewPagerStyle">
                            <Columns>
                                <asp:BoundField HeaderText="Document Ref" DataField="id" HeaderStyle-Width="150">
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
            <div id="Templates" class="tab-pane fade">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GrdWhitePapers" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered"
                            HeaderStyle-CssClass="navbar-default" AllowPaging="True" OnPageIndexChanging="GrdWhitePapers_PageIndexChanging" PagerStyle-CssClass="grdviewPagerStyle">
                            <Columns>
                                <asp:BoundField HeaderText="Document Ref" DataField="id" />
                                <asp:BoundField HeaderText="Name" DataField="Name" />
                                <asp:BoundField HeaderText="Published Date" DataField="CreatedOn" DataFormatString="{0:dd/MMM/yyyy}" />
                                <asp:BoundField HeaderText="Description" DataField="Description" />
                                <asp:HyperLinkField HeaderText="URL" DataTextField="URLName" DataNavigateUrlFields="URL"
                                    Target="_blank" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div id="ReportsArticles" class="tab-pane fade">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GrdReports" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered"
                            HeaderStyle-CssClass="navbar-default" AllowPaging="True" OnPageIndexChanging="GrdReports_PageIndexChanging" PagerStyle-CssClass="grdviewPagerStyle">
                            <Columns>
                                <asp:BoundField HeaderText="Document Ref" DataField="id" />
                                <asp:BoundField HeaderText="Name" DataField="Name" />
                                <asp:BoundField HeaderText="Published Date" DataField="CreatedOn" DataFormatString="{0:dd/MMM/yyyy}" />
                                <asp:BoundField HeaderText="Description" DataField="Description" />
                                <asp:HyperLinkField HeaderText="URL" DataTextField="URLName" DataNavigateUrlFields="URL"
                                    Target="_blank" />
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div id="Others" class="tab-pane fade">
                <h4>In progress
                </h4>
            </div>
        </div>
    </div>
</asp:Content>
