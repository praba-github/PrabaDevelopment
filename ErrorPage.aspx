<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/GWMMaster.Master"
    CodeBehind="ErrorPage.aspx.cs" Inherits="GWMPortal.ErrorPage" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container">
        <table border="0">
            <tr>
                <td style="width: 50%; vertical-align: top; padding-right: 30px">
                    <h1 style="color: #4e4e4e">
                        GWM Portal - Exception Details!</h1>
                    <div>
                        <div style="text-align: left">
                            <img alt="" src="Bootstrap/ui/images/Exception.jpg" />
                        </div>
                        <h2 style="color: #4e4e4e;">
                            Error Description!</h2>
                        <div style="text-align: left">
                            <br />
                            <p style="color: Red; font-weight: bolder;">
                                <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
                            </p>
                        </div>
                    </div>
                    <br />
                    <div>
                        <p style="font-size: small;">
                            Please contact <a style="text-decoration: underline;" href="mailto:Anish.Ravindran@rbc.com">
                                Anish Ravindran</a> or <a style="text-decoration: underline;" href="mailto:Annadurai.Prabakaran@rbc.com">
                                    Prabakaran Annadurai</a> for technical support!, if still having problem
                            to access the portal.</p>
                        <p style="font-size: small;">
                            You can refer the Log file in your application folder for more details.</p>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
