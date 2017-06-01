using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.DirectoryServices;
using System.DirectoryServices.AccountManagement;

namespace GWMPortal
{
    public partial class GWMMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           try
            {
                lblLoggedInUserName.Text = Page.User.Identity.Name.ToString();
                //String loginID = Page.User.Identity.Name.Replace("PINE\\", String.Empty);
                lblCurrentDate.Text = DateTime.Now.ToLongDateString();

                //UserPrincipal userPrincipal = UserPrincipal.Current;
                //lblLoggedInUserName.Text = userPrincipal.DisplayName;

                //using (DirectoryEntry de = new DirectoryEntry(ConfigurationManager.AppSettings["LDAP"], ConfigurationManager.AppSettings["LDAPUserName"], ConfigurationManager.AppSettings["LDAPKey"]))
                //{
                //    using (DirectorySearcher adSearch = new DirectorySearcher(de))
                //    {
                //        adSearch.Filter = "(sAMAccountName=" + loginID + ")";
                //        adSearch.PropertiesToLoad.Add("givenName");
                //        adSearch.PropertiesToLoad.Add("sn");

                //        SearchResult adSearchResult = adSearch.FindOne();
                //        lblLoggedInUserName.Text = adSearchResult.Properties["givenName"][0].ToString() + " " + adSearchResult.Properties["sn"][0].ToString();
                //    }
                //}

                string admin = ConfigurationManager.AppSettings["AdminUsers"];
                string[] stringArray = admin.Split(';');
                int position = Array.IndexOf(stringArray, lblLoggedInUserName.Text);
                if (position > -1)
                {
                   // adminlink.Visible = true;
                   // eventlink.Visible = true;
                    adminMenu.Visible = true;
                }
                else
                {
                   // adminlink.Visible = false;
                    //eventlink.Visible = false;
                    adminMenu.Visible = false;
                }
                
            }
            catch (Exception ex)
            {
                ErrorLog.CreateLogFile(ex, DateTime.Now.ToString());
                Session["Errors"] = ex;
                Response.Redirect("~/ErrorPage.aspx", true);                  
            }
        }
    }
}
