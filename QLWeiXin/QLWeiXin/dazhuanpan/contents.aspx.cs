using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Data;
using System.Text;
using System.Security.Cryptography;

namespace QLWeiXin.dazhuanpan
{
    public partial class content : System.Web.UI.Page
    {
        public string awards;

        protected void Page_Load(object sender, EventArgs e)
        {
            Random rd = new Random();
            int rdnum= rd.Next(65,98);
            this.hidd.Text = rdnum.ToString();
            awards = Request.QueryString["awards"].ToString();
            this.proContent.Text = awards;
            this.Title = "我的匹配指数是" + rdnum + "%";

            set1();

            this.signature.Text = gettict();

        }


        /// <summary>
        /// DateTime时间格式转换为Unix时间戳格式
        /// </summary>
        /// <param name=”time”></param>
        /// <returns></returns>
        private int ConvertDateTimeInt(System.DateTime time)
        {
            System.DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new System.DateTime(1970, 1, 1));
            return (int)(time - startTime).TotalSeconds;
        }

        /// <summary>
        /// 获取微信分享nonceStr和timestamp参数的值
        /// </summary>
        private void set1()
        {
            //timestamp
            this.timestamp.Text = ConvertDateTimeInt(DateTime.Now).ToString();
            //nonceStr
            this.straa.Text = "ss" + DateTime.Now.ToString("yyMMddhhmmssff");
        }

        /// <summary>
        /// 获取微信分享signature参数的值
        /// </summary>
        /// <returns></returns>
        private string gettict()
        {
            WebClient wc = new WebClient();

            Stream myStream = wc.OpenRead("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wxa0e7d758fa3dbcf1&secret=fe230256d7889dc8f6c4c14669599598");

            StreamReader sr = new StreamReader(myStream);

            String sLine = sr.ReadToEnd();


            string access_token = sLine.Split(',')[0].Split(':')[1].Substring(1, sLine.Split(',')[0].Split(':')[1].Length - 2);


            wc.Dispose();


            string url2 = string.Format("https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token={0}&type=jsapi", access_token);


            Stream myStream2 = wc.OpenRead(url2);

            StreamReader sr2 = new StreamReader(myStream2);

            String sLine2 = sr2.ReadToEnd();


            string access_token1 = sLine2.Split(',')[2].Split(':')[1].Substring(1, sLine2.Split(',')[2].Split(':')[1].Length - 2);


            string string1 = string.Format("jsapi_ticket={0}&noncestr={1}&timestamp={2}&url=http://www.zglsjy.com/item/dazhuanpan/contents.aspx?awards={3}", access_token1, this.straa.Text, this.timestamp.Text, awards);


            this.toke.Text = string1;

            // string string2 = "jsapi_ticket=sM4AOVdWfPE4DxkXGEs8VMCPGGVi4C3VM0P37wVUCFvkVAy_90u5h9nbSlYy3-Sl-HhTdfl2fzFy1AOcHKP7qg&noncestr=Wm3WZYTPz0wzccnW&timestamp=1414587457&url=http://mp.weixin.qq.com?params=value";
            return SHA1_Hash(string1);

        }

        /// <summary>
        /// 对微信分享的string1字符串参数SHA1加密
        /// </summary>
        /// <param name="str_sha1_in"></param>
        /// <returns></returns>
        static public string SHA1_Hash(string str_sha1_in)
        {
            SHA1 sha1 = new SHA1CryptoServiceProvider();
            byte[] bytes_sha1_in = UTF8Encoding.Default.GetBytes(str_sha1_in);
            byte[] bytes_sha1_out = sha1.ComputeHash(bytes_sha1_in);
            string str_sha1_out = BitConverter.ToString(bytes_sha1_out);
            str_sha1_out = str_sha1_out.Replace("-", "").ToLower();
            return str_sha1_out;
        }
    }
}