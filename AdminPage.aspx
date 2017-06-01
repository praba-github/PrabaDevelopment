<%@ Page Language="C#" MasterPageFile="~/GWMMaster.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="GWMPortal.AdminPage" EnableEventValidation="false" EnableViewStateMac="false" ViewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1" ID="Content1">
    <div style="align-content: center">
        <table align="center" class="table" width="100%">
            <tr>
                <td valign="top" align="center" style="text-align: center;">
                    <fieldset>
                        <legend><span class="text-primary btn-lg"></span>Latest Documents</legend>
                        <%-- <asp:Panel ID="pnlGrid" CssClass="panel" runat="server" Width="1400px">--%>
                        <div>
                            <div id="Reference" class="tab-pane fade in active" align="center">
                                <asp:GridView ID="grdDocuments" runat="server" CellPadding="15" CssClass="table table-striped table-bordered table-condensed"
                                    CellSpacing="15" AllowPaging="True" HeaderStyle-HorizontalAlign="left" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"  GridLines="None" ForeColor="#333333" DataKeyNames="DocumentId" EmptyDataText="No documents for review">
                                    <AlternatingRowStyle BackColor="White"  />
                                    <RowStyle HorizontalAlign="Left"></RowStyle>

                                    <Columns>
                                        <asp:BoundField DataField="DocumentId" HeaderText="DocumentId" SortExpression="DocumentId" ReadOnly="True" Visible="false" />
                                        <asp:BoundField DataField="DocumentName" HeaderText="Document Name" SortExpression="DocumentName" />
                                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                        <asp:BoundField DataField="UploadedBy" HeaderText="Submitted By" SortExpression="UploadedBy" />
                                        <%--    <asp:BoundField DataField="UploadFile" HeaderText="UploadFile" SortExpression="UploadFile" />--%>
                                       <%-- <asp:BoundField DataField="Emailid" DataFormatString="<a href=mailto:{0}>{0}</a>" HtmlEncodeFormatString="false"
                                            HeaderText="Email ID" SortExpression="EmailId" />--%>
                                        <asp:HyperLinkField DataTextField="EmailId" DataNavigateUrlFields="EmailId,DocumentName" DataTextFormatString="<a href='mailto:{0}?Subject=Attn:GWM Portal Document Submitted'>{0}</a>" HeaderText="Email ID" SortExpression="EmailId" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="statuss" Text="Approve" runat="server"
                                                    NavigateUrl='<%# GetUrl(Eval("DocumentId"),Eval("DocumentName"),Eval("Description"))%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="True" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="DeleteButton" runat="server" ImageUrl="~/Images/Icons/Delete.png"
                                                    CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this Document?');"
                                                    AlternateText="Delete" Width="25px" ToolTip="Delete" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkDownload" Text="Download" ToolTip="Download" CommandArgument='<%#Eval("UploadFile") %>' runat="server" OnClick="DownloadFile"><img src="Images/Icons/Download.png" width="25px"  alt="download" /></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <%-- <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />--%>
                                </asp:GridView>
                            </div>
                        </div>
                        <%--   </asp:Panel>--%>
                    </fieldset>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GWMPortalDatabase %>" SelectCommand="sp_Get_DocsToApprove" DeleteCommand="sp_Document_Deletion" DeleteCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="DocumentId" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
