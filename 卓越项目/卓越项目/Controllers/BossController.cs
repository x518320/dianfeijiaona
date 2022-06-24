using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using 卓越项目.Models;
using 卓越项目.Models.类;
namespace 卓越项目.Controllers
{
    public class BossController : Controller
    {
        //
        // GET: /Boss/
        DemoEntities demo = new DemoEntities();
        public ActionResult Index()
        {
            //获取管理员id
            int id =int.Parse( Session["bid"].ToString());
            var boss = demo.boss.Find(id);
            Session["name"] = boss.name;//姓名
            foreach (var fang in demo.fang.Where(c => c.bossid == id).ToList())
            {
                var item = demo.User.Find(fang.userid);//找到用户

                //通过用户id找到房间

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
                            order.dianjia = boss.dianjia;
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
                            order.dianjia = boss.dianjia;
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
                int bb = Math.Abs(Guid.NewGuid().GetHashCode() % 2) + 2;
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
            }
            return View(demo.fang.Where(c => c.bossid == id).ToList());
        }

        //缴费详情
        public ActionResult order()
        {
            int id = int.Parse(Session["bid"].ToString());
            return View(demo.order.Where(c => c.bossid == id).OrderByDescending(c => c.date).ToList());
        }
        [HttpPost]
        public ActionResult order(string date1,string date2,string text1)
        {
            int id = int.Parse(Session["bid"].ToString());

            //如果是空数据
            if (date1=="")
            {
                date1 = "2000-1-1";
            }
            if (date2=="")
            {
                date2 = DateTime.Now.ToString();
            }
            //转换
            DateTime d1 = DateTime.Parse(date1);
            DateTime d2 = DateTime.Parse(date2);
            return View(demo.order.Where(c => c.bossid == id&&c.date>d1&&c.date<d2&&c.User.name.Contains(text1)).OrderByDescending(c => c.date).ToList()) ;
        }

        //充值详情
        public ActionResult chongzhi()
        {
            int id = int.Parse(Session["bid"].ToString());
            return View(demo.chongzhi.Where(c=>c.bossid==id).OrderByDescending(c=>c.date).ToList());
        }
        [HttpPost]
        public ActionResult chongzhi(string date1, string date2, string text1)
        {
            int id = int.Parse(Session["bid"].ToString());
            //如果是空数据
            if (date1 == "")
            {
                date1 = "2000-1-1";
            }
            if (date2 == "")
            {
                date2 = DateTime.Now.ToString();
            }
            //转换
            DateTime d1 = DateTime.Parse(date1);
            DateTime d2 = DateTime.Parse(date2);
            return View(demo.chongzhi.Where(c => c.bossid == id&&c.date>d1&&c.date<d2&&c.User.name.Contains(text1)).OrderByDescending(c => c.date).ToList());
        }

        //房间管理
        public ActionResult fangjian() {
            int id = int.Parse(Session["bid"].ToString());
            return View(demo.fang.Where(c=>c.bossid==id).ToList());
        }
        //房间更多操作
        public ActionResult fangjian_info(int id) {
           
            return View(demo.fang.Find(id));
        }

