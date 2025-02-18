SET NAMES UTF8;
DROP DATABASE IF EXISTS Koenigsegg;
CREATE DATABASE Koenigsegg CHARSET=UTF8;
USE Koenigsegg;
-- 创建用户信息表
	DROP TABLE IF EXISTS `shop_user`;	
	CREATE TABLE `shop_user` (
		`uid` 	   		INT PRIMARY KEY AUTO_INCREMENT,    		#用户ID
		`uemail`  		varchar(1024) NOT NULL,					#用户邮箱
		`upwd`   		varchar(1024) default NULL				#用户密码
	);
	INSERT INTO `shop_user` VALUES('1','2090802700@qq.com','123456789');
	
-- 创建产品家族表
	DROP TABLE IF EXISTS `shop_family`;	
	CREATE TABLE `shop_family` (
		`cid` 	   		INT PRIMARY KEY,    		#类别ID
		`sf_name`  		varchar(1024) NOT NULL,		#类别名称
		`sf_details`   	varchar(1024) default NULL,	#类别简单介绍
		`sf_href`		VARCHAR(1024) default NULL	#点击时要去的网页
	);
		INSERT INTO `shop_family` VALUES ('1','SCALE MODELS','The Koenigsegg small-scale models are produced by FrontiArt with precise craftsmanship and with the latest modeling techniques<br/>The models deliver top quality results, with high attention to fine details','shop.html?cid=1');
		INSERT INTO `shop_family` VALUES ('2','COLLECTIBLES','The Koenigsegg small-scale models are produced by FrontiArt with precise craftsmanship and with the latest modeling techniques<br/>The models deliver top quality results, with high attention to fine details','shop.html?cid=2');
		INSERT INTO `shop_family` VALUES ('3','CLOTHING','The Koenigsegg small-scale models are produced by FrontiArt with precise craftsmanship and with the latest modeling techniques<br/>The models deliver top quality results, with high attention to fine details','shop.html?cid=3');
		INSERT INTO `shop_family` VALUES ('4','JEWELRY','The Koenigsegg small-scale models are produced by FrontiArt with precise craftsmanship and with the latest modeling techniques<br/>The models deliver top quality results, with high attention to fine details','shop.html?cid=4');
		INSERT INTO `shop_family` VALUES ('5','KIDS','The Koenigsegg small-scale models are produced by FrontiArt with precise craftsmanship and with the latest modeling techniques<br/>The models deliver top quality results, with high attention to fine details','shop.html?cid=5');
		INSERT INTO `shop_family` VALUES ('6','HOME & OFFICE','Koenigsegg ’s unique jewelry are made by Swedish fine jewelry designer Håkan Orrling and the jewelry has a strong, elegant and timeless design<br/>The jewelries are made in limited numbers and only manufactured to order (delivery time, 4-8 weeks), guaranteeing maximum exclusivity to our customers','shop.html?cid=6');	
