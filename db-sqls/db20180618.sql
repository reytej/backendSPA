/*
MySQL Backup
Source Server Version: 5.5.5
Source Database: backend
Date: 18/06/2018 05:55:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `links`
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `links` VALUES ('1','INV00','main','Inventory','','/items','','0','2018-06-17 17:20:50','2018-06-17 17:20:54'), ('2','INV01','sub','Items','INV00','/items','fa fa-inbox','1','2018-06-17 17:23:04','2018-06-17 17:23:09'), ('3','INV02','sub','Purchase','INV00','/purchase','fa fa-inbox','2','2018-06-17 17:23:54','2018-06-17 17:23:57');
INSERT INTO `migrations` VALUES ('1','2014_10_12_000000_create_users_table','1'), ('2','2014_10_12_100000_create_password_resets_table','1'), ('3','2016_06_01_000001_create_oauth_auth_codes_table','1'), ('4','2016_06_01_000002_create_oauth_access_tokens_table','1'), ('5','2016_06_01_000003_create_oauth_refresh_tokens_table','1'), ('6','2016_06_01_000004_create_oauth_clients_table','1'), ('7','2016_06_01_000005_create_oauth_personal_access_clients_table','1'), ('8','2018_06_13_113723_add_users_role_column','2'), ('9','2018_06_13_113853_create_roles_table','2'), ('10','2018_06_17_091359_create_links_table','3');
INSERT INTO `oauth_access_tokens` VALUES ('003991becae6af4c70df19d7714d9bdff28123a34b4a244840afe0d9c95210c9b19d7b224be2bc92','1','1','app','[]','0','2018-06-17 09:43:09','2018-06-17 09:43:09','2019-06-17 09:43:09'), ('0754618872e87774a65a655665552c47569e8ead525364de7fac2cd40e06dbf8ac9d56c878476efc','1','1','app','[]','0','2018-06-17 11:41:58','2018-06-17 11:41:58','2019-06-17 11:41:58'), ('140ff23a9a0973e13235290a9498deee6b361b6de2b713127004c089d7e576a0dec68ea9f3d3791a','1','1','app','[]','0','2018-06-17 09:51:11','2018-06-17 09:51:11','2019-06-17 09:51:11'), ('26819043aab9434fc6a0806ed6ac112f3f1123bed6111cb69bf1e44b3dbbb25a48392aa200992975','1','1','app','[]','0','2018-06-17 11:24:24','2018-06-17 11:24:24','2019-06-17 11:24:24'), ('2a434ad54a7b132c832c31afed14c33e9ba7ccf13fa0d36e1cf4f20e1cdab7db9a514cde34f05e6d','1','1','app','[]','0','2018-06-17 11:23:22','2018-06-17 11:23:22','2019-06-17 11:23:22'), ('2bf15a3642ddd1c54d8f3c5415a8e1abbf87a295c2f6bcc09a59895f9e5dfdc565a823e1e66bb377','1','1','app','[]','0','2018-06-17 11:32:26','2018-06-17 11:32:26','2019-06-17 11:32:26'), ('2ccc1ddfb4de968e7275f2ef8a268856f50e855814213b381d681eb2e0b297975218b17df376f69e','1','1','app','[]','0','2018-06-13 12:10:51','2018-06-13 12:10:51','2019-06-13 12:10:51'), ('2e27317c7b98b5871ff69c5ef9360f844bac203ad9a1a09215fceef2649fe0099c5c7a280cadefbb','1','1','app','[]','0','2018-06-17 11:49:07','2018-06-17 11:49:07','2019-06-17 11:49:07'), ('32602727dd7aa7436873dcc189327e3375aac057888375f088e7efcd022f2b36853dbaf9a93276a0','1','1','app','[]','0','2018-06-13 11:31:46','2018-06-13 11:31:46','2019-06-13 11:31:46'), ('3e0ba1d326bcf6a07c31c5306d743dbd9b60c79f126085e42817ee24f88377cf95ff0e99d6dace73','1','1','app','[]','0','2018-06-17 09:31:12','2018-06-17 09:31:12','2019-06-17 09:31:12'), ('4912f3c81b9e9681129a9e0f0f19740865e795a62142239dc54d3ac0d76e15a9f72d29c7af447803','1','1','app','[]','0','2018-06-17 09:22:35','2018-06-17 09:22:35','2019-06-17 09:22:35'), ('5649828e3ed86b19b03594268da5395919fe38360805bd27cc31b838b8202002fcd14f697fd88316','1','1','app','[]','0','2018-06-13 12:05:53','2018-06-13 12:05:53','2019-06-13 12:05:53'), ('574ca1815269e6548939cff3d5e38b9ab43ae07438e8b722503eec0d8befacfbde72d82569323fac','1','1','app','[]','0','2018-06-17 11:30:52','2018-06-17 11:30:52','2019-06-17 11:30:52'), ('5b36b2da2a81af512b66c4c939eae3a55bf3ca3f177575d204a4667f2cac0ede85e60cd1cc1fbf7c','1','1','app','[]','0','2018-06-17 09:44:50','2018-06-17 09:44:50','2019-06-17 09:44:50'), ('63e62177f1b39cfc2580006d2ca83457586b56e3974db4353418dde79acc81e8c964491350b852de','1','1','app','[]','0','2018-06-13 11:49:35','2018-06-13 11:49:35','2019-06-13 11:49:35'), ('6580e0aa3d74ce085e359f430a092bf510f0676add47fbe39810693206ae6481264264162a1330de','1','1','app','[]','0','2018-06-13 11:43:05','2018-06-13 11:43:05','2019-06-13 11:43:05'), ('6dbeb6516d68dbbb9e1cb99d31fff6c955101d83d45478b25ce8f50614464b9c211ddc3466efba12','1','1','app','[]','0','2018-06-17 09:40:13','2018-06-17 09:40:13','2019-06-17 09:40:13'), ('6e0e69c65759443690c9d365cbbbc2f4770a08e06d347f890aef2f195ff062a0994625320b837bbc','1','1','app','[]','0','2018-06-13 12:05:45','2018-06-13 12:05:45','2019-06-13 12:05:45'), ('7aaf828c81869398408a947be8e1857f7e79c4971dceb252ca0de89f7fb760268e286bf12b7e3945','1','1','app','[]','0','2018-06-17 11:43:48','2018-06-17 11:43:48','2019-06-17 11:43:48'), ('7b58c184a3504ed0670e1fb9cfd52e28b9aa30861a8824e2de7ff23a0b84df9921ff696edaf31011','1','1','app','[]','0','2018-06-17 10:06:27','2018-06-17 10:06:27','2019-06-17 10:06:27'), ('88ef32d75fd12bd4c92ef0f4081f3f7ea50bd20819290fd439f6b8adf56e3fc172ae55ca1df5825b','1','1','app','[]','0','2018-06-17 11:14:56','2018-06-17 11:14:56','2019-06-17 11:14:56'), ('98af2cc87bf5fd477c9449dfac71c29942d57f49b30c9d5f72778d7586d3561b27e37ef19dddcfdb','1','1','app','[]','0','2018-06-17 10:52:53','2018-06-17 10:52:53','2019-06-17 10:52:53'), ('9f6b4af657c72567c7193fb6b663b1c3813db6c16ba6e98da237c558098e41319e07f0509d3a8111','1','1','app','[]','0','2018-06-17 11:05:04','2018-06-17 11:05:04','2019-06-17 11:05:04'), ('ace30b772c056a5eb2f4669e0d7525667f0a0c2ae17fb65e9a55b5550a56a4b6ac348a6bd04de4f2','1','1','app','[]','0','2018-06-13 11:56:55','2018-06-13 11:56:55','2019-06-13 11:56:55'), ('b1d522ec8ad0e7ab42f759305ea66ed7eb171e15381ed6be6a575a1ecca71e5b9245f8f576806cfc','1','1','app','[]','0','2018-06-17 11:09:43','2018-06-17 11:09:43','2019-06-17 11:09:43'), ('b22f5582ada91e697ee0eb9c74701fd9541744d764f9ce00121863b34f62b1e84dfafda1366afe14','1','1','app','[]','0','2018-06-17 11:41:07','2018-06-17 11:41:07','2019-06-17 11:41:07'), ('b3e1ceb1a6cd8c4eddbc4e013068845a99237f69a40e858ab86694695894f42b5a48ce981f610bd3','1','1','app','[]','0','2018-06-17 11:18:39','2018-06-17 11:18:39','2019-06-17 11:18:39'), ('b7760c3e7fe7bffa0ebde978f55030805d2219c52b4ae44e350c0fbd34cff5227a2613cbe5af118b','1','1','app','[]','0','2018-06-17 11:52:04','2018-06-17 11:52:04','2019-06-17 11:52:04'), ('b90b4d41770016786b97eec384897e447a7a2d734d428d2a338c602d7bd8c02dfa610473fe37ae34','1','1','app','[]','0','2018-06-13 12:09:53','2018-06-13 12:09:53','2019-06-13 12:09:53'), ('bb8dbb2eea5ccbf7838ae55ef6ab9e70b03c64b2db6347bce7e162469588fcca3408bdafcd39b487','1','1','app','[]','0','2018-06-17 09:41:58','2018-06-17 09:41:58','2019-06-17 09:41:58'), ('c6640c526140718956e7b6ad6ec86a29f49c3ecdf683f86142e76b29437994663e9a0f24e641133e','1','1','app','[]','0','2018-06-17 11:50:10','2018-06-17 11:50:10','2019-06-17 11:50:10'), ('caa2e1474faccbe37bc414754963ef735d2a09b3d561f69bb17d0cb64c049243ddc7767d922dd84c','1','1','app','[]','0','2018-06-17 11:38:56','2018-06-17 11:38:56','2019-06-17 11:38:56'), ('d6f5846700511aac43f378a12ff4660cf5f47cec1eb721f5ed94c4d86f15ba62aa789be21e6bae21','1','1','app','[]','0','2018-06-17 11:07:49','2018-06-17 11:07:49','2019-06-17 11:07:49'), ('de0b4ad6ba886cd35a80b4f462e3783053cc574e3f4ad4a1dd1d96891280eb96ac8c0e911a55813c','1','1','app','[]','0','2018-06-17 09:46:19','2018-06-17 09:46:19','2019-06-17 09:46:19'), ('e9154dd792bc2fb1b87d261b43bb7427a9a8a8cc5ab8959d5adf15f82c519759c8fa8e0947779568','1','1','app','[]','0','2018-06-17 11:18:24','2018-06-17 11:18:24','2019-06-17 11:18:24'), ('ed138168055b8a26451dbc66f2dae512bc5adc4af1e8016da9a9891a7ea053d48444f6c25f73c9b6','1','1','app','[]','0','2018-06-13 11:55:51','2018-06-13 11:55:51','2019-06-13 11:55:51'), ('efb3db9dda931332080967f12e8daea4c21e8b08e408dfcef40de8da0152f14137ebe736d58b0a96','1','1','app','[]','0','2018-06-13 12:09:15','2018-06-13 12:09:15','2019-06-13 12:09:15'), ('f6d6956a8c877f925dac8ab9dc1e9295b6f2b89a469e6bc7e94a8d0a917eb401e0b871adde73f2ec','1','1','app','[]','0','2018-06-17 11:29:23','2018-06-17 11:29:23','2019-06-17 11:29:23');
INSERT INTO `oauth_clients` VALUES ('1',NULL,'Laravel Personal Access Client','ir0b8IXvtQPYTpvK9YxWowyYviX6tmBhzsutsDRn','http://localhost','1','0','0','2018-06-08 13:33:20','2018-06-08 13:33:20'), ('2',NULL,'Laravel Password Grant Client','y68yuqY2JF4eMt1KeDLwLfVVjvKlnRvjruD8HjOF','http://localhost','0','1','0','2018-06-08 13:33:20','2018-06-08 13:33:20');
INSERT INTO `oauth_personal_access_clients` VALUES ('1','1','2018-06-08 13:33:20','2018-06-08 13:33:20');
INSERT INTO `roles` VALUES ('1','ADMIN','Administrator','2018-06-13 19:41:27',NULL);
INSERT INTO `users` VALUES ('1','Administrator','admin@mail.com','$2y$10$PG4pUzLjJBf9zRQv.ebcU.GEjQWXV6LUSqK0Qc7E8f.jYS3qVtlsS',NULL,'2018-06-12 10:18:44','2018-06-12 10:18:44','ADMIN');
