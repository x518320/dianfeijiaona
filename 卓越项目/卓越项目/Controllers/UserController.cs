using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using Aop.Api;
using Aop.Api.Request;
using Aop.Api.Response;
using Aop.Api.Domain;
using Aop.Api.Parser;
using Aop.Api.Util;
using 卓越项目.Models;
using System.Drawing;
using System.Collections.Specialized;

namespace 卓越项目.Controllers
{
    public class UserController : Controller
    {
        /// <summary>
        /// base64解析为图片并保存
        /// </summary>
        /// <param name="base64Str">base64字符串</param>
        /// <returns>成功（true）|| 失败（false）</returns>
       

      
       
        //
        // GET: /User/
        public DemoEntities demo = new DemoEntities();
        //首页
        public ActionResult Index()
        {
            
            Session["page"] = "主页";
            if (Session["id"] == null)
            {
                Session["login"] = "尊敬的用户您好，请先登录！";
                return View();
            }
            else
            {
                int id = int.Parse(Session["id"].ToString());
                var item = demo.User.Find(id);//找到用户
                Session["name"] = item.name;//姓名
                Session["touxiang"] = item.url;//头像


                //通过用户id找到房间
                var fang = demo.fang.FirstOrDefault(c => c.userid == id);
                //通过房间找到管理员
                var guan = demo.boss.Find(fang.bossid);

                //获取到房间上次缴费时间,如果和现在不再同一个月,就循环,一个月一个月的生成缴费记录

                DateTime scjf = DateTime.Parse(fang.datetiem.ToString());
                DateTime now = DateTime.Now;
                string sql2 = "select datediff(MONTH,'" + scjf.ToString() + "','" + now.ToString() + "')";
                var yue = demo.Database.SqlQuery<int>(sql2).ToList();
                int Iyue = yue.FirstOrDefault();
                //生成缴费记录
                if (Iyue > 0)
                {
                    for (int i = 0; i < Iyue; i++)
                    {
                        //判断账户是否有钱
                        if (item.money == 0)//没钱,就直接生成缴费记录
                        {
                            //更新缴费时间
                            DateTime scjfadd = scjf.AddMonths(i + 1);//加一个月
                            fang.datetiem = scjfadd;

                            order order = new order();
                            order.bossid = guan.id;
                            order.userid = item.id;
                            order.fangid = fang.id;
                            order.up = fang.dianliang;
                            order.now = fang.dianliang;
                            order.dianjia = guan.dianjia;
                            order.money = 0;
                            order.date = scjfadd;
                            demo.order.Add(order);
                            //更新上次缴费记录
                            fang.up = fang.dianliang;
                        }
                        else
                        {
                            DateTime scjf2 = DateTime.Parse(fang.datetiem.ToString());
                            DateTime scjfadd = scjf2.AddMonths(1);//加一个月

                            //算出多少分钟
                            string sql = "select datediff(MI,'" + scjf2.ToString() + "','" + scjfadd.ToString() + "')";
                            var mm = demo.Database.SqlQuery<int>(sql).ToList();
                            int ci = int.Parse(mm.FirstOrDefault().ToString()) / 1440;//循环次数
                            double num = 0;


                            //拿到两个时间的差值  单位分钟
                            for (int g = 0; g < ci; g++)
                            {
                                if (Math.Abs(Guid.NewGuid().GetHashCode() % 4) > 1)
                                {
                                    num += Math.Abs(Guid.NewGuid().GetHashCode() % 15);
                                    num += Math.Abs(Guid.NewGuid().GetHashCode() % 15);
                                    num += Math.Abs(Guid.NewGuid().GetHashCode() % 15);
                                    num += Math.Abs(Guid.NewGuid().GetHashCode() % 13);
                                    num += Math.Abs(Guid.NewGuid().GetHashCode() % 9);
                                    num += Math.Abs(Guid.NewGuid().GetHashCode() % 7);
                                }
                            }


                            //保留两位小数
                            string numDecimalStr3 = num.ToString("#0.00");
                            num = double.Parse(numDecimalStr3);


                            //扣除余额
                            //保留两位小数
                            double kou3 = num * (double)guan.dianjia;
                            string kouu3 = kou3.ToString("#0.00");


                            //生成缴费记录
                            order order = new order();
                            order.bossid = guan.id;
                            order.userid = item.id;
                            order.fangid = fang.id;
                            order.up = fang.dianliang;
                            order.date = scjfadd;
                            order.dianjia = guan.dianjia;
                            //如果金额小于0
                            if (item.money <= decimal.Parse(kouu3))
                            {
                                order.money = item.money;
                                item.money = 0;
                                //修改电量
                                decimal shengdian = (decimal)order.money / (decimal)guan.dianjia;
                                string strshengdian = shengdian.ToString("#0.00");
                                //将剩余电量加上去
                                fang.dianliang += decimal.Parse(strshengdian);
                                order.now = fang.dianliang;
                                //修改房间上次电表数
                                fang.up = order.now;
                            }
                            else
                            {
                                order.money = decimal.Parse(kouu3);
                                item.money -= decimal.Parse(kouu3);
                                //使用电量更新
                                fang.dianliang += (decimal)num;
                                order.now = fang.dianliang;
                                //修改房间上次电表数
                                fang.up = fang.dianliang;
                            }

                            demo.order.Add(order);

                            //上次缴费时间
                            fang.datetiem = scjfadd;
                        }

                        demo.SaveChanges();
                    }

                }
                //当月电费进行模拟
                DateTime dateTime = DateTime.Parse(item.findtime.ToString());
                string sql3 = "select datediff(MI,'" + dateTime.ToString() + "','" + now + "')";
                var mm3 = demo.Database.SqlQuery<int>(sql3).ToList();
                double num3 = double.Parse(mm3.FirstOrDefault().ToString());


                //拿到两个时间的差值  单位分钟
                int b = Math.Abs(Guid.NewGuid().GetHashCode() % 3) + 3;
                int bb = Math.Abs(Guid.NewGuid().GetHashCode() % 3) + 2;
                num3 = num3 * (b * 1.0 / 850) * bb * 1.0;

                //保留两位小数
                string numDecimalStr = num3.ToString("#0.00");
                num3 = double.Parse(numDecimalStr);

                //查询时间更新
                item.findtime = DateTime.Now;
                //登录时间更新
                item.time = DateTime.Now;
                //扣除余额
                //保留两位小数
                double kou = num3 * (double)guan.dianjia;
                string kouu = kou.ToString("#0.00");

                //如果金额小于0
                if (item.money < decimal.Parse(kouu))
                {
                    if (item.money == 0)//如果等于0
                    {

                    }
                    else
                    {
                        fang.dianliang += item.money / guan.dianjia;
                        item.money = 0;
                    }
                }
                else
                {
                    //使用电量更新
                    fang.dianliang += (decimal)num3;
                    //扣钱
                    item.money -= decimal.Parse(kouu);
                }
                demo.SaveChanges();





                //使用电量
                ViewBag.money = item.money;//余额
                ViewBag.nowdian = fang.dianliang - fang.up;//本月用电
                ViewBag.nowmoney = (fang.dianliang - fang.up) * guan.dianjia;

                //缴费记录
                string sql4 = "select * from [order] where userid=" + id;
                var orders= demo.Database.SqlQuery<order>(sql4).ToList();

                
                return View();
            }
        }
        //个人信息界面
        public ActionResult user(int id) {
            var fang = demo.fang.Where(c => c.userid == id).FirstOrDefault();
            ViewBag.fang = fang;
            var boss = demo.boss.Find(fang.bossid);
            ViewBag.boss = boss;
            
            return View(demo.User.Find(id));
        }

