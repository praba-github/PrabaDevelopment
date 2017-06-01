using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.UI.DataVisualization.Charting;

namespace GWMPortal
{
    public partial class GWMPortalHome : System.Web.UI.Page
    {
        //Variable Declarations
        string UserName;
        DataAccess data = new DataAccess();
        /// <summary>
        /// Page Load Events
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                UserName = Page.User.Identity.Name.ToString();
                lblTotalHitCount.Text = Application["NoOfVisitors"].ToString();
                if (!IsPostBack)
                {
                    GetAllUpcomingEvents();
                    GetAllDocuments();
                    GetQuestionOfDay();                    
                }
                GetCIIScore();
            }
            catch (Exception ex)
            {
                ErrorLog.CreateLogFile(ex, DateTime.Now.ToString());
                Session["Errors"] = ex;
                Response.Redirect("~/ErrorPage.aspx", true);               
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public void GetAllUpcomingEvents()
        {
            try
            {
                //Upcoming Events
                GrdEvents.DataSource = data.GetAllEvents();
                GrdEvents.DataBind();
            }
            catch (Exception ex)
            {
                ErrorLog.CreateLogFile(ex, DateTime.Now.ToString());
                Session["Errors"] = ex;
                Response.Redirect("~/ErrorPage.aspx", true);                  
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public void GetCIIScore()
        {
            try
            {
                DataSet ds = new DataSet();
                ds = data.GetCIIScore();
                DataRowCollection _projCIIIndex = ds.Tables[0].Rows;
                DataRowCollection _actCIIIndex = ds.Tables[1].Rows;
                //Chart1.Series["Series1"].Points.DataBindXY(new String[] { "Jan", "Feb", "Mar" }, new Int32[] { 8,16,0});
                //Chart1.Series["Series1"].Points.DataBind(_projCIIIndex, "Month", "Value", String.Empty);
                //Chart1.Series["Series2"].Points.DataBind(_actCIIIndex, "Month", "Value", String.Empty);

                //Chart1.Series["Series1"].ChartType = SeriesChartType.Line;
                //Chart1.Series["Series1"].IsValueShownAsLabel = true;
                ////Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
                //Chart1.ChartAreas["ChartArea1"].AxisX.IsMarginVisible = true;
                //Chart1.Series["Series1"]["ShowMarkerLines"] = "True";
            }
            catch (Exception ex)
            {
                ErrorLog.CreateLogFile(ex, DateTime.Now.ToString());
                Session["Errors"] = ex;
                Response.Redirect("~/ErrorPage.aspx", true);  
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public void GetAllDocuments()
        {
            try
            {
                GrdDocuments.DataSource = data.GetAllDocuments();
                GrdDocuments.DataBind();                
            }
            catch (Exception ex)
            {
                ErrorLog.CreateLogFile(ex, DateTime.Now.ToString());
                Session["Errors"] = ex;
                Response.Redirect("~/ErrorPage.aspx", true);  
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public void GetQuestionOfDay()
        {
            try
            {

                DataSet dsQuestions = new DataSet();
                DataTable dtTodays = new DataTable();
                DataTable dtYesterdays = new DataTable();
                string todaysDate = DateTime.Today.ToString("yyyy/MM/dd");
                string correctAnswer;
                dsQuestions = data.GetQuestionDetails(todaysDate, UserName.ToString());

                if (dsQuestions.Tables[0].Rows.Count > 0)
                {
                    //Todays Answers
                    lblQuestion.Text = dsQuestions.Tables[0].Rows[0][0].ToString();
                    hdnQuestionID.Value = dsQuestions.Tables[0].Rows[0][5].ToString();
                    dtTodays.Columns.Add("TodaysAnswer", typeof(string));
                    dtTodays.Rows.Add(dsQuestions.Tables[0].Rows[0]["Answer_A"]);
                    dtTodays.Rows.Add(dsQuestions.Tables[0].Rows[0]["Answer_B"]);
                    dtTodays.Rows.Add(dsQuestions.Tables[0].Rows[0]["Answer_C"]);
                    dtTodays.Rows.Add(dsQuestions.Tables[0].Rows[0]["Answer_D"]);
                    rblAnswers.DataTextField = "TodaysAnswer";
                    rblAnswers.DataValueField = "TodaysAnswer";
                    rblAnswers.DataSource = dtTodays;
                    rblAnswers.DataBind();
                }
                if (dsQuestions.Tables[1].Rows.Count > 0)
                {
                    //Yesterdays Answers
                    lblYesterdayQuestion.Text = dsQuestions.Tables[1].Rows[0][0].ToString();
                    dtYesterdays.Columns.Add("YesterdaysAnswer", typeof(string));
                    dtYesterdays.Rows.Add(dsQuestions.Tables[1].Rows[0]["Answer_A"]);
                    dtYesterdays.Rows.Add(dsQuestions.Tables[1].Rows[0]["Answer_B"]);
                    dtYesterdays.Rows.Add(dsQuestions.Tables[1].Rows[0]["Answer_C"]);
                    dtYesterdays.Rows.Add(dsQuestions.Tables[1].Rows[0]["Answer_D"]);
                    correctAnswer = dsQuestions.Tables[1].Rows[0][5].ToString();
                    rblYesterdayAnswers.DataTextField = "YesterdaysAnswer";
                    rblYesterdayAnswers.DataValueField = "YesterdaysAnswer";
                    rblYesterdayAnswers.DataSource = dtYesterdays;
                    rblYesterdayAnswers.DataBind();
                    // Selected Item
                    int count = rblYesterdayAnswers.Items.Count;
                    for (int ansCount = 0; ansCount < count; ansCount++)
                    {
                        if (rblYesterdayAnswers.Items[ansCount].Text.Equals(correctAnswer))
                        {
                            rblYesterdayAnswers.SelectedIndex = ansCount;
                        }
                    }
                }

                //Disable Submit button, if already submitted
                string alreadySubmitted;
                if (dsQuestions.Tables[2].Rows.Count > 0)
                {
                    alreadySubmitted = dsQuestions.Tables[2].Rows[0][0].ToString();
                    if (alreadySubmitted == "Yes")
                    {
                        btnSubmit.Enabled = false;
                        lblQuestionStatus.Text = "Already answered for the day! Thank you";
                    }
                    else
                    {
                        btnSubmit.Enabled = true;
                    }
                }
            }
            catch (Exception ex)
            {
                ErrorLog.CreateLogFile(ex, DateTime.Now.ToString());
                Session["Errors"] = ex;
                Response.Redirect("~/ErrorPage.aspx", true);  
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                QuestionOfDay questions = new QuestionOfDay();
                questions.QuestionID = hdnQuestionID.Value.ToString();
                questions.Question = lblQuestion.Text;
                questions.SubmittedUser = Page.User.Identity.Name.ToString();
                questions.SubmittedAnswer = rblAnswers.SelectedItem.Value.ToString();
                questions.CorrectAnswer = rblAnswers.SelectedItem.Value.ToString();
                questions.CreatedBy = UserName.ToString();
                data.InsertAnswers(questions);
                btnSubmit.Enabled = false;
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
               