        //验证
        public ActionResult yanzheng() {
            int id = int.Parse(Session["bid"].ToString());
            return View(demo.zhuce.Where(c=>c.bossid==id).OrderBy(c=>c.time));
        }
        public ActionResult yanzheng_no(int id) {
            var item = demo.zhuce.Find(id);
            demo.zhuce.Remove(item);
            demo.SaveChanges();
            return RedirectToAction("yanzheng");
        }
        //下拉框
        [HttpGet]
        public ActionResult xiala() {
            int id = int.Parse(Session["bid"].ToString());
            string sql = "select * from[dbo].[fang] where bossid="+id;
            var query = demo.Database.SqlQuery<fang>(sql);

            JsonResult jsonResult = new JsonResult();
            jsonResult.Data = query.ToList();
            jsonResult.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            return jsonResult;
        }
        //验证成功
        [HttpGet]
        public ActionResult yanzhenginto(string fid,string zid) {
            int intfid = int.Parse(fid);
            int intzid = int.Parse(zid);
            var zhuce = demo.zhuce.Find(intzid);
            
            var user = new User();
            user.name = zhuce.name;//姓名
            user.phone = zhuce.phone;//电话
            user.pwd = zhuce.pwd;//密码
            user.time = DateTime.Now;
            user.findtime = DateTime.Now;
            user.money = 0;
            user.url = "/Images/用户头像/默认.png";
            //添加到用户表
            demo.User.Add(user);
            demo.SaveChanges();
            //获取到新用户id;
            var last = demo.User.OrderByDescending(c=>c.id).FirstOrDefault();
            int id = last.id;
            //用户绑定房间
            var fang = demo.fang.Find(intfid);
            fang.userid = id;
            //注册信息删除
            demo.zhuce.Remove(zhuce);
            demo.SaveChanges();
            return Content("1");
        }


        //用户建议
        public ActionResult jianyi(int lishi) {
            if (lishi == 0)
            {
                ViewBag.type = 0;
                return View(demo.fankui.Where(c => c.type == 0).OrderBy(c => c.date).ToList());
            }
            else {
                ViewBag.type = 1;
                return View(demo.fankui.Where(c => c.type != 0).OrderBy(c => c.date).ToList());
            }
           
        }
        //回复
        public ActionResult huifu(string id,string huifu) {
            int zid = int.Parse(id);
            var item = demo.fankui.Find(zid);
            item.type = 1;
            item.huifu = huifu;
            demo.SaveChanges();
            return Content("1");
        }
        //用户建议详情
        public ActionResult xiangqing(int id) {
            var item = demo.fankui.Find(id);
            string arr = "";
            arr+=item.User.name+"&";
            arr += item.date+"&";
            arr += item.zhuti + "&";
            arr += item.miaoshu + "&";
            arr += item.huifu+"&";
            arr += item.type;
            return Content(arr);
        }


        //修改密码
        public ActionResult edit() {
            return View();
        }
        public ActionResult editcheck(string pwd1, string pwd2)
        {
            var user = demo.boss.Find(int.Parse(Session["bid"].ToString()));
            if (user.pwd != pwd1)
            {
                return Content("1");//原密码错误
            }
            else
            {
                user.pwd = pwd2;
                demo.SaveChanges();
                return Content("2");//成功
            }

        }


        //修改信息
        public ActionResult xiugai() {
            int id = int.Parse(Session["bid"].ToString());

            return View(demo.boss.Find(id));
        }
        public ActionResult xiugaiok(string name,string phone,string dj)
        {
            int id = int.Parse(Session["bid"].ToString());
            var user = demo.boss.Find(id);
            //判断号码是否被注册
            var user1 = demo.User.FirstOrDefault(c => c.phone == phone);
            var boss = demo.boss.FirstOrDefault(c => c.phone == phone);
            if (user1 != null || boss != null)//已经有用户了
            {
                if (user.phone == phone)//如果是本人号码
                {
                    user.name = name;
                    user.phone = phone;
                    user.dianjia = decimal.Parse(dj);
                    demo.SaveChanges();
                    Session["name"] = user.name;//姓名
                    return Content("1");
                }
                else
                {
                    return Content("2");
                }
            }
            else
            {
                user.name = name;
                user.phone = phone;
                user.dianjia = decimal.Parse(dj);
                demo.SaveChanges();
                Session["name"] = user.name;//姓名
                return Content("1");
            }
          
        }




