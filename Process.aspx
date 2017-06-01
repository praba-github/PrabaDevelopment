<%@ Page Language="C#" MasterPageFile="~/GWMMaster.Master" AutoEventWireup="true"
    CodeBehind="Process.aspx.cs" Inherits="GWMPortal.Process" %>

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
            <li class="active" id="limain"><a data-toggle="tab" href="#Requirements" style="width: 150px">Requirements</a></li>
            <li><a data-toggle="tab" href="#DCUT" style="width: 150px">DCUT</a></li>
            <li><a data-toggle="tab" href="#Implementation" style="width: 150px">Implementation</a></li>
            <li><a data-toggle="tab" href="#Others" style="width: 150px">Others</a></li>
        </ul>
        <div class="tab-content">
            <div id="Requirements" class="tab-pane fade in active">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GrdRequirements" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered"
                            HeaderStyle-CssClass="navbar-default" AllowPaging="True" OnPageIndexChanging="GrdRequirements_PageIndexChanging"
                            EmptyDataText="No Documents Available" PagerStyle-Wrap="true" PagerStyle-CssClass="grdviewPagerStyle">
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
            <div id="DCUT" class="tab-pane fade">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GrdDCUT" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered"
                            HeaderStyle-CssClass="navbar-default" AllowPaging="True" OnPageIndexChanging="GrdDCUT_PageIndexChanging" EmptyDataText="No Documents Available" PagerStyle-CssClass="grdviewPagerStyle">
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
            <div id="Implementation" class="tab-pane fade">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GrdImplementation" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered"
                            HeaderStyle-CssClass="navbar-default" AllowPaging="True" OnPageIndexChanging="GrdImplementation_PageIndexChanging" EmptyDataText="No Documents Available" PagerStyle-CssClass="grdviewPagerStyle">
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
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GrdOthers" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered"
                            HeaderStyle-CssClass="navbar-default" AllowPaging="True" OnPageIndexChanging="GrdOthers_PageIndexChanging" EmptyDataText="No Documents Available" PagerStyle-CssClass="grdviewPagerStyle">
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
        </div>
    </div>
</asp:Content>
