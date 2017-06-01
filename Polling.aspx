<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .ButtonStyle
        {
            background-color: #9EBEDE;
            color: Black;
            font-family: verdana;
            font-size: 8pt;
        }
        .BarStyle
        {
            background-color: #996633;
        }
        .TablePollResultFoot
        {
            background-color: #B0C4DE;
            font-weight: bold;
            height: 30px;
            font-size: 13px;
        }
        .gridview
        {
            border: solid 1px #CCCCCC;
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="border: 1px solid #9EBEDE" align="center" cellpadding="0" cellspacing="0"
            width="100%">
            <tr>
                <td align="left">
                    <b><span style="color: #FF6600">Online Poll Example with XML </span></b>
                </td>
            </tr>
            <tr>
                <td height="10px">
                </td>
            </tr>
            <tr>
                <td>
                    <b>which one is best browser?</b>
                </td>
            </tr>
            <tr>
                <td height="5px">
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:RadioButtonList ID="rblAnswers" RepeatDirection="Vertical" runat="server">
                    </asp:RadioButtonList>
                    <asp:RadioButtonList ID="radVote" runat="server">
                        <asp:ListItem>Mozilla</asp:ListItem>
                        <asp:ListItem>Internet Explorer</asp:ListItem>
                        <asp:ListItem>Google Chrome</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnVote" runat="server" Text="Vote" OnClick="btnVote_Click" CssClass="ButtonStyle" />
                    <asp:Button ID="btnResult" runat="server" Text="Reult" CssClass="ButtonStyle" OnClick="btnResult_Click" />
                    <br />
                    <asp:Label ID="lblStatus" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:GridView runat="server" ID="gvResult" BackColor="White" CellPadding="4" EnableModelValidation="True"
                        AutoGenerateColumns="false" OnRowDataBound="gvResult_RowDataBound" EmptyDataText="No one submit votes">
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <HeaderStyle BackColor="#4682B4" Font-Bold="True" ForeColor="#FFFFCC" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <Columns>
                            <asp:TemplateField HeaderText="Options" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="20%">
                                <ItemTemplate>
                                    <asp:Label ID="lblOptions" runat="server" Text='<%#Bind("OPTION_NAME") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Votes" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="10%">
                                <ItemTemplate>
                                    <asp:Label ID="lblVotes" runat="server" Text='<%#Bind("VOTES") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="%" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="15%">
                                <ItemTemplate>
                                    <asp:Label ID="lblpercentage" runat="server" Text='<%#Bind("PERCENTAGE","{0:f2}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Bar" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="55%">
                                <ItemTemplate>
                                    <table runat="server" id="tblBar">
                                        <tr class="BarStyle">
                                            <td height="8px">
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
