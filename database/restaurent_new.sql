-- -------------------------------------------------------------
-- TablePlus 5.3.6(496)
--
-- https://tableplus.com/
--
-- Database: restaurent
-- Generation Time: 2023-05-28 21:23:54.9140
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `blogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0 => menu, 1 => blog',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `galleries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0 => photo, 1 => video',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `generals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `story_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `story_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `why_choose_us` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `primary_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secondary_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_fee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `menu_order_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `menu_orders_id` bigint(20) unsigned NOT NULL,
  `menus_id` bigint(20) unsigned NOT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `menu_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tables_id` bigint(20) unsigned NOT NULL,
  `price_total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1 => Belum Diproses, 2 => Sudah Diproses, 3 Dibayar, 4 Selesai, 5 Cancel',
  `status` int(11) DEFAULT NULL COMMENT '1 => Belum Diproses, 2 => Sudah Diproses, 3 Dibayar, 4 Selesai, 5 Cancel',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `order_metas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` int(11) NOT NULL COMMENT '1 => cash on delivery, 2 => paypal, 3 => card',
  `payment_status` int(11) NOT NULL COMMENT '0 => due, 1 => paid',
  `order_status` int(11) NOT NULL COMMENT '0 => pending, 1 => completed, 2 => canceled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `reserves` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `people` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sliders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `staff` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('available','unavailable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blogs` (`id`, `category_id`, `title`, `thumbnail`, `description`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 3, 'Taste the best food in town', 'uploads/blog/20221202105425.jpg', '<p>Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>', 1, 1, '2022-12-02 11:54:26', '2022-12-02 11:54:26'),
(3, 7, 'Benefits of Dry Food', 'uploads/blog/20221202105534.jpg', '<p>At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>', 1, 1, '2022-12-02 11:55:34', '2022-12-02 11:55:34'),
(4, 8, 'Why do we need fruits for good health', 'uploads/blog/20221202105622.jpg', '<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>', 1, 1, '2022-12-02 11:56:22', '2022-12-02 11:56:22'),
(5, 9, 'Characteristics of healthy food', 'uploads/blog/20221202105714.jpg', '<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>', 1, 1, '2022-12-02 11:57:14', '2022-12-02 11:57:14'),
(6, 3, 'Chicken Fry recipe', 'uploads/blog/20221202105755.jpg', '<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>', 1, 1, '2022-12-02 11:57:55', '2022-12-02 11:57:55'),
(7, 3, 'This is a demo blog title', 'uploads/blog/20221204084900.jpg', '<p>At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>', 1, 1, '2022-12-04 09:49:00', '2022-12-04 09:49:00');

INSERT INTO `categories` (`id`, `name`, `thumbnail`, `type`, `created_at`, `updated_at`) VALUES
(2, 'Ice Cream', '/uploads/category/20221001081354.jpg', 0, '2022-10-01 09:13:54', '2022-10-01 09:13:54'),
(3, 'Italian', '/uploads/category/20221003043012.jpg', 1, '2022-10-01 09:21:07', '2022-10-03 05:30:12'),
(4, 'Snacks', '', 0, '2022-11-05 13:42:00', '2022-11-05 13:42:00'),
(5, 'Chicken', '', 0, '2022-11-05 13:42:50', '2022-11-05 13:42:50'),
(6, 'Chocolate', '', 0, '2022-11-05 13:43:01', '2022-11-05 13:43:01'),
(7, 'Dry food', '', 1, '2022-12-02 11:50:20', '2022-12-02 11:50:20'),
(8, 'Fruits', '', 1, '2022-12-02 11:50:42', '2022-12-02 11:50:42'),
(9, 'Healthy Food', '', 1, '2022-12-02 11:51:16', '2022-12-02 11:51:16');

