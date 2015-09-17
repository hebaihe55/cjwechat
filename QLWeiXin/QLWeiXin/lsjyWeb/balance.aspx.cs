using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLWeiXin.Code;

namespace QLWeiXin.lsjyWeb
{
    public partial class balance : System.Web.UI.Page
    {
        userInfo uInfo = new userInfo();
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = Request.Url.OriginalString;

            if (Session["userInfo"] == null)
            {


                Response.Redirect("../login.aspx?url="+url);
            }

            uInfo = (userInfo)Session["userInfo"];

            if (!IsPostBack)
            {
              



                if (Request.QueryString["shopcar"] != null)
                {

                   

                    addcar(Request.QueryString["shopcar"].ToString());
                }


            setAddress();
            setZiTiDian();
            bindRP3();
            }

        }



        /// <summary>
        /// 添加到购物车
        /// </summary>
        /// <param name="stra"></param>
        private void addcar(string stra)
        {

            string[] aa = stra.Split(new string[] { "xxx" }, StringSplitOptions.RemoveEmptyEntries);

            foreach (string a in aa)
            {

                if (a != "")
                {

                    AddCar(a.Split(new string[] { "xx" }, StringSplitOptions.RemoveEmptyEntries)[1], uInfo.id, int.Parse(a.Split(new string[] { "xx" }, StringSplitOptions.RemoveEmptyEntries)[0]));
                
                
                }
            
            
            }

        
        
        }


        /// <summary>
        /// 添加到购物车
        /// </summary>
        /// <param name="goodid"></param>
        /// <param name="userid"></param>
        /// <param name="num"></param>

        private void AddCar(string goodid, string userid, int num)
        {


            Util.clearCart(userid);


            string url = "http://120.27.45.83:8085/api/Mall/AddGoodsToCart";






            string para = "goods_id=" + goodid + "&user_id=" + userid + "&goods_num=" + num.ToString();

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

        }










       /// <summary>
       /// 设置默认地址
       /// </summary>

        private void setAddress()
        {

            string url = "http://120.27.45.83:8082/api/Mall/getDefaultAddress";

            string para = "user_id=" + uInfo.id;


            if (Request.QueryString["addr10"] != null)
            {
                url = "http://120.27.45.83:8085/api/Mall/getAddressInfo";

                para = "key=" + Request.QueryString["addr10"].ToString();
            }


        

            resp resp = new resp();


            resp = QLWeiXin.Code.Util.GetResp(url, para);

            if (resp.code == 1000)
            {

                userAddress user = JsonHelper.DeserializeJsonToObject<userAddress>(resp.data.ToString());

                this.name.Text = user.name;

                this.mobile.Text = user.phone;

                if (user == null)
                {
                    this.address.Text = "请选择地址";
                    this.hf1.Value = "0";
                }
                else
                {
                    this.address.Text = user.area + user.address;
                    this.hf1.Value = user.id;
                }

            }


        }

        /// <summary>
        /// 设置默认自提点
        /// </summary>
        private void setZiTiDian()
        {


            if (Request.QueryString["macid"] != null)
            {

                this.Label1.Text = Request.QueryString["title"].ToString();

                this.goid.Value = Request.QueryString["macid"].ToString();

                this.machid.Value = Request.QueryString["macid"].ToString();
            }
            else
            { 
            
           


            string url = "http://120.27.45.83:8085/api/Mall/LBSAddressPost";






            string para = "address=" + "上海"; //this.address.Text;

            resp resp = new resp();

                


            resp = QLWeiXin.Code.Util.GetResp(url, para);

            List<ShopArea> shopArea2 = JsonHelper.DeserializeJsonToList<ShopArea>(JsonHelper.DeserializeJsonToObject < ShopArea1 > (resp.data.ToString()).list.ToString());




            this.Label1.Text = shopArea2[0].title;

            this.goid.Value = shopArea2[0].geotable_id;

            this.machid.Value = shopArea2[0].mch_id;

            }

        }



        /// <summary>
        /// 绑定购物车获取订单参数
        /// </summary>
        private void bindRP3()
        {



            List<shpCarList> shc = JsonHelper.DeserializeJsonToList < shpCarList >( Util.listCart(uInfo.id));


            this.Repeater1.DataSource = shc;

            this.Repeater1.DataBind();

            int count = 0;

            float total = 0.00F;

            string goodids = "";
            string goodnums = "";
            foreach (shpCarList sp in shc)
            {
                count += sp.num;
                total += float.Parse((sp.price * sp.num).ToString());
                goodids += sp.id+",";
                goodnums+= sp.num + ",";
                
            }



            this.goodid.Value = goodids.Trim(',');
            this.goodnum.Value = goodnums.Trim(',');
            Label2.Text = total.ToString();
        



        }


        /// <summary>
        /// 生成订单
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void bal_sub_Click(object sender, EventArgs e)
        {

            string paytype = "";

            if (this.payType.Value == "")
            {
                paytype = "微信";
            
            }

            string code = Util.createOrder(uInfo.id.ToString(), this.hf1.Value.ToString(), this.goid.Value.ToString(), paytype, "0", "门店自提", this.goodid.Value.ToString(), goodnum.Value, "无", DateTime.Now.AddDays(1).ToString(), this.machid.Value);

            if (code != "0")
            {

                string codeid = Util.getorderid(uInfo.id.ToString(), code);

                Response.Redirect("confirm.aspx?orderid=" + codeid);
            }
            else
            {

                Response.Write("<script>alert('订单创建失败');</script>");
            }

        }



    }
}