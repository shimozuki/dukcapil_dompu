/*
 Navicat Premium Data Transfer

 Source Server         : my_local
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : dukcapil_dompu

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 22/06/2025 17:31:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for antrian
-- ----------------------------
DROP TABLE IF EXISTS `antrian`;
CREATE TABLE `antrian`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `jenis_pelayanan_id` bigint UNSIGNED NOT NULL,
  `no_antrian` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `antrian_user_id_foreign`(`user_id` ASC) USING BTREE,
  INDEX `antrian_jenis_pelayanan_id_foreign`(`jenis_pelayanan_id` ASC) USING BTREE,
  CONSTRAINT `antrian_jenis_pelayanan_id_foreign` FOREIGN KEY (`jenis_pelayanan_id`) REFERENCES `jenis_pelayanan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `antrian_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of antrian
-- ----------------------------

-- ----------------------------
-- Table structure for jenis_pelayanan
-- ----------------------------
DROP TABLE IF EXISTS `jenis_pelayanan`;
CREATE TABLE `jenis_pelayanan`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_pelayanan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_layanan` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jenis_pelayanan
-- ----------------------------
INSERT INTO `jenis_pelayanan` VALUES (1, 'Pembuatan KTP', 1, NULL, NULL);
INSERT INTO `jenis_pelayanan` VALUES (2, 'Pembuatan Kartu Keluarga', 1, NULL, NULL);
INSERT INTO `jenis_pelayanan` VALUES (3, 'Surat Keterangan', 2, NULL, NULL);
INSERT INTO `jenis_pelayanan` VALUES (4, 'Surat Keterangan Belum Menikah, Duda/Janda', 2, NULL, NULL);
INSERT INTO `jenis_pelayanan` VALUES (5, 'Surat Keterangan Usaha', 2, NULL, NULL);
INSERT INTO `jenis_pelayanan` VALUES (6, 'Lain - Lain', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2023_06_06_053850_change_field_to_users_table', 1);
INSERT INTO `migrations` VALUES (6, '2023_06_09_014611_create_jenis_pelayanan_table', 1);
INSERT INTO `migrations` VALUES (7, '2023_06_09_014715_create_antrian_table', 1);
INSERT INTO `migrations` VALUES (8, '2023_06_09_015148_create_surat_pengantar_table', 1);
INSERT INTO `migrations` VALUES (9, '2023_06_09_112118_create_notifikasi_table', 1);
INSERT INTO `migrations` VALUES (10, '2023_06_09_112247_create_pengaduan_table', 1);
INSERT INTO `migrations` VALUES (11, '2023_06_09_113327_add_no_antrian_to_antrian_table', 1);
INSERT INTO `migrations` VALUES (12, '2023_06_12_144134_add_tipe_pelayanan_to_jenis_pelayanan_table', 1);
INSERT INTO `migrations` VALUES (13, '2023_06_12_144255_add_jenis_pelayanan_seeder', 1);
INSERT INTO `migrations` VALUES (14, '2023_06_12_145210_add_deleted_at_to_users', 1);
INSERT INTO `migrations` VALUES (15, '2023_06_12_145334_add_users_seeder', 1);
INSERT INTO `migrations` VALUES (16, '2023_06_12_160848_delete_unsed_table', 1);

-- ----------------------------
-- Table structure for notifikasi
-- ----------------------------
DROP TABLE IF EXISTS `notifikasi`;
CREATE TABLE `notifikasi`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `status_notifikasi` int NOT NULL DEFAULT 1,
  `judul_notifikasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi_notifikasi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_notifikasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tipe_notifikasi` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `notifikasi_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `notifikasi_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notifikasi
-- ----------------------------

-- ----------------------------
-- Table structure for pengaduan
-- ----------------------------
DROP TABLE IF EXISTS `pengaduan`;
CREATE TABLE `pengaduan`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `isi_pengaduan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengaduan
-- ----------------------------

-- ----------------------------
-- Table structure for surat_pengantar
-- ----------------------------
DROP TABLE IF EXISTS `surat_pengantar`;
CREATE TABLE `surat_pengantar`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `jenis_pelayanan_id` bigint UNSIGNED NOT NULL,
  `jenis_berkas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_berkas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `orginal_name_berkas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_pengajuan` int NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `surat_pengantar_user_id_foreign`(`user_id` ASC) USING BTREE,
  INDEX `surat_pengantar_jenis_pelayanan_id_foreign`(`jenis_pelayanan_id` ASC) USING BTREE,
  CONSTRAINT `surat_pengantar_jenis_pelayanan_id_foreign` FOREIGN KEY (`jenis_pelayanan_id`) REFERENCES `jenis_pelayanan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `surat_pengantar_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of surat_pengantar
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_nik_unique`(`nik` ASC) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE,
  UNIQUE INDEX `users_phone_number_unique`(`phone_number` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '1111111111111111', 'Admin', '2000-01-01', 'L', 'Jl. Admin', 'admin@mail.com', '081234567890', '$2y$12$llFXrYO.Txy/IpQFHFHBYeoYauWvhEuryNYO.i6sJjjmOUHljZnrm', '1', '2025-05-13 21:07:39', '2025-05-13 21:07:39', NULL);
INSERT INTO `users` VALUES (2, '0987654321123456', 'Warga 1', '2000-01-01', 'L', 'Jl. Warga 1', 'warga1@mail.com', '081234567891', '$2y$12$llFXrYO.Txy/IpQFHFHBYeoYauWvhEuryNYO.i6sJjjmOUHljZnrm', '2', '2025-05-13 21:07:39', '2025-05-13 21:07:39', NULL);

SET FOREIGN_KEY_CHECKS = 1;
