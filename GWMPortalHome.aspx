<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/GWMMaster.Master"
    CodeBehind="GWMPortalHome.aspx.cs" Inherits="GWMPortal.GWMPortalHome" Title="GWM Portal" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GWMPortal Home</title>
    <!-- Bootstrap core CSS -->
    <%--<link href="../Test/css/bootstrap.min.css" rel="stylesheet" />--%>

    <script src="Bootstrap/ui/js/jquery-1.9.1.min.js"></script>

    <script src="Bootstrap/ui/js/bootstrap.min.js"></script>

    <script src="Bootstrap/ui/js/docs.min.js"></script>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->

    <script src="Bootstrap/ui/js/ie10-viewport-bug-workaround.js"></script>

    <!-- jssor slider scripts-->
    <!-- use jssor.js + jssor.slider.js instead for development -->
    <!-- jssor.slider.mini.js = (jssor.js + jssor.slider.js) -->

    <script type="text/javascript" src="Bootstrap/ui/js/jssor.slider.mini.js"></script>

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>

    <script type="text/javascript">
        jQuery(document).ready(function($) {
            var options = {
                $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlaySteps: 1,                                  //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
                $AutoPlayInterval: 2000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 1,                                   //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideEasing: $JssorEasing$.$EaseOutQuint,          //[Optional] Specifies easing for right to left animation, default value is $JssorEasing$.$EaseOutQuad
                $SlideDuration: 800,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
                //$SlideWidth: 600,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
                //$SlideHeight: 300,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                $SlideSpacing: 0, 					                //[Optional] Space between each slide in pixels, default value is 0
                $DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                $DragOrientation: 1,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

                $ArrowNavigatorOptions: {                           //[Optional] Options to specify and enable arrow navigator or not
                    $Class: $JssorArrowNavigator$,                  //[Requried] Class to create arrow navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 2,                                 //[Optional] Auto center arrows in parent container, 0 No, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                    $Scale: false                                   //Scales bullets navigator or not while slider scale
                },

                $BulletNavigatorOptions: {                                //[Optional] Options to specify and enable navigator or not
                    $Class: $JssorBulletNavigator$,                       //[Required] Class to create navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 1,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                    $Lanes: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
                    $SpacingX: 12,                                   //[Optional] Horizontal space between each item in pixel, default value is 0
                    $SpacingY: 4,                                   //[Optional] Vertical space between each item in pixel, default value is 0
                    $Orientation: 1,                                //[Optional] The orientation of the navigator, 1 horizontal, 2 vertical, default value is 1
                    $Scale: false                                   //Scales bullets navigator or not while slider scale
                }
            };

            // Assign Images from XML data source         
            var xmlDoc = loadXMLDoc("Bootstrap/xml/CurrentTrends.xml");
            var images = xmlDoc.getElementsByTagName('Ad');
            var len = images.length;
            var ua = window.navigator.userAgent
            var msie = ua.indexOf("MSIE ")
            var hrefvalue = null;
            var imgsrc = null;

            //alert(len);
            for (var i = 0; i < len; i++) {
                //alert('test');
                var img = document.createElement('img');
                if (msie < 0) {
                    imgsrc = images[i].getElementsByTagName('ImageUrl')[0].textContent;
                    hrefvalue = images[i].getElementsByTagName('NavigateUrl')[0].textContent
                }
                else {
                    imgsrc = images[i].getElementsByTagName('ImageUrl')[0].nodeTypedValue;
                    hrefvalue = images[i].getElementsByTagName('NavigateUrl')[0].nodeTypedValue
                }
                //debugger;
                //alert(images[i].getElementsByTagName('ImageUrl')[0].innerText);
                var src = imgsrc.replace('~/', '');
                img.setAttribute("src", src);
                var href = "'" + hrefvalue + "'"
                //alert(href)
                var uImg = "image";
                var hash = "#";
                var clickURL = "window.open(" + href + ");";
                $("#divContainer").append("<div><a href=" + hash + " onclick=" + clickURL + "><img u=" + uImg + " src=" + src + " /></a></div>");
            }

            //Make the element 'slider1_container' visible before initialize jssor slider.
            $("#slider1_container").css("display", "block");
            var jssor_slider1 = new $JssorSlider$("slider1_container", options);

            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizes
            function ScaleSlider() {
                var parentWidth = jssor_slider1.$Elmt.parentNode.clientWidth;
                if (parentWidth) {
                    jssor_slider1.$ScaleWidth(parentWidth - 30);
                }
                else
                    window.setTimeout(ScaleSlider, 30);
            }
            ScaleSlider();

            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            //responsive code end

            // Call XML file data (Images)
            // Load xml data here
            function loadXMLDoc(filename) {
                if (window.XMLHttpRequest) {
                    xhttp = new XMLHttpRequest();
                } else { // code for IE5 and IE6
                    xhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xhttp.open("GET", filename, false);
                xhttp.send();
                return xhttp.responseXML;
            }
        });
        //Guage Chart

        google.load("visualization", "1", { packages: ["gauge"] });
        google.setOnLoadCallback(drawChart);
        function drawChart() {

            var data = google.visualization.arrayToDataTable([
          ['Label', 'Value'],
          ['Trained (%)', 63],
          ['Certified (%)', 49]
        ]);

            var options = {
                width: 500, height: 150, 
//                yellowFrom: 70, yellowTo: 85,
                greenFrom: 70, greenTo: 100,
                minorTicks: 5
            };
            //alert("hai");
            var chart = new google.visualization.Gauge(document.getElementById('chart_div'));

            chart.draw(data, options);

            //            setInterval(function() {
            //                data.setValue(0, 1, 40 + Math.round(60 * Math.random()));
            //                chart.draw(data, options);
            //            }, 13000);
            //            setInterval(function() {
            //                data.setValue(1, 1, 40 + Math.round(60 * Math.random()));
            //                chart.draw(data, options);
            //            }, 5000);
            //            setInterval(function() {
            //                data.setValue(2, 1, 60 + Math.round(20 * Math.random()));
            //                chart.draw(data, options);
            //            }, 26000);
        }
    </script>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <table width="100%;" style="margin-top: 3px;" cellpadding="0" cellspacing="0" border="0">
            <colgroup>
                <col width="23%" />
                <col width="3%" />
                <col width="48%" />
                <col width="3%" />
                <col width="23%" />
            </colgroup>
            <tr style="margin-left: 30px;">
                <td valign="top" align="center" style="text-align: center; width: 23%;">
                    <table>
                        <tr>
                            <td valign="top" align="center" style="text-align: center;">
                                <%--    <p style="font-family: Tahoma; font-weight: bold; font-size: 1.2em; text-align: center;
                                margin: 2px 0px 0px 5px; color: #3090C7;">
                                Upcoming Events</p>--%>
                                <div style="margin-left: 5px;">
                                    <fieldset>
                                        <legend>Events</legend>
                                        <asp:GridView ID="GrdEvents" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered"
                                            HeaderStyle-CssClass="navbar-default" Font-Size="Smaller">
                                            <Columns>
                                                <asp:BoundField HeaderText="Event Name" DataField="EventName" ItemStyle-HorizontalAlign="Left" />
                                                <asp:BoundField HeaderText="Date" DataField="DateFrom" DataFormatString="{0:dd/MMM/yyyy}"
                                                    ItemStyle-HorizontalAlign="Left" />
                                            </Columns>
                                        </asp:GridView>
                                    </fieldset>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="center" style="text-align: center;">
                                <%--   <p style="font-family: Tahoma; font-weight: bold; font-size: 1.2em; text-align: center;
                                margin: 2px 0px 0px 5px; color: #3090C7;">
                                CII Score
                            </p>--%>
                                <div>
                                    
                                    <fieldset>
                                        <legend>KM Maturity Score</legend>
                                        <img alt="KMScore" src="Bootstrap/ui/images/KMScore.png" style="width: 300px; height: 250px;" />
                                       <%-- <asp:Chart ID="Chart1" runat="server" BackColor="lightgray" BackGradientStyle="TopBottom"
                                            Width="300px" Height="260px">
                                            <BorderSkin SkinStyle="Emboss" />
                                            <Series>
                                                <asp:Series BorderColor="180, 26, 59, 105" BorderWidth="3" ChartArea="ChartArea1"
                                                    ChartType="Line" Color="220, 65, 140, 240" IsValueShownAsLabel="True" MarkerSize="8"
                                                    MarkerStyle="Circle" Name="Series1" ShadowColor="#6698FF" ShadowOffset="0" XValueType="Time"
                                                    YValueType="Int32">
                                                </asp:Series>
                                                <asp:Series BorderColor="180, 26, 59, 105" BorderWidth="3" ChartArea="ChartArea1"
                                                    ChartType="Line" Color="120, 60, 10, 20" IsValueShownAsLabel="True" MarkerSize="8"
                                                    MarkerStyle="Circle" Name="Series2" ShadowColor="#6698FF" ShadowOffset="2" XValueType="Time"
                                                    YValueType="Int32">
                                                </asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea BackColor="OldLace" BackGradientStyle="TopBottom" BackSecondaryColor="White"
                                                    BorderColor="64, 64, 64, 64" BorderDashStyle="Solid" Name="ChartArea1" ShadowColor="Transparent">
                                                    <AxisY LineColor="64, 64, 64, 64" Title="CII Index">
                                                        <MajorGrid LineColor="64, 64, 64, 64" />
                                                        <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                    </AxisY>
                                                    <AxisX LineColor="64, 64, 64, 64" Title="Month">
                                                        <MajorGrid LineColor="64, 64, 64, 64" />
                                                        <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                    </AxisX>
                                                    <Area3DStyle Inclination="40" IsRightAngleAxes="False" LightStyle="Realistic" Perspective="9"
                                                        Rotation="25" WallWidth="3" />
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>--%>
                                    </fieldset>
                                </div>
                                <br />
                                <!--
                            Training Chart-->
                                <div align="center">
                                    <fieldset>
                                        <legend>WM Training</legend></fieldset>
                                        <div id="chart_div" style="width: 300px; height: 120px;">
                                        </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign="top" align="center" style="text-align: center; width: 3%;">
                </td>
                <td valign="top" align="center" style="text-align: center; width: 50%">
                    <table border="0">
                        <tr>
                            <td valign="top" align="center" style="text-align: center;">
                                <fieldset>
                                    <legend>Current Trends & Latest Updates</legend>
                                    <div class="container" style="width: 600px">
                                        <!-- Jssor Slider Begin -->
                                        <!-- To move inline styles to css file/block, please specify a class name for each element. -->
                                        <!-- ================================================== -->
                                        <div id="slider1_container" style="display: none; position: relative; margin: 0 auto;
                                            width: 580px; height: 285px; overflow: hidden;">
                                            <!-- Loading Screen -->
                                            <div u="loading" style="position: absolute; top: 0px; left: 0px;">
                                                <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block;
                                                    background-color: #000; top: 0px; left: 0px; width: 50%; height: 50%;">
                                                </div>
                                                <div style="position: absolute; display: block; background: url(../images/loading.gif) no-repeat center center;
                                                    top: 0px; left: 0px; width: 50%; height: 50%;">
                                                </div>
                                            </div>
                                            <!-- Slides Container -->
                                            <div id="divContainer" u="slides" style="cursor: move; position: absolute; left: 0px;
                                                top: 0px; width: 575px; height: 280px; overflow: hidden;">
                                                <%-- <div>
                                                <a href="#" onclick="window.open('http://www.asp.net/web-api');">
                                                    <img u="image" src="Images/CurrentTrends/ASP.NetWebAPI.jpg" width="550" height="275" /></a>
                                            </div>
                                            <div>
                                                <a href="#" onclick="window.open('http://www.europeanbusinessreview.eu/dossier.asp?cid=27');">
                                                    <img u="image" src="Images/CurrentTrends/Greece.jpg" width="550" height="275" /></a>
                                            </div>--%>
                                            </div>
                                            <!--#region Bullet Navigator Skin Begin -->
                                            <style type="text/css">
                                                .jssorb05
                                                {
                                                    position: absolute;
                                                }
                                                .jssorb05 div, .jssorb05 div:hover, .jssorb05 .av
                                                {
                                                    position: absolute; /* size of bullet elment */
                                                    width: 16px;
                                                    height: 16px;
                                                    background: url(       'Bootstrap/ui/images/b05.png' ) no-repeat;
                                                    overflow: hidden;
                                                    cursor: pointer;
                                                }
                                                .jssorb05 div
                                                {
                                                    background-position: -7px -7px;
                                                }
                                                .jssorb05 div:hover, .jssorb05 .av:hover
                                                {
                                                    background-position: -37px -7px;
                                                }
                                                .jssorb05 .av
                                                {
                                                    background-position: -67px -7px;
                                                }
                                                .jssorb05 .dn, .jssorb05 .dn:hover
                                                {
                                                    background-position: -97px -7px;
                                                }
                                            </style>
                                            <!-- bullet navigator container -->
                                            <div u="navigator" class="jssorb05" style="bottom: 16px; right: 6px;">
                                                <!-- bullet navigator item prototype -->
                                                <div u="prototype">
                                                </div>
                                            </div>
                                            <!--#endregion Bullet Navigator Skin End -->
                                            <!--#region Arrow Navigator Skin Begin -->
                                            <!-- Help: http://www.jssor.com/development/slider-with-arrow-navigator-jquery.html -->
                                            <style type="text/css">
                                                .jssora11l, .jssora11r
                                                {
                                                    display: block;
                                                    position: absolute; /* size of arrow element */
                                                    width: 37px;
                                                    height: 37px;
                                                    cursor: pointer;
                                                    background: url(       'Bootstrap/ui/images/a11.png' ) no-repeat;
                                                    overflow: hidden;
                                                }
                                                .jssora11l
                                                {
                                                    background-position: -11px -41px;
                                                }
                                                .jssora11r
                                                {
                                                    background-position: -71px -41px;
                                                }
                                                .jssora11l:hover
                                                {
                                                    background-position: -131px -41px;
                                                }
                                                .jssora11r:hover
                                                {
                                                    background-position: -191px -41px;
                                                }
                                                .jssora11l.jssora11ldn
                                                {
                                                    background-position: -251px -41px;
                                                }
                                                .jssora11r.jssora11rdn
                                                {
                                                    background-position: -311px -41px;
                                                }
                                            </style>
                                            <!-- Arrow Left -->
                                            <span u="arrowleft" class="jssora11l" style="top: 123px; left: 8px;"></span>
                                            <!-- Arrow Right -->
                                            <span u="arrowright" class="jssora11r" style="top: 123px; right: 8px;"></span>
                                            <!--#endregion Arrow Navigator Skin End -->
                                            <a style="display: none" href="http://www.jssor.com">Bootstrap Slider</a>
                                        </div>
                                        <!-- Jssor Slider End -->
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="center" style="text-align: center;">
                                <fieldset>
                                    <legend>Latest Documents</legend>
                                    <div class="tab-content">
                                        <div id="Reference" class="tab-pane fade in active">
                                            <asp:GridView ID="GrdDocuments" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered"
                                                HeaderStyle-CssClass="navbar-default" Font-Size="Small" RowStyle-HorizontalAlign="Left">
                                                <Columns>
                                                    <asp:BoundField HeaderText="Ref ID" DataField="id" HeaderStyle-Width="80" />
                                                    <asp:BoundField HeaderText="Name" DataField="Name" />
                                                    <asp:BoundField HeaderText="Published Date" DataField="CreatedOn" DataFormatString="{0:dd/MMM/yyyy}" />
                                                    <asp:BoundField HeaderText="Description" DataField="Description" />
                                                    <asp:HyperLinkField HeaderText="URL" DataTextField="URLName" DataNavigateUrlFields="URL"
                                                        Target="_blank" />
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <%--<div id="Templates" class="tab-pane fade" style="height: 180px;">
                                        <asp:GridView ID="GrdTemplates" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered"
                                            HeaderStyle-CssClass="navbar-default">
                                            <Columns>
                                                <asp:BoundField HeaderText="Ref ID" DataField="id" />
                                                <asp:BoundField HeaderText="Name" DataField="Name" />
                                                <asp:BoundField HeaderText="Description" DataField="Description" />
                                                <asp:HyperLinkField HeaderText="URL" DataTextField="URLName" DataNavigateUrlFields="URL"
                                                    Target="_blank" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                    <div id="Others" class="tab-pane fade" style="height: 180px; width: 560px;">
                                        <asp:GridView ID="GrdOthers" AutoGenerateColumns="false" runat="server" CssClass="table  table-bordered"
                                            HeaderStyle-CssClass="navbar-default">
                                            <Columns>
                                                <asp:BoundField HeaderText="Ref ID" DataField="id" />
                                                <asp:BoundField HeaderText="Name" DataField="Name" />
                                                <asp:BoundField HeaderText="Description" DataField="Description" />
                                                <asp:HyperLinkField HeaderText="URL" DataTextField="URLName" DataNavigateUrlFields="URL"
                                                    Target="_blank" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>--%>
                                    </div>
                                </fieldset>
                                <%--  </div>--%>
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign="top" align="center" style="text-align: center; width: 3%;">
                </td>
                <td valign="top" align="right" style="text-align: center; width: 26%;">
                    <table>
                        <tr>
                            <td valign="top" align="right" style="text-align: center;">
                                <%--<p style="font-family: Tahoma; font-weight: bold; font-size: 1.2em; text-align: center;
                                margin: 2px 0px 0px 5px; color: #3090C7;">
                                Question of the Day</p>--%>
                                <div style="margin-left: 5px;">
                                    <fieldset>
                                        <legend>Question of the day</legend>
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <asp:Panel ID="Panel1" CssClass="PanelContent" runat="server">
                                                    <asp:Label ID="lblQuestion" Text="Text" CssClass="PanelContent" runat="server"></asp:Label><br />
                                                    <asp:RadioButtonList ID="rblAnswers" RepeatDirection="Vertical" CssClass="PanelRadioText"
                                                        runat="server">
                                                    </asp:RadioButtonList>
                                                    <div align="center">
                                                        <asp:Button ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" CssClass="PanelButtonText"
                                                            runat="server" />
                                                    </div>
                                                    <asp:Label ID="lblQuestionStatus" CssClass="text-danger" runat="server"></asp:Label>
                                                    <asp:HiddenField ID="hdnQuestionID" runat="server" Visible="false" />
                                                </asp:Panel>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </fieldset>
                                    <br />
                                    <fieldset>
                                        <legend>Answer</legend>
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                            <ContentTemplate>
                                                <asp:Panel ID="Panel2" CssClass="PanelContent" runat="server">
                                                    <asp:Label ID="lblYesterdayQuestion" CssClass="PanelContent" Text="Text" runat="server"></asp:Label><br />
                                                    <asp:RadioButtonList ID="rblYesterdayAnswers" CssClass="PanelRadioText" runat="server"
                                                        Enabled="false">
                                                    </asp:RadioButtonList>
                                                    <asp:HiddenField ID="hdnYesdayQuestion" runat="server" Visible="false" />
                                                </asp:Panel>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </fieldset>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="right" style="text-align: center;">
                                <%--<p style="font-family: Tahoma; font-weight: bold; font-size: 1.2em; text-align: center;
                                margin: 2px 5px 0px 0px; color: #3090C7;">
                                Gallery</p>--%>
                                <div style="margin-left: 5px;">
                                    <div>
                                        <asp:Timer ID="Timer1" Interval="5000" runat="server">
                                        </asp:Timer>
                                        <fieldset>
                                            <legend>Gallery</legend>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                                </Triggers>
                                                <ContentTemplate>
                                                    <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/Bootstrap/xml/Gallery.xml"
                                                        ImageUrlField="ImageUrl" NavigateUrlField="NavigateUrl" AlternateTextField="AlternateText"
                                                        Style="position: relative" Target="_blank" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </fieldset>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <hr />
    <div align="center">
        <div class="text-info">
            <table border="0">
                <tr>
                    <td align="left" style="padding-right: 30px">
                        Copyrights @2015 IGATE All rights reserved! (Best Resolution IE8.0 or above/Chrome)
                    </td>
                    <td align="right" style="padding-left: 30px;visibility:hidden">
                        Total Visitors:
                        <asp:Label ID="lblTotalHitCount" runat="server" Text="Label1"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