INSERT INTO `galleries` (`id`, `caption`, `thumbnail`, `video_link`, `type`, `created_at`, `updated_at`) VALUES
(2, 'Pizza Video', 'uploads/gallery/20221008140822.jpg', 'https://www.youtube.com/embed/dA0VGEbbw4g', 1, '2022-10-08 09:01:44', '2022-12-01 19:48:59'),
(3, 'Demo photo', 'uploads/gallery/20221201183353.jpg', '', 0, '2022-12-01 19:33:53', '2022-12-01 19:33:53'),
(4, 'Demo photo', 'uploads/gallery/20221201183419.jpg', '', 0, '2022-12-01 19:34:20', '2022-12-01 19:34:20'),
(5, 'Demo photo', 'uploads/gallery/20221201183435.jpg', '', 0, '2022-12-01 19:34:35', '2022-12-01 19:34:35'),
(6, 'Demo photo', 'uploads/gallery/20221201183454.jpg', '', 0, '2022-12-01 19:34:54', '2022-12-01 19:34:54'),
(7, 'Demo photo', 'uploads/gallery/20221201183513.jpg', '', 0, '2022-12-01 19:35:13', '2022-12-01 19:35:13'),
(8, 'Demo photo', 'uploads/gallery/20221201183529.jpg', '', 0, '2022-12-01 19:35:29', '2022-12-01 19:35:29'),
(9, 'Demo Video', 'uploads/gallery/20221201183615.jpg', 'https://www.youtube.com/embed/dA0VGEbbw4g', 1, '2022-12-01 19:36:15', '2022-12-01 19:49:49'),
(10, 'Demo Video', 'uploads/gallery/20221201183635.jpg', 'https://www.youtube.com/embed/dA0VGEbbw4g', 1, '2022-12-01 19:36:35', '2022-12-01 19:49:57'),
(11, 'Demo Video', 'uploads/gallery/20221201183656.jpg', 'https://www.youtube.com/embed/dA0VGEbbw4g', 1, '2022-12-01 19:36:56', '2022-12-01 19:50:08'),
(12, 'Demo Video', 'uploads/gallery/20221201183716.jpg', 'https://www.youtube.com/embed/dA0VGEbbw4g', 1, '2022-12-01 19:37:16', '2022-12-01 19:50:17');

INSERT INTO `generals` (`id`, `company_name`, `logo`, `story_title`, `story_description`, `why_choose_us`, `address`, `primary_phone`, `secondary_phone`, `email`, `facebook`, `twitter`, `instagram`, `delivery_fee`, `created_at`, `updated_at`) VALUES
(1, 'Hot Food', 'uploads/logo/20221211174521.png', 'Demo title', '<p>At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>', '<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. </p>', 'Road 57, New York City, USA<br>', '0177223344556', '0177223344557', 'hot@food.com', 'https://www.facebook.com/', 'https://www.twitter.com/', 'https://www.instagram.com/', '12', '2022-12-11 18:45:22', '2022-12-11 19:43:44');

INSERT INTO `menu_order_details` (`id`, `menu_orders_id`, `menus_id`, `qty`, `price_total`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '110000', '10000000', '2023-05-28 10:33:12', '2023-05-28 10:33:12'),
(2, 2, 3, '5', '10000000', '2023-05-28 10:38:13', '2023-05-28 10:38:13'),
(3, 3, 5, '6', '18', '2023-05-28 12:24:32', '2023-05-28 12:24:32'),
(4, 4, 3, '1', '10000000', '2023-05-28 13:41:01', '2023-05-28 13:41:01'),
(5, 4, 5, '2', '18', '2023-05-28 13:41:01', '2023-05-28 13:41:01'),
(6, 4, 9, '2', '15000000', '2023-05-28 13:41:01', '2023-05-28 13:41:01');

