using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Data;
using System.Xml;
using System.Net;
using System.Text.RegularExpressions;

namespace QLWeiXin
{
    public partial class api1 : System.Web.UI.Page
    {
        public string url;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["echostr"]))
            {
                Response.Write(Request.QueryString["echostr"].ToString());
            }

            Stream st = Request.InputStream;

            StreamReader sr = new StreamReader(st, Encoding.GetEncoding("UTF-8"));

            String xmlStr = sr.ReadToEnd();

            //String xmlStr = "<xml><ToUserName><![CDATA[gh_ebadac17e778]]></ToUserName><FromUserName><![CDATA[oNx-us4oY2oZ9pNm8zInVhF8kOoY]]></FromUserName><CreateTime>1439378339</CreateTime><MsgType><![CDATA[event]]></MsgType><Event><![CDATA[CLICK]]></Event><EventKey><![CDATA[play]]></EventKey></xml>";
            WriteLog("weixin", xmlStr);
            if (!string.IsNullOrEmpty(xmlStr))
            {
                string bb = deXML(xmlStr);
                Response.Write(bb);
            }


        }
        private string deXML(string xmldate)
        {
            DataSet ds = ConvertXMLToDataSet(xmldate);


            /////////////////////////////////////////////////绿色家园//////////////////////////////////////////
            if (ds.Tables[0].Rows[0][0].ToString() == "gh_ebadac17e778")
            {
                if (ds.Tables[0].Rows[0][3].ToString() == "text" && ds.Tables[0].Rows[0][4].ToString().Trim() == "测试")
                {

                    return string.Format("<xml><ToUserName><![CDATA[{0}]]></ToUserName><FromUserName><![CDATA[{1}]]></FromUserName><CreateTime>20140814</CreateTime><MsgType><![CDATA[news]]></MsgType><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[克拉水果恋人大转盘]]></Title> <Description><![CDATA[点击进入详情页面]]></Description><PicUrl><![CDATA[http://www.zglsjy.com/item/dazhuanpan/2.jpg]]></PicUrl><Url><![CDATA[http://www.zglsjy.com/item/dazhuanpan/index.aspx?uid=" + ds.Tables[0].Rows[0][1].ToString() + "]]></Url></item></Articles></xml>", ds.Tables[0].Rows[0][1].ToString(), ds.Tables[0].Rows[0][0].ToString());
                }
                if (ds.Tables[0].Rows[0][4].ToString() == "CLICK" && ds.Tables[0].Rows[0][5].ToString().Trim() == "play")
                {

                    return string.Format("<xml><ToUserName><![CDATA[{0}]]></ToUserName><FromUserName><![CDATA[{1}]]></FromUserName><CreateTime>20140814</CreateTime><MsgType><![CDATA[news]]></MsgType><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[克拉水果恋人大转盘]]></Title> <Description><![CDATA[点击进入详情页面]]></Description><PicUrl><![CDATA[http://www.zglsjy.com/item/dazhuanpan/2.jpg]]></PicUrl><Url><![CDATA[http://www.zglsjy.com/item/dazhuanpan/index.aspx]]></Url></item></Articles></xml>", ds.Tables[0].Rows[0][1].ToString(), ds.Tables[0].Rows[0][0].ToString());
                }

            }

            

            return "";
            //return string.Format("<xml><ToUserName><![CDATA[{0}]]></ToUserName><FromUserName><![CDATA[{1}]]></FromUserName><CreateTime>1406201760</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[您好，抱歉周末暂时无客服回复。因为消息24小时后我们将无法回复，烦请您周一重新回复微信，我们会第一时间解答您的问题。谢谢您的谅解~]]></Content></xml>", ds.Tables[0].Rows[0][1].ToString(), ds.Tables[0].Rows[0][0].ToString());
        }
        public string xml(string cityName)
        {
            WebClient wc = new WebClient();
            url = "http://api.map.baidu.com/telematics/v3/weather?location=" + cityName + "&output=xml&ak=4cd1159aeca678076305724404e4bf88";
            //  wc.OpenReadAsync(new Uri(url));
            Stream myStream = wc.OpenRead(url);
            StreamReader sr = new StreamReader(myStream);
            String sLine = sr.ReadToEnd();
            return sLine;

        }
        public string returnXml(string url)
        {
            WebClient wc = new WebClient();
            //  wc.OpenReadAsync(new Uri(url));
            Stream myStream = wc.OpenRead(url);
            StreamReader sr = new StreamReader(myStream);
            String sLine = sr.ReadToEnd();
            return sLine;

        }
        public DataSet GetDataSetByXml(string xmlData)
        {
            try
            {
                DataSet ds = new DataSet();

                using (StringReader xmlSR = new StringReader(xmlData))
                {

                    ds.ReadXml(xmlSR, XmlReadMode.InferTypedSchema);
                    if (ds.Tables.Count > 0)
                    {
                        return ds;
                    }
                }
                return null;
            }
            catch (Exception)
            {
                return null;
            }
        }
        /// <summary>
        /// xml转ds1
        /// </summary>
        /// <param name="xmlData"></param>
        /// <returns></returns>
        public DataSet ConvertXMLToDataSet(string xmlData)
        {
            StringReader stream = null;
            XmlTextReader reader = null;
            try
            {
                DataSet xmlDS = new DataSet();
                stream = new StringReader(xmlData);
                reader = new XmlTextReader(stream);
                xmlDS.ReadXml(reader);
                return xmlDS;
            }
            catch (Exception ex)
            {
                WriteLog("ConvertXMLToDataSet", ex.Message);
                return null;
            }
            finally
            {
                if (reader != null)
                    reader.Close();
            }
        }
        /// <summary>
        /// xml转ds2
        /// </summary>
        /// <param name="xmlFile"></param>
        /// <returns></returns>
        public static DataSet ConvertXMLFileToDataSet(string xmlFile)
        {
            StringReader stream = null;
            XmlTextReader reader = null;
            try
            {
                XmlDocument xmld = new XmlDocument();
                xmld.Load(xmlFile);

                DataSet xmlDS = new DataSet();
                stream = new StringReader(xmld.InnerXml);
                //从stream装载到XmlTextReader
                reader = new XmlTextReader(stream);
                xmlDS.ReadXml(reader);
                //xmlDS.ReadXml(xmlFile);
                return xmlDS;
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (reader != null) reader.Close();
            }
        }



        public static void WriteLog(string txtName, string message)
        {

            try
            {
                string path = System.AppDomain.CurrentDomain.BaseDirectory + @"log\";
                //string path = Server.MapPath(@"log/");
                string fileName = string.Format("{0}{1}_{2}.txt", path, txtName, DateTime.Now.ToString("yyyyMMdd"));

                StringBuilder sb = new StringBuilder();




                sb.Append(string.Format("{0}", DateTime.Now.ToString() + ":" + message));

                sb.Append(string.Format("\r\n"));
                if (!Directory.Exists(path)) // 目录不存在则建立
                    Directory.CreateDirectory(path);

                File.AppendAllText(fileName, sb.ToString());
            }
            catch (Exception)
            {

            }
        }
        public static void WriteUserInfo(string txtName, string message)
        {

            try
            {
                string path = System.AppDomain.CurrentDomain.BaseDirectory + @"UserInfo\";
                //string path = Server.MapPath(@"log/");
                string fileName = string.Format("{0}{1}_{2}.txt", path, txtName, DateTime.Now.ToString("yyyyMMdd"));

                StringBuilder sb = new StringBuilder();




                sb.Append(string.Format("{0}", DateTime.Now.ToString() + "\t" + message));

                sb.Append(string.Format("\r\n"));
                if (!Directory.Exists(path)) // 目录不存在则建立
                    Directory.CreateDirectory(path);

                File.AppendAllText(fileName, sb.ToString());
            }
            catch (Exception)
            {

            }
        }
        public string sendUrl(string url)
        {
            WebClient wc = new WebClient();



            //  wc.OpenReadAsync(new Uri(url));




            Stream myStream = wc.OpenRead(url);

            StreamReader sr = new StreamReader(myStream);

            String sLine = sr.ReadToEnd();
            return sLine;
        }
        public string[] jsonToDatatable(string result)
        {
            result = result.Substring(1, result.Length - 2);
            result = result.Replace("\"", "");
            string[] big = result.Split(',');
            string[] subscribe = big[0].Split(':');
            string[] openid = big[1].Split(':');
            string[] nickname = big[2].Split(':');
            string[] sex = big[3].Split(':');
            string[] language = big[4].Split(':');
            string[] city = big[5].Split(':');
            string[] province = big[6].Split(':');
            string[] country = big[7].Split(':');
            string[] headimgurl = big[8].Split(':');
            string[] subscribe_time = big[9].Split(':');
            string[] resultArr = new string[10];
            resultArr[0] = "是";
            resultArr[1] = openid[1];
            resultArr[2] = nickname[1];
            if (sex[1] == "1")
            {
                resultArr[3] = "男";
            }
            else if (sex[1] == "2")
            {
                resultArr[3] = "女";
            }
            else
            {
                resultArr[3] = "未知";
            }
            resultArr[4] = city[1];
            resultArr[5] = province[1];
            resultArr[6] = country[1];
            resultArr[7] = headimgurl[1] + ":" + headimgurl[2];
            resultArr[7] = resultArr[7].Replace("\\", "");
            resultArr[8] = subscribe_time[1];
            resultArr[9] = language[1];
            return resultArr;
        }

    }
}