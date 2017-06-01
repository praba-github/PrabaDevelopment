<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/GWMMaster.Master"
    CodeBehind="ContactUs.aspx.cs" Inherits="GWMPortal.ContactUs" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <table class="table table-condensed" width="60%" border="0" style="text-align: left;
        margin: 10px 0px 0px 0px">
        <tr class="btn-lg">
            <th style="width: 20%">
                Name
            </th>
            <th style="width: 30%">
                Email
            </th>
            <th style="width: 40%">
                Phone
            </th>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <b>Technology & Innovation Team</b>
            </td>
        </tr>
        <tr class="active">
            <td>
                Anish Ravindran
            </td>
            <!--modified-->
            <td>
                <span class="glyphicon glyphicon-envelope"></span> 
                 <span><a href="mailto:anish.ravindran@rbc.com?Subject=GWMPortal%20query" target="_top">Anish.Ravindran@rbc.com</a></span>
            </td>
            <td>
                <span class="glyphicon glyphicon-phone"></span>&nbsp;+91 80 4104 2993
            </td>
            <td>
                <img alt="" class="img-thumbnail" src="Images/Team/Anish.jpg" width="100" />
            </td>
        </tr>
        <tr class="active">
            <td>
                Prabakaran Annadurai 
            </td>
            <!--modified-->
            <td>
                <span class="glyphicon glyphicon-envelope"></span> 
                <span><a href="mailto:annadurai.prabakaran@rbc.com?Subject=GWMPortal%20query" target="_top">Annadurai.Prabakaran@rbc.com</a></span>
            </td>
            <td>
                <span class="glyphicon glyphicon-phone"></span>&nbsp;+91 80 4104 1714
            </td>
            <td>
                <img alt="" class="img-thumbnail" src="Images/Team/Prabakar.png" width="100" />
            </td>
        </tr>
        <!--added-->
          <tr class="active">
            <td>
               Meena Gude
            </td>
              
            <td>
                <span class="glyphicon glyphicon-envelope"></span> 
                 <span><a href="mailto:meena.gude@rbc.com?Subject=GWMPortal%20query" target="_top">Meena.Gude@rbc.com</a></span>
            </td>
            <td>
                <span class="glyphicon glyphicon-phone"></span>&nbsp;+91 80 4104 1713
            </td>
            <td>
                <img alt="" class="img-thumbnail" src="Images/Team/Meena.Jpg" width="100" />
            </td>
        </tr>
        <!--end-->
        <tr>
            <td colspan="3">
                <b>Consulting Group</b>
            </td>
        </tr>
        <tr class="active">
            <td>
                Prashant Singh
            </td>
            <!--modified-->
            <td>
                <span class="glyphicon glyphicon-envelope"></span> 
                <span><a href="mailto:prashant.singh@rbc.com?Subject=GWMPortal%20query" target="_top">Prashant.Singh@rbc.com</a></span>
            </td>
            <td>
                <span class="glyphicon glyphicon-phone"></span>&nbsp;+91 80 4104 2986
            </td>
            <td>
                <img alt="" class="img-thumbnail" src="Images/Team/Prashant.jpg" width="100" />
            </td>
        </tr>
        <tr class="active">
            <td>
                Prince Rathinasamy 
            </td>
            <!--modified-->
            <td>
                <span class="glyphicon glyphicon-envelope"></span> 
                <span><a href="mailto:prince.rathinasamy@rbc.com?Subject=GWMPortal%20query" target="_top">Prince.Rathinasamy@rbc.com</a></span>
            </td>
            <td>
                <span class="glyphicon glyphicon-phone"></span>&nbsp;+91 80 4104 2972
            </td>
            <td>
                <img alt="" class="img-thumbnail" src="Images/Team/Prince.jpg" width="100" />
            </td>
        </tr>
         <tr class="active">
            <td>
                Rubin Chandrakanthan 
            </td>
            <td><span class="glyphicon glyphicon-envelope"></span> 
                 <span><a href="mailto:rubin.chandrakanthan@rbc.com?Subject=GWMPortal%20query" target="_top">Rubin.Chandrakanthan@rbc.com</a></span>
                
            </td>
            <td>
                <span class="glyphicon glyphicon-phone"></span>&nbsp;+91 80 4104 1770
            </td>
            <td>
                <img alt="" class="img-thumbnail" src="Images/Team/Rubin.jpg" width="100" />
            </td>
        </tr>
    </table>
</asp:Content>
