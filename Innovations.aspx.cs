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
using System.Xml.Xsl;
using System.Xml.XPath;
using System.IO;

namespace GWMPortal
{
    public partial class Innovations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                XPathDocument document = new XPathDocument(Server.MapPath(@"./Bootstrap/xml/Solutions.xml"));
                XslCompiledTransform transform = new XslCompiledTransform();
                StringWriter sw = new StringWriter();
                transform.Load(Server.MapPath(@"./Bootstrap/xml/Solutions.xsl"));
                transform.Transform(document, null, sw);
                lblSolutions.Text = sw.ToString();

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
