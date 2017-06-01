using System;
using System.Xml;
using System.Drawing; 
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

namespace GWMPortal
{
    public partial class Polling : System.Web.UI.Page
    {
        int Count = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
           
          

        }

        protected void btnVote_Click(object sender, EventArgs e)
        {
            if (radVote.SelectedItem != null)
            {
                
                InsertVotes(radVote.SelectedItem.ToString());
            }
            else
            {
                lblStatus.ForeColor = Color.Red;
                lblStatus.Text = "Please select at least one option to vote for poll";
            }
        }

        protected void InsertVotes(string theVote)
        {
            try
            {
                XmlDocument xmldoc = new XmlDocument();
                xmldoc.Load(Server.MapPath("Votes.xml"));
                XmlElement parentelement = xmldoc.CreateElement("Vote");
                XmlElement votechoice = xmldoc.CreateElement("Choice");
                votechoice.InnerText = theVote;
                parentelement.AppendChild(votechoice);
                xmldoc.DocumentElement.AppendChild(parentelement);
                xmldoc.Save(Server.MapPath("Votes.xml"));
                lblStatus.ForeColor = Color.Green;
                lblStatus.Text = "Thank you for your vote.";
            }
            catch
            {
                lblStatus.Text = "Sorry, unable to process request. Please try again.";
            }
        }
        protected void readXML()
        {

            int mCount = 0;
            int iCount = 0;
            int gCount = 0;
            XmlTextReader xmlreader = new XmlTextReader(Server.MapPath("Votes.xml"));
            DataSet ds = new DataSet();
            ds.ReadXml(xmlreader);
            xmlreader.Close();
            if (ds.Tables.Count > 0)
            {
                int dscount = ds.Tables[0].Rows.Count;
                for (int i = 0; i < dscount; i++)
                {
                    if (ds.Tables[0].Rows[i][0].ToString() == "Mozilla")
                        mCount++;
                    else if (ds.Tables[0].Rows[i][0].ToString() == "Internet Explorer")
                        iCount++;
                    else if (ds.Tables[0].Rows[i][0].ToString() == "Google Chrome")
                        gCount++;
                }
                double theTotal;
                theTotal = mCount + iCount + gCount;
                double mPercent;
                double oPercent;
                double gPercent;
                mPercent = (mCount / theTotal) * 100;
                oPercent = (iCount / theTotal) * 100;
                gPercent = (gCount / theTotal) * 100;
                double totalpercentage = mPercent + oPercent + gPercent;
                string[] votescount = { mCount.ToString(), iCount.ToString(), gCount.ToString() };
                string[] array = { mPercent.ToString(), oPercent.ToString(), gPercent.ToString() };
                DataTable dt = new DataTable();
                dt.Columns.Add("OPTION_NAME");
                dt.Columns.Add("VOTES");
                dt.Columns.Add("PERCENTAGE");
                int count = radVote.Items.Count;
                Count = count + 1;
                for (int i = 0; i < count; i++)
                {
                    dt.Rows.Add();
                    dt.Rows[i]["OPTION_NAME"] = radVote.Items[i].ToString();
                    dt.Rows[i]["VOTES"] = votescount[i];
                    dt.Rows[i]["PERCENTAGE"] = array[i];
                }
                dt.Rows.Add("Total", theTotal, totalpercentage);
                gvResult.DataSource = dt;
                gvResult.DataBind();
            }
            else
            {
                gvResult.DataSource = null;
                gvResult.DataBind();
            }
        }

        protected void butResults_Click(object sender, EventArgs e)
        {
            readXML();
        }
        int cnt = 0;
        protected void gvResult_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                cnt++;
                Label lblpercent = (Label)e.Row.FindControl("lblpercentage");
                HtmlTable tblpercent = (HtmlTable)e.Row.FindControl("tblBar");
                tblpercent.Width = lblpercent.Text + "%";
                if (lblpercent.Text == "0")
                {
                    tblpercent.Visible = false;
                }
                if (cnt == Count)
                {
                    e.Row.CssClass = "TablePollResultFoot";
                }
            }
            foreach (TableCell tc in e.Row.Cells)
            {
                tc.Attributes["style"] = "border-color:#CCCCCC";
            }

        }

    }
}
