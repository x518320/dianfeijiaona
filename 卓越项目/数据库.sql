select * from [User]
select * from [dbo].[boss] 
select * from[dbo].[fang]
select * from[dbo].[order] 
select * from[dbo].[zhuce]
select * from[dbo].[fankui] 
select * from [dbo].[chongzhi]

update [User]set url='/Images/�û�ͷ��/Ĭ��.png'


update [User] set [money]=5000,findtime='2022-4-1'
update fang set datetiem='2021-4-1' ,up=1000,dianliang=2000 
delete from [order]


--�û���
create table [User](
id int primary key identity(1,1),--id
name nvarchar(50) ,--�û���
phone nvarchar(50) ,--�ֻ���
pwd nvarchar(50), --����
[time] datetime, --��¼ʱ��
[money] decimal(10,2), --�˻����
findtime datetime, --��ѯ���ʱ��
url nvarchar(600) --ͷ���ַ
)
select * from [user]
--����Ա��
create table boss(
id int primary key identity(1,1),--id
name nvarchar(50) ,--�û���
phone nvarchar(50) ,--�ֻ���
pwd nvarchar(50), --����
dianjia decimal(10,2),	--���
)
--ע��� --��Ҫ����Աͬ��,����ӽ��û���,�����������Ӧ����,Ȼ���������ɾ��
create table zhuce(
id int primary key identity(1,1),--id
name nvarchar(50) ,--�û���
phone nvarchar(50) ,--�ֻ���
pwd nvarchar(50), --����
[time] datetime, --�ύʱ��
bossid int foreign key (bossid) references boss(id), --����Աid
[type] int --�Ƿ����� ,0��û��,1���Ѿ�����

)

--¥���
create table fang(
id int primary key identity(1,1),--id
dong nvarchar(50),--A��,B��
danyuan int, --��Ԫ
louceng int, --¥
fangjian int, --�����
datetiem date,--�ϴνɷ�ʱ��
up decimal(10,2) ,--�ϴνɷѵĵ���
dianliang decimal(10,2),--����ϵĵ���
userid int foreign key (userid) references [User](id) ,--�û�id
bossid int foreign key (bossid) references  boss(id)--����Աid
)
select * from fang
--�ɷѼ�¼��
create table [order](
id int primary key identity(10000,1),--id
bossid int foreign key (bossid) references  boss(id),--����Աid
userid int foreign key (userid) references [User](id),--�û�id
fangid int foreign key (fangid) references fang(id) ,--����id
up decimal(10,2),--�ϴ�ֹ��
[now] decimal(10,2),--����ֹ��
dianjia decimal(10,2),	--���
[money]  decimal(10,2),--�ɷѽ��
[date] datetime,--�ɷ�ʱ��
)

--��ֵ��¼��
create table chongzhi(
id int primary key identity(10000,1),
userid int foreign key (userid) references [User](id),--�û�id
bossid int foreign key (bossid) references  boss(id),--����Աid
[money]  decimal(10,2),--��ֵ���
[houmoney]  decimal(10,2),--��ֵ��Ľ��
[date] datetime,--�ɷ�ʱ��
)

--�û�������
create table fankui(
id int primary key identity(10000,1),
userid int foreign key (userid) references [User](id),--�û�id
bossid int foreign key (bossid) references  boss(id),--����Աid
zhuti nvarchar(100) ,--����
miaoshu nvarchar(600),--����
[date] datetime,--ʱ��
[type] int,--�Ƿ����� ,0��û����,1�����������û���û��,2���û��ѿ�
huifu nvarchar(600),--�ظ�
)

USE [Demo]
GO
SET IDENTITY_INSERT [dbo].[User] ON 

GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (1, N'�ΰ�÷', N'19878907890', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(665.69 AS Decimal(10, 2)), CAST(N'2022-05-04 11:08:02.597' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (2, N'��־��', N'16626552655', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (3, N'�ڹ�', N'13638801992', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (4, N'������', N'13928783383', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(0.00 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (5, N'������', N'15665666339', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(20.00 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (6, N'�����', N'18982072555', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(45.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (7, N'������', N'13250699993', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (8, N'�޺���', N'18666888221', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (9, N'��ƽ', N'15521964888', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (10, N'���', N'13949023216', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (11, N'�޾�ΰ', N'13949023216', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (12, N'����־', N'13938467952', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (13, N'л־��', N'13034888821', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (14, N'������', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (15, N'������', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (16, N'³ȫ��', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (17, N'������', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (18, N'����ˮ', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (19, N'����ʤ', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (20, N'����', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (21, N'����', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (22, N'����', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (23, N'���', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (24, N'����', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (25, N'����', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (26, N'����', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (27, N'������', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (28, N'����', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (29, N'���Ӣ', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (30, N'����', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (31, N'������', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (32, N'�Ž���', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (33, N'���', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (34, N'������', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (35, N'�Ծ�', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (36, N'����', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (37, N'�', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (38, N'������', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (39, N'�÷', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (40, N'������', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (41, N'������', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (42, N'������', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (43, N'����', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (44, N'������', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (45, N'�ŷ�', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (46, N'�Ź�֥', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (47, N'����', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (48, N'������', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (49, N'������', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (50, N'���', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (51, N'���绪', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (52, N'����', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (53, N'������', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (54, N'���', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (55, N'������', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (56, N'������', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (57, N'������', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (58, N'���', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (59, N'����', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (60, N'����', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (61, N'����', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (62, N'�׽�', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (63, N'����', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (64, N'����', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (65, N'����', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (66, N'�غ�', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (67, N'ܲ��', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (68, N'��̩', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[User] ([id], [name], [phone], [pwd], [time], [money], [findtime]) VALUES (69, N'��ï', N'12345678912', N'123', CAST(N'2022-05-04 11:08:02.597' AS DateTime), CAST(78.90 AS Decimal(10, 2)), CAST(N'2022-05-03 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[boss] ON 

GO
INSERT [dbo].[boss] ([id], [name], [phone], [pwd], [dianjia]) VALUES (1, N'������', N'12345678912', N'123', CAST(0.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[boss] ([id], [name], [phone], [pwd], [dianjia]) VALUES (2, N'����', N'12345678912', N'123', CAST(23.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[boss] ([id], [name], [phone], [pwd], [dianjia]) VALUES (3, N'������', N'12345678912', N'123', CAST(12.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[boss] ([id], [name], [phone], [pwd], [dianjia]) VALUES (4, N'����', N'12345678923', N'123', CAST(17.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[boss] ([id], [name], [phone], [pwd], [dianjia]) VALUES (5, N'����', N'12345678934', N'123', CAST(21.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[boss] ([id], [name], [phone], [pwd], [dianjia]) VALUES (6, N'�Ŵ�ѫ', N'12345678956', N'123', CAST(1.20 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[boss] OFF
GO
SET IDENTITY_INSERT [dbo].[fang] ON 

GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (1, N'A��', 1, 2, 201, CAST(0xC5430B00 AS Date), CAST(10.00 AS Decimal(10, 2)), CAST(821.04 AS Decimal(10, 2)), 1, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (2, N'A��', 1, 2, 202, CAST(0xC5430B00 AS Date), CAST(20.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), 2, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (3, N'A��', 1, 2, 203, CAST(0xC5430B00 AS Date), CAST(20.30 AS Decimal(10, 2)), CAST(34.00 AS Decimal(10, 2)), 3, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (4, N'A��', 1, 3, 301, CAST(0xC5430B00 AS Date), CAST(30.00 AS Decimal(10, 2)), CAST(50.40 AS Decimal(10, 2)), 4, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (5, N'A��', 1, 3, 302, CAST(0xC5430B00 AS Date), CAST(35.00 AS Decimal(10, 2)), CAST(100.20 AS Decimal(10, 2)), 5, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (6, N'A��', 1, 3, 303, CAST(0xC5430B00 AS Date), CAST(66.00 AS Decimal(10, 2)), CAST(120.30 AS Decimal(10, 2)), 6, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (7, N'A��', 1, 4, 401, CAST(0xC5430B00 AS Date), CAST(55.65 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), 7, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (8, N'A��', 1, 4, 402, CAST(0xC5430B00 AS Date), CAST(17.00 AS Decimal(10, 2)), CAST(37.00 AS Decimal(10, 2)), 8, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (9, N'A��', 1, 4, 403, CAST(0xC5430B00 AS Date), CAST(99.80 AS Decimal(10, 2)), CAST(400.80 AS Decimal(10, 2)), 9, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (10, N'A��', 2, 2, 201, CAST(0xC5430B00 AS Date), CAST(37.00 AS Decimal(10, 2)), CAST(57.00 AS Decimal(10, 2)), 10, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (11, N'A��', 2, 2, 202, CAST(0xC5430B00 AS Date), CAST(46.00 AS Decimal(10, 2)), CAST(66.00 AS Decimal(10, 2)), 11, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (12, N'A��', 2, 3, 301, CAST(0xC5430B00 AS Date), CAST(59.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), 12, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (13, N'A��', 2, 3, 302, CAST(0xC5430B00 AS Date), CAST(78.00 AS Decimal(10, 2)), CAST(90.00 AS Decimal(10, 2)), 13, 1)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (14, N'B��', 1, 2, 201, CAST(0xC5430B00 AS Date), CAST(200.00 AS Decimal(10, 2)), CAST(430.00 AS Decimal(10, 2)), 14, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (15, N'B��', 1, 2, 202, CAST(0xC5430B00 AS Date), CAST(69.90 AS Decimal(10, 2)), CAST(100.90 AS Decimal(10, 2)), 15, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (16, N'B��', 1, 2, 203, CAST(0xC5430B00 AS Date), CAST(57.00 AS Decimal(10, 2)), CAST(89.00 AS Decimal(10, 2)), 16, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (17, N'B��', 1, 3, 301, CAST(0xC5430B00 AS Date), CAST(89.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), 17, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (18, N'B��', 1, 3, 302, CAST(0xC5430B00 AS Date), CAST(170.90 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), 18, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (19, N'B��', 1, 3, 303, CAST(0xC5430B00 AS Date), CAST(240.90 AS Decimal(10, 2)), CAST(500.90 AS Decimal(10, 2)), 19, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (20, N'B��', 2, 2, 201, CAST(0xC5430B00 AS Date), CAST(69.00 AS Decimal(10, 2)), CAST(690.00 AS Decimal(10, 2)), 20, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (21, N'B��', 2, 2, 202, CAST(0xC5430B00 AS Date), CAST(78.00 AS Decimal(10, 2)), CAST(278.00 AS Decimal(10, 2)), 21, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (22, N'B��', 2, 2, 203, CAST(0xC5430B00 AS Date), CAST(98.00 AS Decimal(10, 2)), CAST(178.00 AS Decimal(10, 2)), 22, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (23, N'B��', 2, 3, 301, CAST(0xC5430B00 AS Date), CAST(67.98 AS Decimal(10, 2)), CAST(234.44 AS Decimal(10, 2)), 23, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (24, N'B��', 2, 3, 302, CAST(0xC5430B00 AS Date), CAST(49.00 AS Decimal(10, 2)), CAST(323.90 AS Decimal(10, 2)), 24, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (25, N'B��', 2, 3, 303, CAST(0xC5430B00 AS Date), CAST(56.00 AS Decimal(10, 2)), CAST(145.00 AS Decimal(10, 2)), 25, 2)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (26, N'C��', 1, 2, 201, CAST(0xC5430B00 AS Date), CAST(77.00 AS Decimal(10, 2)), CAST(177.00 AS Decimal(10, 2)), 26, 3)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (27, N'C��', 1, 2, 202, CAST(0xC5430B00 AS Date), CAST(64.00 AS Decimal(10, 2)), CAST(278.00 AS Decimal(10, 2)), 27, 3)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (28, N'C��', 1, 2, 203, CAST(0xC5430B00 AS Date), CAST(56.00 AS Decimal(10, 2)), CAST(156.00 AS Decimal(10, 2)), 28, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (29, N'C��', 1, 3, 301, CAST(0xC5430B00 AS Date), CAST(45.00 AS Decimal(10, 2)), CAST(78.00 AS Decimal(10, 2)), 29, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (30, N'C��', 1, 3, 302, CAST(0xC5430B00 AS Date), CAST(56.00 AS Decimal(10, 2)), CAST(99.89 AS Decimal(10, 2)), 30, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (31, N'C��', 1, 3, 303, CAST(0xC5430B00 AS Date), CAST(87.00 AS Decimal(10, 2)), CAST(195.69 AS Decimal(10, 2)), 31, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (32, N'C��', 2, 2, 201, CAST(0xC5430B00 AS Date), CAST(36.00 AS Decimal(10, 2)), CAST(87.00 AS Decimal(10, 2)), 32, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (33, N'C��', 2, 2, 202, CAST(0xC5430B00 AS Date), CAST(78.00 AS Decimal(10, 2)), CAST(90.00 AS Decimal(10, 2)), 33, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (34, N'C��', 2, 2, 203, CAST(0xC5430B00 AS Date), CAST(77.89 AS Decimal(10, 2)), CAST(91.00 AS Decimal(10, 2)), 34, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (35, N'C��', 2, 3, 301, CAST(0xC5430B00 AS Date), CAST(80.00 AS Decimal(10, 2)), CAST(180.00 AS Decimal(10, 2)), 35, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (36, N'C��', 2, 3, 302, CAST(0xC5430B00 AS Date), CAST(79.00 AS Decimal(10, 2)), CAST(95.89 AS Decimal(10, 2)), 36, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (37, N'C��', 2, 3, 303, CAST(0xC5430B00 AS Date), CAST(95.00 AS Decimal(10, 2)), CAST(289.00 AS Decimal(10, 2)), 37, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (38, N'D��', 1, 1, 101, CAST(0xC5430B00 AS Date), CAST(135.89 AS Decimal(10, 2)), CAST(467.89 AS Decimal(10, 2)), 38, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (39, N'D��', 2, 1, 101, CAST(0xC5430B00 AS Date), CAST(178.69 AS Decimal(10, 2)), CAST(367.90 AS Decimal(10, 2)), 39, 4)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (40, N'E��', 1, 2, 201, CAST(0xC5430B00 AS Date), CAST(35.00 AS Decimal(10, 2)), CAST(78.00 AS Decimal(10, 2)), 40, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (41, N'E��', 1, 2, 202, CAST(0xC5430B00 AS Date), CAST(45.00 AS Decimal(10, 2)), CAST(98.00 AS Decimal(10, 2)), 41, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (42, N'E��', 1, 2, 203, CAST(0xC5430B00 AS Date), CAST(67.00 AS Decimal(10, 2)), CAST(98.90 AS Decimal(10, 2)), 42, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (43, N'E��', 1, 3, 301, CAST(0xC5430B00 AS Date), CAST(45.00 AS Decimal(10, 2)), CAST(78.00 AS Decimal(10, 2)), 43, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (44, N'E��', 1, 3, 302, CAST(0xC5430B00 AS Date), CAST(67.00 AS Decimal(10, 2)), CAST(98.00 AS Decimal(10, 2)), 44, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (45, N'E��', 1, 3, 303, CAST(0xC5430B00 AS Date), CAST(87.00 AS Decimal(10, 2)), CAST(93.00 AS Decimal(10, 2)), 45, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (46, N'E��', 1, 4, 401, CAST(0xC5430B00 AS Date), CAST(64.00 AS Decimal(10, 2)), CAST(99.00 AS Decimal(10, 2)), 46, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (47, N'E��', 1, 4, 402, CAST(0xC5430B00 AS Date), CAST(84.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), 47, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (48, N'E��', 1, 4, 403, CAST(0xC5430B00 AS Date), CAST(45.00 AS Decimal(10, 2)), CAST(130.00 AS Decimal(10, 2)), 48, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (49, N'E��', 2, 2, 201, CAST(0xC5430B00 AS Date), CAST(78.00 AS Decimal(10, 2)), CAST(98.00 AS Decimal(10, 2)), 49, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (50, N'E��', 2, 2, 202, CAST(0xC5430B00 AS Date), CAST(67.00 AS Decimal(10, 2)), CAST(98.00 AS Decimal(10, 2)), 50, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (51, N'E��', 2, 2, 203, CAST(0xC5430B00 AS Date), CAST(14.00 AS Decimal(10, 2)), CAST(56.00 AS Decimal(10, 2)), 51, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (52, N'E��', 2, 3, 301, CAST(0xC5430B00 AS Date), CAST(25.90 AS Decimal(10, 2)), CAST(67.90 AS Decimal(10, 2)), 52, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (53, N'E��', 2, 3, 302, CAST(0xC5430B00 AS Date), CAST(25.66 AS Decimal(10, 2)), CAST(78.00 AS Decimal(10, 2)), 53, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (54, N'E��', 2, 3, 303, CAST(0xC5430B00 AS Date), CAST(46.00 AS Decimal(10, 2)), CAST(99.00 AS Decimal(10, 2)), 54, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (55, N'E��', 2, 4, 401, CAST(0xC5430B00 AS Date), CAST(23.00 AS Decimal(10, 2)), CAST(78.00 AS Decimal(10, 2)), 55, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (56, N'E��', 2, 4, 402, CAST(0xC5430B00 AS Date), CAST(17.00 AS Decimal(10, 2)), CAST(79.90 AS Decimal(10, 2)), 56, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (57, N'E��', 2, 4, 403, CAST(0xC5430B00 AS Date), CAST(26.80 AS Decimal(10, 2)), CAST(78.90 AS Decimal(10, 2)), 57, 5)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (58, N'F��', 1, 1, 101, CAST(0xC5430B00 AS Date), CAST(64.00 AS Decimal(10, 2)), CAST(78.00 AS Decimal(10, 2)), 58, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (59, N'F��', 1, 1, 102, CAST(0xC5430B00 AS Date), CAST(34.60 AS Decimal(10, 2)), CAST(98.00 AS Decimal(10, 2)), 59, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (60, N'F��', 1, 2, 201, CAST(0xC5430B00 AS Date), CAST(54.00 AS Decimal(10, 2)), CAST(98.00 AS Decimal(10, 2)), 60, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (61, N'F��', 1, 2, 202, CAST(0xC5430B00 AS Date), CAST(35.60 AS Decimal(10, 2)), CAST(98.70 AS Decimal(10, 2)), 61, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (62, N'F��', 1, 3, 301, CAST(0xC5430B00 AS Date), CAST(56.90 AS Decimal(10, 2)), CAST(120.30 AS Decimal(10, 2)), 62, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (63, N'F��', 1, 3, 302, CAST(0xC5430B00 AS Date), CAST(67.00 AS Decimal(10, 2)), CAST(98.00 AS Decimal(10, 2)), 63, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (64, N'F��', 2, 1, 101, CAST(0xC5430B00 AS Date), CAST(39.00 AS Decimal(10, 2)), CAST(96.00 AS Decimal(10, 2)), 64, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (65, N'F��', 2, 1, 102, CAST(0xC5430B00 AS Date), CAST(37.00 AS Decimal(10, 2)), CAST(69.00 AS Decimal(10, 2)), 65, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (66, N'F��', 2, 2, 201, CAST(0xC5430B00 AS Date), CAST(19.60 AS Decimal(10, 2)), CAST(78.59 AS Decimal(10, 2)), 66, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (67, N'F��', 2, 2, 202, CAST(0xC5430B00 AS Date), CAST(23.40 AS Decimal(10, 2)), CAST(98.40 AS Decimal(10, 2)), 67, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (68, N'F��', 2, 3, 301, CAST(0xC5430B00 AS Date), CAST(41.00 AS Decimal(10, 2)), CAST(71.90 AS Decimal(10, 2)), 68, 6)
GO
INSERT [dbo].[fang] ([id], [dong], [danyuan], [louceng], [fangjian], [datetiem], [up], [dianliang], [userid], [bossid]) VALUES (69, N'F��', 2, 3, 302, CAST(0xC5430B00 AS Date), CAST(32.00 AS Decimal(10, 2)), CAST(76.00 AS Decimal(10, 2)), 69, 6)
GO
SET IDENTITY_INSERT [dbo].[fang] OFF
GO


SET IDENTITY_INSERT [dbo].[fankui] ON 

GO
INSERT [dbo].[fankui] ([id], [userid], [bossid], [zhuti], [miaoshu], [date], [type], [huifu]) VALUES (10001, 1, 1, N'ά��', N'��¥��ڹز�ס������һ�»�һ�£���Ҫһֱ�ȹ������ڣ�������ά���������ޡ���������¥���ſڵ����ӡ�����¥����ɶ�˶��ܽ�ȥ������С��涼�������ˡ���С��5����ҵ�����ϡ�', CAST(0x0000AEB100F29255 AS DateTime), 2, NULL)
GO
INSERT [dbo].[fankui] ([id], [userid], [bossid], [zhuti], [miaoshu], [date], [type], [huifu]) VALUES (10002, 1, 1, N'�����豸', N'��԰С�������˺�С���Ӷࡣ�����ٸ��లװһ����ͯ�����ʩ���ͽ����豸�����绬���ݡ������һ��С��ֻ��һ�������ݡ���ô��С��ÿ����һ���档', CAST(0x0000AEB100F82836 AS DateTime), 0, NULL)
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

