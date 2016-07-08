
/*
MySQL Data Transfer
Source Host: localhost
Source Database: media;
Target Host: localhost
Target Database: shop
Date: 2016-06-29 16:29:58
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- 
-- ----------------------------
CREATE DATABASE media 

Go

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
CREATE TABLE `adminuser` (
  `uid` int  NOT NULL AUTO_INCREMENT,
  `username` varchar(32)  ,
  `password` varchar(32)  ,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
Go
-- ----------------------------
-- Table structure for category
-- ----------------------------
CREATE TABLE `category` (
  `cid` int NOT NULL AUTO_INCREMENT, --一级分类
  `cname` varchar(20)  , --一级分类名
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
Go
-- ----------------------------
-- Table structure for categorysecond
-- ----------------------------
CREATE TABLE `categorysecond` (
  `csid` int NOT NULL AUTO_INCREMENT, --二级分类主键
  `csname` varchar(20)  ,--二级分类名
  `cid` int  ,			--一级分类外键
  PRIMARY KEY (`csid`),
  FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
Go
-- ----------------------------
-- Table structure for categorythird
-- ----------------------------
CREATE TABLE `categorythird` (
  `ctid` int NOT NULL AUTO_INCREMENT, --三级分类主键
  `ctname` varchar(20)  ,--三级分类名
  `csid` int  ,			--二级分类外键
  PRIMARY KEY (`ctid`),
  FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
Go

-- ----------------------------
-- Table structure for product
-- ----------------------------
CREATE TABLE `multmedia` (
  `mid` int NOT NULL AUTO_INCREMENT, --主键
  `mname` varchar(32)  ,--媒体标题
  `image` varchar(64)  ,--图片
  `mdesc` varchar(255)  , --描述
  `is_hot` int , --热门
  `pageview` int ,--点击浏览量
  `mdate` datetime  ,--发布日期
  `ctid` int ,--分类号
  PRIMARY KEY (`mid`),
  FOREIGN KEY (`ctid`) REFERENCES `categorythird` (`ctid`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
Go
-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE `user` (
  `uid` int NOT NULL AUTO_INCREMENT, --主键
  `username` varchar(32),--用户名
  `password` varchar(32),--密码
  `name` varchar(20),--姓名
  `email` varchar(30),--电子邮箱
  `sex` varchar(10),--性别
  `phone` varchar(20),--电话
  `addr` varchar(64),--地址
  `state` int,--激活状态
  `code` varchar(64),--激活码
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
go
-- ----------------------------
-- Records 
-- ----------------------------

INSERT INTO `adminuser` VALUES ('1', 'admin', 'admin');

INSERT INTO `category` VALUES ('1', '新闻');
INSERT INTO `category` VALUES ('2', '影视');
INSERT INTO `category` VALUES ('3', '音乐');
INSERT INTO `category` VALUES ('4', '软件');

INSERT INTO `categorysecond` VALUES ('1', '要闻', '1');
INSERT INTO `categorysecond` VALUES ('2', '国内', '1');
INSERT INTO `categorysecond` VALUES ('3', '国际', '1');
INSERT INTO `categorysecond` VALUES ('4', '年份', '2');
INSERT INTO `categorysecond` VALUES ('5', '评分', '2');
INSERT INTO `categorysecond` VALUES ('6', '国家', '2');
INSERT INTO `categorysecond` VALUES ('7', '类型', '2');
INSERT INTO `categorysecond` VALUES ('8', '语种', '3');
INSERT INTO `categorysecond` VALUES ('9', '风格', '3');
INSERT INTO `categorysecond` VALUES ('10', '情感', '3');
INSERT INTO `categorysecond` VALUES ('11', '系统工具', '4');
INSERT INTO `categorysecond` VALUES ('12', '应用软件', '4');

INSERT INTO `categorythird`  VALUES ('1', '最新', '1');
INSERT INTO `categorythird`  VALUES ('2', '最热', '1');
INSERT INTO `categorythird`  VALUES ('3', '民生', '2');
INSERT INTO `categorythird`  VALUES ('4', '时讯', '3');
INSERT INTO `categorythird`  VALUES ('5', '短评', '3');
INSERT INTO `categorythird`  VALUES ('6', '2016', '4');
INSERT INTO `categorythird`  VALUES ('7', '2015', '4');
INSERT INTO `categorythird`  VALUES ('8', '2014', '4');
INSERT INTO `categorythird`  VALUES ('9', '2013', '4');
INSERT INTO `categorythird`  VALUES ('10', '2012', '4');
INSERT INTO `categorythird`  VALUES ('11', '之前', '4');
INSERT INTO `categorythird`  VALUES ('12', '9分以上', '5');
INSERT INTO `categorythird`  VALUES ('13', '8分以上', '5');
INSERT INTO `categorythird`  VALUES ('14', '7分以上', '5');
INSERT INTO `categorythird`  VALUES ('15', '6分以上', '5');
INSERT INTO `categorythird`  VALUES ('16', '中国', '6');
INSERT INTO `categorythird`  VALUES ('17', '欧美', '6');
INSERT INTO `categorythird`  VALUES ('18', '日韩', '6');
INSERT INTO `categorythird`  VALUES ('19', '其他', '6');
INSERT INTO `categorythird`  VALUES ('20', '传记', '7');
INSERT INTO `categorythird`  VALUES ('21', '喜剧', '7');
INSERT INTO `categorythird`  VALUES ('22', '剧情', '7');
INSERT INTO `categorythird`  VALUES ('23', '枪战', '7');
INSERT INTO `categorythird`  VALUES ('24', '恐怖', '7');
INSERT INTO `categorythird`  VALUES ('25', '励志', '7');
INSERT INTO `categorythird`  VALUES ('26', '动画', '7');
INSERT INTO `categorythird`  VALUES ('27', '歌舞', '7');
INSERT INTO `categorythird`  VALUES ('28', '犯罪', '7');
INSERT INTO `categorythird`  VALUES ('29', '爱情', '7');
INSERT INTO `categorythird`  VALUES ('30', '惊悚', '7');
INSERT INTO `categorythird`  VALUES ('31', '青春', '7');
INSERT INTO `categorythird`  VALUES ('32', '科技', '7');
INSERT INTO `categorythird`  VALUES ('33', '冒险', '7');
INSERT INTO `categorythird`  VALUES ('34', '动作', '7');
INSERT INTO `categorythird`  VALUES ('35', '灾难', '7');
INSERT INTO `categorythird`  VALUES ('36', '生活', '7');
INSERT INTO `categorythird`  VALUES ('37', '其他', '7');

INSERT INTO `categorythird`  VALUES ('38', '华语', '8');
INSERT INTO `categorythird`  VALUES ('39', '欧美', '8');
INSERT INTO `categorythird`  VALUES ('40', '日韩', '8');
INSERT INTO `categorythird`  VALUES ('41', '粤语', '8');
INSERT INTO `categorythird`  VALUES ('42', '小语种', '8');
INSERT INTO `categorythird`  VALUES ('44', '流行', '9');
INSERT INTO `categorythird`  VALUES ('45', '摇滚', '9');
INSERT INTO `categorythird`  VALUES ('46', '民谣', '9');
INSERT INTO `categorythird`  VALUES ('47', '电子', '9');
INSERT INTO `categorythird`  VALUES ('48', '轻音乐', '9');
INSERT INTO `categorythird`  VALUES ('49', '乡村', '9');
INSERT INTO `categorythird`  VALUES ('50', '怀旧', '10');
INSERT INTO `categorythird`  VALUES ('51', '清新', '10');
INSERT INTO `categorythird`  VALUES ('52', '浪漫', '10');
INSERT INTO `categorythird`  VALUES ('53', '伤感', '10');
INSERT INTO `categorythird`  VALUES ('54', '治愈', '10');
INSERT INTO `categorythird`  VALUES ('55', '放松', '10');
INSERT INTO `categorythird`  VALUES ('56', '孤独', '10');
INSERT INTO `categorythird`  VALUES ('57', '感动', '10');
INSERT INTO `categorythird`  VALUES ('58', '安静', '10');
INSERT INTO `categorythird`  VALUES ('59', '思念', '10');

INSERT INTO `categorythird`  VALUES ('60', '硬件检测', '11');
INSERT INTO `categorythird`  VALUES ('61', '磁盘工具', '11');
INSERT INTO `categorythird`  VALUES ('62', '系统补丁', '11');
INSERT INTO `categorythird`  VALUES ('63', '翻译', '12');
INSERT INTO `categorythird`  VALUES ('64', '办公', '12');
INSERT INTO `categorythird`  VALUES ('65', '其他', '12');

-- --------------------------
-- 电影记录
-- --------------------------

insert into `multmedia`  values('1','忍者神龟2：破影而出','/film/1.jpg','城市在恢复平静后，大反派重新召集旧部卷土重来，并勾结外星恶势力朗格试图称霸地球，忍者神龟莱昂纳多（皮特·普劳泽克 Pete Ploszek 饰）、拉斐尔（阿兰·里奇森 Alan Ritchson 饰）、多纳泰罗（杰瑞米·霍华德 Jeremy Howard 饰）和米开朗基罗（诺尔·费舍 Noel Fisher 饰）与女记者艾蓓丽尔·奥尼尔（梅根·福克斯 Megan Fox 饰）、韦恩·芬威克（威尔·阿奈特 Will Arnett 饰），及面具义警凯西·琼斯（斯蒂芬·阿梅尔 Stephen Amell 饰）并','1','1','2016-06-01 00:00:00','6');
insert into `multmedia`  values('2','忍者神龟2：破影而出','/film/1.jpg','城市在恢复平静后，大反派重新召集旧部卷土重来，并勾结外星恶势力朗格试图称霸地球，忍者神龟莱昂纳多（皮特·普劳泽克 Pete Ploszek 饰）、拉斐尔（阿兰·里奇森 Alan Ritchson 饰）、多纳泰罗（杰瑞米·霍华德 Jeremy Howard 饰）和米开朗基罗（诺尔·费舍 Noel Fisher 饰）与女记者艾蓓丽尔·奥尼尔（梅根·福克斯 Megan Fox 饰）、韦恩·芬威克（威尔·阿奈特 Will Arnett 饰），及面具义警凯西·琼斯（斯蒂芬·阿梅尔 Stephen Amell 饰）并','1','1','2016-06-01 00:00:00','12');
insert into `multmedia`  values('3','忍者神龟2：破影而出','/film/1.jpg','城市在恢复平静后，大反派重新召集旧部卷土重来，并勾结外星恶势力朗格试图称霸地球，忍者神龟莱昂纳多（皮特·普劳泽克 Pete Ploszek 饰）、拉斐尔（阿兰·里奇森 Alan Ritchson 饰）、多纳泰罗（杰瑞米·霍华德 Jeremy Howard 饰）和米开朗基罗（诺尔·费舍 Noel Fisher 饰）与女记者艾蓓丽尔·奥尼尔（梅根·福克斯 Megan Fox 饰）、韦恩·芬威克（威尔·阿奈特 Will Arnett 饰），及面具义警凯西·琼斯（斯蒂芬·阿梅尔 Stephen Amell 饰）并','1','1','2016-06-01 00:00:00','17');
insert into `multmedia`  values('4','忍者神龟2：破影而出','/film/1.jpg','城市在恢复平静后，大反派重新召集旧部卷土重来，并勾结外星恶势力朗格试图称霸地球，忍者神龟莱昂纳多（皮特·普劳泽克 Pete Ploszek 饰）、拉斐尔（阿兰·里奇森 Alan Ritchson 饰）、多纳泰罗（杰瑞米·霍华德 Jeremy Howard 饰）和米开朗基罗（诺尔·费舍 Noel Fisher 饰）与女记者艾蓓丽尔·奥尼尔（梅根·福克斯 Megan Fox 饰）、韦恩·芬威克（威尔·阿奈特 Will Arnett 饰），及面具义警凯西·琼斯（斯蒂芬·阿梅尔 Stephen Amell 饰）并','1','1','2016-06-01 00:00:00','21');
insert into `multmedia`  values('5','忍者神龟2：破影而出','/film/1.jpg','城市在恢复平静后，大反派重新召集旧部卷土重来，并勾结外星恶势力朗格试图称霸地球，忍者神龟莱昂纳多（皮特·普劳泽克 Pete Ploszek 饰）、拉斐尔（阿兰·里奇森 Alan Ritchson 饰）、多纳泰罗（杰瑞米·霍华德 Jeremy Howard 饰）和米开朗基罗（诺尔·费舍 Noel Fisher 饰）与女记者艾蓓丽尔·奥尼尔（梅根·福克斯 Megan Fox 饰）、韦恩·芬威克（威尔·阿奈特 Will Arnett 饰），及面具义警凯西·琼斯（斯蒂芬·阿梅尔 Stephen Amell 饰）并','1','1','2016-06-01 00:00:00','34');
insert into `multmedia`  values('6','忍者神龟2：破影而出','/film/1.jpg','城市在恢复平静后，大反派重新召集旧部卷土重来，并勾结外星恶势力朗格试图称霸地球，忍者神龟莱昂纳多（皮特·普劳泽克 Pete Ploszek 饰）、拉斐尔（阿兰·里奇森 Alan Ritchson 饰）、多纳泰罗（杰瑞米·霍华德 Jeremy Howard 饰）和米开朗基罗（诺尔·费舍 Noel Fisher 饰）与女记者艾蓓丽尔·奥尼尔（梅根·福克斯 Megan Fox 饰）、韦恩·芬威克（威尔·阿奈特 Will Arnett 饰），及面具义警凯西·琼斯（斯蒂芬·阿梅尔 Stephen Amell 饰）并','1','1','2016-06-01 00:00:00','32');
insert into `multmedia`  values('7','忍者神龟2：破影而出','/film/1.jpg','城市在恢复平静后，大反派重新召集旧部卷土重来，并勾结外星恶势力朗格试图称霸地球，忍者神龟莱昂纳多（皮特·普劳泽克 Pete Ploszek 饰）、拉斐尔（阿兰·里奇森 Alan Ritchson 饰）、多纳泰罗（杰瑞米·霍华德 Jeremy Howard 饰）和米开朗基罗（诺尔·费舍 Noel Fisher 饰）与女记者艾蓓丽尔·奥尼尔（梅根·福克斯 Megan Fox 饰）、韦恩·芬威克（威尔·阿奈特 Will Arnett 饰），及面具义警凯西·琼斯（斯蒂芬·阿梅尔 Stephen Amell 饰）并','1','1','2016-06-01 00:00:00','33');
insert into `multmedia`  values('8','赏金猎人','/film/2.jpg','李山（李敏镐 饰）和阿Yo（钟汉良 饰）曾经同为国际刑警，后因任务失败被一同革职，当起了私人保镖。在一起看似普通的爆炸案中，两人与由凌芯（唐嫣 饰）、Swan（吴千语 饰）和宝宝（樊少皇 饰）组成的赏金三人组狭路相逢，一番冲突较量后，他们组成了专门缉捕罪犯、维护社会安宁的赏金天团','1','1','2016-06-02 00:00:00','6');
insert into `multmedia`  values('9','赏金猎人','/film/2.jpg','李山（李敏镐 饰）和阿Yo（钟汉良 饰）曾经同为国际刑警，后因任务失败被一同革职，当起了私人保镖。在一起看似普通的爆炸案中，两人与由凌芯（唐嫣 饰）、Swan（吴千语 饰）和宝宝（樊少皇 饰）组成的赏金三人组狭路相逢，一番冲突较量后，他们组成了专门缉捕罪犯、维护社会安宁的赏金天团','1','1','2016-06-02 00:00:00','15');
insert into `multmedia`  values('10','赏金猎人','/film/2.jpg','李山（李敏镐 饰）和阿Yo（钟汉良 饰）曾经同为国际刑警，后因任务失败被一同革职，当起了私人保镖。在一起看似普通的爆炸案中，两人与由凌芯（唐嫣 饰）、Swan（吴千语 饰）和宝宝（樊少皇 饰）组成的赏金三人组狭路相逢，一番冲突较量后，他们组成了专门缉捕罪犯、维护社会安宁的赏金天团','1','1','2016-06-02 00:00:00','16');
insert into `multmedia`  values('11','赏金猎人','/film/2.jpg','李山（李敏镐 饰）和阿Yo（钟汉良 饰）曾经同为国际刑警，后因任务失败被一同革职，当起了私人保镖。在一起看似普通的爆炸案中，两人与由凌芯（唐嫣 饰）、Swan（吴千语 饰）和宝宝（樊少皇 饰）组成的赏金三人组狭路相逢，一番冲突较量后，他们组成了专门缉捕罪犯、维护社会安宁的赏金天团','1','1','2016-06-02 00:00:00','22');
insert into `multmedia`  values('12','赏金猎人','/film/2.jpg','李山（李敏镐 饰）和阿Yo（钟汉良 饰）曾经同为国际刑警，后因任务失败被一同革职，当起了私人保镖。在一起看似普通的爆炸案中，两人与由凌芯（唐嫣 饰）、Swan（吴千语 饰）和宝宝（樊少皇 饰）组成的赏金三人组狭路相逢，一番冲突较量后，他们组成了专门缉捕罪犯、维护社会安宁的赏金天团','1','1','2016-06-02 00:00:00','28');
insert into `multmedia`  values('13','惊天魔盗团2','/film/3.jpg','该片讲述一群拥有超凡智慧与胆量的现代罗宾汉，运用魔术才华，与舞台之上劫富济贫','1','1','2016-06-03 00:00:00','6');
insert into `multmedia`  values('14','惊天魔盗团2','/film/3.jpg','该片讲述一群拥有超凡智慧与胆量的现代罗宾汉，运用魔术才华，与舞台之上劫富济贫','1','1','2016-06-03 00:00:00','15');
insert into `multmedia`  values('15','惊天魔盗团2','/film/3.jpg','该片讲述一群拥有超凡智慧与胆量的现代罗宾汉，运用魔术才华，与舞台之上劫富济贫','1','1','2016-06-03 00:00:00','17');
insert into `multmedia`  values('16','惊天魔盗团2','/film/3.jpg','该片讲述一群拥有超凡智慧与胆量的现代罗宾汉，运用魔术才华，与舞台之上劫富济贫','1','1','2016-06-03 00:00:00','22');
insert into `multmedia`  values('17','惊天魔盗团2','/film/3.jpg','该片讲述一群拥有超凡智慧与胆量的现代罗宾汉，运用魔术才华，与舞台之上劫富济贫','1','1','2016-06-03 00:00:00','21');
insert into `multmedia`  values('18','惊天魔盗团2','/film/3.jpg','该片讲述一群拥有超凡智慧与胆量的现代罗宾汉，运用魔术才华，与舞台之上劫富济贫','1','1','2016-06-03 00:00:00','34');
insert into `multmedia`  values('19','独立日：卷土重来','/film/4.jpg','外星人却带着人类前所未见、更先进强大的武力再次入侵地球，带来更大的全球灾难，几位勇敢的年轻人，他们挺身而出，将再一次为人类生存而战斗','1','1','2016-06-04 00:00:00','6');
insert into `multmedia`  values('20','独立日：卷土重来','/film/4.jpg','外星人却带着人类前所未见、更先进强大的武力再次入侵地球，带来更大的全球灾难，几位勇敢的年轻人，他们挺身而出，将再一次为人类生存而战斗','1','1','2016-06-04 00:00:00','15');
insert into `multmedia`  values('21','独立日：卷土重来','/film/4.jpg','外星人却带着人类前所未见、更先进强大的武力再次入侵地球，带来更大的全球灾难，几位勇敢的年轻人，他们挺身而出，将再一次为人类生存而战斗','1','1','2016-06-04 00:00:00','17');
insert into `multmedia`  values('22','独立日：卷土重来','/film/4.jpg','外星人却带着人类前所未见、更先进强大的武力再次入侵地球，带来更大的全球灾难，几位勇敢的年轻人，他们挺身而出，将再一次为人类生存而战斗','1','1','2016-06-04 00:00:00','32');
insert into `multmedia`  values('23','独立日：卷土重来','/film/4.jpg','外星人却带着人类前所未见、更先进强大的武力再次入侵地球，带来更大的全球灾难，几位勇敢的年轻人，他们挺身而出，将再一次为人类生存而战斗','1','1','2016-06-04 00:00:00','34');
insert into `multmedia`  values('24','所以……和黑粉结婚了','/film/5.jpg','女记者方淼淼（袁姗姗 饰）不小心撞破大明星后准（朴灿烈 饰）的私生活，用手机拍照后爆出独家猛料，引发后准公司投诉并遭杂志社辞退，从此与后准结怨，成为复仇的黑粉。','1','1','2016-06-05 00:00:00','6');
insert into `multmedia`  values('25','所以……和黑粉结婚了','/film/5.jpg','女记者方淼淼（袁姗姗 饰）不小心撞破大明星后准（朴灿烈 饰）的私生活，用手机拍照后爆出独家猛料，引发后准公司投诉并遭杂志社辞退，从此与后准结怨，成为复仇的黑粉。','1','1','2016-06-05 00:00:00','15');
insert into `multmedia`  values('26','所以……和黑粉结婚了','/film/5.jpg','女记者方淼淼（袁姗姗 饰）不小心撞破大明星后准（朴灿烈 饰）的私生活，用手机拍照后爆出独家猛料，引发后准公司投诉并遭杂志社辞退，从此与后准结怨，成为复仇的黑粉。','1','1','2016-06-05 00:00:00','16');
insert into `multmedia`  values('27','所以……和黑粉结婚了','/film/5.jpg','女记者方淼淼（袁姗姗 饰）不小心撞破大明星后准（朴灿烈 饰）的私生活，用手机拍照后爆出独家猛料，引发后准公司投诉并遭杂志社辞退，从此与后准结怨，成为复仇的黑粉。','1','1','2016-06-05 00:00:00','21');
insert into `multmedia`  values('28','所以……和黑粉结婚了','/film/5.jpg','女记者方淼淼（袁姗姗 饰）不小心撞破大明星后准（朴灿烈 饰）的私生活，用手机拍照后爆出独家猛料，引发后准公司投诉并遭杂志社辞退，从此与后准结怨，成为复仇的黑粉。','1','1','2016-06-05 00:00:00','29');
insert into `multmedia`  values('29','海底总动员2：多莉去哪儿','/film/6.jpg','当多莉和朋友们在研究所错综复杂的内部水道中辗转前行时，她也逐渐对友谊、亲情和家庭的奥义有了更深刻的认识','1','1','2016-06-06 00:00:00','6');
insert into `multmedia`  values('30','海底总动员2：多莉去哪儿','/film/6.jpg','当多莉和朋友们在研究所错综复杂的内部水道中辗转前行时，她也逐渐对友谊、亲情和家庭的奥义有了更深刻的认识','1','1','2016-06-06 00:00:00','14');
insert into `multmedia`  values('31','海底总动员2：多莉去哪儿','/film/6.jpg','当多莉和朋友们在研究所错综复杂的内部水道中辗转前行时，她也逐渐对友谊、亲情和家庭的奥义有了更深刻的认识','1','1','2016-06-06 00:00:00','17');
insert into `multmedia`  values('32','海底总动员2：多莉去哪儿','/film/6.jpg','当多莉和朋友们在研究所错综复杂的内部水道中辗转前行时，她也逐渐对友谊、亲情和家庭的奥义有了更深刻的认识','1','1','2016-06-06 00:00:00','21');
insert into `multmedia`  values('33','魔轮','/film/7.jpg','黑暗的背后，究竟是谁在操纵一切，这对误入魔轮的甜蜜爱人，又将逃向何处？','1','1','2016-06-07 00:00:00','6');
insert into `multmedia`  values('34','魔轮','/film/7.jpg','黑暗的背后，究竟是谁在操纵一切，这对误入魔轮的甜蜜爱人，又将逃向何处？','1','1','2016-06-07 00:00:00','15');
insert into `multmedia`  values('35','魔轮','/film/7.jpg','黑暗的背后，究竟是谁在操纵一切，这对误入魔轮的甜蜜爱人，又将逃向何处？','1','1','2016-06-07 00:00:00','16');
insert into `multmedia`  values('36','魔轮','/film/7.jpg','黑暗的背后，究竟是谁在操纵一切，这对误入魔轮的甜蜜爱人，又将逃向何处？','1','1','2016-06-07 00:00:00','24');
insert into `multmedia`  values('37','魔轮','/film/7.jpg','黑暗的背后，究竟是谁在操纵一切，这对误入魔轮的甜蜜爱人，又将逃向何处？','1','1','2016-06-07 00:00:00','30');



-- -----------------------
-- 新闻
-- -----------------------
INSERT INTO `multmedia` VALUES ('100', '为了保住武汉，这些小镇吞下了大半的洪水，却没人管', '/images/news/new1.jpg', '蓄滞洪区每年帮有钱的邻居们吞下大半的洪水，却是以自身的经济发展为代价，最后一直穷着的它们，也只能一直当着泄洪区。', NULL, NULL, '2016-07-04', '3');
INSERT INTO `multmedia` VALUES ('101', '湖北千人上堤死守簰洲湾:不能让洪水惊扰烈士墓', '/images/news/new2.jpg', '咸宁市嘉鱼县簰洲湾江堤水位超警戒，6万亩农田被淹。为了不让洪水惊扰烈士坟墓，1200多村民日夜上堤巡防', NULL, NULL, '2016-07-04', '4');
INSERT INTO `multmedia` VALUES ('102', '《大鱼海棠》发终见大鱼预告 十二年一梦终相见', '/images/news/new3.jpg', '由导演梁旋、张春历时十二年打造，彼岸天、光线影业、彩条屋影业联合出品的动画电影《大鱼海棠》即将于7月8日登陆全国院线。近日，这部备受大众关注的动画电影公布了“终见大鱼”版预告，片中曝光了更多《大鱼海棠》的故事情节与人物角色，配上同时发布的描绘“其他人”世界人物图谱与地图，加之不久前公布的强势配音阵容，在影片即将上映之际，让影迷和粉丝们对这部电影的期待值达到了新高峰。', NULL, NULL, '2016-07-04', '2');
INSERT INTO `multmedia` VALUES ('103', '《幻城》首曝冰火大战海报 定档7.2', '/images/news/new4.jpg', '今日，耀客电视剧《幻城》官方微博及湖南卫视官方微博一齐宣布该剧定档7月24日在湖南卫视暑期档钻石独播剧场播出，并曝光了以冰火大战为主题的定档海报。', NULL, NULL, '2016-07-04', '1');
INSERT INTO `multmedia` VALUES ('104', '《大雄的日本诞生》曝先导预告 哆啦A梦回银幕', '/images/news/new5.jpg', '近日，动画电影《哆啦A梦：新·大雄的日本诞生》曝光先导预告片，预告片中哆啦A梦在大雄、小夫、胖虎和静香的呼唤中闪亮登场，仍然是那个大家所熟悉的身影。据悉，本片是哆啦A梦系列中最卖座的剧场版。今年春季在日本上映后，首周初登排名和观众满意度排名均位列第一。', NULL, NULL, '2016-07-04', '2');
INSERT INTO `multmedia` VALUES ('105', '《最好的我们》播放量破20亿 成就精品网剧', '/images/news/new6.jpg', '由爱奇艺出品，刘昊然、谭松韵、王栎鑫主演的校园青春网剧《最好的我们》在上周非会员大结局上线后以20亿的播放量完美谢幕，交出了一份漂亮的答卷。从4月份开播至今，《最好的我们》用平实的剧情和精良的制作征服了无数剧迷的心，“耿耿余淮”的青春成为了这个夏天当之无愧的热点，豆瓣8.5的高分、单日播放量突破7900万、将近55万的的百度指数以及多次跻身纯网热播剧微博视频排行榜榜首的数据不仅代表了《最好的我们》的成功，也让观众对精品网剧的概念有了更深层次的认知。', NULL, NULL, '2016-07-04', '2');
INSERT INTO `multmedia` VALUES ('106', '《周杰伦上海连唱四场 八个主题趴high翻歌迷', '/images/news/new7.jpg', '周杰伦“地表最强”世界巡迴演唱会一连四场演出在7月3日画下完美的句点！也成功启动了“地表最强”世界巡演的开关！在视觉科技与感官震撼中，歌迷随着周杰伦的音乐遨游宇宙又潜入海底世界，一起创造“地表最强”的感动！但是周董要给歌迷的不仅止于此，与其说只是一场演唱会，更可以说是周董精心设计了八种不同主题的派对！有气势的开场、恐怖Part、美人鱼Part、钢琴Part、O.S. Part、復古Part、嘻哈Part、经典歌曲Part，让歌迷完全陶醉在其中！', NULL, NULL, '2016-07-04', '2');
INSERT INTO `multmedia` VALUES ('107', '《余罪》：国产警匪剧迎来个韦小宝', '/images/news/new8.jpg', '《余罪》一反传统国产警匪剧里警察形象高大全的传统，贡献了一个韦小宝式的小人物英雄。即便整部剧的拍摄手法依旧是传统的警匪剧路线，但这个最不像警察的警察余罪已经足够新鲜、足够吸引。', NULL, NULL, '2016-07-04', '1');

-- ----------------------
--  音乐
-- ----------------------
/** http://music.163.com/#/song?id=27969800

<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 
	src="http://music.163.com/outchain/player?type=2&id=27984047&auto=0&height=66"></iframe>

http://music.163.com/outchain/player?type=2&id=17584144&auto=0&height=66	Tik Tok								歌手：Eliane
	28613576	Bila								歌手：Candy
	27984047	Hidden Heart						歌手：Eliane
	17584142	The Reason That I Live				歌手：Eliane
	27984052	Raindrops							歌手：Eliane
	22563394	Goodnight Moon						歌手：Shivaree
	19264098	Can not Stand The Rain				歌手：The Rescues
	1474776		I am Yours							歌手：Jason Mraz
	27759600	Five Hundred Miles					歌手：Justin Timberlake / Carey Mulligan / Stark Sands
	3986017		Viva la Vida						歌手：Coldplay				
	29023211	Must Be Something					歌手：The Pierces
	26677654	Broken Angel						歌手：Arash / Helena
	32835377    Reality 							歌手：Lost Frequencies / Janieck Devy
	25730796    Sealed With A Kiss(以吻封缄) 		歌手：Dana Winner
	18003388    Careless Whisper					歌手：George Michael
	28409529    The Rains of Castamere				歌手：Sigur Rós
	27969800    Soldier								歌手：Samantha Jade
	18098542    7 Years And 50 Days 				歌手：Groove Coverage
	5086081     River Flows In You (Original Mix)   歌手：Mark Pride
	3950752     SMS  								歌手：Befour
**/
	
