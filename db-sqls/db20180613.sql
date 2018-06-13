/*
MySQL Backup
Source Server Version: 5.5.5
Source Database: backend
Date: 13/06/2018 20:27:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_access_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_auth_codes`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_clients`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_personal_access_clients`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_refresh_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `migrations` VALUES ('1','2014_10_12_000000_create_users_table','1'), ('2','2014_10_12_100000_create_password_resets_table','1'), ('3','2016_06_01_000001_create_oauth_auth_codes_table','1'), ('4','2016_06_01_000002_create_oauth_access_tokens_table','1'), ('5','2016_06_01_000003_create_oauth_refresh_tokens_table','1'), ('6','2016_06_01_000004_create_oauth_clients_table','1'), ('7','2016_06_01_000005_create_oauth_personal_access_clients_table','1'), ('8','2018_06_13_113723_add_users_role_column','2'), ('9','2018_06_13_113853_create_roles_table','2');
INSERT INTO `oauth_access_tokens` VALUES ('2ccc1ddfb4de968e7275f2ef8a268856f50e855814213b381d681eb2e0b297975218b17df376f69e','1','1','app','[]','0','2018-06-13 12:10:51','2018-06-13 12:10:51','2019-06-13 12:10:51'), ('32602727dd7aa7436873dcc189327e3375aac057888375f088e7efcd022f2b36853dbaf9a93276a0','1','1','app','[]','0','2018-06-13 11:31:46','2018-06-13 11:31:46','2019-06-13 11:31:46'), ('5649828e3ed86b19b03594268da5395919fe38360805bd27cc31b838b8202002fcd14f697fd88316','1','1','app','[]','0','2018-06-13 12:05:53','2018-06-13 12:05:53','2019-06-13 12:05:53'), ('63e62177f1b39cfc2580006d2ca83457586b56e3974db4353418dde79acc81e8c964491350b852de','1','1','app','[]','0','2018-06-13 11:49:35','2018-06-13 11:49:35','2019-06-13 11:49:35'), ('6580e0aa3d74ce085e359f430a092bf510f0676add47fbe39810693206ae6481264264162a1330de','1','1','app','[]','0','2018-06-13 11:43:05','2018-06-13 11:43:05','2019-06-13 11:43:05'), ('6e0e69c65759443690c9d365cbbbc2f4770a08e06d347f890aef2f195ff062a0994625320b837bbc','1','1','app','[]','0','2018-06-13 12:05:45','2018-06-13 12:05:45','2019-06-13 12:05:45'), ('ace30b772c056a5eb2f4669e0d7525667f0a0c2ae17fb65e9a55b5550a56a4b6ac348a6bd04de4f2','1','1','app','[]','0','2018-06-13 11:56:55','2018-06-13 11:56:55','2019-06-13 11:56:55'), ('b90b4d41770016786b97eec384897e447a7a2d734d428d2a338c602d7bd8c02dfa610473fe37ae34','1','1','app','[]','0','2018-06-13 12:09:53','2018-06-13 12:09:53','2019-06-13 12:09:53'), ('ed138168055b8a26451dbc66f2dae512bc5adc4af1e8016da9a9891a7ea053d48444f6c25f73c9b6','1','1','app','[]','0','2018-06-13 11:55:51','2018-06-13 11:55:51','2019-06-13 11:55:51'), ('efb3db9dda931332080967f12e8daea4c21e8b08e408dfcef40de8da0152f14137ebe736d58b0a96','1','1','app','[]','0','2018-06-13 12:09:15','2018-06-13 12:09:15','2019-06-13 12:09:15');
INSERT INTO `oauth_clients` VALUES ('1',NULL,'Laravel Personal Access Client','ir0b8IXvtQPYTpvK9YxWowyYviX6tmBhzsutsDRn','http://localhost','1','0','0','2018-06-08 13:33:20','2018-06-08 13:33:20'), ('2',NULL,'Laravel Password Grant Client','y68yuqY2JF4eMt1KeDLwLfVVjvKlnRvjruD8HjOF','http://localhost','0','1','0','2018-06-08 13:33:20','2018-06-08 13:33:20');
INSERT INTO `oauth_personal_access_clients` VALUES ('1','1','2018-06-08 13:33:20','2018-06-08 13:33:20');
INSERT INTO `roles` VALUES ('1','ADMIN','Administrator','2018-06-13 19:41:27',NULL);
INSERT INTO `users` VALUES ('1','Administrator','admin@mail.com','$2y$10$PG4pUzLjJBf9zRQv.ebcU.GEjQWXV6LUSqK0Qc7E8f.jYS3qVtlsS',NULL,'2018-06-12 10:18:44','2018-06-12 10:18:44','ADMIN');
