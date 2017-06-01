using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using GWMPortal.Common;
using System.Net;
using System.IO;
using System.Configuration;

namespace GWMPortal
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userName = Page.User.Identity.Name.ToString();
            string admin = ConfigurationManager.AppSettings["AdminUsers"];
            string[] stringArray = admin.Split(';');
            int position = Array.IndexOf(stringArray, userName);
            if (position > -1)
            {
                //Do Nothing
            }
            else
            {
                Response.Redirect("GWMPortalHome.aspx");
            }
        }
        //admin can download the document
        protected void DownloadFile(object sender, EventArgs e)
        {
            
            string filePath = (sender as LinkButton).CommandArgument;
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();

        }
        public string GetUrl(object id, object DocumentName, object Description)
        {
            string url = ConfigurationManager.AppSettings["NavigationUrl"] + "DocumentID=" + id.ToString() + "&DocumentName=" + Server.UrlEncode(DocumentName.ToString()) + "&Description=" + Server.UrlEncode(Description.ToString());
            return url;
        }

        
    }
}

        
  
