/*
MySQL Backup
Source Server Version: 5.5.5
Source Database: backend
Date: 01/07/2018 20:17:49
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
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `links` VALUES ('1','INV00','main','Inventory','','items','pages/inventory/items','','0','2018-06-17 17:20:50','2018-06-17 17:20:54'), ('2','INV01','sub','Items','INV00','items','pages/inventory/items','fa fa-archive','1','2018-06-17 17:23:04','2018-06-17 17:23:09'), ('3','INV02','sub','Purchase','INV00','purchase','pages/inventory/purchase','fa fa-truck','2','2018-06-17 17:23:54','2018-06-17 17:23:57'), ('4','SLE00','main','Sales','','sales','pages/sales/transactions','','0','2018-06-19 17:10:43','2018-06-19 17:10:46'), ('5','SLE01','sub','Transactions','SLE00','sales','pages/sales/transactions','fa fa-table','1','2018-06-19 17:11:20','2018-06-19 17:11:23'), ('6','ADM00','main','Administration','','company','pages/administration/company','fa fa-cogs','0','2018-06-27 17:22:09','2018-06-27 17:22:12'), ('7','ADM01','sub','Company ','ADM00','company','pages/administration/company','fa fa-building','1','2018-06-27 17:44:07','2018-06-27 17:44:20'), ('8','ADM02','sub','Users','ADM00','users','pages/administration/users','fa fa-users','2','2018-06-27 17:44:10','2018-06-27 17:44:23'), ('10','ADM03','sub','Roles and Permissions','ADM00','roles','pages/administration/roles','fa fa-lock','3','2018-06-27 17:44:17','2018-06-27 17:44:28');
INSERT INTO `migrations` VALUES ('1','2014_10_12_000000_create_users_table','1'), ('2','2014_10_12_100000_create_password_resets_table','1'), ('3','2016_06_01_000001_create_oauth_auth_codes_table','1'), ('4','2016_06_01_000002_create_oauth_access_tokens_table','1'), ('5','2016_06_01_000003_create_oauth_refresh_tokens_table','1'), ('6','2016_06_01_000004_create_oauth_clients_table','1'), ('7','2016_06_01_000005_create_oauth_personal_access_clients_table','1'), ('8','2018_06_13_113723_add_users_role_column','2'), ('9','2018_06_13_113853_create_roles_table','2'), ('10','2018_06_17_091359_create_links_table','3'), ('11','2018_07_01_030217_add_inactive_to_users_table','4');
INSERT INTO `oauth_access_tokens` VALUES ('003991becae6af4c70df19d7714d9bdff28123a34b4a244840afe0d9c95210c9b19d7b224be2bc92','1','1','app','[]','0','2018-06-17 09:43:09','2018-06-17 09:43:09','2019-06-17 09:43:09'), ('02af93d8beec9d68cf862e3eec94bea5d39b0a7e76a783996cd409ba80a15877688b010c88124315','1','1','app','[]','0','2018-06-19 09:47:05','2018-06-19 09:47:05','2019-06-19 09:47:05'), ('0754618872e87774a65a655665552c47569e8ead525364de7fac2cd40e06dbf8ac9d56c878476efc','1','1','app','[]','0','2018-06-17 11:41:58','2018-06-17 11:41:58','2019-06-17 11:41:58'), ('0c73450eb286f5a10cfd2a3b9417b859b0a548b5d5dad732118a7a6a61ce7ef50c33d6862559b4bf','1','1','app','[]','0','2018-06-30 01:12:27','2018-06-30 01:12:27','2019-06-30 01:12:27'), ('13c047aa88ecfbda1935993fc47b6d9c366226837adaad30a612f1894134a9dee45b2501578c1f93','1','1','app','[]','0','2018-06-27 09:45:49','2018-06-27 09:45:49','2019-06-27 09:45:49'), ('140ff23a9a0973e13235290a9498deee6b361b6de2b713127004c089d7e576a0dec68ea9f3d3791a','1','1','app','[]','0','2018-06-17 09:51:11','2018-06-17 09:51:11','2019-06-17 09:51:11'), ('142222aea24a128da14be74bc0da5978891c08077160cde91cd0597c5bca92c2152362111a185fde','1','1','app','[]','0','2018-06-30 01:05:01','2018-06-30 01:05:01','2019-06-30 01:05:01'), ('1651fa9aeb0171b5dd832cccaa993d777802ef5abdb5d5c995002a9da5261009174646bc445de211','1','1','app','[]','0','2018-06-30 01:16:30','2018-06-30 01:16:30','2019-06-30 01:16:30'), ('177ae6823dfd6f06c1319902d578ed06ff557c359fa75c0ba5a50854f38c7e8c2650f71e7893b765','1','1','app','[]','0','2018-06-30 01:11:49','2018-06-30 01:11:49','2019-06-30 01:11:49'), ('1f1563ccedc54de3348d07cdb3425e38a6ba8835299b1c1fcb8a2307af021f4a4549301492aac16d','1','1','app','[]','0','2018-06-30 01:09:52','2018-06-30 01:09:52','2019-06-30 01:09:52'), ('257685bba4314ff660bbe10d8d61e89e912294f6683aeb94e2b292d67124e4115fa360f1aaaf59aa','1','1','app','[]','0','2018-06-27 09:35:04','2018-06-27 09:35:04','2019-06-27 09:35:04'), ('26819043aab9434fc6a0806ed6ac112f3f1123bed6111cb69bf1e44b3dbbb25a48392aa200992975','1','1','app','[]','0','2018-06-17 11:24:24','2018-06-17 11:24:24','2019-06-17 11:24:24'), ('27078b2c00f98c497f1c33338713814e2316bb6677895e6cc65047fd4b54be154ad5d4743848796e','1','1','app','[]','0','2018-06-19 09:45:22','2018-06-19 09:45:22','2019-06-19 09:45:22'), ('2a434ad54a7b132c832c31afed14c33e9ba7ccf13fa0d36e1cf4f20e1cdab7db9a514cde34f05e6d','1','1','app','[]','0','2018-06-17 11:23:22','2018-06-17 11:23:22','2019-06-17 11:23:22'), ('2bf15a3642ddd1c54d8f3c5415a8e1abbf87a295c2f6bcc09a59895f9e5dfdc565a823e1e66bb377','1','1','app','[]','0','2018-06-17 11:32:26','2018-06-17 11:32:26','2019-06-17 11:32:26'), ('2ccc1ddfb4de968e7275f2ef8a268856f50e855814213b381d681eb2e0b297975218b17df376f69e','1','1','app','[]','0','2018-06-13 12:10:51','2018-06-13 12:10:51','2019-06-13 12:10:51'), ('2e27317c7b98b5871ff69c5ef9360f844bac203ad9a1a09215fceef2649fe0099c5c7a280cadefbb','1','1','app','[]','0','2018-06-17 11:49:07','2018-06-17 11:49:07','2019-06-17 11:49:07'), ('32602727dd7aa7436873dcc189327e3375aac057888375f088e7efcd022f2b36853dbaf9a93276a0','1','1','app','[]','0','2018-06-13 11:31:46','2018-06-13 11:31:46','2019-06-13 11:31:46'), ('33854c19688aac3068fa79c1dd58cff46dccd6d8a845c3178430c76b311032cfa906f5c8a89244de','1','1','app','[]','0','2018-06-28 11:02:23','2018-06-28 11:02:23','2019-06-28 11:02:23'), ('3766f79489d70aa910248b91a8239db9731c9f678e7dcd92464b8bab1d0fd9b41417cab664765a5a','1','1','app','[]','0','2018-07-01 02:55:04','2018-07-01 02:55:04','2019-07-01 02:55:04'), ('3e0ba1d326bcf6a07c31c5306d743dbd9b60c79f126085e42817ee24f88377cf95ff0e99d6dace73','1','1','app','[]','0','2018-06-17 09:31:12','2018-06-17 09:31:12','2019-06-17 09:31:12'), ('4912f3c81b9e9681129a9e0f0f19740865e795a62142239dc54d3ac0d76e15a9f72d29c7af447803','1','1','app','[]','0','2018-06-17 09:22:35','2018-06-17 09:22:35','2019-06-17 09:22:35'), ('53a90cbd5665be34e9d191da726cb535ff85e81abb53f83c91a3a26c9fc6aa8294fa85c9784f5149','1','1','app','[]','0','2018-06-27 09:47:40','2018-06-27 09:47:40','2019-06-27 09:47:40'), ('553f409e96d9fcf68bf65f79bdb19e0982f04bedf18194e15454bb9e839cb9846c9cb5b1ff0393c3','1','1','app','[]','0','2018-06-27 10:23:59','2018-06-27 10:23:59','2019-06-27 10:23:59'), ('5649828e3ed86b19b03594268da5395919fe38360805bd27cc31b838b8202002fcd14f697fd88316','1','1','app','[]','0','2018-06-13 12:05:53','2018-06-13 12:05:53','2019-06-13 12:05:53'), ('574ca1815269e6548939cff3d5e38b9ab43ae07438e8b722503eec0d8befacfbde72d82569323fac','1','1','app','[]','0','2018-06-17 11:30:52','2018-06-17 11:30:52','2019-06-17 11:30:52'), ('5a7198e7b50dbc1b6ac9dbc3fe04b68e749c138e622a6b3f0db3bed270f2565e7d0daf3139c3ab4b','1','1','app','[]','0','2018-06-29 11:47:27','2018-06-29 11:47:27','2019-06-29 11:47:27'), ('5b36b2da2a81af512b66c4c939eae3a55bf3ca3f177575d204a4667f2cac0ede85e60cd1cc1fbf7c','1','1','app','[]','0','2018-06-17 09:44:50','2018-06-17 09:44:50','2019-06-17 09:44:50'), ('5b52a698e1476c1220118b50748b0986aeac401f3e402b20689f716f33fa4b8eefcee75a5a29c712','1','1','app','[]','0','2018-06-30 01:06:27','2018-06-30 01:06:27','2019-06-30 01:06:27'), ('60e08f55244cd0f5cef1360e6d4fe8f50515e3028e622e38ac4689c2b4ea3a271f0e6f0c611d54db','1','1','app','[]','0','2018-06-19 09:54:03','2018-06-19 09:54:03','2019-06-19 09:54:03'), ('63e62177f1b39cfc2580006d2ca83457586b56e3974db4353418dde79acc81e8c964491350b852de','1','1','app','[]','0','2018-06-13 11:49:35','2018-06-13 11:49:35','2019-06-13 11:49:35'), ('6580e0aa3d74ce085e359f430a092bf510f0676add47fbe39810693206ae6481264264162a1330de','1','1','app','[]','0','2018-06-13 11:43:05','2018-06-13 11:43:05','2019-06-13 11:43:05'), ('697f04727395c391eff77bcf31baaf057b67b233920d6fdec7fc8f3889f236a6ebbba6b4fd0fb83f','1','1','app','[]','0','2018-06-30 01:04:27','2018-06-30 01:04:27','2019-06-30 01:04:27'), ('6dbeb6516d68dbbb9e1cb99d31fff6c955101d83d45478b25ce8f50614464b9c211ddc3466efba12','1','1','app','[]','0','2018-06-17 09:40:13','2018-06-17 09:40:13','2019-06-17 09:40:13'), ('6e0e69c65759443690c9d365cbbbc2f4770a08e06d347f890aef2f195ff062a0994625320b837bbc','1','1','app','[]','0','2018-06-13 12:05:45','2018-06-13 12:05:45','2019-06-13 12:05:45'), ('702cefcf3f8d25749771e61e24182a06e3b1b7b0e4f0d7defabbba6e3771f8e23947f4bf68a7da2a','1','1','app','[]','0','2018-06-27 09:33:56','2018-06-27 09:33:56','2019-06-27 09:33:56'), ('760223622f9405bd60935f1ebfaec8397cacaae5bbb310587a062104844f1c7e97cb9517d163f175','1','1','app','[]','0','2018-06-27 09:38:38','2018-06-27 09:38:38','2019-06-27 09:38:38'), ('79f57fabe836ca34abec055385950cb21cd21efd69b2296a294aaf885c2dc71405bcf2dbcde628c8','1','1','app','[]','0','2018-06-30 01:13:34','2018-06-30 01:13:34','2019-06-30 01:13:34'), ('7aaf828c81869398408a947be8e1857f7e79c4971dceb252ca0de89f7fb760268e286bf12b7e3945','1','1','app','[]','0','2018-06-17 11:43:48','2018-06-17 11:43:48','2019-06-17 11:43:48'), ('7b58c184a3504ed0670e1fb9cfd52e28b9aa30861a8824e2de7ff23a0b84df9921ff696edaf31011','1','1','app','[]','0','2018-06-17 10:06:27','2018-06-17 10:06:27','2019-06-17 10:06:27'), ('8270d440c5a92a7ef6e8c100384f957894640d9e8b0e3c8bedddce5538cdb6ddbe7edf01f19c8ce9','1','1','app','[]','0','2018-06-27 09:05:18','2018-06-27 09:05:18','2019-06-27 09:05:18'), ('82cae5cf6e7b8b8bc6730b34831b1e8ecb149e97df77610bd9b3f32544a6ce94b2e40d23ea8d2a8f','1','1','app','[]','0','2018-06-30 02:01:47','2018-06-30 02:01:47','2019-06-30 02:01:47'), ('85d8a497db53420082357c3d3491f4debde749efa931c85329f6f1b8ec0ba8ea3a22ddf6bd08e630','1','1','app','[]','0','2018-06-27 09:48:34','2018-06-27 09:48:34','2019-06-27 09:48:34'), ('87b128aa91260f296899b13c2e04534e4a99780d6ce8986b91cb2b92f1da3a2a7cefbea1388009b8','1','1','app','[]','0','2018-06-30 01:12:07','2018-06-30 01:12:07','2019-06-30 01:12:07'), ('88ef32d75fd12bd4c92ef0f4081f3f7ea50bd20819290fd439f6b8adf56e3fc172ae55ca1df5825b','1','1','app','[]','0','2018-06-17 11:14:56','2018-06-17 11:14:56','2019-06-17 11:14:56'), ('8a7507fc3e3eb35a3b76e8b6bce7d5808c1fb6827059f1532ea03487e6ed8d42cd1fbabea149c2a1','1','1','app','[]','0','2018-06-19 09:48:34','2018-06-19 09:48:34','2019-06-19 09:48:34'), ('8edcb65f3cbedbb8b65544294aa6728b98094164b603cb6d9f2b7d0a968df2d644e7e9c70812e429','1','1','app','[]','0','2018-06-30 01:05:38','2018-06-30 01:05:38','2019-06-30 01:05:38'), ('8f6955d9b813d97ffef7757bf4276ac52dbcb89b9db765cb0a1b8953ef3288cacba2b5d42aeb77ff','1','1','app','[]','0','2018-06-19 09:16:31','2018-06-19 09:16:31','2019-06-19 09:16:31'), ('974907e32a3f3e8cfc5dbece53f56b05b868549e8548d55f70a0c0ebede6f1aae6ddb002798281ad','1','1','app','[]','0','2018-06-20 12:20:40','2018-06-20 12:20:40','2019-06-20 12:20:40'), ('98af2cc87bf5fd477c9449dfac71c29942d57f49b30c9d5f72778d7586d3561b27e37ef19dddcfdb','1','1','app','[]','0','2018-06-17 10:52:53','2018-06-17 10:52:53','2019-06-17 10:52:53'), ('9c051c90fe9271d669a83aff4340e442069ea141b319c823d3322c3393e1f8474d7ab8530f3862c9','1','1','app','[]','0','2018-06-30 01:03:26','2018-06-30 01:03:26','2019-06-30 01:03:26'), ('9c161aa183d1fb322da548507f8f0bdd3ea0f6e084f206bbc56e2e231068620c3ea815c1f102a03a','1','1','app','[]','0','2018-06-29 13:01:37','2018-06-29 13:01:37','2019-06-29 13:01:37'), ('9f6b4af657c72567c7193fb6b663b1c3813db6c16ba6e98da237c558098e41319e07f0509d3a8111','1','1','app','[]','0','2018-06-17 11:05:04','2018-06-17 11:05:04','2019-06-17 11:05:04'), ('a0093404719fb5801dff51bf0b419e7149d4e261360a15e950892fd534a30c7ffc250796cf6ae090','1','1','app','[]','0','2018-06-30 01:06:11','2018-06-30 01:06:11','2019-06-30 01:06:11'), ('a457d27d432761dde68b0211b84b2264fc3efedd788255957294ce2c653dd14bdd4aba1a0e360c06','1','1','app','[]','0','2018-06-27 09:38:16','2018-06-27 09:38:16','2019-06-27 09:38:16'), ('a57c47536cb522e2897c69f5b1a99dae8a31b31d6607106fb00d0e126161a530444d2796a9ebad1d','1','1','app','[]','0','2018-06-19 09:56:29','2018-06-19 09:56:29','2019-06-19 09:56:29'), ('a631bda19ddb5021677d624233eb43d54ee2ab57148f68275a87e0845038d3a538fda6996e6b1a10','1','1','app','[]','0','2018-06-30 01:07:39','2018-06-30 01:07:39','2019-06-30 01:07:39'), ('a8bc98af00eb85e52b03d13b1fbb5113e630bb948b9475f8149c1b881e0162b371dfebb6a68f51fa','1','1','app','[]','0','2018-06-27 09:56:13','2018-06-27 09:56:13','2019-06-27 09:56:13'), ('ace30b772c056a5eb2f4669e0d7525667f0a0c2ae17fb65e9a55b5550a56a4b6ac348a6bd04de4f2','1','1','app','[]','0','2018-06-13 11:56:55','2018-06-13 11:56:55','2019-06-13 11:56:55'), ('b1d522ec8ad0e7ab42f759305ea66ed7eb171e15381ed6be6a575a1ecca71e5b9245f8f576806cfc','1','1','app','[]','0','2018-06-17 11:09:43','2018-06-17 11:09:43','2019-06-17 11:09:43'), ('b22f5582ada91e697ee0eb9c74701fd9541744d764f9ce00121863b34f62b1e84dfafda1366afe14','1','1','app','[]','0','2018-06-17 11:41:07','2018-06-17 11:41:07','2019-06-17 11:41:07'), ('b3e1ceb1a6cd8c4eddbc4e013068845a99237f69a40e858ab86694695894f42b5a48ce981f610bd3','1','1','app','[]','0','2018-06-17 11:18:39','2018-06-17 11:18:39','2019-06-17 11:18:39'), ('b7760c3e7fe7bffa0ebde978f55030805d2219c52b4ae44e350c0fbd34cff5227a2613cbe5af118b','1','1','app','[]','0','2018-06-17 11:52:04','2018-06-17 11:52:04','2019-06-17 11:52:04'), ('b90b4d41770016786b97eec384897e447a7a2d734d428d2a338c602d7bd8c02dfa610473fe37ae34','1','1','app','[]','0','2018-06-13 12:09:53','2018-06-13 12:09:53','2019-06-13 12:09:53'), ('b973709b69e5652d3527f503c6ef9255cd756bb755be5240870eaf12cc7739ca93dd7428547eb38e','1','1','app','[]','0','2018-06-27 11:01:40','2018-06-27 11:01:40','2019-06-27 11:01:40'), ('bb02264ad576458d8a058e2bbd83f6231bfcfbe5b5d9ed1a7904ce6a56cf0d1c16cc8dd71b2f98e3','1','1','app','[]','0','2018-06-30 01:11:09','2018-06-30 01:11:09','2019-06-30 01:11:09'), ('bb8dbb2eea5ccbf7838ae55ef6ab9e70b03c64b2db6347bce7e162469588fcca3408bdafcd39b487','1','1','app','[]','0','2018-06-17 09:41:58','2018-06-17 09:41:58','2019-06-17 09:41:58'), ('c64cac1d8587c1ea3ff0a59ef3b4b899976ab9b6a838493a7ef865696c99f63e7defaf98e8434c76','1','1','app','[]','0','2018-06-27 09:39:01','2018-06-27 09:39:01','2019-06-27 09:39:01'), ('c6640c526140718956e7b6ad6ec86a29f49c3ecdf683f86142e76b29437994663e9a0f24e641133e','1','1','app','[]','0','2018-06-17 11:50:10','2018-06-17 11:50:10','2019-06-17 11:50:10'), ('caa2e1474faccbe37bc414754963ef735d2a09b3d561f69bb17d0cb64c049243ddc7767d922dd84c','1','1','app','[]','0','2018-06-17 11:38:56','2018-06-17 11:38:56','2019-06-17 11:38:56'), ('cea9addc5ee0504b7223e4b602405c44376d1883d5ccd6492f44e20187e60c2ffda58811460dad10','1','1','app','[]','0','2018-06-27 09:43:03','2018-06-27 09:43:03','2019-06-27 09:43:03'), ('cfabf9d2733bc6a52d04c15d7eb1b84e2ace7ebd9bfcd23ebcd25ebc7d1c835dc3b70aee4a395a6a','1','1','app','[]','0','2018-06-27 10:06:08','2018-06-27 10:06:08','2019-06-27 10:06:08'), ('d20d51f8dd2ff3fa17450525358d84f5137fcf17a7c6dc2c2633e3034bfc22b6a396f4a374473186','1','1','app','[]','0','2018-06-29 13:00:51','2018-06-29 13:00:51','2019-06-29 13:00:51'), ('d6f5846700511aac43f378a12ff4660cf5f47cec1eb721f5ed94c4d86f15ba62aa789be21e6bae21','1','1','app','[]','0','2018-06-17 11:07:49','2018-06-17 11:07:49','2019-06-17 11:07:49'), ('d7b634bc1adf6639b7b5a4ee8b4a4f18b9e50c2fedee07e86f61baa12edd4f64b5cdc295fb50dbd4','1','1','app','[]','0','2018-06-29 12:51:10','2018-06-29 12:51:10','2019-06-29 12:51:10'), ('dd38af5cdcd17f885354c9c68e4e0013a9ec98a24c58884669544e84fc79a54f669bacc14bc7f0ca','1','1','app','[]','0','2018-06-19 09:59:04','2018-06-19 09:59:04','2019-06-19 09:59:04'), ('de0b4ad6ba886cd35a80b4f462e3783053cc574e3f4ad4a1dd1d96891280eb96ac8c0e911a55813c','1','1','app','[]','0','2018-06-17 09:46:19','2018-06-17 09:46:19','2019-06-17 09:46:19'), ('e0a37c97002997522b1b0acfc51783947ab486dcac11ffe1249f3c234b01d4071b6e07b5a5207871','1','1','app','[]','0','2018-06-27 10:06:49','2018-06-27 10:06:49','2019-06-27 10:06:49'), ('e0a69ee80e2648dd7ccbcdfa088c585ac3d7397060f8f036d21acd8e5348aedd13604c1ab9958f7a','1','1','app','[]','0','2018-06-19 09:56:45','2018-06-19 09:56:45','2019-06-19 09:56:45'), ('e0fe54588326ccec0b297f97d9a1b3878511839e876f6f719106ce4ebc09cc3a903d3f82ce98b10e','1','1','app','[]','0','2018-06-27 10:06:28','2018-06-27 10:06:28','2019-06-27 10:06:28'), ('e443bf28dde7bf443be2f1cb5627335a452f34dbabe9cfb70bccfeda7bc8e0d7ee5317e79fcdb924','1','1','app','[]','0','2018-06-27 09:41:53','2018-06-27 09:41:53','2019-06-27 09:41:53'), ('e60de0a82c0815a646ab05336b2851a6ac5ffca5408b79dc9520b8b623d9f40de43a538e1f1053e0','1','1','app','[]','0','2018-06-19 09:11:53','2018-06-19 09:11:53','2019-06-19 09:11:53'), ('e8d724dd7f93f503a27a65f03a77766fdc925156758785445dc941859aacb63f9c9de59e0fcafb4e','1','1','app','[]','0','2018-06-27 10:05:24','2018-06-27 10:05:24','2019-06-27 10:05:24'), ('e9103cd64e307e5c64a6351a09571d986f03054548f3b25468b5a79aca2246e87726cb5758dbc0a1','1','1','app','[]','0','2018-06-27 09:18:04','2018-06-27 09:18:04','2019-06-27 09:18:04'), ('e9154dd792bc2fb1b87d261b43bb7427a9a8a8cc5ab8959d5adf15f82c519759c8fa8e0947779568','1','1','app','[]','0','2018-06-17 11:18:24','2018-06-17 11:18:24','2019-06-17 11:18:24'), ('e9a08b747249156864a7035ada4c3524c93c532e93359fedde9cf4de37072b0f2bf1b33042cac586','1','1','app','[]','0','2018-06-30 01:10:37','2018-06-30 01:10:37','2019-06-30 01:10:37'), ('e9e41057de737d81dc136cab184aed574c3f8b18c63b9e6ab70d57fd13a07b5951b737833983e6ab','1','1','app','[]','0','2018-06-27 09:36:45','2018-06-27 09:36:45','2019-06-27 09:36:45'), ('ed138168055b8a26451dbc66f2dae512bc5adc4af1e8016da9a9891a7ea053d48444f6c25f73c9b6','1','1','app','[]','0','2018-06-13 11:55:51','2018-06-13 11:55:51','2019-06-13 11:55:51'), ('efb3db9dda931332080967f12e8daea4c21e8b08e408dfcef40de8da0152f14137ebe736d58b0a96','1','1','app','[]','0','2018-06-13 12:09:15','2018-06-13 12:09:15','2019-06-13 12:09:15'), ('f238ccd2d3a474c083599eb9433fbe40d440012b34178756abe9c41a81131ece07ff6d06007fb813','1','1','app','[]','0','2018-06-27 09:42:03','2018-06-27 09:42:03','2019-06-27 09:42:03'), ('f6255fbc29bd082fa0a7d56e4d28128553b05ddb975a51947cf43c23fb92d1ab6d05a76595451f2e','1','1','app','[]','0','2018-06-30 01:14:47','2018-06-30 01:14:47','2019-06-30 01:14:47'), ('f6d6956a8c877f925dac8ab9dc1e9295b6f2b89a469e6bc7e94a8d0a917eb401e0b871adde73f2ec','1','1','app','[]','0','2018-06-17 11:29:23','2018-06-17 11:29:23','2019-06-17 11:29:23'), ('f77c737d274560d33d8c85d7df26edd2827426e90636305ccb67d31b6b4304e45a3d0a7dafdab7c7','1','1','app','[]','0','2018-06-27 09:37:21','2018-06-27 09:37:21','2019-06-27 09:37:21'), ('fe07929485f77def7fad5cd28be83d6f8edfaff4b0dceb7f1699dcb09c96562e62c73e37de53dcad','1','1','app','[]','0','2018-06-19 09:49:00','2018-06-19 09:49:00','2019-06-19 09:49:00');
INSERT INTO `oauth_clients` VALUES ('1',NULL,'Laravel Personal Access Client','ir0b8IXvtQPYTpvK9YxWowyYviX6tmBhzsutsDRn','http://localhost','1','0','0','2018-06-08 13:33:20','2018-06-08 13:33:20'), ('2',NULL,'Laravel Password Grant Client','y68yuqY2JF4eMt1KeDLwLfVVjvKlnRvjruD8HjOF','http://localhost','0','1','0','2018-06-08 13:33:20','2018-06-08 13:33:20');
INSERT INTO `oauth_personal_access_clients` VALUES ('1','1','2018-06-08 13:33:20','2018-06-08 13:33:20');
INSERT INTO `roles` VALUES ('1','ADMIN','Administrator','2018-06-13 19:41:27',NULL), ('2','EMPLY','Employee','2018-06-29 19:43:54',NULL);
INSERT INTO `users` VALUES ('1','Administrator','admin@mail.com','$2y$10$PG4pUzLjJBf9zRQv.ebcU.GEjQWXV6LUSqK0Qc7E8f.jYS3qVtlsS',NULL,'2018-06-12 10:18:44','2018-06-12 10:18:44','ADMIN',NULL), ('2','Employee 1','emp1@mail.com','$2y$10$1En92vBZB1qzSYr.8qd4Le1VnpPokQLTbmdGPJs0b7.qIvkL3Ta4W',NULL,'2018-06-30 01:36:24','2018-06-30 01:52:57','EMPLY',NULL), ('3','Employee 2','emp2@mail.com','$2y$10$idVrEH93ro.XnmHfn5x6e.SR5SVI9RZzQjDKJur20BRbnyN1xMZ3e',NULL,'2018-06-30 01:52:20','2018-06-30 01:52:20','EMPLY',NULL), ('4','Employee 3','emp3@mail.com','$2y$10$mFYASVvSKv./O08QNpGjseVk0nfW0ejoBsRhGOodL2M5ar2DAZkRm',NULL,'2018-06-30 01:53:27','2018-06-30 01:53:27','EMPLY',NULL), ('5','Administrator 2','admin2@mail.com','$2y$10$7rqodP/qjHkoq1yoCeIfbOAleiQYyOo5pLMVUWqnnoAWhXGyipaz.',NULL,'2018-06-30 01:55:42','2018-06-30 01:55:42','ADMIN',NULL);
