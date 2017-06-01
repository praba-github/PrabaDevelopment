<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/GWMMaster.Master"
    CodeBehind="ReferDocuments.aspx.cs" Inherits="GWMPortal.ReferDocuments" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
<script language="javascript" type="text/javascript">
    $('.nav.navbar-nav > li').on('click', function() {
//    $(this).addClass('bg-success');
    //$(this).siblings().removeClass('bg-success');
    });
</script>
    <div style="margin: 10px 0px 0px 15px;">
        <ul class="nav nav-pills nav-stackeds">
            <li class="active" id="limain"><a data-toggle="tab" href="#Reference" style="width:150px">Requirements</a></li>
            <li><a data-toggle="tab" href="#Templates" style="width:150px">Design</a></li>
            <li><a data-toggle="tab" href="#Templates" style="width:150px">Testing</a></li>
            <li><a data-toggle="tab" href="#Templates" style="width:150px">Implementation</a></li>
            <li><a data-toggle="tab" href="#Others" style="width:150px">Domain Group</a></li>
             <li><a data-toggle="tab" href="#Others" style="width:150px">T&I Group</a></li>
        </ul>
        <div class="tab-content">
            <div id="Reference" class="tab-pane fade in active">
                <asp:GridView ID="GrdDocuments" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered"
                    HeaderStyle-CssClass="navbar-default" AllowPaging="True"                     
                    onpageindexchanging="GrdDocuments_PageIndexChanging">
                    <Columns>
                        <asp:BoundField HeaderText="Document Ref" DataField="id" 
                            HeaderStyle-Width="150" >
<HeaderStyle Width="150px"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Name" DataField="Name" />
                        <asp:BoundField HeaderText="Description" DataField="Description" />
                        <asp:HyperLinkField HeaderText="URL" DataTextField="URLName" DataNavigateUrlFields="URL"
                            Target="_blank" />
                    </Columns>

<HeaderStyle CssClass="navbar-default"></HeaderStyle>
                </asp:GridView>
            </div>
            <div id="Templates" class="tab-pane fade">
                <asp:GridView ID="GrdTemplates" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered"
                    HeaderStyle-CssClass="navbar-default" AllowPaging="True"                     
                    onpageindexchanging="GrdTemplates_PageIndexChanging">
                    <Columns>
                        <asp:BoundField HeaderText="Document Ref" DataField="id" />
                        <asp:BoundField HeaderText="Name" DataField="Name" />
                        <asp:BoundField HeaderText="Description" DataField="Description" />
                        <asp:HyperLinkField HeaderText="URL" DataTextField="URLName" DataNavigateUrlFields="URL"
                            Target="_blank" />
                    </Columns>
                </asp:GridView>
            </div>
            <div id="Others" class="tab-pane fade">
                <h4>
                    In progress
                </h4>
            </div>
        </div>
    </div>
</asp:Content>
