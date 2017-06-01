<%@ Page Language="C#" MasterPageFile="~/GWMMaster.Master" AutoEventWireup="true" CodeBehind="DocumentUpload.aspx.cs" Inherits="GWMPortal.DocumentUpload" EnableEventValidation="false" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div style="align-content: center" class="form-group">
        <table class="table" align="center" border="0" style="width: 70%">
            <thead>
                <tr align="center">
                    <td colspan="3" class="text-primary btn-lg">Document Upload Form</td>
                </tr>
            </thead>
            <tr style="height: 30px">
                <td colspan="3">
                    <asp:Label runat="server" ID="lblMessage" CssClass="alert-success"></asp:Label></td>
            </tr>

            <tr class="hidden">
                <td>
                    <asp:Label runat="server" Visible="false">Document Id</asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="DocumentId" ReadOnly="true" Visible="false"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 200px">
                    <asp:Label runat="server">Document Name</asp:Label></td>
                <td style="width: 450px">
                    <asp:TextBox runat="server" ID="DocumentName" placeholder="Document Name" CssClass="form-control" TabIndex="0" Width="350px"></asp:TextBox></td>
                <td style="width: 550px">
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="DocumentName" Text="Please provide the document name" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>

            <tr>
                <td>
                    <asp:Label runat="server">Description</asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="Description" PlaceHolder="Document description" Width="350px" CssClass="form-control"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Description" Text="Please provide the document description" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server">Upload File</asp:Label></td>
                <td>
                    <asp:FileUpload runat="server" ID="UploadFile" placeholder="Upload File" CssClass="form-control" Height="40px" Width="350px" /></td>
                <td>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UploadFile" ErrorMessage="Please upload the file" Text="Please select atleast one file" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="UploadFile" ErrorMessage="Filename should not contain special characters like @,!,&,#,$" Text="Filename should not contain special characters like @,!,&,#,$ and file extension should be .pdf,.pptx,.doc,.docx,.zip " ValidationExpression="^([a-zA-Z0-9\s_\\.\-:])+(.doc|.docx|.pdf|.pptx|.ppt|.zip)$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server">Email Id</asp:Label></td>
                <td>
                    <asp:TextBox runat="server" CssClass="form-control" ID="Email" placeholder="someone@rbc.com" Width="350px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" ErrorMessage="Please enter your RBC Email ID" Text="Please enter your RBC Email ID" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="Email" ErrorMessage="Please enter your rbc mail" Text="Please enter your rbc mail" ForeColor="Red" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([rbc.]+)\.([a-zA-Z]{2,5})$"></asp:RegularExpressionValidator> 
                </td>
            </tr>
            <%--<tr>
                <td colspan="2" align="center">
                    <asp:Button CssClass="btn bg-primary" runat="server" Style="margin-left: 100px" Text="Upload" OnClick="Upload_Click" ID="btnUpload" />

                </td>
            </tr>--%>
            <tr class="hidden">
                <td>
                    <asp:Label runat="server" Visible="false">Uploaded By</asp:Label></td>
                <td>
                    <asp:TextBox runat="server" CssClass="fa-underline" Font-Underline="true" ID="UploadedBy" Visible="false"></asp:TextBox></td>
            </tr>
            <tr class="hidden">
                <td colspan="3"></td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <asp:Button CssClass="btn bg-primary" runat="server" Style="margin-left: 100px" Text="Upload" OnClick="Upload_Click" ID="btnUpload" /></td>
                    <asp:Label ID="UploadStatusLabel" runat="server">
                    </asp:Label>
                 <td></td>

            </tr>
            <tr>
                <td colspan="3" align="center">
                    <asp:Button CssClass="btn bg-primary" runat="server" Style="margin-left: 100px" Text="Clear" OnClick="Clear_Click" ID="btnClear" /></td>
            </tr>
        </table>
    </div>
    <asp:HiddenField ID="success" runat="server" />
</asp:Content>
