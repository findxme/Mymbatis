/*
 Navicat Premium Data Transfer

 Source Server         : lxj
 Source Server Type    : MySQL
 Source Server Version : 50711
 Source Host           : localhost:3306
 Source Schema         : myweb

 Target Server Type    : MySQL
 Target Server Version : 50711
 File Encoding         : 65001

 Date: 24/09/2019 23:06:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dbsupermarket
-- ----------------------------
DROP TABLE IF EXISTS `dbsupermarket`;
CREATE TABLE `dbsupermarket`  (
  `GID` int(255) NOT NULL AUTO_INCREMENT,
  `GNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GPRICE` float NULL DEFAULT NULL,
  PRIMARY KEY (`GID`) USING BTREE,
  UNIQUE INDEX `GNAME`(`GNAME`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dbsupermarket
-- ----------------------------
INSERT INTO `dbsupermarket` VALUES (1, '熊熊一号', 1);
INSERT INTO `dbsupermarket` VALUES (27, '熊熊二号', 2);

SET FOREIGN_KEY_CHECKS = 1;
