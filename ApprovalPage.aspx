<%@ Page Language="C#" MasterPageFile="~/GWMMaster.Master" AutoEventWireup="true" CodeBehind="ApprovalPage.aspx.cs" Inherits="GWMPortal.ApprovalPage" EnableEventValidation="false" %>

<asp:Content runat="server" ID="content2" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="form-group">
        <table class="table" align="center" border="0" style="width: 70%">
            <thead>
                <tr align="center">
                    <td colspan="3" class="text-primary btn-lg">Document Approval</td>
                </tr>
            </thead>
            <tr style="height:30px">
                <td colspan="3"><asp:Label runat="server" id="lblMessage" CssClass="alert-success"></asp:Label></td>
            </tr>
            <tr class="hidden">
                <td>
                    <asp:Label runat="server">Document Id</asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="DocumentId" ReadOnly="true" CssClass="form-control"></asp:TextBox></td>
                <td></td>
            </tr>
            <tr>
                <td style="width: 150px">
                    <asp:Label runat="server">Document Name</asp:Label></td>
                <td style="width: 450px">
                    <asp:TextBox runat="server" ID="DocumentName" TabIndex="1" placeholder="Document Name" Width="350px" CssClass="form-control"></asp:TextBox></td>
                <td style="width: 250px">
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="DocumentName" ForeColor="Red" ErrorMessage="Please specify document Name" Text="Please specify document Name"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server">Description</asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="Description" TabIndex="2"  placeholder="Document Description" Width="350px" CssClass="form-control"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Description" ForeColor="Red" ErrorMessage="Please provide document description" Text="Please provide document description"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server">Category</asp:Label></td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <td>
                            <asp:DropDownList ID="ddlCategory" runat="server" TabIndex="3"  AutoPostBack="true" OnSelectedIndexChanged="ddlcategory_changed" Width="200px" CssClass="form-control">
                            </asp:DropDownList>
                        </td>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server">SubCategory</asp:Label></td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <td>
                            <asp:DropDownList ID="ddlSubCategory" TabIndex="4" runat="server" Width="200px" CssClass="form-control">
                            </asp:DropDownList>
                        </td>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <td></td>
            </tr>
            <tr class="hidden">
                <td>
                    <asp:Label runat="server" Visible="false">Document Url Name</asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="DocumentUrlName" placeholder="Specify Document URL Name" Visible="false"></asp:TextBox></td>
            </tr>
            <tr class="hidden">
                <td>
                    <asp:Label runat="server" Visible="false">Document Url</asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="DocumentUrl" placeholder="Specify the Document Url" Visible="false"></asp:TextBox></td>
                <td></td>
            </tr>
            <tr class="hidden">
                <td colspan="3"></td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <asp:Button class="btn bg-primary" TabIndex="5"  runat="server" Text="Approve" OnClick="Approve_Click" ID="btnApprove" />
                </td>
            </tr>
            <tr class="hidden">
                <td colspan="3" class="auto-style1"></td>
            </tr>
        </table>
    </div>
</asp:Content>
