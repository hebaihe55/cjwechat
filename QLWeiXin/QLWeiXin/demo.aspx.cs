using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Text;
using System.Data;
using System.Text.RegularExpressions;

namespace QLWeiXin
{
    public partial class demo : System.Web.UI.Page
    {
        DataTable dt1;
        protected void Page_Load(object sender, EventArgs e)
        {


            /*
            string BaidujsonGet = publicClass.requestGet("http://api.map.baidu.com/geosearch/v3/nearby?ak=wZPaui15nEeP3nDlFTaBckSl&geotable_id=111944&location=121.42407510639893,31.23608370022221&radius=2000000&sortby=distance:1");
            BaidujsonGet = BaidujsonGet.Replace(" ", "");
            BaidujsonGet = BaidujsonGet.Replace("{", "*");
            BaidujsonGet = BaidujsonGet.Replace(",", "*");
            BaidujsonGet = BaidujsonGet.Replace("}", "*");
            BaidujsonGet = BaidujsonGet.Replace("[", "*");
            BaidujsonGet = BaidujsonGet.Replace("]", "*");
            BaidujsonGet = BaidujsonGet.Replace(":", "*");
            BaidujsonGet = BaidujsonGet.Replace("\"", "*");
            BaidujsonGet = BaidujsonGet.Replace("***", "*");
            BaidujsonGet = BaidujsonGet.Replace("**", "*");
            string[] BaiduJsonGet = BaidujsonGet.Split('*');
            Response.Write(BaiduJsonGet[31].ToString() + BaiduJsonGet[29].ToString());

            */
            
        }
        protected string RequestUrl(string url, string value)
        {
            //建立WebRequest对象，url目标地址
            HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);

            string s = value;

            //将LoginInfo转换为byte[]格式，这里的LoginInfo应该是你要传输的数据
            byte[] requestBytes = System.Text.Encoding.ASCII.GetBytes(s);

            //设置请求为POST方式,
            req.Method = "POST";

            //设置请求类型
            req.ContentType = "application/x-www-form-urlencoded";

            //请求发送的数据长度, 这里就很清楚了，请求数据是从LoginInfo转换来的
            //前面的代码byte[] requestBytes = System.Text.Encoding.ASCII.GetBytes(LoginInfo);
            req.ContentLength = requestBytes.Length;

            //建立请求的输入流
            Stream requestStream = req.GetRequestStream();

            //从requestBytes中读取数据到输入流中
            requestStream.Write(requestBytes, 0, requestBytes.Length);

            //关闭输入流
            requestStream.Close();

            //获取响应对象
            HttpWebResponse res = (HttpWebResponse)req.GetResponse();

            //获取服务器返回流
            StreamReader sr = new StreamReader(res.GetResponseStream(), System.Text.Encoding.UTF8);

            //读取返回流数据，并赋值给backstr 
            string backstr = sr.ReadToEnd();

            //页面输出line???? 应该是backstr 吧
            return backstr;

            //关闭* 2, 不解释了
            sr.Close();
            res.Close();

        }

        /// <summary>
        /// 将json转换为DataTable
        /// </summary>
        /// <param name="strJson">得到的json</param>
        /// <returns></returns>
        public static DataTable JsonToDataTable(string strJson)
        {
            //转换json格式
            strJson = strJson.Replace(",\"", "*\"").Replace("\":", "\"#").ToString();
            //取出表名   
            var rg = new Regex(@"(?<={)[^:]+(?=:\[)", RegexOptions.IgnoreCase);
            string strName = rg.Match(strJson).Value;
            DataTable tb = null;
            //去除表名   
            strJson = strJson.Substring(strJson.IndexOf("[") + 1);
            strJson = strJson.Substring(0, strJson.IndexOf("]"));

            //获取数据   
            rg = new Regex(@"(?<={)[^}]+(?=})");
            MatchCollection mc = rg.Matches(strJson);
            for (int i = 0; i < mc.Count; i++)
            {
                string strRow = mc[i].Value;
                string[] strRows = strRow.Split('*');

                //创建表   
                if (tb == null)
                {
                    tb = new DataTable();
                    tb.TableName = strName;
                    foreach (string str in strRows)
                    {
                        var dc = new DataColumn();
                        string[] strCell = str.Split('#');

                        if (strCell[0].Substring(0, 1) == "\"")
                        {
                            int a = strCell[0].Length;
                            dc.ColumnName = strCell[0].Substring(1, a - 2);
                        }
                        else
                        {
                            dc.ColumnName = strCell[0];
                        }
                        tb.Columns.Add(dc);
                    }
                    tb.AcceptChanges();
                }

                //增加内容   
                DataRow dr = tb.NewRow();
                for (int r = 0; r < strRows.Length; r++)
                {
                    dr[r] = strRows[r].Split('#')[1].Trim().Replace("，", ",").Replace("：", ":").Replace("\"", "");
                }
                tb.Rows.Add(dr);
                tb.AcceptChanges();
            }

            return tb;
        }

        
    }
}