        //修改密码
        public ActionResult edit() {

            return View();
        }
        [HttpPost]
        public ActionResult editcheck(string pwd1,string pwd2) {
            var user = demo.User.Find( int.Parse(Session["id"].ToString()));
            if (user.pwd != pwd1)
            {
                return Content("1");//原密码错误
            }
            else {
                user.pwd = pwd2;
                demo.SaveChanges();
                return Content("2");//成功
            }
            
        }

        //缴费记录
        public ActionResult order(int PageSize = 12, int Page = 1) {
            int id = int.Parse(Session["id"].ToString());
            var Count = demo.order.Where(c=>c.userid==id).Count();
            var Size = Math.Ceiling(Count * 1.0 / PageSize);
            ViewBag.JfCount = Size;
            ViewBag.JfPage = Page;
            
            return View(demo.order.Where(c => c.userid == id).OrderByDescending(c => c.date).Skip((Page - 1) * PageSize).Take(PageSize).ToList());
        }

        //充值记录
        public ActionResult chongzhi(int PageSize = 13, int Page = 1) {
            int id = int.Parse(Session["id"].ToString());
            var item = demo.User.Find(id);
            ViewBag.money = item.money;
            var Count = demo.chongzhi.Where(c=>c.userid==id).Count();
            var Size = Math.Ceiling(Count * 1.0 / PageSize);
            ViewBag.CzCount = Size;
            ViewBag.CzPage = Page;
            return View(demo.chongzhi.Where(c => c.userid == id).OrderByDescending(c => c.date).Skip((Page - 1) * PageSize).Take(PageSize).ToList());
        }

