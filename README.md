# 一、项目介绍

## 项目简介

使用jsp、layui、mysql完成的图书馆系统，包含用户图书借阅、图书管理员、系统管理员界面，功能齐全。

开发工具为eclipse，其中mysql为5.7（mysql8也行）

**演示地址**：http://library.mingyuefusu.cn

**最新代码存放在码云：https://gitee.com/mingyuefusu/tushuguanlixitong**

`（谢谢手下留情）`

**用户账号密码：1805010219    1234**

**图书管理员账号密码：root  1234**

**系统管理员账号密码：admin admin**

如果遇到解决不了的问题或需要课设相关文档，请添加Q群1021590105

## 项目详细介绍

本图书管理系统总体上分为前台页面显示和后台管理。

前台页面（即本书图书管理系统的首页）实现了公告的显示，图书查询，留言建议三大主要功能，有读者规则查看功能，师生们可以看到图书管理人员发布的最新公告信息，并可以查询自己感兴趣的图书，查看留言提议，用户登录后还有个人资料修改、个人借阅信息查询、个人违章信息查询等功能，也可以给学校的图书管理人员留言提议。

后台的页面则集成了图书管理中所需的功能，分成图书管理人员和系统管理人员，平时管理人员的工作都是在后台中完成的。前台是为了师生显示的。相对应的后台是针对学校图书管理人员，后台的页面都加密，如果不正常登录是进入不了后台管理页面的，后台图书管理人员功能包括：借阅图书、归还图书、借书记录显示与查找、还书记录显示与查找、公告增删改查；后台系统管理员功能包括：对书籍的增删改查、对书籍分类的增删改、对借阅证的增删改查、对借阅信息的显示与查找、对借阅规则的增删改、对图书管理员的增删改、对近期借阅书籍数量的折线图显示，以及对这些表格数据进行Excel表格的输出

共包含三个大模块：用户、图书管理员、系统管理员

### 一、用户模块

1. 查看公告：能看到图书管理员发布的公告信息。
2. 图书查看：分页显示，能看到图书总览，能通过图书编号、图书名称、作者、存放位置、图书描述进行模糊查询
3. 个人违章信息（登录后）：个人历史违章信息与查询
4. 图书馆读者留言（登录后）：对图书馆的建议，或对书籍的评价
5. 查看借阅规则：不同的规则有不同的借阅限定数量、限定时间、超期费用
6. 个人信息（登录后）：对个人信息的查看与登录密码的修改
7. 个人借阅信息（登录后）：对个人借阅记录的分页查看与查询

### 二、图书管理员模块

1. 借还图书：帮助用户借阅图书，并判断符不符合借阅规则、返还图书时判断有没有超期，超期则输出超期费用再归还
2. 借阅报表：分页显示所有借阅记录、能进行查询和输出结果到excel公告管理：能添加编辑和删除公告
3. 还书报表：分页显示所有未还的书籍，能通过借阅证号、图书编号、借阅日期、截止日期等条件进行模糊查询
4. 个人信息修改：修改个人信息、密码等

### 三、系统管理员模块

1. 书籍管理：分页，新添图书，设置图书各种信息，编辑删除，通过编号、书名、作者、描述等进行搜索，输出结果到excel，并且能查看该书籍被谁借阅过。
2. 分类管理：分页显示，增删改书籍分类，书籍分类方便查阅整理
3. 借阅证管理：分页显示所有借阅证，增删改查用户借阅证，查看该借阅证所有的借阅记录
4. 借阅规则管理：能显示、编辑、删除所有借阅规则，借阅规则将决定该图书证能借阅什么图书馆的图书，能借多少本，能借多久以及超期每天的费用。
5. 借阅信息查询：分页显示，能条件查询超期没还的，根据编号、借阅证号、书籍编号、借阅日期等进行模糊查询，输出结果到excel等，系统管理员只能查询，不能增删改借阅信息，这个操作由图书管理员操作。
6. 图书管理员管理：对图书管理员进行增删改操作，但是不能修改原来的账号
7. 图书借阅统计：通过折线图将图书馆近30天的每天借阅书籍数量直观的显示出来。

### sql表
共有十张数据库表，书籍表、借书记录表、留言表、系统管理员表、借阅证表、图书管理管理员表书籍分类表、图书馆表、借阅规则表、公告表
- 书籍表
    - 编号、姓名、作者、存放的图书馆、分类编号、存放位置、是否借出、书籍描述

- 借书记录表
    - 编号、借阅证编号、书籍编号、借书日期、限制日期、归还日期、违规描述、处理人编号

- 留言表
	- 编号、借阅证编号、留言内容、留言日期

- 系统管理员表
	- 账号、密码

- 借阅证表
	- 编号、密码、借阅者姓名、规则编号、状态（丢失、可用）

- 图书管理员表
	- 编号、姓名、账号、密码、邮箱

- 书籍分类表
	- 编号、分类名、分类描述

- 图书馆表
	- 编号、图书馆名、描述

- 规则表
	- 编号、限制借阅数量、限制借阅天数、图书超期每天费用
    
- 公告表
    - 编号、标题、公告内容、发布日期

# 二、部署

将**library.sql文件导入mysql数据库**，并需要修改以下两个数据库连接相关属性（数据库账号密码、数据库表名）

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/image-20201117122227215.png)

# 三、项目演示

## 用户

**图书查询**

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/image-20201117124235584.png)



![](https://ming-edu.oss-cn-beijing.aliyuncs.com/1605588101413.png)

其他省略

## 图书管理员

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/1605588522320.png)

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/image-20201117124314632.png)

## 系统管理员

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/1605586686520.png)

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/1605588740472.png)

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/1605588792283.png)

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/1605586708802.png)

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/1605586720887.png)

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/1605586727919.png)

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/1605586733759.png)

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/1605586739400.png)

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/1605588836223.png)

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/1605586754111.png)

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/1605588810178.png)

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/1605586772278.png)

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/1605586779311.png)

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/1605586784032.png)

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/1605586790655.png)

![](https://ming-edu.oss-cn-beijing.aliyuncs.com/1605586794872.png)
