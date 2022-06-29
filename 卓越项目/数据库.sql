select * from [User]
select * from [dbo].[boss] 
select * from[dbo].[fang]
select * from[dbo].[order] 
select * from[dbo].[zhuce]
select * from[dbo].[fankui] 
select * from [dbo].[chongzhi]

update [User]set url='/Images/用户头像/默认.png'


update [User] set [money]=5000,findtime='2022-4-1'
update fang set datetiem='2021-4-1' ,up=1000,dianliang=2000 
delete from [order]


--用户表
create table [User](
id int primary key identity(1,1),--id
name nvarchar(50) ,--用户名
phone nvarchar(50) ,--手机号
pwd nvarchar(50), --密码
[time] datetime, --登录时间
[money] decimal(10,2), --账户余额
findtime datetime, --查询电表时间
url nvarchar(600) --头像地址
)
select * from [user]
--管理员表
create table boss(
id int primary key identity(1,1),--id
name nvarchar(50) ,--用户名
phone nvarchar(50) ,--手机号
pwd nvarchar(50), --密码
dianjia decimal(10,2),	--电价
)
--注册表单 --需要管理员同意,才添加进用户表,并将他放入对应房间,然后在这个表删除
create table zhuce(
id int primary key identity(1,1),--id
name nvarchar(50) ,--用户名
phone nvarchar(50) ,--手机号
pwd nvarchar(50), --密码
[time] datetime, --提交时间
bossid int foreign key (bossid) references boss(id), --管理员id
[type] int --是否受理 ,0是没看,1是已经看了

)

--楼层表
create table fang(
id int primary key identity(1,1),--id
dong nvarchar(50),--A栋,B栋
danyuan int, --单元
louceng int, --楼
fangjian int, --房间号
datetiem date,--上次缴费时间
up decimal(10,2) ,--上次缴费的电量
dianliang decimal(10,2),--电表上的电量
userid int foreign key (userid) references [User](id) ,--用户id
bossid int foreign key (bossid) references  boss(id)--管理员id
)
select * from fang
--缴费记录表
create table [order](
id int primary key identity(10000,1),--id
bossid int foreign key (bossid) references  boss(id),--管理员id
userid int foreign key (userid) references [User](id),--用户id
fangid int foreign key (fangid) references fang(id) ,--房间id
up decimal(10,2),--上次止表
[now] decimal(10,2),--本次止表
dianjia decimal(10,2),	--电价
[money]  decimal(10,2),--缴费金额
[date] datetime,--缴费时间
)

--充值记录表
create table chongzhi(
id int primary key identity(10000,1),
userid int foreign key (userid) references [User](id),--用户id
bossid int foreign key (bossid) references  boss(id),--管理员id
[money]  decimal(10,2),--充值金额
[houmoney]  decimal(10,2),--充值后的金额
[date] datetime,--缴费时间
)

--用户反馈表
create table fankui(
id int primary key identity(10000,1),
userid int foreign key (userid) references [User](id),--用户id
bossid int foreign key (bossid) references  boss(id),--管理员id
zhuti nvarchar(100) ,--主题
miaoshu nvarchar(600),--描述
[date] datetime,--时间
[type] int,--是否受理 ,0是没受理,1是已受理并且用户还没看,2是用户已看
huifu nvarchar(600),--回复
)

USE [Demo]
GO
SET IDENTITY_INSERT [dbo].[User] ON 

GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (1, N'宋爱梅', N'19878907890', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(665.69 AS Decimal(10, 2)), CAST(N'2022-05-04 11:08:02.597' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (2, N'王志芳', N'16626552655', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (3, N'于光', N'13638801992', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (4, N'贾隽仙', N'13928783383', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (5, N'贾燕青', N'15665666339', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(20.00 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (6, N'刘振杰', N'18982072555', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(45.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (7, N'郭卫东', N'13250699993', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (8, N'崔红宇', N'18666888221', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (9, N'马福平', N'15521964888', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (10, N'冯红', N'13949023216', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (11, N'崔敬伟', N'13949023216', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (12, N'穆增志', N'13938467952', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (13, N'谢志威', N'13034888821', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (14, N'吕金起', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (15, N'韩云庆', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (16, N'鲁全福', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (17, N'郭建立', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (18, N'郝连水', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (19, N'闫智胜', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (20, N'王芳', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (21, N'李娜', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (22, N'张丽', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (23, N'李杰', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (24, N'张勇', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (25, N'刘洋', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (26, N'王娟', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (27, N'王秀兰', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (28, N'张燕', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (29, N'李桂英', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (30, N'王丹', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (31, N'张秀兰', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (32, N'张建华', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (33, N'李建华', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (34, N'张玉珍', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (35, N'赵静', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (36, N'刘鑫', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (37, N'李健', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (38, N'王海燕', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (39, N'李春梅', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (40, N'王淑珍', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (41, N'王建军', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (42, N'王建国', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (43, N'陈鹏', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (44, N'王桂荣', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (45, N'张帆', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (46, N'张桂芝', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (47, N'张坤', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (48, N'刘婷婷', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (49, N'张淑兰', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (50, N'王璐', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (51, N'李淑华', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (52, N'陈鑫', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (53, N'刘建国', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (54, N'李桂花', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (55, N'李淑兰', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (56, N'王凤兰', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (57, N'陈秀珍', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (58, N'田鹤', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (59, N'冰勇', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (60, N'万玉', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (61, N'何晓', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (62, N'易杰', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (63, N'余坤', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (64, N'耿邦', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (65, N'耿勇', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (66, N'池浩', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (67, N'懿轩', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (68, N'康泰', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (69, N'嘉茂', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[boss] ON 

GO
INSERT [dbo].[boss] ([id], [name], [phone], [pwd], [dianjia]) VALUES (1, N'夏运宇', N'12345678912', N'123', CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[boss] ([id], [name], [phone], [pwd], [dianjia]) VALUES (2, N'李瑶', N'12345678912', N'123', CAST(23.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[boss] ([id], [name], [phone], [pwd], [dianjia]) VALUES (3, N'汪家振', N'12345678912', N'123', CAST(12.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[boss] ([id], [name], [phone], [pwd], [dianjia]) VALUES (4, N'周政', N'12345678923', N'123', CAST(17.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[boss] ([id], [name], [phone], [pwd], [dianjia]) VALUES (5, N'王艳', N'12345678934', N'123', CAST(21.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[boss] ([id], [name], [phone], [pwd], [dianjia]) VALUES (6, N'张大勋', N'12345678956', N'123', CAST(1.20 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[boss] OFF
GO
SET IDENTITY_INSERT [dbo].[fang] ON 

GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (1, N'A栋', 1, 2, 201, CAST(0xC5430B00 AS Date), CAST(10.00 AS Decimal(10, 2)), CAST(821.04 AS Decimal(10, 2)), 1, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (2, N'A栋', 1, 2, 202, CAST(0xC5430B00 AS Date), CAST(20.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), 2, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (3, N'A栋', 1, 2, 203, CAST(0xC5430B00 AS Date), CAST(20.30 AS Decimal(10, 2)), CAST(34.00 AS Decimal(10, 2)), 3, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (4, N'A栋', 1, 3, 301, CAST(0xC5430B00 AS Date), CAST(30.00 AS Decimal(10, 2)), CAST(50.40 AS Decimal(10, 2)), 4, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (5, N'A栋', 1, 3, 302, CAST(0xC5430B00 AS Date), CAST(35.00 AS Decimal(10, 2)), CAST(100.20 AS Decimal(10, 2)), 5, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (6, N'A栋', 1, 3, 303, CAST(0xC5430B00 AS Date), CAST(66.00 AS Decimal(10, 2)), CAST(120.30 AS Decimal(10, 2)), 6, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (7, N'A栋', 1, 4, 401, CAST(0xC5430B00 AS Date), CAST(55.65 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), 7, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (8, N'A栋', 1, 4, 402, CAST(0xC5430B00 AS Date), CAST(17.00 AS Decimal(10, 2)), CAST(37.00 AS Decimal(10, 2)), 8, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (9, N'A栋', 1, 4, 403, CAST(0xC5430B00 AS Date), CAST(99.80 AS Decimal(10, 2)), CAST(400.80 AS Decimal(10, 2)), 9, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (10, N'A栋', 2, 2, 201, CAST(0xC5430B00 AS Date), CAST(37.00 AS Decimal(10, 2)), CAST(57.00 AS Decimal(10, 2)), 10, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (11, N'A栋', 2, 2, 202, CAST(0xC5430B00 AS Date), CAST(46.00 AS Decimal(10, 2)), CAST(66.00 AS Decimal(10, 2)), 11, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (12, N'A栋', 2, 3, 301, CAST(0xC5430B00 AS Date), CAST(59.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), 12, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (13, N'A栋', 2, 3, 302, CAST(0xC5430B00 AS Date), CAST(78.00 AS Decimal(10, 2)), CAST(90.00 AS Decimal(10, 2)), 13, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (14, N'B栋', 1, 2, 201, CAST(0xC5430B00 AS Date), CAST(200.00 AS Decimal(10, 2)), CAST(430.00 AS Decimal(10, 2)), 14, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (15, N'B栋', 1, 2, 202, CAST(0xC5430B00 AS Date), CAST(69.90 AS Decimal(10, 2)), CAST(100.90 AS Decimal(10, 2)), 15, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (16, N'B栋', 1, 2, 203, CAST(0xC5430B00 AS Date), CAST(57.00 AS Decimal(10, 2)), CAST(89.00 AS Decimal(10, 2)), 16, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (17, N'B栋', 1, 3, 301, CAST(0xC5430B00 AS Date), CAST(89.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), 17, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (18, N'B栋', 1, 3, 302, CAST(0xC5430B00 AS Date), CAST(170.90 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), 18, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (19, N'B栋', 1, 3, 303, CAST(0xC5430B00 AS Date), CAST(240.90 AS Decimal(10, 2)), CAST(500.90 AS Decimal(10, 2)), 19, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (20, N'B栋', 2, 2, 201, CAST(0xC5430B00 AS Date), CAST(69.00 AS Decimal(10, 2)), CAST(690.00 AS Decimal(10, 2)), 20, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (21, N'B栋', 2, 2, 202, CAST(0xC5430B00 AS Date), CAST(78.00 AS Decimal(10, 2)), CAST(278.00 AS Decimal(10, 2)), 21, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (22, N'B栋', 2, 2, 203, CAST(0xC5430B00 AS Date), CAST(98.00 AS Decimal(10, 2)), CAST(178.00 AS Decimal(10, 2)), 22, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (23, N'B栋', 2, 3, 301, CAST(0xC5430B00 AS Date), CAST(67.98 AS Decimal(10, 2)), CAST(234.44 AS Decimal(10, 2)), 23, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (24, N'B栋', 2, 3, 302, CAST(0xC5430B00 AS Date), CAST(49.00 AS Decimal(10, 2)), CAST(323.90 AS Decimal(10, 2)), 24, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (25, N'B栋', 2, 3, 303, CAST(0xC5430B00 AS Date), CAST(56.00 AS Decimal(10, 2)), CAST(145.00 AS Decimal(10, 2)), 25, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (26, N'C栋', 1, 2, 201, CAST(0xC5430B00 AS Date), CAST(77.00 AS Decimal(10, 2)), CAST(177.00 AS Decimal(10, 2)), 26, 3)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (27, N'C栋', 1, 2, 202, CAST(0xC5430B00 AS Date), CAST(64.00 AS Decimal(10, 2)), CAST(278.00 AS Decimal(10, 2)), 27, 3)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (28, N'C栋', 1, 2, 203, CAST(0xC5430B00 AS Date), CAST(56.00 AS Decimal(10, 2)), CAST(156.00 AS Decimal(10, 2)), 28, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (29, N'C栋', 1, 3, 301, CAST(0xC5430B00 AS Date), CAST(45.00 AS Decimal(10, 2)), CAST(78.00 AS Decimal(10, 2)), 29, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (30, N'C栋', 1, 3, 302, CAST(0xC5430B00 AS Date), CAST(56.00 AS Decimal(10, 2)), CAST(99.89 AS Decimal(10, 2)), 30, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (31, N'C栋', 1, 3, 303, CAST(0xC5430B00 AS Date), CAST(87.00 AS Decimal(10, 2)), CAST(195.69 AS Decimal(10, 2)), 31, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (32, N'C栋', 2, 2, 201, CAST(0xC5430B00 AS Date), CAST(36.00 AS Decimal(10, 2)), CAST(87.00 AS Decimal(10, 2)), 32, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (33, N'C栋', 2, 2, 202, CAST(0xC5430B00 AS Date), CAST(78.00 AS Decimal(10, 2)), CAST(90.00 AS Decimal(10, 2)), 33, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (34, N'C栋', 2, 2, 203, CAST(0xC5430B00 AS Date), CAST(77.89 AS Decimal(10, 2)), CAST(91.00 AS Decimal(10, 2)), 34, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (35, N'C栋', 2, 3, 301, CAST(0xC5430B00 AS Date), CAST(80.00 AS Decimal(10, 2)), CAST(180.00 AS Decimal(10, 2)), 35, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (36, N'C栋', 2, 3, 302, CAST(0xC5430B00 AS Date), CAST(79.00 AS Decimal(10, 2)), CAST(95.89 AS Decimal(10, 2)), 36, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (37, N'C栋', 2, 3, 303, CAST(0xC5430B00 AS Date), CAST(95.00 AS Decimal(10, 2)), CAST(289.00 AS Decimal(10, 2)), 37, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (38, N'D栋', 1, 1, 101, CAST(0xC5430B00 AS Date), CAST(135.89 AS Decimal(10, 2)), CAST(467.89 AS Decimal(10, 2)), 38, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (39, N'D栋', 2, 1, 101, CAST(0xC5430B00 AS Date), CAST(178.69 AS Decimal(10, 2)), CAST(367.90 AS Decimal(10, 2)), 39, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (40, N'E栋', 1, 2, 201, CAST(0xC5430B00 AS Date), CAST(35.00 AS Decimal(10, 2)), CAST(78.00 AS Decimal(10, 2)), 40, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (41, N'E栋', 1, 2, 202, CAST(0xC5430B00 AS Date), CAST(45.00 AS Decimal(10, 2)), CAST(98.00 AS Decimal(10, 2)), 41, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (42, N'E栋', 1, 2, 203, CAST(0xC5430B00 AS Date), CAST(67.00 AS Decimal(10, 2)), CAST(98.90 AS Decimal(10, 2)), 42, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (43, N'E栋', 1, 3, 301, CAST(0xC5430B00 AS Date), CAST(45.00 AS Decimal(10, 2)), CAST(78.00 AS Decimal(10, 2)), 43, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (44, N'E栋', 1, 3, 302, CAST(0xC5430B00 AS Date), CAST(67.00 AS Decimal(10, 2)), CAST(98.00 AS Decimal(10, 2)), 44, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (45, N'E栋', 1, 3, 303, CAST(0xC5430B00 AS Date), CAST(87.00 AS Decimal(10, 2)), CAST(93.00 AS Decimal(10, 2)), 45, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (46, N'E栋', 1, 4, 401, CAST(0xC5430B00 AS Date), CAST(64.00 AS Decimal(10, 2)), CAST(99.00 AS Decimal(10, 2)), 46, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (47, N'E栋', 1, 4, 402, CAST(0xC5430B00 AS Date), CAST(84.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), 47, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (48, N'E栋', 1, 4, 403, CAST(0xC5430B00 AS Date), CAST(45.00 AS Decimal(10, 2)), CAST(130.00 AS Decimal(10, 2)), 48, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (49, N'E栋', 2, 2, 201, CAST(0xC5430B00 AS Date), CAST(78.00 AS Decimal(10, 2)), CAST(98.00 AS Decimal(10, 2)), 49, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (50, N'E栋', 2, 2, 202, CAST(0xC5430B00 AS Date), CAST(67.00 AS Decimal(10, 2)), CAST(98.00 AS Decimal(10, 2)), 50, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (51, N'E栋', 2, 2, 203, CAST(0xC5430B00 AS Date), CAST(14.00 AS Decimal(10, 2)), CAST(56.00 AS Decimal(10, 2)), 51, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (52, N'E栋', 2, 3, 301, CAST(0xC5430B00 AS Date), CAST(25.90 AS Decimal(10, 2)), CAST(67.90 AS Decimal(10, 2)), 52, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (53, N'E栋', 2, 3, 302, CAST(0xC5430B00 AS Date), CAST(25.66 AS Decimal(10, 2)), CAST(78.00 AS Decimal(10, 2)), 53, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (54, N'E栋', 2, 3, 303, CAST(0xC5430B00 AS Date), CAST(46.00 AS Decimal(10, 2)), CAST(99.00 AS Decimal(10, 2)), 54, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (55, N'E栋', 2, 4, 401, CAST(0xC5430B00 AS Date), CAST(23.00 AS Decimal(10, 2)), CAST(78.00 AS Decimal(10, 2)), 55, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (56, N'E栋', 2, 4, 402, CAST(0xC5430B00 AS Date), CAST(17.00 AS Decimal(10, 2)), CAST(79.90 AS Decimal(10, 2)), 56, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (57, N'E栋', 2, 4, 403, CAST(0xC5430B00 AS Date), CAST(26.80 AS Decimal(10, 2)), CAST(78.90 AS Decimal(10, 2)), 57, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (58, N'F栋', 1, 1, 101, CAST(0xC5430B00 AS Date), CAST(64.00 AS Decimal(10, 2)), CAST(78.00 AS Decimal(10, 2)), 58, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (59, N'F栋', 1, 1, 102, CAST(0xC5430B00 AS Date), CAST(34.60 AS Decimal(10, 2)), CAST(98.00 AS Decimal(10, 2)), 59, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (60, N'F栋', 1, 2, 201, CAST(0xC5430B00 AS Date), CAST(54.00 AS Decimal(10, 2)), CAST(98.00 AS Decimal(10, 2)), 60, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (61, N'F栋', 1, 2, 202, CAST(0xC5430B00 AS Date), CAST(35.60 AS Decimal(10, 2)), CAST(98.70 AS Decimal(10, 2)), 61, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (62, N'F栋', 1, 3, 301, CAST(0xC5430B00 AS Date), CAST(56.90 AS Decimal(10, 2)), CAST(120.30 AS Decimal(10, 2)), 62, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (63, N'F栋', 1, 3, 302, CAST(0xC5430B00 AS Date), CAST(67.00 AS Decimal(10, 2)), CAST(98.00 AS Decimal(10, 2)), 63, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (64, N'F栋', 2, 1, 101, CAST(0xC5430B00 AS Date), CAST(39.00 AS Decimal(10, 2)), CAST(96.00 AS Decimal(10, 2)), 64, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (65, N'F栋', 2, 1, 102, CAST(0xC5430B00 AS Date), CAST(37.00 AS Decimal(10, 2)), CAST(69.00 AS Decimal(10, 2)), 65, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (66, N'F栋', 2, 2, 201, CAST(0xC5430B00 AS Date), CAST(19.60 AS Decimal(10, 2)), CAST(78.59 AS Decimal(10, 2)), 66, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (67, N'F栋', 2, 2, 202, CAST(0xC5430B00 AS Date), CAST(23.40 AS Decimal(10, 2)), CAST(98.40 AS Decimal(10, 2)), 67, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (68, N'F栋', 2, 3, 301, CAST(0xC5430B00 AS Date), CAST(41.00 AS Decimal(10, 2)), CAST(71.90 AS Decimal(10, 2)), 68, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (69, N'F栋', 2, 3, 302, CAST(0xC5430B00 AS Date), CAST(32.00 AS Decimal(10, 2)), CAST(76.00 AS Decimal(10, 2)), 69, 6)
GO
SET IDENTITY_INSERT [dbo].[fang] OFF
GO


SET IDENTITY_INSERT [dbo].[fankui] ON 

GO
INSERT [dbo].[fankui] ([id], [userid], [bossid], [zhuti], [miaoshu], [date], [type], [huifu]) VALUES (10001, 1, 1, N'维修', N'把楼宇口关不住的门修一下换一下，不要一直等过保修期，等启用维保基金再修。建议启用楼宇门口的锁子。现在楼道里啥人都能进去。门上小广告都快贴满了。和小区5星物业不符合。', CAST(0x0000AEB100F29255 AS DateTime), 2, NULL)
GO
INSERT [dbo].[fankui] ([id], [userid], [bossid], [zhuti], [miaoshu], [date], [type], [huifu]) VALUES (10002, 1, 1, N'增加设备', N'桃园小区里老人和小孩居多。建议再给多安装一个儿童玩的设施。和健身设备。比如滑滑梯。这个大一个小区只有一个滑滑梯。那么多小孩每天抢一个玩。', CAST(0x0000AEB100F82836 AS DateTime), 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[fankui] OFF
GO

SET IDENTITY_INSERT [dbo].[chongzhi] ON 

GO
INSERT [dbo].[chongzhi] ([id], [userid], [bossid], [money], [houmoney], [date]) VALUES (10000, 1, 1, CAST(1000.00 AS Decimal(10, 2)), CAST(2748.74 AS Decimal(10, 2)), CAST(0x0000AEB100EE753C AS DateTime))
GO
INSERT [dbo].[chongzhi] ([id], [userid], [bossid], [money], [houmoney], [date]) VALUES (10001, 2, 1, CAST(1204.00 AS Decimal(10, 2)), CAST(3433.76 AS Decimal(10, 2)), CAST(0x0000AEB100EEF572 AS DateTime))
GO
INSERT [dbo].[chongzhi] ([id], [userid], [bossid], [money], [houmoney], [date]) VALUES (10002, 3, 1, CAST(1500.00 AS Decimal(10, 2)), CAST(2269.39 AS Decimal(10, 2)), CAST(0x0000AEB100F98C2D AS DateTime))
GO
INSERT [dbo].[chongzhi] ([id], [userid], [bossid], [money], [houmoney], [date]) VALUES (10003, 4, 1, CAST(800.00 AS Decimal(10, 2)), CAST(1555.45 AS Decimal(10, 2)), CAST(0x0000AEB100F9E47C AS DateTime))
GO
INSERT [dbo].[chongzhi] ([id], [userid], [bossid], [money], [houmoney], [date]) VALUES (10004, 5, 1, CAST(590.00 AS Decimal(10, 2)), CAST(1447.41 AS Decimal(10, 2)), CAST(0x0000AEB100FA3739 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[chongzhi] OFF
GO