INSERT INTO `menu_orders` (`id`, `tables_id`, `price_total`, `payment_method`, `qty_total`, `order_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, '1100000000000', 'Kredit', '110000', NULL, 1, '2023-05-28 10:33:12', '2023-05-28 12:22:27'),
(2, 2, '50000000', 'Debit', '5', NULL, 2, '2023-05-28 10:38:13', '2023-05-28 12:22:22'),
(3, 2, '108', 'Cash', '6', NULL, 1, '2023-05-28 12:24:32', '2023-05-28 13:38:56'),
(4, 2, '40000036', 'Cash', '5', 'ORD16852812616043', 3, '2023-05-28 13:41:01', '2023-05-28 13:50:38');

INSERT INTO `menus` (`id`, `category_id`, `title`, `thumbnail`, `description`, `price`, `status`, `created_at`, `updated_at`) VALUES
(3, 6, 'Chocolate milk shake', 'uploads/menu/20221105124355.jpg', '<p>At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>\"', '10000000', 1, '2022-11-05 13:43:55', '2023-05-27 15:23:08'),
(4, 2, 'Vanilla Ice Cream', 'uploads/menu/20221105124429.jpg', '<p>Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>', '12', 1, '2022-11-05 13:44:29', '2022-11-05 13:44:29'),
(5, 2, 'Chicken Burger', 'uploads/menu/20221105124502.jpg', '<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>', '18', 1, '2022-11-05 13:45:02', '2022-11-05 13:45:02'),
(6, 4, 'French Fries', 'uploads/menu/20221105124541.jpg', '<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>', '10', 1, '2022-11-05 13:45:41', '2022-11-05 13:45:41'),
(7, 5, 'Chicken Fry', 'uploads/menu/20221105124633.jpg', '<p>Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>', '18', 1, '2022-11-05 13:46:33', '2022-11-05 13:46:33'),
(8, 5, 'Chicken Curry', 'uploads/menu/20221105124742.jpg', '<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>', '15', 1, '2022-11-05 13:47:42', '2022-11-05 13:47:42'),
(9, 4, 'Steak', 'uploads/menu/20221105124823.jpg', '<p>Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>\"', '15000000', 1, '2022-11-05 13:48:23', '2023-05-27 15:23:39');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_09_30_111432_create_permission_tables', 1),
(6, '2022_10_01_055307_create_categories_table', 1),
(7, '2022_10_03_043825_create_menus_table', 2),
(8, '2022_10_03_153305_create_blogs_table', 3),
(9, '2022_10_04_080110_create_galleries_table', 4),
(10, '2022_10_30_130829_create_sliders_table', 5),
(11, '2022_11_18_165045_create_reserves_table', 6),
(12, '2022_12_11_082612_create_services_table', 7),
(13, '2022_12_11_162625_create_staff_table', 8),
(14, '2022_12_11_165033_create_generals_table', 9),
(15, '2022_12_17_220039_create_carts_table', 10),
(16, '2022_12_18_134440_create_orders_table', 11),
(17, '2022_12_18_135134_create_order_metas_table', 11),
(20, '2023_05_28_034248_create_tables_table', 12),
(21, '2023_05_28_100307_create_menu_orders_table', 13),
(22, '2023_05_28_100344_create_menu_order_details_table', 13);

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 5);

INSERT INTO `order_metas` (`id`, `order_id`, `menu_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(2, 2, 4, '2', '12', '2022-12-19 01:16:01', '2022-12-19 01:16:01'),
(6, 4, 8, '2', '15', '2022-12-20 07:15:01', '2022-12-20 07:15:01'),
(7, 4, 4, '1', '12', '2022-12-20 07:15:01', '2022-12-20 07:15:01'),
(8, 5, 3, '1', '10', '2022-12-20 07:25:22', '2022-12-20 07:25:22'),
(21, 17, 8, '1', '15', '2022-12-21 03:36:57', '2022-12-21 03:36:57'),
(22, 17, 9, '1', '150', '2022-12-21 03:36:57', '2022-12-21 03:36:57'),
(23, 18, 9, '1', '150', '2022-12-21 11:13:16', '2022-12-21 11:13:16'),
(24, 19, 9, '2', '150', '2022-12-21 16:14:42', '2022-12-21 16:14:42'),
(25, 19, 5, '3', '18', '2022-12-21 16:14:42', '2022-12-21 16:14:42');

INSERT INTO `orders` (`id`, `user_id`, `name`, `email`, `phone`, `address`, `city`, `postal_code`, `total`, `payment_method`, `payment_status`, `order_status`, `created_at`, `updated_at`) VALUES
(2, 2, 'David', 'david@gmail.com', '01711223344', 'road 28', 'New york city', '1230', '36', 1, 0, 1, '2022-12-19 01:16:01', '2023-05-28 03:29:11'),
(5, 2, 'David', 'david@gmail.com', '01711223344', 'New york city', 'New york city', '1230', '22', 3, 1, 0, '2022-12-20 07:25:18', '2022-12-20 07:25:22'),
(17, 3, 'Mickel', 'mick@gmail.com', '01711223343', 'road 28', 'New york city', '1230', '177', 2, 1, 1, '2022-12-21 03:36:57', '2022-12-21 10:36:15'),
(18, 3, 'Mickel', 'mick@gmail.com', '01711223343', 'road 28', 'New york city', '1230', '162', 3, 1, 0, '2022-12-21 11:13:16', '2022-12-21 11:13:20'),
(19, 4, 'Arthur', 'arthur@gmail.com', '01711223343', 'road 28', 'New york city', '1230', '366', 3, 1, 0, '2022-12-21 16:14:42', '2022-12-21 16:14:46');

INSERT INTO `reserves` (`id`, `date`, `time`, `people`, `name`, `email`, `phone`, `description`, `status`, `created_at`, `updated_at`) VALUES
(4, '12/22/2022', '12.30pm', '3', 'John', 'john@gmail.com', '01711223343', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.', 1, '2022-12-21 16:10:53', '2023-05-28 03:29:03');

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2022-10-01 09:11:52', '2022-10-01 09:11:52'),
(2, 'user', 'web', '2022-10-01 09:11:52', '2022-10-01 09:11:52');

INSERT INTO `services` (`id`, `title`, `thumbnail`, `description`, `created_at`, `updated_at`) VALUES
(2, 'Test service', 'uploads/service/20221221035015.jpg', '<p>At vero eos et accusam et justo duo dolores et ea rebum. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. </p>', '2022-12-21 13:50:15', '2022-12-21 13:50:15');

INSERT INTO `sliders` (`id`, `title`, `sub_title`, `thumbnail`, `created_at`, `updated_at`) VALUES
(2, 'Taste the best food in town', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt', 'uploads/slider/20221104104512.jpg', '2022-11-04 11:45:13', '2022-11-04 11:45:13'),
(3, 'We offer a variety of food', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt', 'uploads/slider/20221104104617.jpg', '2022-11-04 11:46:17', '2022-11-04 11:46:17'),
(4, 'We focus on the quality', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt', 'uploads/slider/20221104104745.jpg', '2022-11-04 11:47:46', '2022-11-04 11:47:46');

INSERT INTO `staff` (`id`, `name`, `designation`, `thumbnail`, `created_at`, `updated_at`) VALUES
(2, 'Scarlet White', 'Main chef', 'uploads/staffs/20221221035107.jpg', '2022-12-21 13:51:07', '2022-12-21 13:51:07'),
(3, 'Daniel', 'Manager', 'uploads/staffs/20221221035204.jpg', '2022-12-21 13:52:04', '2022-12-21 13:52:04');

INSERT INTO `tables` (`id`, `name`, `barcode`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Table 01', 'TBL16852501609057Table01', 'unavailable', '2023-05-28 05:02:40', '2023-05-28 12:13:52');

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'doe@gmail.com', NULL, '$2y$10$15OMzF6sdoHU736ltxysBuaPQFA45WnkqWD2.Kr1YWat65nNba6YG', NULL, '2022-10-01 09:11:52', '2022-10-01 09:11:52'),
(2, 'David Mold', 'david@gmail.com', NULL, '$2y$10$AWb/FmeQaDL6.l5oG0qVSur79996O9gq/rGgi19igKK3m1.jguG0G', NULL, '2022-10-01 09:11:52', '2022-10-01 09:11:52'),
(3, 'Mickel', 'mick@gmail.com', NULL, '$2y$10$tJpfl8kKbHjYTlFEEKRpYOcGG/8Mw5AMGWaiDu8A4GXBvqdgdE7ve', NULL, '2022-11-04 11:58:50', '2022-11-04 11:58:50'),
(4, 'Arthur', 'arthur@gmail.com', NULL, '$2y$10$aUYES1DtirMHQSodVOgB1ejtYnOaisx9Nno/RvBy9x9sp1jkmjGeu', NULL, '2022-12-21 16:08:47', '2022-12-21 16:08:47'),
(5, 'Reihan', 'admin@gmail.com', NULL, '$2y$10$0JkQFYiNl8HdYNJvBFoO/eaTZ7vnwfM6Ux7UpfTMiLg3x/tqG9MfC', NULL, '2023-05-27 15:12:08', '2023-05-27 15:12:08');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;