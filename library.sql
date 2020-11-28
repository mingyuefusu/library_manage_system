/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : library

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-06-13 20:31:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'e7ef63bc4c950228aa049fc02d2ec291');
INSERT INTO `admin` VALUES ('root', 'e7ef63bc4c950228aa049fc02d2ec291');

-- ----------------------------
-- Table structure for `announcement`
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '告示标题',
  `detail` varchar(2000) DEFAULT NULL COMMENT '告示内容',
  `publish_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES ('1', '图书系统开始建设', '图书系统开始建设', '2020-06-02 22:28:31');
INSERT INTO `announcement` VALUES ('2', '图书系统正在建设', '图书系统正在建设，冲鸭', '2020-06-02 08:29:40');
INSERT INTO `announcement` VALUES ('3', '图书管理系统基本建成', '庆祝图书管理系统基本建成', '2020-06-09 16:43:18');

-- ----------------------------
-- Table structure for `books`
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `library_id` int(20) DEFAULT NULL,
  `sort_id` int(30) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('1', '夏洛特烦恼', '夏洛', '1', '1', '4asdfa23', '1', '<p>我也特烦恼!!!!<br></p>');
INSERT INTO `books` VALUES ('2', '植发的价格', '江湖老中医', '2', '2', '5sdfs1', '0', '详细介绍每植一根发多少钱？');
INSERT INTO `books` VALUES ('3', '代码的力量', '明月复苏', '2', '3', '234as', '1', '<p>神不知鬼不觉的拔掉你的头发<br></p>');
INSERT INTO `books` VALUES ('4', 'java从入门到入土', '明月复苏', '2', '3', 'sdfs33', '1', '无简介');
INSERT INTO `books` VALUES ('5', '图书馆章程', '明月复苏', '1', '5', '234sdfs', '1', '图书馆章程');
INSERT INTO `books` VALUES ('6', '图书馆建设', '吸尘羊', '1', '5', '23dgdff', '0', '图书馆建设！');
INSERT INTO `books` VALUES ('7', '学习如何跑路', '明月复苏', '1', '7', '2sdsa', '1', '<p>学习如何跑路</p>');
INSERT INTO `books` VALUES ('8', '美好课设', '匿名', '1', '8', '23432s', '1', '做梦');
INSERT INTO `books` VALUES ('9', '中国童话', '刘丽朵', '1', '9', '6sdf11', '1', '这是一本给孩子的中国童话故事集。以“非教训的无意思、空灵的幻想、快活的嬉笑、纯净的诗意、悠远的生命体味”为选篇标准，从《搜神记》《太平广记》《聊斋志异》《酉阳杂俎》等近30本经典作品中，精心挑选45篇符合现代审美、适合孩子阅读的故事；故事蕴涵着丰富的想象力与趣味性；用简美的现代语言，全新讲述中国童话故事；搭配符合故事主题的原创古风插画，带孩子进入奇幻浪漫的童话世界。');
INSERT INTO `books` VALUES ('10', '人生删除事务所', '本多孝好', '1', '7', '22sdf1', '1', '你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所');
INSERT INTO `books` VALUES ('11', '飞鸟集', '拉宾德拉纳特·泰戈尔', '1', '10', '23sdf12', '1', '《飞鸟集》是泰戈尔的代表作之一，也是世界上最杰出的诗集之一。白昼和黑夜、溪流和海洋、自由和背叛，都在泰戈尔的笔下合而为一，短小的语句道出了深刻的人生哲理，引领世人探寻真理和智慧的源泉。初读这些诗篇，如同在暴风雨过后的初夏清晨，推开卧室的窗户，看到一个淡泊清透的世界，一切都是那样清新、亮丽，可是其中的韵味却很厚实，耐人寻味。');
INSERT INTO `books` VALUES ('12', '声音中的另一种语言', '伊夫·博纳富瓦', '1', '10', '23sdf2', '1', '在本书中，我们会读到这位诗人翻译家从自己的写作和翻译经验出发，对诗及诗的翻译的特殊性与重要性的阐述，对某些诗歌译作的批评，对译者处境与任务的思考，以及对不同语言的诗歌的独特见解……总而言之，在博纳富瓦看来，诗，我们在声音中触及的另一种语言，是存在僭越概念性日常言语，书写生命真实“在场”的语言，诗的语言不同于世上其他一切语言，它斟酌词语，倾听节奏，“一首诗歌（poème）的诗（poésie）以一种声音（voix）的方式走向读者”。诗的翻译是可能的，但不同于其他任何翻译，只能以独特的方式进行：“诗歌唯一需要忠实的是‘在场’”，译者要保留诗意，便要倾听词语的音乐，重新经历诗人用声音勾起的关于“在场”的记忆，用自己的语言和存在经验去重构、去分享原诗的“在场”。诗的翻译应当受到重视，通过诗的翻译，处于两种语言间隙的译者和另一种语言的读者能够对虚幻的概念性言语提出质疑，在进一步自我批评的同时重新思考与异的关系，从而探寻真实的生活与场所，与自己真实的信念相遇。');
INSERT INTO `books` VALUES ('13', '诗经', '孔丘', '1', '10', '23sdf3', '1', '这本《诗经》收录全部305篇，每篇诗歌都配有相应的解释及译文，使读者更容易理解');
INSERT INTO `books` VALUES ('14', '海子的诗', '海子', '1', '10', '23sdf4', '1', '本书收录了已故诗人海子的诗作精华，其诗以独特的风格深受读者的喜爱，从这些诗中反映出诗人那对于一切美好事物的眷恋之情，对于生命的世俗和崇高的激动和关怀。');
INSERT INTO `books` VALUES ('15', '剧变', '[美] 贾雷德·戴蒙德 ', '2', '11', '2342sdf', '1', '<p>&nbsp; 《剧变》探讨了一个当前人类社会面临的重大问题：当危机来临时，我们该如何应对？从个人视角而言，危机可以改变一个人的成长轨迹，如处理不当，终其一生会生活在负面情绪中。对于整个人类社会而言，危机可使一种文明没落、一个国家解体、一个时代终结。因此，如何分辨危机、应对危机，避免危机，化危机为机遇，实现个人和整个人类社会的剧变，是人类当下面临的主课题。普利策奖得主、《枪炮、病菌与钢铁》作者戴蒙德再一次发挥其历史叙事的顶级水准，带我们巡礼了各国在历史中的危机应对，并从社会学、心理学、经济学、生物进化等跨学科视角展现了人类自古以来何以应对危机的历史沿革，并谏言国家、企业及整个人类社会如何从个人应对危机的进化逻辑和生理变化中得到启示，以更加多维度的、宽视角地看待危机应对这一关乎人类未来的命题。</p>');
INSERT INTO `books` VALUES ('16', '七个疯子', '罗伯特·阿尔特 ', '2', '12', '234sae', '1', '<p><span class=\"all hidden\"></span></p><div class=\"intro\">\n    <p>◎ “是我想太多，还是这世界太疯狂？”</p>    <p>◎ 毒丽场域疯子们的“蛮荒故事”，纳粹等现代性之殇的神奇预言</p>    <p>◎ “阿根廷的陀思妥耶夫斯基”，拉美现代小说之父，罗伯特·阿尔特代表作</p>    <p>◎ 马尔克斯、博尔赫斯之先驱，胡里奥·科塔萨尔、罗伯特·波拉尼奥、胡安·卡洛斯·奥内蒂盛赞的伟大作家</p>    <p>——————————</p>    <p>本书是阿根廷著名作家罗伯特·阿尔特的长篇小说代表作，描述男主人公在社会底层挣扎并逐渐走向崩溃的过程。故事集中在三天时间，各色人物纷纷登场，从一件绑架案折射出20世纪20年代阿根廷乃至拉美的社会现实生活。作家以精湛的文笔对主人公进行了大量的心理描摹，并通过主人公的眼睛变形地透视了身边的现实和种种人物，其混乱怪诞之感，正应了魔幻现实主义的画风。有续集《喷火器》。</p>    <p>——————————</p>    <p>阿尔特无疑是一位伟大的作家……他是拉美第一位真正的都市小说家……这就是激发文学创作的力量。——《卫报》</p>    <p>他的视野与布宜诺斯艾利斯那一帮家伙昏暗而偏缘的视野从不可同日而语。——胡里奥·科塔萨尔</p>    <p>阿尔特是阿根廷现代小说之父，他是最重要、最伟大的阿根廷小说家。——里卡多·皮格利亚</p>    <p>如果这些海岸上有人能被称为文学天才的话，那一定是罗伯特·阿尔特……我在谈论一个将在时间长河中留下名字的小说家……难以置信，他还不为当今大众所熟知。——胡安·卡洛斯·奥内蒂</p>    <p>——————————</p>    <p>美洲西班牙语文学的另一重要特征即是它永恒的见证：暴力与不公平的见证，集体与个体的见证，现实与虚构的见证，往昔与现今的见证。在美洲，写作总是兼有诗意与政治的功能，写作从来不是一种无谓的游戏，即便在表面看来最形式化的表达中，它也从不逃遁于幻觉中。</p>    <p>——《理想藏书》</p></div><p></p>');
INSERT INTO `books` VALUES ('17', '走出唯一真理观', '陈嘉映', '1', '13', '234sdfd', '1', '<div class=\"intro\">\n    <p>★陈嘉映2007—2018自选文集。</p>    <p>★《何为良好生活》后新作，认真思考，认真表述这些思考，召唤爱思考的人来一道思考。</p>    <p>★在危机与纷争爆发的时代，哲学如何协助我们反思生活。“我们与其说需要共识，不如说需要学会，没有共识的人应该如何一起生存。”</p>    <p>本书是陈嘉映先生选编自己于2007—2018年间所作演讲、访谈与评论结集。</p>    <p>有不同的道，从前有不同的道，现在有不同的道，将来还有不同的道。重要的问题不是找到唯一的道，而是这些不同的道之间怎样呼应，怎样交流，怎样斗争。你要是坚持说，哲学要的就是唯一的真理体系，那我不得不说，哲学已经死了。</p>    <p>哲学，尤其今天的哲学，不是宣教式的，不是上智向下愚宣教。我们之所求，首先不是让别人明白，而是求自己明白。</p>    <p>“我个人想要的是，认真思考，认真表述这些思考，召唤爱思考的人来一道思考。”</p></div>');
INSERT INTO `books` VALUES ('18', '人类灭绝之后', '杜格尔·狄克逊', '1', '14', '234s', '1', '<p><span class=\"all hidden\"></span></p><p>《人类灭绝之后——未来世界动物图鉴》描绘了人类灭绝5000万年之后的动物世界。</p>    <p>本书分为十一个章节，前两章回顾了从生命进化之初到人类出现之后的物种进化历程；中间八章则根据狄克逊天马行空又有理有据的想象，推演出在人类灭绝之后的5000万年地球上，从热带到寒带、从雨林到苔原的动物进化可能，带领读者穿越时空，共同欣赏这颗星球上生命进化的壮观景象；最终章则畅想了在更遥远的未来生命终将归往何处。</p><p></p>');
INSERT INTO `books` VALUES ('19', '孩子们的诗', '果麦', '1', '10', 'sd2342', '1', '<p><span class=\"all hidden\"><div class=\"intro\">\n    <p>书中有灵气的诗句包括但不限于以下：</p>    <p>*我的眼睛／很小很小／有时遇到心事／就连两行泪／也装不下——陈科全， 八岁</p>    <p>*灯把黑夜／烫了一个洞——姜二嫚，七岁</p>    <p>*春天来了／我去小溪边砸冰／把春天砸得头破血流／直淌眼泪——铁头，八岁</p>    <p>*要是笑过了头／你就会飞到天上去／要想回到地面／你必须做一件伤心事——朵朵，五岁</p>    <p>*纸币在飘的时候，我们知道风在算钱。——王子乔，六岁</p>    <p>*你问我出生前在做什么／我答 我在天上挑妈妈——朱尔，八岁</p>    <p>*母亲提水桶／父亲提电脑／我想起／往日他们提着我在街上乱跑——王芗远，十二岁</p>    <p>*树枝想去撕裂天空，但却只戳了几个微小的窟窿，它透出天外的光亮，人们把它叫做月亮和星星。——顾城，十二岁</p>    <p>《孩子们的诗》，精选了七十多首等3－13岁小朋友写的诗。小诗人们来自北京、上海、广东、江苏、山东、广西、福建、内蒙古、新疆等全国各个地方。</p>    <p>从上万首诗作中脱颖而出，它们首先是好诗，其次才是孩子的诗。</p>    <p>本书还邀请了Starry阿星、飞行猴CF、九个妖、木可子、黄雷蕾Linali、苏寒、Lett Yice等二十多位国内知名插画家，为书中每一首诗歌创作了兼具美感与奇趣的插画。</p></div></span></p>');
INSERT INTO `books` VALUES ('20', '万物静默如谜', '维斯拉瓦•辛波斯卡', '1', '10', '5楼1室234', '1', '<div class=\"intro\">\n    <p>《辛波斯卡诗选：万物静默如谜》收录辛波斯卡各阶段名作75首，包括激发知名绘本作家幾米创作出《向左走，向右走》的《一见钟情》，收录高中语文教材的《底片》，网上广为流传的《在一颗小星星下》《种种可能》等，曾获得《洛杉矶时报》年度最佳图书。</p>    <p>辛波斯卡的诗取材于日常生活的事物和经验，甲虫、海参、石头、沙粒、天空；安眠药、履历表、衣服；电影、画作、剧场、梦境等等，在她的笔下无不焕发出新的诗意，让人们重新认识生活中常见的事物。</p></div>');
INSERT INTO `books` VALUES ('21', 'Python编程', '埃里克·马瑟斯', '1', '3', '4楼1室234', '1', '<p>本书是一本针对所有层次的Python 读者而作的Python 入门书。全书分两部分：第一部分介绍用Python \n编程所必须了解的基本概念，包括matplotlib、NumPy 和Pygal 等强大的Python 库和工具介绍，以及列表、字典、if \n语句、类、文件与异常、代码测试等内容；第二部分将理论付诸实践，讲解如何开发三个项目，包括简单的Python 2D \n游戏开发如何利用数据生成交互式的信息图，以及创建和定制简单的Web 应用，并帮读者解决常见编程问题和困惑。</p>');
INSERT INTO `books` VALUES ('24', '战斗', '战斗', '2', '1', '五楼234', '1', '<p>战斗</p>');
INSERT INTO `books` VALUES ('26', '124', '1243', '1', '2', '撒旦法', '1', '撒旦法');

-- ----------------------------
-- Table structure for `book_sort`
-- ----------------------------
DROP TABLE IF EXISTS `book_sort`;
CREATE TABLE `book_sort` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '' COMMENT '书籍类型名',
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_sort
-- ----------------------------
INSERT INTO `book_sort` VALUES ('1', '未分类', '不可删除');
INSERT INTO `book_sort` VALUES ('2', '护理', '护理护理');
INSERT INTO `book_sort` VALUES ('3', '编程', '编程编程');
INSERT INTO `book_sort` VALUES ('4', '艺术', '');
INSERT INTO `book_sort` VALUES ('5', '管理', null);
INSERT INTO `book_sort` VALUES ('6', '法律', null);
INSERT INTO `book_sort` VALUES ('7', '生活', null);
INSERT INTO `book_sort` VALUES ('8', '励志', '');
INSERT INTO `book_sort` VALUES ('9', '故事', null);
INSERT INTO `book_sort` VALUES ('10', '诗歌', null);
INSERT INTO `book_sort` VALUES ('11', '社会学', null);
INSERT INTO `book_sort` VALUES ('12', '文学', null);
INSERT INTO `book_sort` VALUES ('13', '哲学', null);
INSERT INTO `book_sort` VALUES ('14', '科学', null);
INSERT INTO `book_sort` VALUES ('16', '幽默', '');

-- ----------------------------
-- Table structure for `borrow_books`
-- ----------------------------
DROP TABLE IF EXISTS `borrow_books`;
CREATE TABLE `borrow_books` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `card_id` int(20) DEFAULT NULL,
  `book_id` int(20) DEFAULT NULL,
  `borrow_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `return_date` datetime DEFAULT NULL,
  `illegal` varchar(200) DEFAULT NULL,
  `manager_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrow_books
-- ----------------------------
INSERT INTO `borrow_books` VALUES ('20', '1805010202', '1', '2020-06-11 09:37:10', '2020-06-12 09:37:18', '2020-06-11 09:48:07', '', 'chen');
INSERT INTO `borrow_books` VALUES ('21', '1805010206', '5', '2020-04-08 09:37:40', '2020-06-08 09:38:14', '2020-06-11 10:50:07', '已逾期3天', 'chen');
INSERT INTO `borrow_books` VALUES ('22', '1805010207', '1', '2020-06-11 09:47:44', '2020-08-10 09:47:52', '2020-06-11 09:50:07', '', 'chen');
INSERT INTO `borrow_books` VALUES ('24', '1805010202', '1', '2020-06-02 09:55:04', '2020-06-03 09:55:16', '2020-06-11 09:56:02', '已逾期8天', 'chen');
INSERT INTO `borrow_books` VALUES ('25', '1805010204', '2', '2020-06-11 09:59:42', '2020-08-10 09:59:47', '2020-06-11 10:00:17', '', 'chen');
INSERT INTO `borrow_books` VALUES ('26', '1805010202', '1', '2020-06-09 10:01:13', '2020-06-10 10:01:48', '2020-06-11 10:07:29', '超期一天', 'chen');
INSERT INTO `borrow_books` VALUES ('27', '1805010202', '5', '2020-06-08 10:12:18', '2020-06-09 10:12:27', '2020-06-11 10:13:36', '已逾期2天', 'chen');
INSERT INTO `borrow_books` VALUES ('28', '1805010204', '2', '2020-04-07 10:12:28', '2020-06-06 10:12:41', null, null, null);
INSERT INTO `borrow_books` VALUES ('29', '1805010202', '6', '2020-06-11 08:19:56', '2020-06-12 08:20:07', null, null, null);

-- ----------------------------
-- Table structure for `borrow_card`
-- ----------------------------
DROP TABLE IF EXISTS `borrow_card`;
CREATE TABLE `borrow_card` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(20) DEFAULT NULL,
  `reader` varchar(20) DEFAULT NULL,
  `rule_id` int(11) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '0注销，1正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1805010220 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrow_card
-- ----------------------------
INSERT INTO `borrow_card` VALUES ('1805010202', 'root', '老王', '7', '1');
INSERT INTO `borrow_card` VALUES ('1805010203', 'root', '黄白白', '2', '0');
INSERT INTO `borrow_card` VALUES ('1805010204', 'root', '黄土', '1', '1');
INSERT INTO `borrow_card` VALUES ('1805010205', '1234', '白云', '1', '1');
INSERT INTO `borrow_card` VALUES ('1805010206', '111', '月', '6', '1');
INSERT INTO `borrow_card` VALUES ('1805010207', 'admin', '明月', '1', '1');
INSERT INTO `borrow_card` VALUES ('1805010208', 'admin', '明月复苏', '1', '1');
INSERT INTO `borrow_card` VALUES ('1805010210', 'yue', '张沙', '1', '1');
INSERT INTO `borrow_card` VALUES ('1805010211', 'mingming', '星星', '1', '1');
INSERT INTO `borrow_card` VALUES ('1805010212', 'admin', '明月', '1', '1');
INSERT INTO `borrow_card` VALUES ('1805010213', 'chen', '辰', '1', '1');
INSERT INTO `borrow_card` VALUES ('1805010214', '1234', '小红', '1', '1');
INSERT INTO `borrow_card` VALUES ('1805010217', '赵雪', '赵雪', '2', '1');
INSERT INTO `borrow_card` VALUES ('1805010219', '1234', '测试', '1', '0');

-- ----------------------------
-- Table structure for `library`
-- ----------------------------
DROP TABLE IF EXISTS `library`;
CREATE TABLE `library` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of library
-- ----------------------------
INSERT INTO `library` VALUES ('1', '南图', null);
INSERT INTO `library` VALUES ('2', '北图', null);
INSERT INTO `library` VALUES ('3', '教师之家', null);

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `account` varchar(20) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', '辰', 'chen', 'chen', '232222@qq.com');
INSERT INTO `manager` VALUES ('2', '明', 'ming', 'ming', '234234@qq.com');
INSERT INTO `manager` VALUES ('3', '明月', 'root', '1234', '284908631@qq.com');
INSERT INTO `manager` VALUES ('11', 'root', '1234', 'root', '123456@qq.com');
INSERT INTO `manager` VALUES ('12', '测试员', 'test', 'test', 'test@qq.com');
INSERT INTO `manager` VALUES ('13', '明月', '1', 'root', '1');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `card_id` int(20) DEFAULT NULL,
  `detail` varchar(1000) DEFAULT NULL,
  `public_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '1805010201', '冲鸭，一起来看书', '2020-06-01 23:11:59');