        const string URL = "https://openapi.alipaydev.com/gateway.do";
        //支付宝正式环境 
        //https://openapi.alipaydev.com/gateway.do   
        //APPID即创建应用后生成,沙箱环境中的AppId
        const string APPID = "2021000120613581";
        //这里是我们之前用秘钥工具生成的商户私钥
        const string APP_PRIVATE_KEY = "MIIEowIBAAKCAQEAkpLAMeDR3SfVcohB0zGk8okzSa3+2RcL5jY3XKKwwxrdbr9Cu55WilFntBPRSShvXGtnochh37a05GhvAF5O6P/BbtdmUbcBH5jESS3qBM5cwBhBNql7p7edHIwk0HDTSEAqxFB/cIpplPpLb8Q0Mk5PG+Q0DnPjiLdCAjwGHiZVAqCwUZot9wp+CZyY5IoPGn4jpdVPRHQEonkb5qMxvmaUcqJaT02lOOLf73UITajflaFZZkW6fQwZ7NFXmek11X4RnA9mLMwUSITyU8KVUAEF/jiqxrTPDM05AX9YQKRTiV1CYWEdID3yX1S+Tx2iaDhzqR1RJCZOxJsadIvUJwIDAQABAoIBABvUJw+RSuc9d+Y9/pl1lIbEC+vSUE+xc33rD0nUTdFNWXt8btQmdPHgENt848CLH9GhRtTNsd+C1geD2IduYHcWkAhWd0POhjUUkTf/sq3k7HFAaalSNnsafob8CMVWlpbiL/yD+B5K+U7i0s3Op8ZhXd3CzytrT2kWuj6oXNT+UPBL2grHKd2CoyhbaWjVjoTu5HjorkMptZ5XTvCcNDiYtZafxsEDjnYlgVSF0gedM69VcImjDcbeUob/sJogHzzflgvpZ9xbvkMpoPGfwfYZFFLEEz0C7rZsSVxXMNCpKj/i9+do6UwGTVpi2YWxa2aFvcluECjI86VXTes7nskCgYEA73TMdFVwyfDopr3fXQYi04KZdyRdnkVXfmzmo/djGZm20AobFHu1970WwOjvDkfa2+na2JgKLPFtHf0hdryO0Izyz1KLb1u2Iq79j2dBuFYi1n0zFnjIelwMao9CSCIktFtSWg9+JgpXwiBQOngT3N/4dk6k5cUJ1X4p8hMcwK0CgYEAnLMnfVXG6URGfWNts0Yto6/P6BIuPUWjmIociJndtrr60RMuQz0RbHn3iu9AUqqTX3CU/A/PTjiFduY9Ooy64R4Fgpx6+mGAYUF5pBNvZ5ByZAL1M9T8nEJqcSbS+y2UXK8ozjl4IaIuAP6YytmCGx7Y7dZT7g89y2EWDTEIfqMCgYEAgOePaNDV9uAJXjm4lItJFDOqCck53InXn+dgAcSbRJzLHRNToKM4QjU4moDKsBVebCRn+1FdqPQOmaY67YB0ITC/RXxaM4hbdDBfr2MWrfUwq+aaKe67faMvy+1y8QHwYGcI3hKZBkFrHMXoapFZn/2x835Cpq57rMJOMlK3l8ECgYBwi4QLUvZAR9dQ6364yeixre5nQdeQDlpHjrqbqddCDN1kGKCbjlrbTGZslRXfyb97RsLanwhHp/TDxu2nBbibQxK2EmmJN0obkAkrvQHAolBmYHF4PrsIB/OnPTk/SidKwktOgpwzm+XqtPFMkBgQHoGzoMI7Mxsw3ZQW+WaefQKBgDXoDDaMvnOO+Fz1QKo7HU5cR3YhS+bbBoDoCN9YsRsSmlYl1ok9xHf5+b/xXloJmGQKX+TvO2mT45aNLJ+6CylOlFKelxUsX7tckWgS8fXs9M82oZMhWYnooyRHyHSztesDhCfwpzBG2l2yuMVIRa3oy+c3YgE6R2D7awos2eQT";
        //参数返回格式，只支持json
        const string FORMAT = "json";
        //支持GBK和UTF-8
        const string CHARSET = "UTF-8";
        //支付宝公钥
        const string ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhegAB9LaZJfaMaVtxxBmNWX9o4F / 50eHb5EmqMCA/BU4a+qzr8rbYchUDLeISDkaR7EIz7gdjgCDQ+TRksX7iC2i5ExEUkf5xGDpCbgE73jl/IT4GpkYRmvMg3FjprIKbkqw9xH7i5oELhwdBa2kwdnmU8dLde45hgikqNJp8XqVe451W0XMydLbT1e3kgjvCrJ3SeBsJKc5o+FetAD+gW1wpsCOhwQ1mMAuYZ6m27uM98o3xqgWJg8p4ZD8JbZjiPbY7dmuZlUvWUsJWYEDJMrhzcTwMdRyc3VM69UkZ686Qpi0rUr/dyRiSjn3WZgIb9Tu5Rvp+pQtdk4r+wgxVQIDAQAB";