-- 创建商品详情表,商品ID外链到shop_family的cid 
	DROP TABLE IF EXISTS `shop_details`;	
	CREATE TABLE `shop_details` (
		`sdid` 		INT PRIMARY KEY AUTO_INCREMENT,			#商品ID
		`sdname` 	VARCHAR(1024) default NULL,				#商品名字,允许内外共用
		`sdprice` 	VARCHAR(1024) default NULL,				#商品价格,允许内外共用
		`sdpic`		VARCHAR(1024) default NULL,				#商品展示图,算中图,允许内外共用
		`sdhref`	VARCHAR(1024) default NULL,				#商品展示时点击链接到内部
		`sddetails`	VARCHAR(1024) default NULL,				#商品描述,仅展示时使用
		`sdcount`	INT,									#商品库存,不展示,仅存数据
		`family_id`	INT,									#产品所属类别的ID
		FOREIGN KEY(family_id) REFERENCES shop_family(cid)	#外链到shop_family
	);
	-- SCALE MODELS
		INSERT INTO `shop_details` VALUES ('11','1:87 Regera Green Tint','$ 39','img/shop/models/middle/011.jpg','shop_details.html?sdid=11','This Regera model in scale 1:87, is our smallest replication of the Koenigsegg Regera<br>Handcrafted by AvanStyle','2','1');
		INSERT INTO `shop_details` VALUES ('12','1:18 Regera Horizon Blue','$ 479','img/shop/models/middle/021.jpg','shop_details.html?sdid=12','This Koenigsegg Regera model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Regera<br>Handcrafted by AvanStyle','2','1');
		INSERT INTO `shop_details` VALUES ('13','1:18 Regera Candy Apple Red','$ 479','img/shop/models/middle/031.jpg','shop_details.html?sdid=13','This Koenigsegg Regera model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Regera<br>Handcrafted by AvanStyle','3','1');
		INSERT INTO `shop_details` VALUES ('14','1:18 Agera RSR','$ 470','img/shop/models/middle/041.jpg','shop_details.html?sdid=14','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','2','1');
		INSERT INTO `shop_details` VALUES ('15','1:18 Agera RS “XS”','$ 470','img/shop/models/middle/051.jpg','shop_details.html?sdid=15','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','0','1');
		INSERT INTO `shop_details` VALUES ('16','1:18 Agera RS “ML”','$ 470','img/shop/models/middle/061.jpg','shop_details.html?sdid=16','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','0','1');
		INSERT INTO `shop_details` VALUES ('17','1:18 Agera RS “Gryphon”','$ 470','img/shop/models/middle/071.jpg','shop_details.html?sdid=17','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','1','1');
		INSERT INTO `shop_details` VALUES ('18','1:43 Regera Horizon Blue','$ 210','img/shop/models/middle/081.jpg','shop_details.html?sdid=18','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','1','1');
		INSERT INTO `shop_details` VALUES ('19','1:43 Regera Candy Apple Red','$ 210','img/shop/models/middle/091.jpg','shop_details.html?sdid=19','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','1','1');
		-- INSERT INTO `shop_details` VALUES ('110','1:6 Scale Model Engine','$ 1,515','img/shop/models/middle/101.jpg','shop_details.html?sdid=110','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','2','1');
		-- INSERT INTO `shop_details` VALUES ('111','1:43 One:1 Matte Imperial Blue','$ 199','img/shop/models/middle/111.jpg','shop_details.html?sdid=111','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','1','1');
	-- COLLECTIBLES
		INSERT INTO `shop_details` VALUES ('21','Koenigsegg Postscards','$ 32','img/shop/collectibles/middle/11.jpg','shop_details.html?sdid=21','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','4','2');
		INSERT INTO `shop_details` VALUES ('22','Koenigsegg Magazine (2015)','$ 13','img/shop/collectibles/middle/21.jpg','shop_details.html?sdid=22','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','5','2');
		INSERT INTO `shop_details` VALUES ('23','Agera RS Poster','$ 32','img/shop/collectibles/middle/31.jpg','shop_details.html?sdid=23','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','5','2');
		INSERT INTO `shop_details` VALUES ('24','Regera Horizon Blue Poster','$ 32','img/shop/collectibles/middle/41.jpg','shop_details.html?sdid=24','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','5','2');
		INSERT INTO `shop_details` VALUES ('25','Koenigsegg Brochure 2014','$ 55','img/shop/collectibles/middle/51.jpg','shop_details.html?sdid=25','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','2','2');
		INSERT INTO `shop_details` VALUES ('26','Shield cufflinks','$ 49','img/shop/collectibles/middle/61.jpg','shop_details.html?sdid=26','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','7','2');
		INSERT INTO `shop_details` VALUES ('27','Book – Koenigsegg CC','$ 91','img/shop/collectibles/middle/71.jpg','shop_details.html?sdid=27','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','3','2');
		INSERT INTO `shop_details` VALUES ('28','2013 Agera R Poster','$ 32','img/shop/collectibles/middle/81.jpg','shop_details.html?sdid=28','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','2','2');
		INSERT INTO `shop_details` VALUES ('29','Agera Poster','$ 32','img/shop/collectibles/middle/91.jpg','shop_details.html?sdid=29','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','4','2');
		-- INSERT INTO `shop_details` VALUES ('210','Carbon Pen','$ 88','img/shop/collectibles/middle/101.jpg','shop_details.html?sdid=210','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','6','2');
		-- INSERT INTO `shop_details` VALUES ('211','Koenigsegg Magazine (2017)','$ 13','img/shop/collectibles/middle/111.jpg','shop_details.html?sdid=211','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','8','2');
	-- CLOTHING
		INSERT INTO `shop_details` VALUES ('31','White cap -color logo','$ 37','img/shop/clothing/middle/1.jpg','shop_details.html?sdid=31','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','2','3');
		INSERT INTO `shop_details` VALUES ('32','White cap -gold logo','$ 37','img/shop/clothing/middle/2.jpg','shop_details.html?sdid=32','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','2','3');
		INSERT INTO `shop_details` VALUES ('33','Black cap -silver logo','$ 37','img/shop/clothing/middle/3.jpg','shop_details.html?sdid=33','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','2','3');
		INSERT INTO `shop_details` VALUES ('34','Vest (Man)','$ 235','img/shop/clothing/middle/41.jpg','shop_details.html?sdid=34','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','2','3');
		INSERT INTO `shop_details` VALUES ('35','Vest (Lady)','$ 235','img/shop/clothing/middle/51.jpg','shop_details.html?sdid=35','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','2','3');
		INSERT INTO `shop_details` VALUES ('36','Koenigsegg wind jacket','$ 253','img/shop/clothing/middle/61.jpg','shop_details.html?sdid=36','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','2','3');
		INSERT INTO `shop_details` VALUES ('37','T-shirt – Carbon Fiber Lady','$ 75','img/shop/clothing/middle/71.jpg','shop_details.html?sdid=37','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','3','3');
		INSERT INTO `shop_details` VALUES ('38','Copper T-shirt (Lady)','$ 75','img/shop/clothing/middle/81.jpg','shop_details.html?sdid=38','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','5','3');
		INSERT INTO `shop_details` VALUES ('39','Koenigsegg Jacket','$ 530','img/shop/clothing/middle/91.jpg','shop_details.html?sdid=39','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','5','3');
		-- INSERT INTO `shop_details` VALUES ('310','T-shirt Agera RS, White','$ 69','img/shop/clothing/middle/101.jpg','shop_details.html?sdid=310','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','5','3');
		-- INSERT INTO `shop_details` VALUES ('311','T-shirt – Carbon Fiber','$ 75','img/shop/clothing/middle/111.jpg','shop_details.html?sdid=311','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','5','3');
	-- JEWELRY
		INSERT INTO `shop_details` VALUES ('41','Leather Belt','$ 612','img/shop/jewelry/middle/1.jpg','shop_details.html?sdid=41','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','5','4');
		INSERT INTO `shop_details` VALUES ('42','CC Diamond Ring','$ 1000','img/shop/jewelry/middle/2.jpg','shop_details.html?sdid=42','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','5','4');
		INSERT INTO `shop_details` VALUES ('43','CC Key Pendant','$ 315–$ 423','img/shop/jewelry/middle/3.jpg','shop_details.html?sdid=43','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','5','4');
		INSERT INTO `shop_details` VALUES ('44','CC Gold Cufflinks','$ 1,914','img/shop/jewelry/middle/4.jpg','shop_details.html?sdid=44','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','4','4');
		INSERT INTO `shop_details` VALUES ('45','Silver Loop Keychain','$ 480','img/shop/jewelry/middle/5.jpg','shop_details.html?sdid=45','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','5','4');
		INSERT INTO `shop_details` VALUES ('46','CC Key Ring','$ 582','img/shop/jewelry/middle/6.jpg','shop_details.html?sdid=46','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','5','4');
		INSERT INTO `shop_details` VALUES ('47','Silver Shield Key Ring','$ 520','img/shop/jewelry/middle/7.jpg','shop_details.html?sdid=47','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','2','4');
		INSERT INTO `shop_details` VALUES ('48','Mousepad','$ 84','img/shop/jewelry/middle/8.jpg','shop_details.html?sdid=48','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','4','4');
		INSERT INTO `shop_details` VALUES ('49','Leather Laptop Case','$ 383','img/shop/jewelry/middle/9.jpg','shop_details.html?sdid=49','This Agera RSR model in scale 1:18, is a very detailed and high quality replication of the Koenigsegg Agera RSR chassis #122. There will only ever exist three Agera RSRs.<br>Handcrafted by FrontiArt','2','4');
