-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 產生日期: 2012 年 12 月 09 日 12:53
-- 伺服器版本: 5.5.25
-- PHP 版本: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 資料庫: `lunch`
--

-- --------------------------------------------------------

--
-- 表的結構 `comment`
--

CREATE TABLE `comment` (
  `time` varchar(50) NOT NULL,
  `Name` varchar(15) NOT NULL,
  `Content` varchar(500) NOT NULL,
  PRIMARY KEY (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 轉存資料表中的資料 `comment`
--

INSERT INTO `comment` (`time`, `Name`, `Content`) VALUES
('', '阿肛', '我...我也達成目標阿!');

-- --------------------------------------------------------

--
-- 表的結構 `infodetail`
--

CREATE TABLE `infodetail` (
  `InfoNo` varchar(10) NOT NULL,
  `InfoMoney` varchar(15) NOT NULL,
  `InfoTel` varchar(15) NOT NULL,
  `InfoSeat` varchar(10) NOT NULL,
  PRIMARY KEY (`InfoNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 轉存資料表中的資料 `infodetail`
--

INSERT INTO `infodetail` (`InfoNo`, `InfoMoney`, `InfoTel`, `InfoSeat`) VALUES
('L001', '50元~100元', '(07)-5916669', '少'),
('L002', '50元~100元', '07-366-2505', '多'),
('L003', '50元~100元', '07-591-0049', '多'),
('L004', '50元~100元', '07-591-1716', '少'),
('L005', '50元~100元', '07-612-2030', '少'),
('L006', '50元以下', '07-611-0400', '少'),
('L007', '50元~100元', '07-362-4114', '少'),
('L008', '50元~100元', '07-362-2222', '少'),
('L009', '50元~100元', '07-365-3561', '多'),
('L010', '50元~100元', '07-360-3000', '多'),
('L011', '50元~100元', '07-362-9852', '少'),
('L012', '50元~100元', '07-365-8463', '少'),
('L013', '50元~100元', '07-363-2878', '少'),
('L014', '50元~100元', '07-368-1079', '多'),
('L015', '50元~100元', '07-365-1470', '多'),
('L016', '50元~100元', '07-365-8285', '少'),
('L017', '50元~100元', '07-360-0579', '多'),
('L018', '50元~100元', '07-366-3965', '少'),
('L019', '50元~100元', '07-591-0013', '少'),
('L020', '50元~100元', '', '少'),
('L021', '50元~100元', '07-368-1822', '多'),
('L022', '50元以下', '07-363-0590', '多'),
('L023', '100元~150元', '07-368-1508', '少'),
('L024', '100元~150元', '07-365-3587', '少'),
('L025', '50元以下', '07-365-6505', '多'),
('L026', '50元以下', '07-360-5757', '多'),
('L027', '50元~100元', '07-613-2407', '少'),
('L028', '50元~100元', '07-611-5533', '多'),
('L029', '150元以上', '07-613-0299', '多'),
('L030', '50元以下', '07-612-3253', '少');

-- --------------------------------------------------------

--
-- 表的結構 `infolocation`
--

CREATE TABLE `infolocation` (
  `InfoNo` varchar(10) NOT NULL,
  `InfoRoad` varchar(50) NOT NULL,
  `InfoArea` varchar(50) NOT NULL,
  `latitude` varchar(128) NOT NULL,
  `longitude` varchar(128) NOT NULL,
  PRIMARY KEY (`InfoNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 轉存資料表中的資料 `infolocation`
--

INSERT INTO `infolocation` (`InfoNo`, `InfoRoad`, `InfoArea`, `latitude`, `longitude`) VALUES
('L001', '高雄市楠梓區藍田路398號之8號', '楠梓區', '22.7280938', '120.2872753'),
('L002', '高雄市楠梓區藍昌路469號', '楠梓區', '22.7316323', '120.2923771'),
('L003', '高雄市楠梓區藍昌路398-3號', '楠梓區', '22.7267331', '120.2918737'),
('L004', '高雄市楠梓區藍昌路398-7號', '楠梓區', '22.7267331', '120.2918737'),
('L005', '高雄市橋頭區甲南村甲倉路43號', '橋頭區', '22.7403649', '120.2902105'),
('L006', '高雄市橋頭區甲南村甲昌路116號', '橋頭區', '22.7389265', '120.2945877'),
('L007', '高雄市楠梓區惠民路175號', '楠梓區', '22.7232440', '120.2948880'),
('L008', '高雄市楠梓區惠民路49號', '楠梓區', '22.7245752', '120.2984697'),
('L009', '高雄市楠梓區德賢路279號', '楠梓區', '22.7261450', '120.3036070'),
('L010', '高雄市楠梓區德賢路378號', '楠梓區', '22.7265790', '120.3041810'),
('L011', '高雄市楠梓區德賢路392號', '楠梓區', '22.7264520', '120.3034930'),
('L012', '高雄市楠梓區德賢路273號', '楠梓區', '22.7261510', '120.3037370'),
('L013', '高雄市楠梓區德賢路275號', '楠梓區', '22.7261490', '120.3036990'),
('L014', '高雄市楠梓區惠民路61號', '楠梓區', '22.7243274', '120.2982051'),
('L015', '高雄市楠梓區惠民路59號', '楠梓區', '22.7244715', '120.2982567'),
('L016', '高雄市楠梓區惠民路57號', '楠梓區', '22.7244244', '120.2983400'),
('L017', '高雄市楠梓區惠民路121號', '楠梓區', '22.7237070', '120.2966650'),
('L018', '高雄市楠梓區惠民路394號', '楠梓區', '22.7241641', '120.2913472'),
('L019', '高雄市楠梓區大學西路', '楠梓區', '22.7279005', '120.2793451'),
('L020', '高雄市楠梓區大學西路', '楠梓區', '22.7279005', '120.2793451'),
('L021', '高雄市楠梓區德祥路178號', '楠梓區', '22.7267121', '120.3080255'),
('L022', '高雄市楠梓區翠屏路10號', '楠梓區', '22.7259410', '120.2993679'),
('L023', '高雄市楠梓區右昌街372號之1', '楠梓區', '22.7149240', '120.2890260'),
('L024', '高雄市楠梓區德賢路166號', '楠梓區', '22.7270980', '120.3073650'),
('L025', '高雄市楠梓區右昌街415號', '楠梓區', '22.7156750', '120.2879900'),
('L026', '高雄市楠梓區翠屏路28號', '楠梓區', '22.7259410', '120.2993679'),
('L027', '高雄市橋頭區橋頭路1-4號', '橋頭區', '22.7582236', '120.3106469'),
('L028', '高雄市橋頭區成功南路47號', '橋頭區', '22.7546065', '120.3116964'),
('L029', '高雄市橋頭區樹德路11-5號', '橋頭區', '22.7588810', '120.3048770'),
('L030', '高雄市橋頭區橋南路106號', '橋頭區', '22.7544723', '120.3122655');

-- --------------------------------------------------------

--
-- 表的結構 `infoname`
--

CREATE TABLE `infoname` (
  `InfoNo` varchar(10) NOT NULL,
  `InfoName` varchar(10) NOT NULL,
  PRIMARY KEY (`InfoNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 轉存資料表中的資料 `infoname`
--

INSERT INTO `infoname` (`InfoNo`, `InfoName`) VALUES
('L001', '大稻里池上飯包'),
('L002', '好想再吃'),
('L003', '吉昱排骨飯'),
('L004', '金之菊日式拉麵'),
('L005', '牛摩王牛排'),
('L006', '阿爸的滷肉飯'),
('L007', '老師傅水餃店'),
('L008', '水餃進'),
('L009', '本家巧廚'),
('L010', '豐廚'),
('L011', '品湘美食館'),
('L012', '緣的灶腳'),
('L013', '三鍋王'),
('L014', '山東一品手工餃'),
('L015', '資記樓庭'),
('L016', '美珍味燒臘烤鴨莊'),
('L017', 'I AM I'),
('L018', '南大門'),
('L019', '小妹妹牛肉麵/飯館'),
('L020', '姑姑小吃'),
('L021', '好望角'),
('L022', '阿寶米粉羹'),
('L023', '小陽鐵板燒'),
('L024', '大呼過癮'),
('L025', '金火雞嘉義火雞肉飯'),
('L026', '火雞頭嘉義火雞肉飯'),
('L027', '小南橋頭老街便當'),
('L028', '丹丹漢堡'),
('L029', 'Small萱'),
('L030', '橋頭黃家魯肉飯');

-- --------------------------------------------------------

--
-- 表的結構 `infotype`
--

CREATE TABLE `infotype` (
  `InfoNo` varchar(10) NOT NULL,
  `TypeRice` varchar(5) NOT NULL,
  `TypeNoodle` varchar(5) NOT NULL,
  `TypeDump` varchar(5) NOT NULL,
  `TypeVeg` varchar(5) NOT NULL,
  `TypeOther` varchar(5) NOT NULL,
  PRIMARY KEY (`InfoNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 轉存資料表中的資料 `infotype`
--

INSERT INTO `infotype` (`InfoNo`, `TypeRice`, `TypeNoodle`, `TypeDump`, `TypeVeg`, `TypeOther`) VALUES
('L001', '有', '無', '無', '有', '無'),
('L002', '有', '有', '無', '有', '有'),
('L003', '有', '無', '無', '無', '無'),
('L004', '有', '有', '無', '無', '有'),
('L005', '有', '有', '無', '無', '無'),
('L006', '有', '有', '無', '無', '無'),
('L007', '有', '有', '有', '無', '無'),
('L008', '有', '有', '有', '無', '無'),
('L009', '有', '有', '無', '無', '無'),
('L010', '有', '無', '無', '有', '無'),
('L011', '有', '有', '無', '無', '無'),
('L012', '有', '有', '無', '無', '無'),
('L013', '有', '有', '無', '無', '無'),
('L014', '有', '有', '無', '有', '有'),
('L015', '有', '有', '無', '無', '有'),
('L016', '有', '無', '無', '無', '有'),
('L017', '有', '有', '無', '有', '有'),
('L018', '有', '有', '無', '無', '有'),
('L019', '有', '有', '有', '有', '無'),
('L020', '有', '有', '無', '無', '無'),
('L021', '無', '有', '無', '無', '無'),
('L022', '有', '有', '有', '有', '有'),
('L023', '有', '無', '無', '有', '無'),
('L024', '有', '有', '無', '有', '有'),
('L025', '有', '無', '無', '無', '無'),
('L026', '有', '有', '無', '無', '無'),
('L027', '有', '無', '無', '無', '無'),
('L028', '無', '有', '無', '無', '有'),
('L029', '有', '有', '無', '有', '有'),
('L030', '有', '無', '無', '無', '無');

-- --------------------------------------------------------

--
-- 表的結構 `member`
--

CREATE TABLE `member` (
  `name` varchar(10) NOT NULL,
  `id` varchar(10) NOT NULL,
  `pwd` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 轉存資料表中的資料 `member`
--

INSERT INTO `member` (`name`, `id`, `pwd`) VALUES
('曾令衡', 'wdp56004', 'shaq8117'),
('蔡耀賢', 'yao', 'ecwin123'),
('曉率', 'yi31', 'hll9257'),
('王歪頭', 'ytall1113', '713113');

-- --------------------------------------------------------

--
-- 表的結構 `storecomment`
--

CREATE TABLE `storecomment` (
  `StoreNumber` varchar(10) NOT NULL,
  `Time` varchar(50) NOT NULL,
  `UserName` varchar(10) NOT NULL,
  `UserContent` varchar(200) NOT NULL,
  PRIMARY KEY (`StoreNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的結構 `useradd`
--

CREATE TABLE `useradd` (
  `UserInfoName` varchar(10) NOT NULL,
  `UserInfoTel` varchar(15) NOT NULL,
  `UserInfoRoad` varchar(50) NOT NULL,
  `UserInfoRice` varchar(5) NOT NULL,
  `UserInfoNoodle` varchar(5) NOT NULL,
  `UserInfoDump` varchar(5) NOT NULL,
  `UserInfoVeg` varchar(5) NOT NULL,
  `UserInfoOther` varchar(5) NOT NULL,
  `UserInfoMoney` varchar(15) NOT NULL,
  `UserInfoArea` varchar(50) NOT NULL,
  `UserInfoSeat` varchar(10) NOT NULL,
  PRIMARY KEY (`UserInfoTel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 轉存資料表中的資料 `useradd`
--

INSERT INTO `useradd` (`UserInfoName`, `UserInfoTel`, `UserInfoRoad`, `UserInfoRice`, `UserInfoNoodle`, `UserInfoDump`, `UserInfoVeg`, `UserInfoOther`, `UserInfoMoney`, `UserInfoArea`, `UserInfoSeat`) VALUES
('吉昱便當', '062055546', '藍田路上', '有', '有', '無', '有', '無', '50~100元', '楠梓', '多');

-- --------------------------------------------------------

--
-- 表的結構 `userRecord`
--

CREATE TABLE `userRecord` (
  `UserNo` varchar(128) NOT NULL,
  `InfoNo` varchar(15) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UserNo`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 轉存資料表中的資料 `userRecord`
--

INSERT INTO `userRecord` (`UserNo`, `InfoNo`, `time`) VALUES
('AppTest01', 'L021', '2012-12-09 10:02:22'),
('AppTest01', 'L021', '2012-12-09 10:02:27'),
('AppTest01', 'L030', '2012-12-09 10:02:31'),
('AppTest01', 'L021', '2012-12-09 10:02:34'),
('AppTest01', 'L005', '2012-12-09 10:02:38');

--
-- 匯出資料表的 Constraints
--

--
-- 資料表的 Constraints `infodetail`
--
ALTER TABLE `infodetail`
  ADD CONSTRAINT `infodetail_ibfk_1` FOREIGN KEY (`InfoNo`) REFERENCES `infoname` (`InfoNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `infolocation`
--
ALTER TABLE `infolocation`
  ADD CONSTRAINT `infolocation_ibfk_1` FOREIGN KEY (`InfoNo`) REFERENCES `infoname` (`InfoNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `infotype`
--
ALTER TABLE `infotype`
  ADD CONSTRAINT `infotype_ibfk_1` FOREIGN KEY (`InfoNo`) REFERENCES `infoname` (`InfoNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `storecomment`
--
ALTER TABLE `storecomment`
  ADD CONSTRAINT `storecomment_ibfk_1` FOREIGN KEY (`StoreNumber`) REFERENCES `infolocation` (`InfoNo`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