        [HttpPost]
        public ActionResult cz(string num)
        {
            Session["df"] = num;
            IAopClient client = new DefaultAopClient(URL, APPID, APP_PRIVATE_KEY, FORMAT, "2.0", "RSA2", ALIPAY_PUBLIC_KEY, CHARSET, false);
            //实例化具体API对应的request类,类名称和接口名称对应,当前调用接口名称如：
            AlipayTradePrecreateRequest request = new AlipayTradePrecreateRequest();//创建API对应的request类,请求返回二维码
            AlipayTradePagePayRequest requestPagePay = new AlipayTradePagePayRequest();//请求返回支付宝支付网页
            AlipayTradePagePayModel model = new AlipayTradePagePayModel();
            //主要注意的是这个地方的值
            model.Body = "电费";
            model.Subject = "电费";
            model.TotalAmount = num;
            model.OutTradeNo = DateTime.Now.ToString("yyyyMMddHHmmss"); ;//订单号我们是直接用日期产生的
            model.StoreId = "William001";
            model.ProductCode = "FAST_INSTANT_TRADE_PAY";
            requestPagePay.SetBizModel(model);
            //这是要注意的，支付后就要通过他完成回调，这里填写你要跳转页面的地址
            requestPagePay.SetReturnUrl("http://localhost:1048/User/ReturnUrl");
            var response = client.SdkExecute(requestPagePay);//Execute(request);
            if (!response.IsError)
            {
                var res = new
                {
                    success = true,
                    out_trade_no = response.OutTradeNo,
                    // qr_code = response.QrCode,    //二维码字符串
                    pay_url = URL + "?" + response.Body
                };
                return Json(res);
            }
            else
            {
                var res = new
                {
                    success = false,
                };
                return Json(res);
            }
        }
        public SortedDictionary<string, string> GetRequestGet()
        {
            #region 获取支付宝GET过来通知消息，并以“参数名=参数值”的形式组成数组

            int i = 0;
            SortedDictionary<string, string> sArray = new SortedDictionary<string, string>();
            NameValueCollection coll;
            //Load Form variables into NameValueCollection variable.
            coll = Request.QueryString;

            // Get names of all forms into a string array.
            String[] requestItem = coll.AllKeys;

            for (i = 0; i < requestItem.Length; i++)
            {
                sArray.Add(requestItem[i], Request.QueryString[requestItem[i]]);
            }

            return sArray;

            #endregion
        }