-- 创建商品图片表,图片的siid外链到shop_details的sdid
	DROP TABLE IF EXISTS `shop_imgs`;	
	CREATE TABLE `shop_imgs` (
		`siid` 	 	INT PRIMARY KEY AUTO_INCREMENT,     	#图片所属ID
		`sism`   	VARCHAR(1024),							#商品小图的路径
		`sidm`	 	VARCHAR(1024),							#商品中图的路径
		`sibm`   	VARCHAR(1024),							#商品大图的路径
		`shop_id`	INT,									#图片所属商品的ID
		FOREIGN KEY(shop_id) REFERENCES shop_details(sdid)	#外链到shop_details
	);	
	-- SCALE MODELS
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/011.jpg','img/shop/models/middle/011.jpg','img/shop/models/big/011.jpg','11');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/012.jpg','img/shop/models/middle/012.jpg','img/shop/models/big/012.jpg','11');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/013.jpg','img/shop/models/middle/013.jpg','img/shop/models/big/013.jpg','11');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/014.jpg','img/shop/models/middle/014.jpg','img/shop/models/big/014.jpg','11');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/015.jpg','img/shop/models/middle/015.jpg','img/shop/models/big/015.jpg','11');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/016.jpg','img/shop/models/middle/016.jpg','img/shop/models/big/016.jpg','11');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/017.jpg','img/shop/models/middle/017.jpg','img/shop/models/big/017.jpg','11');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/018.jpg','img/shop/models/middle/018.jpg','img/shop/models/big/018.jpg','11');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/011.jpg','img/shop/models/middle/011.jpg','img/shop/models/big/011.jpg','12');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/012.jpg','img/shop/models/middle/012.jpg','img/shop/models/big/012.jpg','12');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/013.jpg','img/shop/models/middle/013.jpg','img/shop/models/big/013.jpg','12');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/014.jpg','img/shop/models/middle/014.jpg','img/shop/models/big/014.jpg','12');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/015.jpg','img/shop/models/middle/015.jpg','img/shop/models/big/015.jpg','12');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/016.jpg','img/shop/models/middle/016.jpg','img/shop/models/big/016.jpg','12');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/017.jpg','img/shop/models/middle/017.jpg','img/shop/models/big/017.jpg','12');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/018.jpg','img/shop/models/middle/018.jpg','img/shop/models/big/018.jpg','12');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/011.jpg','img/shop/models/middle/011.jpg','img/shop/models/big/011.jpg','13');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/012.jpg','img/shop/models/middle/012.jpg','img/shop/models/big/012.jpg','13');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/013.jpg','img/shop/models/middle/013.jpg','img/shop/models/big/013.jpg','13');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/014.jpg','img/shop/models/middle/014.jpg','img/shop/models/big/014.jpg','13');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/015.jpg','img/shop/models/middle/015.jpg','img/shop/models/big/015.jpg','13');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/016.jpg','img/shop/models/middle/016.jpg','img/shop/models/big/016.jpg','13');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/017.jpg','img/shop/models/middle/017.jpg','img/shop/models/big/017.jpg','13');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/018.jpg','img/shop/models/middle/018.jpg','img/shop/models/big/018.jpg','13');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/011.jpg','img/shop/models/middle/011.jpg','img/shop/models/big/011.jpg','14');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/012.jpg','img/shop/models/middle/012.jpg','img/shop/models/big/012.jpg','14');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/013.jpg','img/shop/models/middle/013.jpg','img/shop/models/big/013.jpg','14');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/014.jpg','img/shop/models/middle/014.jpg','img/shop/models/big/014.jpg','14');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/015.jpg','img/shop/models/middle/015.jpg','img/shop/models/big/015.jpg','14');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/016.jpg','img/shop/models/middle/016.jpg','img/shop/models/big/016.jpg','14');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/017.jpg','img/shop/models/middle/017.jpg','img/shop/models/big/017.jpg','14');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/018.jpg','img/shop/models/middle/018.jpg','img/shop/models/big/018.jpg','14');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/011.jpg','img/shop/models/middle/011.jpg','img/shop/models/big/011.jpg','15');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/012.jpg','img/shop/models/middle/012.jpg','img/shop/models/big/012.jpg','15');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/013.jpg','img/shop/models/middle/013.jpg','img/shop/models/big/013.jpg','15');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/014.jpg','img/shop/models/middle/014.jpg','img/shop/models/big/014.jpg','15');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/015.jpg','img/shop/models/middle/015.jpg','img/shop/models/big/015.jpg','15');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/016.jpg','img/shop/models/middle/016.jpg','img/shop/models/big/016.jpg','15');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/017.jpg','img/shop/models/middle/017.jpg','img/shop/models/big/017.jpg','15');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/018.jpg','img/shop/models/middle/018.jpg','img/shop/models/big/018.jpg','15');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/011.jpg','img/shop/models/middle/011.jpg','img/shop/models/big/011.jpg','16');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/012.jpg','img/shop/models/middle/012.jpg','img/shop/models/big/012.jpg','16');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/013.jpg','img/shop/models/middle/013.jpg','img/shop/models/big/013.jpg','16');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/014.jpg','img/shop/models/middle/014.jpg','img/shop/models/big/014.jpg','16');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/015.jpg','img/shop/models/middle/015.jpg','img/shop/models/big/015.jpg','16');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/016.jpg','img/shop/models/middle/016.jpg','img/shop/models/big/016.jpg','16');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/017.jpg','img/shop/models/middle/017.jpg','img/shop/models/big/017.jpg','16');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/018.jpg','img/shop/models/middle/018.jpg','img/shop/models/big/018.jpg','16');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/011.jpg','img/shop/models/middle/011.jpg','img/shop/models/big/011.jpg','17');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/012.jpg','img/shop/models/middle/012.jpg','img/shop/models/big/012.jpg','17');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/013.jpg','img/shop/models/middle/013.jpg','img/shop/models/big/013.jpg','17');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/014.jpg','img/shop/models/middle/014.jpg','img/shop/models/big/014.jpg','17');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/015.jpg','img/shop/models/middle/015.jpg','img/shop/models/big/015.jpg','17');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/016.jpg','img/shop/models/middle/016.jpg','img/shop/models/big/016.jpg','17');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/017.jpg','img/shop/models/middle/017.jpg','img/shop/models/big/017.jpg','17');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/018.jpg','img/shop/models/middle/018.jpg','img/shop/models/big/018.jpg','17');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/011.jpg','img/shop/models/middle/011.jpg','img/shop/models/big/011.jpg','18');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/012.jpg','img/shop/models/middle/012.jpg','img/shop/models/big/012.jpg','18');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/013.jpg','img/shop/models/middle/013.jpg','img/shop/models/big/013.jpg','18');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/014.jpg','img/shop/models/middle/014.jpg','img/shop/models/big/014.jpg','18');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/015.jpg','img/shop/models/middle/015.jpg','img/shop/models/big/015.jpg','18');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/016.jpg','img/shop/models/middle/016.jpg','img/shop/models/big/016.jpg','18');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/017.jpg','img/shop/models/middle/017.jpg','img/shop/models/big/017.jpg','18');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/018.jpg','img/shop/models/middle/018.jpg','img/shop/models/big/018.jpg','18');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/011.jpg','img/shop/models/middle/011.jpg','img/shop/models/big/011.jpg','19');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/012.jpg','img/shop/models/middle/012.jpg','img/shop/models/big/012.jpg','19');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/013.jpg','img/shop/models/middle/013.jpg','img/shop/models/big/013.jpg','19');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/014.jpg','img/shop/models/middle/014.jpg','img/shop/models/big/014.jpg','19');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/015.jpg','img/shop/models/middle/015.jpg','img/shop/models/big/015.jpg','19');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/016.jpg','img/shop/models/middle/016.jpg','img/shop/models/big/016.jpg','19');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/017.jpg','img/shop/models/middle/017.jpg','img/shop/models/big/017.jpg','19');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/018.jpg','img/shop/models/middle/018.jpg','img/shop/models/big/018.jpg','19');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/011.jpg','img/shop/models/middle/011.jpg','img/shop/models/big/011.jpg','110');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/012.jpg','img/shop/models/middle/012.jpg','img/shop/models/big/012.jpg','110');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/013.jpg','img/shop/models/middle/013.jpg','img/shop/models/big/013.jpg','110');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/014.jpg','img/shop/models/middle/014.jpg','img/shop/models/big/014.jpg','110');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/015.jpg','img/shop/models/middle/015.jpg','img/shop/models/big/015.jpg','110');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/016.jpg','img/shop/models/middle/016.jpg','img/shop/models/big/016.jpg','110');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/017.jpg','img/shop/models/middle/017.jpg','img/shop/models/big/017.jpg','110');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/018.jpg','img/shop/models/middle/018.jpg','img/shop/models/big/018.jpg','110');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/011.jpg','img/shop/models/middle/011.jpg','img/shop/models/big/011.jpg','111');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/012.jpg','img/shop/models/middle/012.jpg','img/shop/models/big/012.jpg','111');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/013.jpg','img/shop/models/middle/013.jpg','img/shop/models/big/013.jpg','111');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/014.jpg','img/shop/models/middle/014.jpg','img/shop/models/big/014.jpg','111');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/015.jpg','img/shop/models/middle/015.jpg','img/shop/models/big/015.jpg','111');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/016.jpg','img/shop/models/middle/016.jpg','img/shop/models/big/016.jpg','111');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/017.jpg','img/shop/models/middle/017.jpg','img/shop/models/big/017.jpg','111');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/models/small/018.jpg','img/shop/models/middle/018.jpg','img/shop/models/big/018.jpg','111');
	-- COLLECTIBLES
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/011.jpg','img/shop/collectibles/middle/011.jpg','img/shop/collectibles/big/011.jpg','21');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/012.jpg','img/shop/collectibles/middle/012.jpg','img/shop/collectibles/big/012.jpg','21');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/013.jpg','img/shop/collectibles/middle/013.jpg','img/shop/collectibles/big/013.jpg','21');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/014.jpg','img/shop/collectibles/middle/014.jpg','img/shop/collectibles/big/014.jpg','21');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/015.jpg','img/shop/collectibles/middle/015.jpg','img/shop/collectibles/big/015.jpg','21');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/016.jpg','img/shop/collectibles/middle/016.jpg','img/shop/collectibles/big/016.jpg','21');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/017.jpg','img/shop/collectibles/middle/017.jpg','img/shop/collectibles/big/017.jpg','21');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/011.jpg','img/shop/collectibles/middle/011.jpg','img/shop/collectibles/big/011.jpg','22');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/012.jpg','img/shop/collectibles/middle/012.jpg','img/shop/collectibles/big/012.jpg','22');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/013.jpg','img/shop/collectibles/middle/013.jpg','img/shop/collectibles/big/013.jpg','22');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/014.jpg','img/shop/collectibles/middle/014.jpg','img/shop/collectibles/big/014.jpg','22');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/015.jpg','img/shop/collectibles/middle/015.jpg','img/shop/collectibles/big/015.jpg','22');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/016.jpg','img/shop/collectibles/middle/016.jpg','img/shop/collectibles/big/016.jpg','22');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/017.jpg','img/shop/collectibles/middle/017.jpg','img/shop/collectibles/big/017.jpg','22');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/011.jpg','img/shop/collectibles/middle/011.jpg','img/shop/collectibles/big/011.jpg','23');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/012.jpg','img/shop/collectibles/middle/012.jpg','img/shop/collectibles/big/012.jpg','23');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/013.jpg','img/shop/collectibles/middle/013.jpg','img/shop/collectibles/big/013.jpg','23');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/014.jpg','img/shop/collectibles/middle/014.jpg','img/shop/collectibles/big/014.jpg','23');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/015.jpg','img/shop/collectibles/middle/015.jpg','img/shop/collectibles/big/015.jpg','23');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/016.jpg','img/shop/collectibles/middle/016.jpg','img/shop/collectibles/big/016.jpg','23');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/017.jpg','img/shop/collectibles/middle/017.jpg','img/shop/collectibles/big/017.jpg','23');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/011.jpg','img/shop/collectibles/middle/011.jpg','img/shop/collectibles/big/011.jpg','24');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/012.jpg','img/shop/collectibles/middle/012.jpg','img/shop/collectibles/big/012.jpg','24');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/013.jpg','img/shop/collectibles/middle/013.jpg','img/shop/collectibles/big/013.jpg','24');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/014.jpg','img/shop/collectibles/middle/014.jpg','img/shop/collectibles/big/014.jpg','24');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/015.jpg','img/shop/collectibles/middle/015.jpg','img/shop/collectibles/big/015.jpg','24');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/016.jpg','img/shop/collectibles/middle/016.jpg','img/shop/collectibles/big/016.jpg','24');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/017.jpg','img/shop/collectibles/middle/017.jpg','img/shop/collectibles/big/017.jpg','24');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/011.jpg','img/shop/collectibles/middle/011.jpg','img/shop/collectibles/big/011.jpg','26');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/012.jpg','img/shop/collectibles/middle/012.jpg','img/shop/collectibles/big/012.jpg','26');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/013.jpg','img/shop/collectibles/middle/013.jpg','img/shop/collectibles/big/013.jpg','26');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/014.jpg','img/shop/collectibles/middle/014.jpg','img/shop/collectibles/big/014.jpg','26');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/015.jpg','img/shop/collectibles/middle/015.jpg','img/shop/collectibles/big/015.jpg','26');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/016.jpg','img/shop/collectibles/middle/016.jpg','img/shop/collectibles/big/016.jpg','26');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/017.jpg','img/shop/collectibles/middle/017.jpg','img/shop/collectibles/big/017.jpg','26');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/011.jpg','img/shop/collectibles/middle/011.jpg','img/shop/collectibles/big/011.jpg','27');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/012.jpg','img/shop/collectibles/middle/012.jpg','img/shop/collectibles/big/012.jpg','27');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/013.jpg','img/shop/collectibles/middle/013.jpg','img/shop/collectibles/big/013.jpg','27');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/014.jpg','img/shop/collectibles/middle/014.jpg','img/shop/collectibles/big/014.jpg','27');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/015.jpg','img/shop/collectibles/middle/015.jpg','img/shop/collectibles/big/015.jpg','27');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/016.jpg','img/shop/collectibles/middle/016.jpg','img/shop/collectibles/big/016.jpg','27');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/017.jpg','img/shop/collectibles/middle/017.jpg','img/shop/collectibles/big/017.jpg','27');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/011.jpg','img/shop/collectibles/middle/011.jpg','img/shop/collectibles/big/011.jpg','28');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/012.jpg','img/shop/collectibles/middle/012.jpg','img/shop/collectibles/big/012.jpg','28');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/013.jpg','img/shop/collectibles/middle/013.jpg','img/shop/collectibles/big/013.jpg','28');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/014.jpg','img/shop/collectibles/middle/014.jpg','img/shop/collectibles/big/014.jpg','28');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/015.jpg','img/shop/collectibles/middle/015.jpg','img/shop/collectibles/big/015.jpg','28');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/016.jpg','img/shop/collectibles/middle/016.jpg','img/shop/collectibles/big/016.jpg','28');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/017.jpg','img/shop/collectibles/middle/017.jpg','img/shop/collectibles/big/017.jpg','28');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/011.jpg','img/shop/collectibles/middle/011.jpg','img/shop/collectibles/big/011.jpg','29');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/012.jpg','img/shop/collectibles/middle/012.jpg','img/shop/collectibles/big/012.jpg','29');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/013.jpg','img/shop/collectibles/middle/013.jpg','img/shop/collectibles/big/013.jpg','29');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/014.jpg','img/shop/collectibles/middle/014.jpg','img/shop/collectibles/big/014.jpg','29');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/015.jpg','img/shop/collectibles/middle/015.jpg','img/shop/collectibles/big/015.jpg','29');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/016.jpg','img/shop/collectibles/middle/016.jpg','img/shop/collectibles/big/016.jpg','29');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/017.jpg','img/shop/collectibles/middle/017.jpg','img/shop/collectibles/big/017.jpg','29');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/011.jpg','img/shop/collectibles/middle/011.jpg','img/shop/collectibles/big/011.jpg','210');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/012.jpg','img/shop/collectibles/middle/012.jpg','img/shop/collectibles/big/012.jpg','210');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/013.jpg','img/shop/collectibles/middle/013.jpg','img/shop/collectibles/big/013.jpg','210');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/014.jpg','img/shop/collectibles/middle/014.jpg','img/shop/collectibles/big/014.jpg','210');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/015.jpg','img/shop/collectibles/middle/015.jpg','img/shop/collectibles/big/015.jpg','210');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/016.jpg','img/shop/collectibles/middle/016.jpg','img/shop/collectibles/big/016.jpg','210');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/017.jpg','img/shop/collectibles/middle/017.jpg','img/shop/collectibles/big/017.jpg','210');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/011.jpg','img/shop/collectibles/middle/011.jpg','img/shop/collectibles/big/011.jpg','211');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/012.jpg','img/shop/collectibles/middle/012.jpg','img/shop/collectibles/big/012.jpg','211');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/013.jpg','img/shop/collectibles/middle/013.jpg','img/shop/collectibles/big/013.jpg','211');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/014.jpg','img/shop/collectibles/middle/014.jpg','img/shop/collectibles/big/014.jpg','211');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/015.jpg','img/shop/collectibles/middle/015.jpg','img/shop/collectibles/big/015.jpg','211');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/016.jpg','img/shop/collectibles/middle/016.jpg','img/shop/collectibles/big/016.jpg','211');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/collectibles/small/017.jpg','img/shop/collectibles/middle/017.jpg','img/shop/collectibles/big/017.jpg','211');
	-- CLOTHING
		INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/011.jpg','img/shop/clothing/middle/011.jpg','img/shop/clothing/big/011.jpg','31');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/012.jpg','img/shop/clothing/middle/012.jpg','img/shop/clothing/big/012.jpg','31');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/011.jpg','img/shop/clothing/middle/011.jpg','img/shop/clothing/big/011.jpg','32');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/012.jpg','img/shop/clothing/middle/012.jpg','img/shop/clothing/big/012.jpg','32');INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/011.jpg','img/shop/clothing/middle/011.jpg','img/shop/clothing/big/011.jpg','33');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/012.jpg','img/shop/clothing/middle/012.jpg','img/shop/clothing/big/012.jpg','33');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/011.jpg','img/shop/clothing/middle/011.jpg','img/shop/clothing/big/011.jpg','34');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/012.jpg','img/shop/clothing/middle/012.jpg','img/shop/clothing/big/012.jpg','34');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/011.jpg','img/shop/clothing/middle/011.jpg','img/shop/clothing/big/011.jpg','35');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/012.jpg','img/shop/clothing/middle/012.jpg','img/shop/clothing/big/012.jpg','35');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/011.jpg','img/shop/clothing/middle/011.jpg','img/shop/clothing/big/011.jpg','36');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/012.jpg','img/shop/clothing/middle/012.jpg','img/shop/clothing/big/012.jpg','36');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/011.jpg','img/shop/clothing/middle/011.jpg','img/shop/clothing/big/011.jpg','37');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/012.jpg','img/shop/clothing/middle/012.jpg','img/shop/clothing/big/012.jpg','37');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/011.jpg','img/shop/clothing/middle/011.jpg','img/shop/clothing/big/011.jpg','38');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/012.jpg','img/shop/clothing/middle/012.jpg','img/shop/clothing/big/012.jpg','38');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/011.jpg','img/shop/clothing/middle/011.jpg','img/shop/clothing/big/011.jpg','39');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/012.jpg','img/shop/clothing/middle/012.jpg','img/shop/clothing/big/012.jpg','39');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/011.jpg','img/shop/clothing/middle/011.jpg','img/shop/clothing/big/011.jpg','310');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/012.jpg','img/shop/clothing/middle/012.jpg','img/shop/clothing/big/012.jpg','310');	
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/011.jpg','img/shop/clothing/middle/011.jpg','img/shop/clothing/big/011.jpg','311');
		-- INSERT INTO `shop_imgs` VALUES ('','img/shop/clothing/small/012.jpg','img/shop/clothing/middle/012.jpg','img/shop/clothing/big/012.jpg','311');
	-- JEWELRY
		INSERT INTO `shop_imgs` VALUES ('','img/shop/jewelry/small/011.jpg','img/shop/jewelry/middle/011.jpg','img/shop/jewelry/big/011.jpg','41');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/jewelry/small/012.jpg','img/shop/jewelry/middle/012.jpg','img/shop/jewelry/big/012.jpg','41');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/jewelry/small/011.jpg','img/shop/jewelry/middle/011.jpg','img/shop/jewelry/big/011.jpg','42');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/jewelry/small/012.jpg','img/shop/jewelry/middle/012.jpg','img/shop/jewelry/big/012.jpg','42');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/jewelry/small/011.jpg','img/shop/jewelry/middle/011.jpg','img/shop/jewelry/big/011.jpg','43');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/jewelry/small/012.jpg','img/shop/jewelry/middle/012.jpg','img/shop/jewelry/big/012.jpg','43');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/jewelry/small/011.jpg','img/shop/jewelry/middle/011.jpg','img/shop/jewelry/big/011.jpg','44');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/jewelry/small/012.jpg','img/shop/jewelry/middle/012.jpg','img/shop/jewelry/big/012.jpg','44');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/jewelry/small/011.jpg','img/shop/jewelry/middle/011.jpg','img/shop/jewelry/big/011.jpg','46');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/jewelry/small/012.jpg','img/shop/jewelry/middle/012.jpg','img/shop/jewelry/big/012.jpg','46');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/jewelry/small/011.jpg','img/shop/jewelry/middle/011.jpg','img/shop/jewelry/big/011.jpg','47');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/jewelry/small/012.jpg','img/shop/jewelry/middle/012.jpg','img/shop/jewelry/big/012.jpg','47');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/jewelry/small/011.jpg','img/shop/jewelry/middle/011.jpg','img/shop/jewelry/big/011.jpg','48');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/jewelry/small/012.jpg','img/shop/jewelry/middle/012.jpg','img/shop/jewelry/big/012.jpg','48');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/jewelry/small/011.jpg','img/shop/jewelry/middle/011.jpg','img/shop/jewelry/big/011.jpg','49');
		INSERT INTO `shop_imgs` VALUES ('','img/shop/jewelry/small/012.jpg','img/shop/jewelry/middle/012.jpg','img/shop/jewelry/big/012.jpg','49');

-- 创建用户购物车信息表
	DROP TABLE IF EXISTS `shop_cart`;
	CREATE TABLE `shop_cart`(
		`iid` 		INT PRIMARY KEY AUTO_INCREMENT,				#购物车内商品ID
		`uid`		INT,										#用户名ID
		`shop_id` 	INT,										#商品ID
		FOREIGN KEY(shop_id) REFERENCES shop_details(sdid),		#外链到shop_details的sdid
		`count`		INT,										#购买数量
		`is_check`	BOOLEAN										#是否购买/是否勾选
	)
-- 创建用户购买信息表
-- 创建用户订单详情表
-- 创建首页轮播表
-- 创建车系表
-- 创建首页车系展示表
-- 创建车系详情介绍表
-- 创建博客表