            //图表
            [HttpGet]
        public ActionResult tubiao() {
            int id = int.Parse(Session["bid"].ToString());
            string sql = "select top 5 a.[now]-a.up dian,b.name from [order] a,[user] b,boss c where a.bossid=c.id and a.userid=b.id and  bossid="+id+" and a.[date]='"+DateTime.Now.Year+"-"+(int.Parse(DateTime.Now.Month.ToString())-1)+"-"+"1"+"' order by(a.[now]-a.up) desc";
            var query = demo.Database.SqlQuery<b1>(sql);

            JsonResult jsonResult = new JsonResult();
            jsonResult.Data = query.ToList();
            jsonResult.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            return jsonResult;
        }
        [HttpGet]
        public ActionResult tubiao2()
        {
            int id = int.Parse(Session["bid"].ToString());
            string sql = "select top 5 AVG([now]-up) dian,date from [order] where bossid=" + id + " group by(date) order by date desc";
                  var query = demo.Database.SqlQuery<b2>(sql);

            JsonResult jsonResult = new JsonResult();
            jsonResult.Data = query.ToList();
            jsonResult.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            return jsonResult;
        }
        [HttpGet]
        public ActionResult tubiao5()
        {
            int id = int.Parse(Session["bid"].ToString());
            string sql = "   select sum(a.money) dian,b.name from chongzhi a,[User] b,boss c, fang d where d.userid = b.id and d.bossid = c.id and c.id = 1 and a.userid = b.id and date> DATEADD(MONTH, -1, GETDATE()) group by(b.name) order by(sum(a.money)) desc";
                var query = demo.Database.SqlQuery<b1>(sql);

            JsonResult jsonResult = new JsonResult();
            jsonResult.Data = query.ToList();
            jsonResult.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            return jsonResult;
        }
        [HttpGet]
        public ActionResult tubiao6()
        {
            int id = int.Parse(Session["bid"].ToString());
            List<int> list = new List<int>();
            string sql = "select count(*) from [User] a,boss b,fang c where c.userid=a.id and c.bossid=b.id  and  money>5000 and b.id=" + id;
            string sql2 = "select count(*) from[User] a,boss b, fang c where c.userid = a.id and c.bossid = b.id and money<5000 and money> 1000 and b.id = "+id;
            string sql3 = "select count(*) from [User] a,boss b,fang c where c.userid=a.id and c.bossid=b.id and money<1000 and money>500 and b.id= " + id;
            string sql4 = "select count(*) from [User] a,boss b,fang c where c.userid=a.id and c.bossid=b.id  and money<500 and money>200 and b.id=" + id;
            string sql5 = "select count(*) from [User] a,boss b,fang c where c.userid=a.id and c.bossid=b.id and money<200 and money>=0 and b.id=" + id;



            var query = demo.Database.SqlQuery<int>(sql).ToList();
            list.Add(query[0]);
            var query2 = demo.Database.SqlQuery<int>(sql2).ToList();
            list.Add(query2[0]);
            var query3 = demo.Database.SqlQuery<int>(sql3).ToList();
            list.Add(query3[0]);
            var query4 = demo.Database.SqlQuery<int>(sql4).ToList();
            list.Add(query4[0]);
            var query5 = demo.Database.SqlQuery<int>(sql5).ToList();
            list.Add(query5[0]);

            JsonResult jsonResult = new JsonResult();
            jsonResult.Data = list;
            jsonResult.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            return jsonResult;
        }
        [HttpGet]
        public ActionResult tubiao7(int fid)
        {
            var fang = demo.fang.Find(fid);
            string sql = "select top 5 [money] dian,[date] from [order] where userid="+fang.userid+" order by [date] desc";
            var query = demo.Database.SqlQuery<b2>(sql);

            JsonResult jsonResult = new JsonResult();
            jsonResult.Data = query.ToList();
            jsonResult.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            return jsonResult;
        }


        //消息条数
        public ActionResult xiaoxi() {
            int id = int.Parse(Session["bid"].ToString());
            //注册
            string sql1 = "select count(*) from zhuce where bossid="+id+" and [type]=0";
            //建议
            string sql2 = "select COUNT(*) from fankui where bossid="+id+" and [type]=0";
           int a= demo.Database.SqlQuery<int>(sql1).FirstOrDefault();
           int b= demo.Database.SqlQuery<int>(sql2).FirstOrDefault();

            return Content((a+b)+","+a+","+b);
        }
    }
}