        public ActionResult ReturnUrl()
        {
            SortedDictionary<string, string> sPara = GetRequestGet();
            int Result = 0;
            if (sPara.Count > 0)//判断是否有带返回参数
            {
                bool flag = AlipaySignature.RSACheckV1(sPara, ALIPAY_PUBLIC_KEY, "utf-8", "RSA2", false);

                if (flag)//验证成功
                {
                    #region 验证成功对数据库执行操作
                    int id = int.Parse(Session["id"].ToString());
                    var item = demo.User.Find(id);
                    var fang = demo.fang.Where(c => c.userid == id).FirstOrDefault();
                    chongzhi cz = new chongzhi();
                    cz.userid = id;
                    cz.bossid = fang.bossid;
                    cz.money = int.Parse(Session["df"].ToString());
                    cz.houmoney = item.money + cz.money;
                    cz.date = DateTime.Now;
                    demo.chongzhi.Add(cz);
                    item.money = cz.houmoney;
                    demo.SaveChanges();
                    return RedirectToAction("chongzhi");

                    #endregion
                }
                else//验证失败
                {
                    Result = 0;
                    // Cmn.Log.Write("异步支付验证失败！" + Request.Form);
                }
            }
            else
            {
                return Content("<script>location.href='/pay/Index'</script>");
            }
            return RedirectToAction("chongzhi");
        }


        //用户建议
        public ActionResult jianyi() {
            int id = int.Parse(Session["id"].ToString());
            return View(demo.fankui.Where(c=>c.userid==id).OrderByDescending(c=>c.date).ToList());
        }
        public ActionResult jy(string str1,string str2)
        {
            int id = int.Parse(Session["id"].ToString());
            //一天之内只能反馈3条信息
            DateTime now=DateTime.Parse( DateTime.Now.ToString("yyyy-MM-dd"));
            DateTime addday = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd")).AddDays(1);
           int nn= demo.fankui.Where(c => c.date > now&&c.date<addday).Count();
            if (nn>=3)
            {
                return Content("2");
            }
            else { 

                 var item = demo.User.Find(id);
                 var fang = demo.fang.Where(c => c.userid == id).ToList();

                 fankui fk = new fankui();
                 fk.userid = id;
                 fk.bossid = fang[0].bossid;
                 fk.zhuti = str1;
                 fk.miaoshu = str2;
                 fk.date = DateTime.Now;
                 fk.type = 0;
                 demo.fankui.Add(fk);
                 demo.SaveChanges();
                 return Content("1");

            }
        }
        //用户建议详情
        public ActionResult xiangqing(int id)
        {
            var item = demo.fankui.Find(id);
            string arr = "";
            arr += item.User.name + "&";
            arr += item.date + "&";
            arr += item.zhuti + "&";
            arr += item.miaoshu + "&";
            arr += item.huifu + "&";
            arr += item.type;
            if (item.type==1)
            {
                 item.type = 2;
            }
           
            demo.SaveChanges();
            return Content(arr);
        }