INSERT INTO `message` VALUES ('2', '1805010202', '我爱学习', '2020-05-29 23:12:03');
INSERT INTO `message` VALUES ('3', '1805010202', '图书馆的书质量很好，图书管理员态度非常好，系统管理员也非常热心，太棒了', '2020-06-04 23:12:24');
INSERT INTO `message` VALUES ('6', '1805010202', '咋回事', '2020-06-12 08:34:18');

-- ----------------------------
-- Table structure for `rules`
-- ----------------------------
DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `borrow_num` int(10) DEFAULT NULL COMMENT '限制本数',
  `limit_day` int(10) DEFAULT NULL COMMENT '限制天数',
  `borrow_library` varchar(20) DEFAULT NULL,
  `overtime_fee` float(10,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rules
-- ----------------------------
INSERT INTO `rules` VALUES ('1', '10', '60', '1、2、3', '0.100');
INSERT INTO `rules` VALUES ('2', '1', '10', '2、3', '1.000');
INSERT INTO `rules` VALUES ('3', '20', '120', '1、2、3', '1.000');
INSERT INTO `rules` VALUES ('4', '20', '180', '1、2、3', '0.100');
INSERT INTO `rules` VALUES ('5', '1', '100', '1', '0.100');
INSERT INTO `rules` VALUES ('6', '15', '60', '1、2、3', '0.100');
INSERT INTO `rules` VALUES ('7', '1', '1', '1、3', '1.000');
