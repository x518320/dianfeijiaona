using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using 卓越项目.Models;
namespace 卓越项目.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/
        public DemoEntities demo = new DemoEntities();

        //登录界面
        public ActionResult Index()
        {
            Session.Remove("id");
            Session.Remove("bid");
            return View();
        }
        //登录
        public ActionResult check(string username, string pwd)
        {
            if (username == "" || pwd == "")
            {
                return Content("1");
            }
            else
            {
                var item = demo.User.FirstOrDefault(c => c.phone == username);//用户
                var item2 = demo.boss.FirstOrDefault(c => c.phone == username);//管理员
                if (item != null || item2 != null)//其中一个有数据
                {
                    if (item != null)//用户有数据
                    {
                        if (item.pwd == pwd)
                        {
                            //是否绑定房间
                            if (demo.fang.Where(c => c.userid == item.id).Count() == 0)
                            {
                                return Content("5");//没有绑定房间
                            }
                            else
                            {
                                Session["id"] = item.id;
                                return Content("3");//用户登录成功
                            }
                        }
                        return Content("2");//密码错误
                    }
                    else
                    { //用户没数据
                        if (item2 != null)
                        {
                            if (item2.pwd == pwd)
                            {
                                Session["bid"] = item2.id;
                                return Content("4");//管理员登录成功
                            }
                            return Content("2");//密码错误
                        }
                        else
                        {
                            return Content("2");//密码错误
                        }
                    }
                }
                else//没查询到用户或管理员
                {
                    return Content("2");
                }
            }
        }
        //注册
        public ActionResult zhuce(string name, string phone, string pwd, string guan)
        {
            var item = demo.User.FirstOrDefault(c => c.phone == phone);
            if (item != null)//已经有用户了
            {
                return Content("1");
            }
            else {
                //查询是否有管理员
                var item2 = demo.boss.FirstOrDefault(c => c.phone == guan);
                if (item2 == null)//没有管理员
                {
                    return Content("2");
                }
                else {
                    //如果注册表有一样的数据
                    var item3 = demo.zhuce.FirstOrDefault(c => c.phone == phone);
                    if (item3 == null)//没有该注册信息
                    {
                        zhuce user = new zhuce();
                        user.name = name;
                        user.phone = phone;
                        user.pwd = pwd;
                        user.time = DateTime.Now;
                        user.bossid = item2.id;
                        user.type = 0;

                        demo.zhuce.Add(user);
                        demo.SaveChanges();
                        return Content("3");
                    }
                    else {
                        if (item3.bossid == item2.id)//看管理员id是否一样
                        {
                            return Content("4");//重复提交
                        }
                        else {//管理员不一样,可能是用户填错
                            zhuce user = new zhuce();
                            user.name = name;
                            user.phone = phone;
                            user.pwd = pwd;
                            user.time = DateTime.Now;
                            user.bossid = item2.id;
                            user.type = 0;
                            demo.zhuce.Add(user);
                            demo.SaveChanges();
                            return Content("3");
                        }
                    }
                   
                    
                }
            }
        }

      

       

    }
}
