/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : 127.0.0.1:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 23/03/2022 11:52:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for file_folder
-- ----------------------------
DROP TABLE IF EXISTS `file_folder`;
CREATE TABLE `file_folder`  (
  `file_folder_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '文件夹ID',
  `file_folder_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件夹名称',
  `parent_folder_id` int(0) DEFAULT 0 COMMENT '父文件夹ID',
  `file_store_id` int(0) DEFAULT NULL COMMENT '所属文件仓库ID',
  `time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`file_folder_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_folder
-- ----------------------------
INSERT INTO `file_folder` VALUES (1, 'less', 0, 1, '2021-07-17 17:00:06');

-- ----------------------------
-- Table structure for file_store
-- ----------------------------
DROP TABLE IF EXISTS `file_store`;
CREATE TABLE `file_store`  (
  `file_store_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '文件仓库ID',
  `user_id` int(0) DEFAULT NULL COMMENT '主人ID',
  `current_size` int(0) DEFAULT 0 COMMENT '当前容量（单位KB）',
  `max_size` int(0) DEFAULT 1048576 COMMENT '最大容量（单位KB）',
  `permission` int(0) DEFAULT 0 COMMENT '仓库权限，0可上传下载、1不允许上传可以下载、2不可以上传下载',
  PRIMARY KEY (`file_store_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_store
-- ----------------------------
INSERT INTO `file_store` VALUES (1, 2, 0, 1048576, 0);

-- ----------------------------
-- Table structure for msg
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date` datetime(0) DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of msg
-- ----------------------------
INSERT INTO `msg` VALUES ('远程数据库密码', 'HUOyingrenzhe520', '2021-06-26 10:10:14');

-- ----------------------------
-- Table structure for my_file
-- ----------------------------
DROP TABLE IF EXISTS `my_file`;
CREATE TABLE `my_file`  (
  `my_file_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `my_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件名',
  `file_store_id` int(0) DEFAULT NULL COMMENT '文件仓库ID',
  `my_file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '/' COMMENT '文件存储路径',
  `download_time` int(0) DEFAULT 0 COMMENT '下载次数',
  `upload_time` datetime(0) DEFAULT NULL COMMENT '上传时间',
  `parent_folder_id` int(0) DEFAULT NULL COMMENT '父文件夹ID',
  `size` int(0) DEFAULT NULL COMMENT '文件大小',
  `type` int(0) DEFAULT NULL COMMENT '文件类型',
  `postfix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件后缀',
  PRIMARY KEY (`my_file_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for nb_article
-- ----------------------------
DROP TABLE IF EXISTS `nb_article`;
CREATE TABLE `nb_article`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `post` datetime(6) NOT NULL,
  `title` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `appreciable` tinyint(1) DEFAULT 0,
  `approve_cnt` int(0) DEFAULT NULL,
  `author_id` bigint(0) NOT NULL,
  `commented` tinyint(1) DEFAULT 0,
  `reprinted` tinyint(1) DEFAULT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `draft` tinyint(1) NOT NULL DEFAULT 1,
  `md_content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `modify` datetime(6) DEFAULT NULL,
  `summary` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `text_content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `top` int(0) DEFAULT NULL,
  `url_seq` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `views` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nb_article
-- ----------------------------
INSERT INTO `nb_article` VALUES ('60c36ea2a7ad7a6ae6064dfd', '2021-06-11 22:18:49.637000', '字符串匹配的KMP算法', 0, 59, 1, 0, 1, '<h5 id=\"h5--lt-lt-gt-gt-lt-lt-kmp-gt-gt-\"><a name=\"注:转自&lt;&lt;  阮一峰的网络日志 &gt;&gt;中的&lt;&lt;  字符串匹配的KMP算法 &gt;&gt;\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>注:转自&lt;&lt;<a href=\"http://www.ruanyifeng.com/blog/\" title=\"阮一峰的网络日志\">阮一峰的网络日志</a>&gt;&gt;中的&lt;&lt;<a href=\"http://www.ruanyifeng.com/blog/2013/05/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm.html\" title=\"字符串匹配的KMP算法\">字符串匹配的KMP算法</a>&gt;&gt;</h5><hr>\n<p>字符串匹配是计算机的基本任务之一。</p>\n<p>举例来说，有一个字符串”BBC ABCDAB ABCDABCDABDE”，我想知道，里面是否包含另一个字符串”ABCDABD”？</p>\n<p><img src=\"http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050101.jpg\" alt=\"\"></p>\n<p>许多算法可以完成这个任务，Knuth-Morris-Pratt算法（简称KMP）是最常用的之一。它以三个发明者命名，起头的那个K就是著名科学家Donald Knuth。</p>\n<p><img src=\"http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050102.jpg\" alt=\"\"></p>\n<p>这种算法不太容易理解，网上有很多解释，但读起来都很费劲。直到读到Jake Boxer的文章，我才真正理解这种算法。下面，我用自己的语言，试图写一篇比较好懂的KMP算法解释。</p>\n<p>1.</p>\n<p><img src=\"http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050103.png\" alt=\"\"></p>\n<p>首先，字符串”BBC ABCDAB ABCDABCDABDE”的第一个字符与搜索词”ABCDABD”的第一个字符，进行比较。因为B与A不匹配，所以搜索词后移一位。</p>\n<p>2.</p>\n<p><img src=\"http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050104.png\" alt=\"\"></p>\n<p>因为B与A不匹配，搜索词再往后移。</p>\n<p>3.</p>\n<p><img src=\"http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050105.png\" alt=\"\"></p>\n<p>就这样，直到字符串有一个字符，与搜索词的第一个字符相同为止。</p>\n<p>4.</p>\n<p><img src=\"http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050106.png\" alt=\"\"></p>\n<p>接着比较字符串和搜索词的下一个字符，还是相同。</p>\n<p>5.</p>\n<p><img src=\"http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050107.png\" alt=\"\"></p>\n<p>直到字符串有一个字符，与搜索词对应的字符不相同为止。</p>\n<p>6.</p>\n<p><img src=\"http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050107.png\" alt=\"\"></p>\n<p>这时，最自然的反应是，将搜索词整个后移一位，再从头逐个比较。这样做虽然可行，但是效率很差，因为你要把”搜索位置”移到已经比较过的位置，重比一遍。</p>\n<p>7.</p>\n<p><img src=\"http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050107.png\" alt=\"\"></p>\n<p>一个基本事实是，当空格与D不匹配时，你其实知道前面六个字符是”ABCDAB”。KMP算法的想法是，设法利用这个已知信息，不要把”搜索位置”移回已经比较过的位置，继续把它向后移，这样就提高了效率。</p>\n<p>8.</p>\n<p><img src=\"http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050109.png\" alt=\"\"></p>\n<p>怎么做到这一点呢？可以针对搜索词，算出一张《部分匹配表》（Partial Match Table）。这张表是如何产生的，后面再介绍，这里只要会用就可以了。</p>\n<p>9.</p>\n<p><img src=\"http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050107.png\" alt=\"\"></p>\n<p>已知空格与D不匹配时，前面六个字符”ABCDAB”是匹配的。查表可知，最后一个匹配字符B对应的”部分匹配值”为2，因此按照下面的公式算出向后移动的位数：</p>\n<pre><code>移动位数 = 已匹配的字符数 - 对应的部分匹配值\n</code></pre><p>因为 6 - 2 等于4，所以将搜索词向后移动4位。</p>\n<p>10.</p>\n<p><img src=\"http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050110.png\" alt=\"\"></p>\n<p>因为空格与Ｃ不匹配，搜索词还要继续往后移。这时，已匹配的字符数为2（”AB”），对应的”部分匹配值”为0。所以，移动位数 = 2 - 0，结果为 2，于是将搜索词向后移2位。</p>\n<p>11.</p>\n<p><img src=\"http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050111.png\" alt=\"\"></p>\n<p>因为空格与A不匹配，继续后移一位。</p>\n<p>12.</p>\n<p><img src=\"http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050112.png\" alt=\"\"></p>\n<p>逐位比较，直到发现C与D不匹配。于是，移动位数 = 6 - 2，继续将搜索词向后移动4位。</p>\n<p>13.</p>\n<p><img src=\"http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050113.png\" alt=\"\"></p>\n<p>逐位比较，直到搜索词的最后一位，发现完全匹配，于是搜索完成。如果还要继续搜索（即找出全部匹配），移动位数 = 7 - 0，再将搜索词向后移动7位，这里就不再重复了。</p>\n<p>14.</p>\n<p><img src=\"http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050114.png\" alt=\"\"></p>\n<p>下面介绍《部分匹配表》是如何产生的。</p>\n<p>首先，要了解两个概念：”前缀”和”后缀”。 “前缀”指除了最后一个字符以外，一个字符串的全部头部组合；”后缀”指除了第一个字符以外，一个字符串的全部尾部组合。</p>\n<p>15.</p>\n<p><img src=\"http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050109.png\" alt=\"\"></p>\n<p>“部分匹配值”就是”前缀”和”后缀”的最长的共有元素的长度。以”ABCDABD”为例，</p>\n<pre><code>　　－　&quot;A&quot;的前缀和后缀都为空集，共有元素的长度为0；\n\n　　－　&quot;AB&quot;的前缀为[A]，后缀为[B]，共有元素的长度为0；\n\n　　－　&quot;ABC&quot;的前缀为[A, AB]，后缀为[BC, C]，共有元素的长度0；\n\n　　－　&quot;ABCD&quot;的前缀为[A, AB, ABC]，后缀为[BCD, CD, D]，共有元素的长度为0；\n\n　　－　&quot;ABCDA&quot;的前缀为[A, AB, ABC, ABCD]，后缀为[BCDA, CDA, DA, A]，共有元素为&quot;A&quot;，长度为1；\n\n　　－　&quot;ABCDAB&quot;的前缀为[A, AB, ABC, ABCD, ABCDA]，后缀为[BCDAB, CDAB, DAB, AB, B]，共有元素为&quot;AB&quot;，长度为2；\n\n　　－　&quot;ABCDABD&quot;的前缀为[A, AB, ABC, ABCD, ABCDA, ABCDAB]，后缀为[BCDABD, CDABD, DABD, ABD, BD, D]，共有元素的长度为0。\n</code></pre><p>16.</p>\n<p><img src=\"http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050112.png\" alt=\"\"></p>\n<p>“部分匹配”的实质是，有时候，字符串头部和尾部会有重复。比如，”ABCDAB”之中有两个”AB”，那么它的”部分匹配值”就是2（”AB”的长度）。搜索词移动的时候，第一个”AB”向后移动4位（字符串长度-部分匹配值），就可以来到第二个”AB”的位置。</p>\n<p>（完）</p>\n', '/upfiles/img/2021-06-11/ea8fad9c-45c6-4a99-93fd-198ac08c4f4a.png', 0, '##### 注:转自<<[阮一峰的网络日志](http://www.ruanyifeng.com/blog/ \"阮一峰的网络日志\")>>中的<<[字符串匹配的KMP算法](http://www.ruanyifeng.com/blog/2013/05/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm.html \"字符串匹配的KMP算法\")>>\n\n------------\n\n\n字符串匹配是计算机的基本任务之一。\n\n举例来说，有一个字符串\"BBC ABCDAB ABCDABCDABDE\"，我想知道，里面是否包含另一个字符串\"ABCDABD\"？\n\n![](http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050101.jpg)\n\n许多算法可以完成这个任务，Knuth-Morris-Pratt算法（简称KMP）是最常用的之一。它以三个发明者命名，起头的那个K就是著名科学家Donald Knuth。\n\n![](http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050102.jpg)\n\n这种算法不太容易理解，网上有很多解释，但读起来都很费劲。直到读到Jake Boxer的文章，我才真正理解这种算法。下面，我用自己的语言，试图写一篇比较好懂的KMP算法解释。\n\n1.\n\n![](http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050103.png)\n\n首先，字符串\"BBC ABCDAB ABCDABCDABDE\"的第一个字符与搜索词\"ABCDABD\"的第一个字符，进行比较。因为B与A不匹配，所以搜索词后移一位。\n\n2.\n\n![](http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050104.png)\n\n因为B与A不匹配，搜索词再往后移。\n\n3.\n\n![](http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050105.png)\n\n就这样，直到字符串有一个字符，与搜索词的第一个字符相同为止。\n\n4.\n\n![](http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050106.png)\n\n接着比较字符串和搜索词的下一个字符，还是相同。\n\n5.\n\n![](http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050107.png)\n\n直到字符串有一个字符，与搜索词对应的字符不相同为止。\n\n6.\n\n![](http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050107.png)\n\n这时，最自然的反应是，将搜索词整个后移一位，再从头逐个比较。这样做虽然可行，但是效率很差，因为你要把\"搜索位置\"移到已经比较过的位置，重比一遍。\n\n7.\n\n![](http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050107.png)\n\n一个基本事实是，当空格与D不匹配时，你其实知道前面六个字符是\"ABCDAB\"。KMP算法的想法是，设法利用这个已知信息，不要把\"搜索位置\"移回已经比较过的位置，继续把它向后移，这样就提高了效率。\n\n8.\n\n![](http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050109.png)\n\n怎么做到这一点呢？可以针对搜索词，算出一张《部分匹配表》（Partial Match Table）。这张表是如何产生的，后面再介绍，这里只要会用就可以了。\n\n9.\n\n![](http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050107.png)\n\n已知空格与D不匹配时，前面六个字符\"ABCDAB\"是匹配的。查表可知，最后一个匹配字符B对应的\"部分匹配值\"为2，因此按照下面的公式算出向后移动的位数：\n\n    移动位数 = 已匹配的字符数 - 对应的部分匹配值\n\n因为 6 - 2 等于4，所以将搜索词向后移动4位。\n\n10.\n\n![](http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050110.png)\n\n因为空格与Ｃ不匹配，搜索词还要继续往后移。这时，已匹配的字符数为2（\"AB\"），对应的\"部分匹配值\"为0。所以，移动位数 = 2 - 0，结果为 2，于是将搜索词向后移2位。\n\n11.\n\n![](http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050111.png)\n\n因为空格与A不匹配，继续后移一位。\n\n12.\n\n![](http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050112.png)\n\n逐位比较，直到发现C与D不匹配。于是，移动位数 = 6 - 2，继续将搜索词向后移动4位。\n\n13.\n\n![](http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050113.png)\n\n逐位比较，直到搜索词的最后一位，发现完全匹配，于是搜索完成。如果还要继续搜索（即找出全部匹配），移动位数 = 7 - 0，再将搜索词向后移动7位，这里就不再重复了。\n\n14.\n\n![](http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050114.png)\n\n下面介绍《部分匹配表》是如何产生的。\n\n首先，要了解两个概念：\"前缀\"和\"后缀\"。 \"前缀\"指除了最后一个字符以外，一个字符串的全部头部组合；\"后缀\"指除了第一个字符以外，一个字符串的全部尾部组合。\n\n15.\n\n![](http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050109.png)\n\n\"部分匹配值\"就是\"前缀\"和\"后缀\"的最长的共有元素的长度。以\"ABCDABD\"为例，\n\n```\n　　－　\"A\"的前缀和后缀都为空集，共有元素的长度为0；\n\n　　－　\"AB\"的前缀为[A]，后缀为[B]，共有元素的长度为0；\n\n　　－　\"ABC\"的前缀为[A, AB]，后缀为[BC, C]，共有元素的长度0；\n\n　　－　\"ABCD\"的前缀为[A, AB, ABC]，后缀为[BCD, CD, D]，共有元素的长度为0；\n\n　　－　\"ABCDA\"的前缀为[A, AB, ABC, ABCD]，后缀为[BCDA, CDA, DA, A]，共有元素为\"A\"，长度为1；\n\n　　－　\"ABCDAB\"的前缀为[A, AB, ABC, ABCD, ABCDA]，后缀为[BCDAB, CDAB, DAB, AB, B]，共有元素为\"AB\"，长度为2；\n\n　　－　\"ABCDABD\"的前缀为[A, AB, ABC, ABCD, ABCDA, ABCDAB]，后缀为[BCDABD, CDABD, DABD, ABD, BD, D]，共有元素的长度为0。\n```\n\n16.\n\n![](http://www.ruanyifeng.com/blogimg/asset/201305/bg2013050112.png)\n\n\"部分匹配\"的实质是，有时候，字符串头部和尾部会有重复。比如，\"ABCDAB\"之中有两个\"AB\"，那么它的\"部分匹配值\"就是2（\"AB\"的长度）。搜索词移动的时候，第一个\"AB\"向后移动4位（字符串长度-部分匹配值），就可以来到第二个\"AB\"的位置。\n\n（完）\n[1]: http://www.ruanyifeng.com/blog/2013/05/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm.html \"字符串匹配的KMP算法\"', '2021-06-11 22:30:43.827000', '字符串匹配是计算机的基本任务之一。举例来说，有一个字符串”BBCABCDABABCDABCDABDE”，我想知道，里面是否包含另一个字符串”ABCDABD”？许多算法可以完成这个任务，Knuth-Morris-Pratt算法（简称KMP）是最常用的之一。它以三个发明者命名，起头的那个K就是著名科学家DonaldKn', '注:转自&lt;&lt;阮一峰的网络日志&gt;&gt;中的&lt;&lt;字符串匹配的KMP算法&gt;&gt;字符串匹配是计算机的基本任务之一。举例来说，有一个字符串”BBCABCDABABCDABCDABDE”，我想知道，里面是否包含另一个字符串”ABCDABD”？许多算法可以完成这个任务，Knuth-Morris-Pratt算法（简称KMP）是最常用的之一。它以三个发明者命名，起头的那个K就是著名科学家DonaldKnuth。这种算法不太容易理解，网上有很多解释，但读起来都', 0, '', 1110);
INSERT INTO `nb_article` VALUES ('60c37169a7ad7a6ae6064dff', '2021-06-11 22:21:45.614000', 'ryt任天野', 0, 71, 1, 0, 0, '<h3 id=\"h3-u60A8u7684u6587u7AE0u4E66u5199u81F3u6B64u7ED5u592Au9633\"><a name=\"您的文章书写至此绕太阳\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>您的文章书写至此绕太阳</h3>', '', 0, '### 您的文章书写至此绕太阳', '2021-06-11 22:21:45.614000', '您的文章书写', '您的文章书写至此绕太阳', 0, '', 1471);

-- ----------------------------
-- Table structure for nb_cash
-- ----------------------------
DROP TABLE IF EXISTS `nb_cash`;
CREATE TABLE `nb_cash`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `cash_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cash_value` int(0) NOT NULL DEFAULT 100 COMMENT '卡密内包含硬币数量，默认100',
  `create_time` datetime(0) DEFAULT NULL COMMENT '充值卡创建时间',
  `recharge_time` datetime(0) DEFAULT NULL COMMENT '用户充值时间',
  `enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '充值之后变为不可用状态',
  `user_id` bigint(0) DEFAULT NULL COMMENT '使用此卡充值的用户id',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for nb_comment
-- ----------------------------
DROP TABLE IF EXISTS `nb_comment`;
CREATE TABLE `nb_comment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `article_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(0) NOT NULL,
  `reply_id` bigint(0) DEFAULT NULL COMMENT '回复的评论ID，如果不是回复他人，则此项为空',
  `clear_comment` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `comment` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `enable` tinyint(1) NOT NULL,
  `ip_addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ip_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `post` datetime(6) DEFAULT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `floor` int(0) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for nb_dict
-- ----------------------------
DROP TABLE IF EXISTS `nb_dict`;
CREATE TABLE `nb_dict`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `group` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nb_dict
-- ----------------------------
INSERT INTO `nb_dict` VALUES (8, '小汪的酱牛肉', 'tag');
INSERT INTO `nb_dict` VALUES (10, 'JAVA', 'cate');
INSERT INTO `nb_dict` VALUES (11, '算法', 'tag');
INSERT INTO `nb_dict` VALUES (12, '啊', 'tag');
INSERT INTO `nb_dict` VALUES (13, 'BiliBili，https://www.bilibili.com/', 'link');
INSERT INTO `nb_dict` VALUES (14, '1', 'download_cate');

-- ----------------------------
-- Table structure for nb_download
-- ----------------------------
DROP TABLE IF EXISTS `nb_download`;
CREATE TABLE `nb_download`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `download_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `download_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `top` tinyint(1) DEFAULT 0,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime(0) DEFAULT NULL,
  `create_user_id` bigint(0) NOT NULL,
  `create_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nb_download
-- ----------------------------
INSERT INTO `nb_download` VALUES ('60c3fe6ca7ad5eba9f23e1a2', '啊', 'http://emiria.top/', '123', 0, '2021-06-12 08:23:08', NULL, 1, NULL, NULL);

-- ----------------------------
-- Table structure for nb_hide
-- ----------------------------
DROP TABLE IF EXISTS `nb_hide`;
CREATE TABLE `nb_hide`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `article_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hide_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '隐藏类型：依次是：回复可见、购买可见以及登录可见 --> comment、purchase、login',
  `hide_html` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `hide_price` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for nb_log
-- ----------------------------
DROP TABLE IF EXISTS `nb_log`;
CREATE TABLE `nb_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `content_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ip_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ip_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `request_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `session_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `time` datetime(0) DEFAULT NULL,
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` bigint(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT INDEX `ip_info`(`ip_info`)
) ENGINE = InnoDB AUTO_INCREMENT = 307 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nb_log
-- ----------------------------
INSERT INTO `nb_log` VALUES (2, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '1FFE9F45FE7CC3E4A8F39B3588130018', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 08:26:57', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (3, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '1FFE9F45FE7CC3E4A8F39B3588130018', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:26:55', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (4, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/sendMailCode', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:39:33', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (5, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/registration', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:38:23', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (6, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/sendMailCode', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:38:02', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (7, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:35:45', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (8, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/sendMailCode', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:35:28', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (9, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/sendMailCode', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:33:57', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (10, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/sendMailCode', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:32:52', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (11, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/reg', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:32:20', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (12, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/image/code', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:32:19', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (13, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:32:19', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (14, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:32:18', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (15, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/token/logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:32:18', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (16, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '1FFE9F45FE7CC3E4A8F39B3588130018', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 08:32:14', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (17, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '1FFE9F45FE7CC3E4A8F39B3588130018', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:32:11', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (18, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '1FFE9F45FE7CC3E4A8F39B3588130018', 'http://localhost/management/settings/profile', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 08:32:09', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (19, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '1FFE9F45FE7CC3E4A8F39B3588130018', 'http://localhost/management/settings/mail/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:32:08', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (20, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '1FFE9F45FE7CC3E4A8F39B3588130018', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:30:37', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (21, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '1FFE9F45FE7CC3E4A8F39B3588130018', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:30:35', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (22, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '1FFE9F45FE7CC3E4A8F39B3588130018', 'http://localhost/management/settings/profile', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 08:30:33', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (23, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '1FFE9F45FE7CC3E4A8F39B3588130018', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 08:30:28', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (24, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '1FFE9F45FE7CC3E4A8F39B3588130018', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 08:30:27', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (25, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '1FFE9F45FE7CC3E4A8F39B3588130018', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 08:30:27', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (26, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/sendMailCode', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:42:31', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (27, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/reg', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:42:12', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (28, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/upfiles/img/2021-06-12/bc3d34a9-4f53-4910-b554-c72b3ea11647.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:55:11', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (29, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/management/user/list', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:55:11', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (30, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/management/user', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 08:55:11', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (31, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'FAE1E500AFC73DB43799C0626545D7F4', 'http://localhost/ubs/token/getUserRemainCoin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:54:27', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (32, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'FAE1E500AFC73DB43799C0626545D7F4', 'http://localhost/upfiles/img/2021-06-12/bc3d34a9-4f53-4910-b554-c72b3ea11647.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:54:27', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (33, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'FAE1E500AFC73DB43799C0626545D7F4', 'http://localhost/ubs/token/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:54:27', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (34, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'FAE1E500AFC73DB43799C0626545D7F4', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:54:27', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (35, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'FAE1E500AFC73DB43799C0626545D7F4', 'http://localhost/upfiles/img/2021-06-11/ea8fad9c-45c6-4a99-93fd-198ac08c4f4a.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:54:21', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (36, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'FAE1E500AFC73DB43799C0626545D7F4', 'http://localhost/upfiles/img/2021-06-12/bc3d34a9-4f53-4910-b554-c72b3ea11647.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:54:21', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (37, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'FAE1E500AFC73DB43799C0626545D7F4', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:54:21', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (38, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'FAE1E500AFC73DB43799C0626545D7F4', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:54:20', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (39, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'FAE1E500AFC73DB43799C0626545D7F4', 'http://localhost/image/code', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:54:16', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (40, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'FAE1E500AFC73DB43799C0626545D7F4', 'http://localhost/image/code', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:54:09', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (41, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'FAE1E500AFC73DB43799C0626545D7F4', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:54:09', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (42, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'FAE1E500AFC73DB43799C0626545D7F4', 'http://localhost/token/logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:54:09', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (43, 'multipart/form-data; boundary=----WebKitFormBoundaryT9lGlPkm3xHz7nuK', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'ED545D9F9C260B994C67D0D3DF35F995', 'http://localhost/ubs/token/avatar/change', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:54:04', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (44, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'ED545D9F9C260B994C67D0D3DF35F995', 'http://localhost/ubs/token/getUserRemainCoin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:54:00', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (45, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'ED545D9F9C260B994C67D0D3DF35F995', 'http://localhost/ubs/token/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:54:00', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (46, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'ED545D9F9C260B994C67D0D3DF35F995', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:53:59', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (47, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'ED545D9F9C260B994C67D0D3DF35F995', 'http://localhost/image/code', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:53:51', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (48, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'ED545D9F9C260B994C67D0D3DF35F995', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:53:51', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (49, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'ED545D9F9C260B994C67D0D3DF35F995', 'http://localhost/upfiles/img/2021-06-11/ea8fad9c-45c6-4a99-93fd-198ac08c4f4a.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:53:50', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (50, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'ED545D9F9C260B994C67D0D3DF35F995', 'http://localhost/upfiles/img/2021-06-11/4a0fac75-1b2c-4c9f-84bd-b6f82a5dcee4.jpg', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:53:49', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (51, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'ED545D9F9C260B994C67D0D3DF35F995', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:53:49', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (52, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/management/user/list', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:53:39', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (53, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/management/user', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 08:53:39', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (54, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/article/60c36ea2a7ad7a6ae6064dfd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:53:29', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (55, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/upfiles/img/2021-06-11/ea8fad9c-45c6-4a99-93fd-198ac08c4f4a.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:53:28', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (56, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:53:28', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (57, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/ubs/token/getUserRemainCoin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:53:16', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (58, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/ubs/token/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:53:16', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (59, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:53:16', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (60, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/ubs/token/getUserRemainCoin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:53:06', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (61, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/ubs/token/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:53:06', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (62, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:53:06', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (63, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/message', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:53:04', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (64, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/message', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:53:02', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (65, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/note', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:53:01', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (66, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/upfiles/img/2021-06-11/ea8fad9c-45c6-4a99-93fd-198ac08c4f4a.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:52:57', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (67, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:52:57', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (68, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/ubs/token/getUserRemainCoin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:52:55', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (69, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/ubs/token/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:52:55', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (70, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:52:55', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (71, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/ubs/token/purchase/3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:52:54', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (72, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/ubs/token/purchase', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:52:54', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (73, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/ubs/token/comment/3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:52:53', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (74, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/ubs/token/comment', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:52:53', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (75, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/ubs/token/reply/3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:52:51', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (76, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/ubs/token/message', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:52:51', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (77, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/ubs/token/getUserRemainCoin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:52:43', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (78, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/ubs/token/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:52:43', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (79, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/ubs/token/sign', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:52:42', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (80, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/ubs/token/getUserRemainCoin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:52:37', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (81, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/ubs/token/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'zhangwj', '2021-06-12 08:52:37', 'Chrome', 3);
INSERT INTO `nb_log` VALUES (82, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:52:36', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (83, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/image/code', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:52:29', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (84, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:52:29', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (85, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/upfiles/img/2021-06-11/ea8fad9c-45c6-4a99-93fd-198ac08c4f4a.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:52:27', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (86, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:52:27', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (87, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/image/code', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:52:26', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (88, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:52:26', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (89, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/registration', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:52:25', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (90, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/sendMailCode', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:51:40', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (91, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/reg', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:51:10', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (92, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/image/code', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:51:09', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (93, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:51:09', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (94, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/upfiles/img/2021-06-11/ea8fad9c-45c6-4a99-93fd-198ac08c4f4a.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:51:08', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (95, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/upfiles/img/2021-06-11/4a0fac75-1b2c-4c9f-84bd-b6f82a5dcee4.jpg', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:51:08', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (96, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '2E3CA5DF554DF2B8EDA750E60051D8F4', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:51:08', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (97, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/management/settings/profile', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 08:51:01', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (98, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/management/settings/mail/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:51:00', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (99, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/management/settings/profile', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 08:50:56', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (100, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 08:50:54', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (101, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 08:50:54', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (102, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:50:53', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (103, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/image/code', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:50:43', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (104, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 08:50:43', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (105, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/management/user/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 09:00:57', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (106, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/management/user/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 09:00:53', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (107, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/management/dict/keyword', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 09:12:55', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (108, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '6E20F168F4944466883C31E8BE9B0F4B', 'http://localhost/management/dict/catetag', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 09:12:54', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (109, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:39:58', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (110, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:39:56', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (111, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:39:56', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (112, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:39:44', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (113, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:39:42', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (114, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:39:42', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (115, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:38:56', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (116, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:38:55', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (117, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:38:55', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (118, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:38:41', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (119, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:38:39', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (120, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:38:39', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (121, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:37:04', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (122, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:37:02', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (123, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:37:02', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (124, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:35:46', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (125, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:35:43', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (126, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:35:43', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (127, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:35:20', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (128, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:35:19', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (129, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:35:19', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (130, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:49:05', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (131, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:49:03', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (132, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:49:01', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (133, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:48:49', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (134, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:46:39', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (135, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:46:33', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (136, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:46:25', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (137, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:46:19', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (138, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:46:13', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (139, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:45:53', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (140, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:43:39', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (141, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:43:37', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (142, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:43:37', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (143, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:43:27', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (144, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:43:26', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (145, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:43:26', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (146, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:43:19', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (147, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:43:18', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (148, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:43:17', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (149, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:42:33', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (150, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:42:17', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (151, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:42:16', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (152, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:41:58', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (153, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:41:20', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (154, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:41:19', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (155, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:41:17', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (156, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:41:15', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (157, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:41:15', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (158, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:41:02', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (159, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:41:01', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (160, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:41:00', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (161, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:40:54', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (162, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:40:52', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (163, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:40:52', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (164, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:40:32', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (165, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:40:31', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (166, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:40:30', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (167, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:58:44', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (168, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:58:33', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (169, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:57:23', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (170, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:57:10', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (171, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:56:56', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (172, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:56:18', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (173, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:56:17', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (174, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:56:17', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (175, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/updateBatch', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:56:15', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (176, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/updateBatch', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:55:15', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (177, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:55:13', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (178, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:55:12', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (179, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/upfiles/img/2021-06-11/4a0fac75-1b2c-4c9f-84bd-b6f82a5dcee4.jpg', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:55:12', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (180, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:55:11', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (181, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:55:10', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (182, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:53:31', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (183, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/upfiles/img/2021-06-11/4a0fac75-1b2c-4c9f-84bd-b6f82a5dcee4.jpg', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:53:28', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (184, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:53:28', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (185, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:53:25', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (186, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:53:07', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (187, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:53:05', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (188, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:53:05', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (189, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:52:39', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (190, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:52:38', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (191, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:52:37', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (192, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:52:32', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (193, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:52:31', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (194, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:52:24', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (195, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/upfiles/img/2021-06-11/4a0fac75-1b2c-4c9f-84bd-b6f82a5dcee4.jpg', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:52:20', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (196, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-12 10:52:20', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (197, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:51:42', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (198, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'D2FA930EC0C9E9740DA30B2BC269B291', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 10:50:44', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (199, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '00F3F2AA9946D193DDEDFCC9F0B858DF', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 11:39:00', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (200, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '98AAFB97D322DFB3E865F061B6BC4525', 'http://localhost/article/60c36ea2a7ad7a6ae6064dfd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 22:08:14', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (201, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '98AAFB97D322DFB3E865F061B6BC4525', 'http://localhost/upfiles/img/2021-06-11/ea8fad9c-45c6-4a99-93fd-198ac08c4f4a.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 22:08:11', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (202, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '98AAFB97D322DFB3E865F061B6BC4525', 'http://localhost/upfiles/img/2021-06-11/4a0fac75-1b2c-4c9f-84bd-b6f82a5dcee4.jpg', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 22:08:10', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (203, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '98AAFB97D322DFB3E865F061B6BC4525', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-12 22:08:10', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (204, NULL, '127.0.0.1', '开发中内网地址', 'GET', 'A6E4293CDCB5A9B4B4D6D1C81B38FE85', 'http://localhost/article/60c36ea2a7ad7a6ae6064dfd', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-13 09:59:56', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (205, NULL, '127.0.0.1', '开发中内网地址', 'GET', 'A6E4293CDCB5A9B4B4D6D1C81B38FE85', 'http://localhost/upfiles/img/2021-06-11/ea8fad9c-45c6-4a99-93fd-198ac08c4f4a.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-13 09:59:54', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (206, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '5A9603AA3767B32B2DA26AEDF2189218', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-13 20:19:52', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (207, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '5A9603AA3767B32B2DA26AEDF2189218', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-13 20:49:57', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (208, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '5A9603AA3767B32B2DA26AEDF2189218', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-13 20:49:56', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (209, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '5A9603AA3767B32B2DA26AEDF2189218', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-13 20:49:56', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (210, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '5A9603AA3767B32B2DA26AEDF2189218', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-13 20:49:55', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (211, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '5A9603AA3767B32B2DA26AEDF2189218', 'http://localhost/image/code', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-13 20:49:47', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (212, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '5A9603AA3767B32B2DA26AEDF2189218', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-13 20:49:47', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (213, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '5A9603AA3767B32B2DA26AEDF2189218', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-13 20:49:46', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (214, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '5A9603AA3767B32B2DA26AEDF2189218', 'http://localhost/image/code', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-13 20:49:39', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (215, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '5A9603AA3767B32B2DA26AEDF2189218', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-13 20:49:39', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (216, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '5A9603AA3767B32B2DA26AEDF2189218', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-13 20:49:38', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (217, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '5A9603AA3767B32B2DA26AEDF2189218', 'http://localhost/image/code', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-13 20:49:32', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (218, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '5A9603AA3767B32B2DA26AEDF2189218', 'http://localhost/image/code', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-13 20:49:25', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (219, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '5A9603AA3767B32B2DA26AEDF2189218', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-13 20:49:25', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (220, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '5A9603AA3767B32B2DA26AEDF2189218', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-13 20:49:23', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (221, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '5A9603AA3767B32B2DA26AEDF2189218', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-13 21:06:57', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (222, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '5A9603AA3767B32B2DA26AEDF2189218', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-13 21:06:18', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (223, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '5A9603AA3767B32B2DA26AEDF2189218', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', 'admin', '2021-06-13 21:05:53', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (224, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '4142A7DDA280663835CE3E82633340A2', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-14 23:07:35', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (225, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '4142A7DDA280663835CE3E82633340A2', 'http://localhost/image/code', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-14 23:04:47', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (226, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '4142A7DDA280663835CE3E82633340A2', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-14 23:04:47', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (227, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '4142A7DDA280663835CE3E82633340A2', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-14 23:04:39', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (228, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '4142A7DDA280663835CE3E82633340A2', 'http://localhost/image/code', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-14 23:04:31', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (229, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '4142A7DDA280663835CE3E82633340A2', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-14 23:04:31', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (230, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '4142A7DDA280663835CE3E82633340A2', 'http://localhost/upfiles/img/2021-06-11/ea8fad9c-45c6-4a99-93fd-198ac08c4f4a.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-14 23:04:28', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (231, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '4142A7DDA280663835CE3E82633340A2', 'http://localhost/upfiles/img/2021-06-11/4a0fac75-1b2c-4c9f-84bd-b6f82a5dcee4.jpg', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-14 23:04:28', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (232, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '4142A7DDA280663835CE3E82633340A2', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '', '2021-06-14 23:04:28', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (233, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:38:48', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (234, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/settings/profile', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:38:46', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (235, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/message/list', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:38:42', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (236, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/message', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:38:42', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (237, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/comment/list', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:38:41', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (238, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/comment', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:38:41', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (239, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/upfiles/img/2021-06-12/bc3d34a9-4f53-4910-b554-c72b3ea11647.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:38:37', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (240, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/user/list', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:38:37', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (241, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/user', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:38:37', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (242, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:38:31', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (243, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:38:31', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (244, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:38:30', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (245, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/image/code', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:38:21', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (246, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:38:21', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (247, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:38:20', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (248, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/image/code', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:38:12', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (249, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:38:12', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (250, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:38:11', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (251, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/image/code', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:38:01', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (252, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:38:01', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (253, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/upfiles/img/2021-06-11/ea8fad9c-45c6-4a99-93fd-198ac08c4f4a.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:38:00', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (254, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/upfiles/img/2021-06-11/4a0fac75-1b2c-4c9f-84bd-b6f82a5dcee4.jpg', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:37:59', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (255, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:37:59', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (256, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/upfiles/img/2021-06-11/4a0fac75-1b2c-4c9f-84bd-b6f82a5dcee4.jpg', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:46:00', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (257, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:46:00', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (258, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:45:56', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (259, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:45:55', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (260, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:45:01', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (261, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:45:00', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (262, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:45:00', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (263, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:44:20', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (264, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:44:18', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (265, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:44:18', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (266, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:43:05', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (267, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:43:04', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (268, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:43:04', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (269, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:42:59', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (270, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:42:49', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (271, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:42:46', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (272, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:42:46', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (273, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/dict/catetag', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:41:03', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (274, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/dict/keyword', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:41:01', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (275, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/dict/keyword', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:40:58', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (276, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/dict/link', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:40:58', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (277, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/settings/profile', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:40:52', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (278, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/upfiles/img/2021-06-11/4a0fac75-1b2c-4c9f-84bd-b6f82a5dcee4.jpg', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:59:17', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (279, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:59:17', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (280, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:59:16', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (281, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:59:16', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (282, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:59:02', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (283, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:59:01', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (284, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:59:01', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (285, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:58:58', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (286, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:58:35', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (287, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:58:34', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (288, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:58:29', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (289, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/settings/update', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:58:28', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (290, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/upfiles/img/2021-06-11/4a0fac75-1b2c-4c9f-84bd-b6f82a5dcee4.jpg', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', '', '2021-06-15 20:58:24', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (291, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/settings/website', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:58:24', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (292, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:58:22', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (293, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'B88ED349C11C30F821066AE345F3B733', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'admin', '2021-06-15 20:58:22', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (294, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', 'A048DC304A65A6A95687A00B26A26BA5', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', '', '2021-07-02 21:39:55', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (295, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '695C1956B82ABBACCB1A0B8D6A9066D1', 'http://localhost/upfiles/img/2021-06-11/ea8fad9c-45c6-4a99-93fd-198ac08c4f4a.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '', '2021-12-06 19:49:59', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (296, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '695C1956B82ABBACCB1A0B8D6A9066D1', 'http://localhost/upfiles/img/2021-06-11/4a0fac75-1b2c-4c9f-84bd-b6f82a5dcee4.jpg', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '', '2021-12-06 19:49:59', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (297, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '695C1956B82ABBACCB1A0B8D6A9066D1', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '', '2021-12-06 19:49:59', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (298, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '695C1956B82ABBACCB1A0B8D6A9066D1', 'http://localhost/favicon.ico', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '', '2021-12-06 19:49:57', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (299, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '695C1956B82ABBACCB1A0B8D6A9066D1', 'http://localhost/admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '', '2021-12-06 19:49:57', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (300, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '695C1956B82ABBACCB1A0B8D6A9066D1', 'http://localhost/upfiles/img/2021-06-11/ea8fad9c-45c6-4a99-93fd-198ac08c4f4a.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '', '2021-12-06 19:49:51', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (301, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '695C1956B82ABBACCB1A0B8D6A9066D1', 'http://localhost/upfiles/img/2021-06-11/4a0fac75-1b2c-4c9f-84bd-b6f82a5dcee4.jpg', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '', '2021-12-06 19:49:51', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (302, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '695C1956B82ABBACCB1A0B8D6A9066D1', 'http://localhost/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '', '2021-12-06 19:49:50', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (303, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '695C1956B82ABBACCB1A0B8D6A9066D1', 'http://localhost/management/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', 'admin', '2021-12-06 19:50:12', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (304, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '695C1956B82ABBACCB1A0B8D6A9066D1', 'http://localhost/management/index', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', 'admin', '2021-12-06 19:50:11', 'Chrome', 1);
INSERT INTO `nb_log` VALUES (305, 'application/x-www-form-urlencoded; charset=UTF-8', '0:0:0:0:0:0:0:1', '开发中内网地址', 'POST', '695C1956B82ABBACCB1A0B8D6A9066D1', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '', '2021-12-06 19:50:10', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (306, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '695C1956B82ABBACCB1A0B8D6A9066D1', 'http://localhost/image/code', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '', '2021-12-06 19:50:02', 'Chrome', NULL);
INSERT INTO `nb_log` VALUES (307, NULL, '0:0:0:0:0:0:0:1', '开发中内网地址', 'GET', '695C1956B82ABBACCB1A0B8D6A9066D1', 'http://localhost/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '', '2021-12-06 19:50:01', 'Chrome', NULL);

-- ----------------------------
-- Table structure for nb_message
-- ----------------------------
DROP TABLE IF EXISTS `nb_message`;
CREATE TABLE `nb_message`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NOT NULL,
  `reply_id` bigint(0) DEFAULT NULL COMMENT '回复的评论ID，如果不是回复他人，则此项为空',
  `clear_comment` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `comment` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `enable` tinyint(1) NOT NULL,
  `ip_addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ip_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `post` datetime(6) DEFAULT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nb_message
-- ----------------------------
INSERT INTO `nb_message` VALUES (1, 1, NULL, 'sf', 'sf', 1, '0:0:0:0:0:0:0:1', '本地/未知', '2021-03-26 20:09:00.828000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36');
INSERT INTO `nb_message` VALUES (2, 1, 1, '回复@nbv5_user (#1): gfdg', '回复@<span style=\'color: #00c4ff;\'>nbv5_user (#1)</span>: gfdg', 1, '0:0:0:0:0:0:0:1', '本地/未知', '2021-03-26 20:09:06.641000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36');
INSERT INTO `nb_message` VALUES (3, 1, NULL, '1', '1', 1, '0:0:0:0:0:0:0:1', '本地/未知', '2021-04-08 08:40:50.081000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36');

-- ----------------------------
-- Table structure for nb_note
-- ----------------------------
DROP TABLE IF EXISTS `nb_note`;
CREATE TABLE `nb_note`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `clear_content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `md_content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `modify` datetime(6) DEFAULT NULL,
  `post` datetime(6) NOT NULL,
  `show` tinyint(1) NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `top` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nb_note
-- ----------------------------
INSERT INTO `nb_note` VALUES (1, '随笔内容nnn', '<h3 id=\"h3--nnn\"><a name=\"随笔内容nnn\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>随笔内容nnn</h3>', '### 随笔内容nnn', NULL, '2021-06-11 21:13:51.562000', 1, 'nnnn', 0);

-- ----------------------------
-- Table structure for nb_param
-- ----------------------------
DROP TABLE IF EXISTS `nb_param`;
CREATE TABLE `nb_param`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `group` int(0) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_index` int(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nb_param
-- ----------------------------
INSERT INTO `nb_param` VALUES (1, 'init_status', '1', -1, '是否初始化', 0);
INSERT INTO `nb_param` VALUES (2, 'admin_init_status', '0', -1, '是否设置了管理员账号', 0);
INSERT INTO `nb_param` VALUES (3, 'system_started_datetime', '2021-12-06 19:43:55', -1, '系统最近一次的启动时间', 0);
INSERT INTO `nb_param` VALUES (4, 'system_init_datetime', '2021-03-24 22:05:17', -1, '系统初始化时间', 0);
INSERT INTO `nb_param` VALUES (5, 'mail_smpt_server_addr', 'smtp.qq.com', 0, 'SMTP服务器', 0);
INSERT INTO `nb_param` VALUES (6, 'mail_smpt_server_port', '465', 0, 'SMTP端口号', 0);
INSERT INTO `nb_param` VALUES (7, 'mail_server_account', '1349143710@qq.com', 0, '发件人邮箱', 0);
INSERT INTO `nb_param` VALUES (8, 'mail_sender_name', '1349143710', 0, '发件人邮箱帐号（一般为@前面部分）', 0);
INSERT INTO `nb_param` VALUES (9, 'mail_server_password', 'ekbkzpwzyotqiaga', 0, '邮箱登入密码', 0);
INSERT INTO `nb_param` VALUES (10, 'qq_login_onoff', '0', 0, '是否开放qq登录', 0);
INSERT INTO `nb_param` VALUES (11, 'qq_app_id', '', 0, 'qq登录API的app_id', 0);
INSERT INTO `nb_param` VALUES (12, 'qq_app_key', '', 0, 'qq登录API的app_key', 0);
INSERT INTO `nb_param` VALUES (13, 'github_login_onoff', '0', 0, '开启github登录', 0);
INSERT INTO `nb_param` VALUES (14, 'github_client_id', NULL, 0, 'github登录API Client ID', 0);
INSERT INTO `nb_param` VALUES (15, 'github_client_secret', NULL, 0, 'github登录API Client Secret', 0);
INSERT INTO `nb_param` VALUES (16, 'qiniu_accessKey', NULL, 0, '七牛云AccessKey', 0);
INSERT INTO `nb_param` VALUES (17, 'qiniu_secretKey', NULL, 0, '七牛云SecretKey', 0);
INSERT INTO `nb_param` VALUES (18, 'qiniu_bucket', NULL, 0, '七牛云bucket', 0);
INSERT INTO `nb_param` VALUES (19, 'qiniu_domain', NULL, 0, '七牛云文件服务器域名', 0);
INSERT INTO `nb_param` VALUES (20, 'article_page_size', '12', 1, '文章页面显示条数', 0);
INSERT INTO `nb_param` VALUES (21, 'upload_type', 'LOCAL', 1, '上传方式类型（七牛或本地），默认本地local，本地上传', 0);
INSERT INTO `nb_param` VALUES (22, 'summary_length', '243', 1, '文章摘要文字长度', 0);
INSERT INTO `nb_param` VALUES (23, 'comment_length', '100', 1, '评论文字长度', 0);
INSERT INTO `nb_param` VALUES (24, 'global_comment_onoff', '0', 1, '是否全局开放评论', 0);
INSERT INTO `nb_param` VALUES (25, 'message_onoff', '0', 1, '是否开启留言功能', 0);
INSERT INTO `nb_param` VALUES (26, 'statistics_onoff', '1', 1, '是否开启统计，开启可能会消耗服务器资源（统计很粗糙、暴力）', 0);
INSERT INTO `nb_param` VALUES (27, 'is_open_oss_upload', '0', 1, '是否开启云存储', 0);
INSERT INTO `nb_param` VALUES (28, 'comment_mail_notice_onoff', '0', 1, '是否开启新评论邮件通知', 0);
INSERT INTO `nb_param` VALUES (29, 'message_mail_notice_onoff', '0', 1, '是否开启新留言通知', 0);
INSERT INTO `nb_param` VALUES (30, 'user_simple_reg_onoff', '1', 1, '是否开启用户注册', 0);
INSERT INTO `nb_param` VALUES (31, 'is_show_download_page', '0', 1, '是否显示下载页面按钮', 0);
INSERT INTO `nb_param` VALUES (32, 'is_show_product_page', '0', 1, '是否显示商城页面按钮', 0);
INSERT INTO `nb_param` VALUES (33, 'website_fontawesome', 'fa fa-graduation-cap', 2, '网站的字体logo图标', 0);
INSERT INTO `nb_param` VALUES (34, 'website_title', 'Ayanmi', 2, '网站标题', 0);
INSERT INTO `nb_param` VALUES (35, 'website_logo_words', '小汪的酱牛肉', 2, '网站的LOGO文字', 0);
INSERT INTO `nb_param` VALUES (36, 'website_logo_small_words', 'MIMI', 2, '网站LOGO旁的小字', 0);
INSERT INTO `nb_param` VALUES (37, 'footer_words', '愿天堂没有BUG', 2, '页脚的文字', 0);
INSERT INTO `nb_param` VALUES (38, 'menu_home', '首页', 2, '导航菜单_首页名称', 0);
INSERT INTO `nb_param` VALUES (39, 'menu_note', '笔记', 2, '导航菜单_笔记名称', 0);
INSERT INTO `nb_param` VALUES (40, 'menu_message', '留言', 2, '导航菜单_留言名称', 0);
INSERT INTO `nb_param` VALUES (41, 'info_label_text', NULL, 2, '信息板内容', 0);
INSERT INTO `nb_param` VALUES (42, 'info_label_logo', 'https://emiria.oss-cn-shenzhen.aliyuncs.com/base/leimu.jpg', 2, '信息板的logo图标', 0);
INSERT INTO `nb_param` VALUES (43, 'info_label_nickname', '迷茫的旅人', 2, '信息板上的名称', 0);
INSERT INTO `nb_param` VALUES (44, 'index_top_text', '迷茫的旅人,欢迎你们的到来........', 2, '首页顶部的一些文字', 0);
INSERT INTO `nb_param` VALUES (45, 'comment_top_text', '迷茫的旅人,欢迎你们的到来........', 2, '评论面板上方的公告', 0);
INSERT INTO `nb_param` VALUES (46, 'message_top_notice', '欢迎来访', 2, '留言页面顶部的文字', 0);
INSERT INTO `nb_param` VALUES (47, 'ubs_top_notice', '迷茫的旅人,欢迎你们的到来........', 2, '用户中心页面顶部的文字', 0);
INSERT INTO `nb_param` VALUES (48, 'link_apply_words', '御坂网络正在施工中!!', 2, '友链申请提示信息文本', 0);
INSERT INTO `nb_param` VALUES (49, 'qrcode_alipay', '/static/assets/img/noqrcode.jpg', 2, '支付宝二维码', 0);
INSERT INTO `nb_param` VALUES (50, 'qrcode_wechat', '/static/assets/img/noqrcode.jpg', 2, '微信支付二维码', 0);
INSERT INTO `nb_param` VALUES (51, 'typesetting', 'left3right9', 2, '网站排版设置', 0);
INSERT INTO `nb_param` VALUES (52, 'article_page_style', '0', 2, '文章详细页面的风格，有无侧边栏', 0);
INSERT INTO `nb_param` VALUES (53, 'bottom_logo', '/upfiles/img/2021-06-11/4a0fac75-1b2c-4c9f-84bd-b6f82a5dcee4.jpg', 2, '网站底部LOGO图片', 0);
INSERT INTO `nb_param` VALUES (54, 'sign_check_coin', '1', 2, '每天签到加的硬币数量', 0);
INSERT INTO `nb_param` VALUES (55, 'cash_recharge_url', '[]', 2, '充值卡购买地址', 0);
INSERT INTO `nb_param` VALUES (56, 'seo_description', NULL, 2, 'seo描述', 0);
INSERT INTO `nb_param` VALUES (57, 'seo_keyword', NULL, 2, 'seo关键字', 0);
INSERT INTO `nb_param` VALUES (58, 'aliyun_accesskey', '', 0, '阿里云Access Key ID', 0);
INSERT INTO `nb_param` VALUES (59, 'aliyun_secretkey', '', 0, '阿里云Access Key Secret', 0);
INSERT INTO `nb_param` VALUES (60, 'aliyun_bucket', '', 0, '阿里云bucket名称', 0);
INSERT INTO `nb_param` VALUES (61, 'aliyun_endpoint', NULL, 0, '阿里云内或外网域名', 0);
INSERT INTO `nb_param` VALUES (62, 'is_open_aliyunoss_upload', '0', 1, '是否开启阿里云上传服务', 0);
INSERT INTO `nb_param` VALUES (63, 'ip_blacklist', '', 3, 'ip黑名单', 0);

-- ----------------------------
-- Table structure for nb_upload
-- ----------------------------
DROP TABLE IF EXISTS `nb_upload`;
CREATE TABLE `nb_upload`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) DEFAULT NULL,
  `disk_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `upload` datetime(6) DEFAULT NULL,
  `virtual_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `object_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上传标识',
  `object_key_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标识id，一般指的是文章的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nb_upload
-- ----------------------------
INSERT INTO `nb_upload` VALUES (20, 1, '/root/ayanmi/img/2021-06-11/4a0fac75-1b2c-4c9f-84bd-b6f82a5dcee4.jpg', 'image/jpeg', '2021-06-11 21:08:50.269000', '/upfiles/img/2021-06-11/4a0fac75-1b2c-4c9f-84bd-b6f82a5dcee4.jpg', 'management_website_bottom_logo', NULL);
INSERT INTO `nb_upload` VALUES (24, 1, '/root/ayanmi/img/2021-06-11/ea8fad9c-45c6-4a99-93fd-198ac08c4f4a.png', 'image/png', '2021-06-11 22:22:52.872000', '/upfiles/img/2021-06-11/ea8fad9c-45c6-4a99-93fd-198ac08c4f4a.png', 'management_article_edit_cover', '60c36ea2a7ad7a6ae6064dfd');
INSERT INTO `nb_upload` VALUES (25, 3, '/root/ayanmi/img/2021-06-12/bc3d34a9-4f53-4910-b554-c72b3ea11647.png', 'image/png', '2021-06-12 08:54:02.242000', '/upfiles/img/2021-06-12/bc3d34a9-4f53-4910-b554-c72b3ea11647.png', 'frontend_ubs_avatar', NULL);

-- ----------------------------
-- Table structure for nb_user
-- ----------------------------
DROP TABLE IF EXISTS `nb_user`;
CREATE TABLE `nb_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `role` tinyint(0) NOT NULL COMMENT '1：管理员，2：系统注册用户，3：qq登录用户，4：github登录用户',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_date` datetime(0) DEFAULT NULL,
  `email` varbinary(255) DEFAULT NULL,
  `enable` tinyint(1) NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remain_coin` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nb_user
-- ----------------------------
INSERT INTO `nb_user` VALUES (1, 1, 'https://emiria.oss-cn-shenzhen.aliyuncs.com/base/leimu.jpg', NULL, 0x313334393134333731304071712E636F6D, 1, '小汪的酱牛肉', '81bf27c66149f8060b5f9c9308a5281e', NULL, 'admin', 0);
INSERT INTO `nb_user` VALUES (3, 2, '/upfiles/img/2021-06-12/bc3d34a9-4f53-4910-b554-c72b3ea11647.png', '2021-06-12 08:52:24', 0x333139313530343632374071712E636F6D, 1, 'zhangwj', '251e37070064356c5405b215c2a85e5d', NULL, 'zhangwj', 1);

-- ----------------------------
-- Table structure for nb_user_coin_record
-- ----------------------------
DROP TABLE IF EXISTS `nb_user_coin_record`;
CREATE TABLE `nb_user_coin_record`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NOT NULL,
  `operate_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详情见 OperateType枚举类',
  `operate_time` datetime(0) DEFAULT NULL,
  `operate_value` int(0) NOT NULL DEFAULT 0,
  `remain_coin` int(0) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nb_user_coin_record
-- ----------------------------
INSERT INTO `nb_user_coin_record` VALUES (1, 1, '0', '2021-03-24 22:07:17', 0, 0, '初始注册：0');
INSERT INTO `nb_user_coin_record` VALUES (2, 2, '0', '2021-06-11 00:14:24', 0, 0, '初始注册：0');
INSERT INTO `nb_user_coin_record` VALUES (3, 3, '0', '2021-06-12 08:52:25', 0, 0, '初始注册：0');
INSERT INTO `nb_user_coin_record` VALUES (4, 3, '1', '2021-06-12 08:52:42', 1, 1, '签到充值');

-- ----------------------------
-- Table structure for refer_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `refer_article_cate`;
CREATE TABLE `refer_article_cate`  (
  `article_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cate_id` bigint(0) NOT NULL,
  PRIMARY KEY (`article_id`, `cate_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of refer_article_cate
-- ----------------------------
INSERT INTO `refer_article_cate` VALUES ('60c36ea2a7ad7a6ae6064dfd', 10);
INSERT INTO `refer_article_cate` VALUES ('60c37169a7ad7a6ae6064dff', 10);

-- ----------------------------
-- Table structure for refer_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `refer_article_tag`;
CREATE TABLE `refer_article_tag`  (
  `article_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag_id` bigint(0) NOT NULL,
  PRIMARY KEY (`article_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of refer_article_tag
-- ----------------------------
INSERT INTO `refer_article_tag` VALUES ('60c36ea2a7ad7a6ae6064dfd', 11);
INSERT INTO `refer_article_tag` VALUES ('60c37169a7ad7a6ae6064dff', 8);
INSERT INTO `refer_article_tag` VALUES ('60c37169a7ad7a6ae6064dff', 12);

-- ----------------------------
-- Table structure for refer_download_cate
-- ----------------------------
DROP TABLE IF EXISTS `refer_download_cate`;
CREATE TABLE `refer_download_cate`  (
  `download_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cate_id` bigint(0) NOT NULL,
  PRIMARY KEY (`download_id`, `cate_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of refer_download_cate
-- ----------------------------
INSERT INTO `refer_download_cate` VALUES ('60c3fe6ca7ad5eba9f23e1a2', 14);

-- ----------------------------
-- Table structure for refer_hide_user_purchase
-- ----------------------------
DROP TABLE IF EXISTS `refer_hide_user_purchase`;
CREATE TABLE `refer_hide_user_purchase`  (
  `article_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hide_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(0) NOT NULL,
  `purchase_time` datetime(0) DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `appreciation` bit(1) NOT NULL,
  `commentabled` bit(1) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `create_time` datetime(0) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `first_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `published` bit(1) NOT NULL,
  `recommend` bit(1) NOT NULL,
  `share_statement` bit(1) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `views` int(0) DEFAULT NULL,
  `type_id` bigint(0) DEFAULT NULL,
  `user_id` bigint(0) DEFAULT NULL,
  `first_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK292449gwg5yf7ocdlmswv9w4j`(`type_id`) USING BTREE,
  INDEX `FK8ky5rrsxh01nkhctmo7d48p82`(`user_id`) USING BTREE,
  CONSTRAINT `FK292449gwg5yf7ocdlmswv9w4j` FOREIGN KEY (`type_id`) REFERENCES `t_type` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK8ky5rrsxh01nkhctmo7d48p82` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_blog
-- ----------------------------
INSERT INTO `t_blog` VALUES (11, b'1', b'1', '~~测试&emsp;&emsp;&emsp;嗯~~`</>`\r\n```sql\r\nselect t.*, t.rowid from t_tag t \r\n```\r\n\r\n------------\r\n```sql\r\nselect t.*, t.rowid from t_tag t \r\n``````sql\r\nselect t.*, t.rowid from t_tag t \r\n```\r\n', '2020-03-30 21:34:48', '嗯嗯嗯', NULL, '转载', b'1', b'1', b'1', '测试标签', '2020-04-02 21:46:57', 26, 13, 1, 'https://ssyerv1.oss-cn-hangzhou.aliyuncs.com/picture/3c2c4c67739144df8f89aa97b1e02f4f.jpg!sswm');
INSERT INTO `t_blog` VALUES (12, b'0', b'1', '装了个', '2020-04-19 10:17:59', '呃呃', NULL, '原创', b'0', b'1', b'0', '一个日常吧', '2020-04-19 10:18:29', 12, 15, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTDsNreqc5Hn4kr3q_kdP5yYzEvN2Di44DskYrokMQ_rn8Lkcg2&usqp=CAU');
INSERT INTO `t_blog` VALUES (20, b'0', b'0', '测试', '2020-04-26 20:26:13', '测试', NULL, '原创', b'0', b'0', b'0', '测试', '2020-05-05 20:08:05', 25, 15, 1, '/images/upload/20200505/20200505200805239.jpg');
INSERT INTO `t_blog` VALUES (22, b'0', b'1', '###图片的使用\r\n![](/images/upload/20200505/20200505200805239.jpg)', '2020-05-05 20:42:43', '阿三大苏打的是', NULL, '原创', b'0', b'1', b'1', 'md简单了解', '2020-05-05 20:42:43', 17, 15, 1, '/images/upload/20200505/20200505204242806.jpg');
INSERT INTO `t_blog` VALUES (26, b'1', b'1', 'asd', '2021-03-17 20:38:27', 'zcx', NULL, '原创', b'0', b'1', b'1', 'cz', '2021-03-17 20:38:27', 0, 12, 1, '/images/upload/20210317/20210317203826697.jpg');
INSERT INTO `t_blog` VALUES (27, b'0', b'1', 'zxc', '2021-03-19 19:28:57', 'asd', NULL, '原创', b'0', b'1', b'1', 'asd', '2021-03-19 19:35:10', 6, 10, 1, 'https://emiria.oss-cn-shenzhen.aliyuncs.com/20210319/20210319193509713.jpg');
INSERT INTO `t_blog` VALUES (28, b'1', b'1', 'asd', '2021-03-20 19:07:17', 'qwe', NULL, '原创', b'0', b'1', b'1', 'wqe', '2021-03-20 19:07:17', 5, 15, 1, 'https://emiria.oss-cn-shenzhen.aliyuncs.com/20210320/20210320190717018.jpg');

-- ----------------------------
-- Table structure for t_blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_tags`;
CREATE TABLE `t_blog_tags`  (
  `blogs_id` bigint(0) NOT NULL,
  `tags_id` bigint(0) NOT NULL,
  INDEX `FK5feau0gb4lq47fdb03uboswm8`(`tags_id`) USING BTREE,
  INDEX `FKh4pacwjwofrugxa9hpwaxg6mr`(`blogs_id`) USING BTREE,
  CONSTRAINT `FK5feau0gb4lq47fdb03uboswm8` FOREIGN KEY (`tags_id`) REFERENCES `t_tag` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FKh4pacwjwofrugxa9hpwaxg6mr` FOREIGN KEY (`blogs_id`) REFERENCES `t_blog` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_blog_tags
-- ----------------------------
INSERT INTO `t_blog_tags` VALUES (11, 17);
INSERT INTO `t_blog_tags` VALUES (12, 20);
INSERT INTO `t_blog_tags` VALUES (20, 20);
INSERT INTO `t_blog_tags` VALUES (22, 21);
INSERT INTO `t_blog_tags` VALUES (26, 20);
INSERT INTO `t_blog_tags` VALUES (27, 8);
INSERT INTO `t_blog_tags` VALUES (28, 7);
INSERT INTO `t_blog_tags` VALUES (28, 20);

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `admin_comment` tinyint(1) DEFAULT 0,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `blog_id` bigint(0) DEFAULT NULL,
  `parent_comment_id` bigint(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK4jj284r3pb7japogvo6h72q95`(`parent_comment_id`) USING BTREE,
  INDEX `FKke3uogd04j4jx316m1p51e05u`(`blog_id`) USING BTREE,
  CONSTRAINT `FK4jj284r3pb7japogvo6h72q95` FOREIGN KEY (`parent_comment_id`) REFERENCES `t_comment` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FKke3uogd04j4jx316m1p51e05u` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (10, 1, 'https://i.picsum.photos/id/1062/100/100.jpg', 'en', '2020-03-30 22:37:48', '1349143710@qq.com', 'cc', 11, NULL);
INSERT INTO `t_comment` VALUES (11, 1, 'https://i.picsum.photos/id/1062/100/100.jpg', 'e ', '2020-03-30 22:37:52', '1349143710@qq.com', 'cc', 11, 10);
INSERT INTO `t_comment` VALUES (12, 0, '/images/dog.jpg', '是这样的吗', '2020-04-01 22:02:39', 'cc@126.com', 'mc', 11, NULL);
INSERT INTO `t_comment` VALUES (13, 0, '/images/dog.jpg', '6666\n', '2020-04-28 21:12:23', '1603759909@qq.com', '是的大蛇', 11, NULL);
INSERT INTO `t_comment` VALUES (15, 1, '/images/leimuhead.jpg', 'dsfsdf', '2020-07-17 20:51:12', '1349143710@qq.com', 'cc', 22, NULL);
INSERT INTO `t_comment` VALUES (16, 1, '/images/leimuhead.jpg', 'tg', '2020-07-17 20:51:28', '1349143710@qq.com', 'cc', 22, 15);
INSERT INTO `t_comment` VALUES (17, 1, '/images/leimuhead.jpg', 'sad', '2021-03-20 09:25:46', '1349143710@qq.com', 'cc', 27, NULL);

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES (7, 'GC处理');
INSERT INTO `t_tag` VALUES (8, 'JVM虚拟机');
INSERT INTO `t_tag` VALUES (9, '缓存淘汰机制');
INSERT INTO `t_tag` VALUES (17, '青涩');
INSERT INTO `t_tag` VALUES (20, '日常');
INSERT INTO `t_tag` VALUES (21, 'markdown');

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES (10, 'PHP');
INSERT INTO `t_type` VALUES (11, 'JQuery');
INSERT INTO `t_type` VALUES (12, 'Vue');
INSERT INTO `t_type` VALUES (13, 'HTML');
INSERT INTO `t_type` VALUES (15, '日常');
INSERT INTO `t_type` VALUES (22, '测试');
INSERT INTO `t_type` VALUES (32, '阿达');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` int(0) DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'https://emiria.oss-cn-shenzhen.aliyuncs.com/base/leimu.jpg', '2020-02-12 11:36:05', '1349143710@qq.com', 'cc', '21232f297a57a5a743894a0e4a801fc3', 1, '2020-02-12 11:37:03', 'admin');

-- ----------------------------
-- Table structure for temp_file
-- ----------------------------
DROP TABLE IF EXISTS `temp_file`;
CREATE TABLE `temp_file`  (
  `file_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '临时文件ID',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件名',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件大小',
  `upload_time` datetime(0) DEFAULT NULL COMMENT '上传时间：4小时后删除',
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件在FTP上的存放路径',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int unsigned NOT NULL COMMENT '用户ID',
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户的openid',
  `file_store_id` int(0) DEFAULT NULL COMMENT '文件仓库ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '	0000@qq.com' COMMENT '用户邮箱',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `register_time` datetime(0) DEFAULT NULL COMMENT '注册时间',
  `image_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '头像地址',
  `role` int(0) DEFAULT 1 COMMENT '用户角色,0管理员，1普通用户',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, NULL, 1, 'admin', '319150462@qq.com', '123456', '2021-07-17 16:57:32', 'https://p.qpic.cn/qqconnect/0/app_101851241_1582451550/100?max-age=2592000&t=0', 0);

SET FOREIGN_KEY_CHECKS = 1;