        //修改信息
        public ActionResult xiugai(int id)
        {
            return View(demo.User.Find(id));
        }
        //保存的地址
        public static string saveDataPath;
        //头像上传事件
        public ActionResult tuup(string dddd)
        {
            int id = int.Parse(Session["id"].ToString());
            Base64ToImage(dddd);
            var item = demo.User.Find(id);
            item.url = saveDataPath;
            Session["touxiang"] = item.url;
            demo.SaveChanges();
            return Content(id.ToString());
        }
        //头像图片
        private bool Base64ToImage(string base64Str)
        {
            base64Str = base64Str.Replace("data:image/png;base64,", "").Replace("data:image/jgp;base64,", "").Replace("data:image/jpg;base64,", "").Replace("data:image/jpeg;base64,", "");  // 将base64头部信息替换
            // 去掉特殊符号
            string dummyData = base64Str.Trim().Replace("%", "").Replace(",", "").Replace(" ", "+");
            if (dummyData.Length % 4 > 0)
            {
                dummyData = base64Str.PadRight(dummyData.Length + 4 - dummyData.Length % 4, '=');
            }
            try
            {
                string inputStr = dummyData;
                byte[] arr = Convert.FromBase64String(inputStr);
                MemoryStream ms = new MemoryStream(arr);

                Bitmap bmp = new Bitmap(ms);  // GDI 位图
                string path = Server.MapPath("~/Images/用户头像/");
                string imgName = DateTime.Now.ToString("yyMMddhhmmssfff");
                string file = path + imgName + ".jpg";  // 图片路径包括名字后缀
                bmp.Save(file, System.Drawing.Imaging.ImageFormat.Jpeg);  // 保存到文件夹
                ms.Close();  // 关闭流
                saveDataPath = "/Images/用户头像/" + imgName + ".jpg";  // 保存到数据库的路径
            }
            catch (Exception e)
            {
                string error = e.Message;
                return false;
            }
            return true;
        }
        //修改信息保存
        [HttpPost]
        public ActionResult xiugai_ok(string name, string phone)
        {
            //看是否是本人号码
            int id = int.Parse(Session["id"].ToString());
                var item = demo.User.Find(id);
            //判断号码是否被注册
            var user = demo.User.FirstOrDefault(c => c.phone == phone);
            var boss = demo.boss.FirstOrDefault(c => c.phone == phone);
            if (user != null||boss!=null)//已经有用户了
            {
                if (item.phone == phone)//如果是本人号码
                {
                    item.name = name;
                    item.phone = phone;
                    demo.SaveChanges();
                    Session["name"] = item.name;//姓名
                    return Content(id.ToString());
                }
                else { 
                 return Content("chongfu");
                }
            }
            else
            {
                item.name = name;
                item.phone = phone;
                demo.SaveChanges();
                Session["name"] = item.name;//姓名
                return Content(id.ToString());
            }
           
           
        }




        //图表数据
        [HttpGet]
        public JsonResult  tubiao() {

            string sql = "select top 5 * from [order] where userid="+Session["id"].ToString()+ " order by [date] desc";
            var query = demo.Database.SqlQuery<order>(sql);
            
            JsonResult jsonResult = new JsonResult();
            jsonResult.Data = query.ToList();
            jsonResult.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            return jsonResult;
        }
        [HttpGet]
        public JsonResult tubiao2() {
            string sql = "select  * from [User] where id=" + Session["id"].ToString() + "";
            var query = demo.Database.SqlQuery<User>(sql);

            JsonResult jsonResult = new JsonResult();
            jsonResult.Data = query.ToList();
            jsonResult.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            return jsonResult;
        }


        //消息条数
        public ActionResult xiaoxi()
        {
            int id = int.Parse(Session["id"].ToString());
           //建议
            string sql2 = "select COUNT(*) from fankui where bossid=" + id + " and [type]=1";
            int b = demo.Database.SqlQuery<int>(sql2).FirstOrDefault();
            return Content(b.ToString());
        }


    }
}