INSERT INTO `multmedia`		VALUES ('1474776', 'I am Yours', '', '歌手：Jason Mraz', '0', '0', now(), '39');
INSERT INTO `multmedia`		VALUES ('3950752', 'SMS', '', '歌手：Befour', '0', '0', now(), '39');
INSERT INTO `multmedia`		VALUES ('3986017', 'Viva la Vida', '', '歌手：Coldplay', '0', '0', now(), '39');
INSERT INTO `multmedia`		VALUES ('5086081', 'River Flows In You', '', '歌手：Mark Pride', '0', '0', now(), '39');
INSERT INTO `multmedia`		VALUES ('17584142', 'The Reason That I Live', '', '歌手：Eliane', '0', '0', now(), '39');
INSERT INTO `multmedia`		VALUES ('18003388', 'Careless Whisper', '', '歌手：George Michael', '0', '0', now(), '39');
INSERT INTO `multmedia`		VALUES ('18098542', '7 Years And 50 Days', '', '歌手：Groove Coverage', '0', '0', now(), '39');
INSERT INTO `multmedia`		VALUES ('19264098', 'Can not Stand The Rain', '', '歌手：The Rescues', '0', '0', now(), '39');
INSERT INTO `multmedia`		VALUES ('22563394', 'Goodnight Moon', '', '歌手：Shivaree', '0', '0', now(), '39');
INSERT INTO `multmedia`		VALUES ('25730796', 'Sealed With A Kiss', '', '歌手：Dana Winner', '0', '0', now(), '39');
INSERT INTO `multmedia`		VALUES ('26677654', 'Broken Angel', '', '歌手：Arash / Helena', '0', '0', now(), '39');
INSERT INTO `multmedia`		VALUES ('27759600', 'Five Hundred Miles', '', '歌手：Justin Timberlake / Carey Mulligan / Stark Sands', '0', '0', now(), '39');
INSERT INTO `multmedia`		VALUES ('27969800', 'Soldier', '', '歌手：Arash / Helena', '0', '0', now(), '39');
INSERT INTO `multmedia`		VALUES ('27984047', 'Hidden Heart', '', '歌手：Eliane', '0', '0', now(), '39');
INSERT INTO `multmedia`		VALUES ('27984052', 'Raindrops', '', '歌手：Eliane', '0', '0', now(), '39');
INSERT INTO `multmedia`		VALUES ('28409529', 'The Rains of Castamere', '', '歌手：Sigur Rós', '0', '0', now(), '39');
INSERT INTO `multmedia`		VALUES ('28613576', 'Bila', '', '歌手：Candy', '0', '0', now(), '39');
INSERT INTO `multmedia`		VALUES ('29023211', 'Must Be Something', '', '歌手：The Pierces', '0', '0', now(), '39');
INSERT INTO `multmedia`		VALUES ('32835377', 'Reality', '', '歌手：Lost Frequencies / Janieck Devy', '0', '0', now(), '39');


/**更新电影数据
 * 
 */

UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=2;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=3;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=4;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=5;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=6;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=7;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=9;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=10;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=11;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=12;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=14;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=15;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=16;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=17;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=18;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=20;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=21;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=22;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=23;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=25;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=26;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=27;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=28;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=30;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=31;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=32;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=34;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=35;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=36;
UPDATE multmedia SET is_hot=0,pageview=0 WHERE MID=37;











