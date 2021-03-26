-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 13, 2021 at 10:52 PM
-- Server version: 5.6.49-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(191) NOT NULL DEFAULT '0',
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_name` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `role_id`, `photo`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `shop_name`) VALUES
(1, 'Admin', 'admin@gmail.com', '4124034100', 0, '1556780563user.png', '$2y$10$p35S2FczpEfpbe41CX4j4.XE548tHBtF5weGLPxZ56MX5dsOFtaCC', 1, 'M6UCO4tok3xaUSKuCm5l4UqJg7TdIeYdNqv9s1BWeaex1IiPnhVnLU1FTXio', '2018-02-28 23:27:08', '2021-03-09 22:34:22', 'OG.Life');

-- --------------------------------------------------------

--
-- Table structure for table `admin_languages`
--

CREATE TABLE `admin_languages` (
  `id` int(191) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_languages`
--

INSERT INTO `admin_languages` (`id`, `is_default`, `language`, `file`, `name`, `rtl`) VALUES
(1, 1, 'English', '1567232745AoOcvCtY.json', '1567232745AoOcvCtY', 0);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_conversations`
--

CREATE TABLE `admin_user_conversations` (
  `id` int(191) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('Ticket','Dispute') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_user_conversations`
--

INSERT INTO `admin_user_conversations` (`id`, `subject`, `user_id`, `message`, `created_at`, `updated_at`, `type`, `order_number`) VALUES
(2, 'test message', 68, 'test from og.life', '2021-02-15 22:58:08', '2021-02-15 22:58:08', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_messages`
--

CREATE TABLE `admin_user_messages` (
  `id` int(191) NOT NULL,
  `conversation_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_user_messages`
--

INSERT INTO `admin_user_messages` (`id`, `conversation_id`, `message`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 2, 'test from og.life', NULL, '2021-02-15 22:58:08', '2021-02-15 22:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `advertising_plans`
--

CREATE TABLE `advertising_plans` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `price` float NOT NULL,
  `product_count` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `advertising_plans`
--

INSERT INTO `advertising_plans` (`id`, `category_id`, `view_count`, `price`, `product_count`, `name`) VALUES
(1, 0, 1000, 100, 6, 'Hot Ad'),
(3, 15, 1000, 100, 8, 'Accessories Ad Plan'),
(5, 16, 1000, 100, 8, 'Concentrates Ad Plan'),
(7, 17, 1000, 100, 8, 'Flower Ad Plan'),
(9, 18, 1000, 100, 8, 'Genetics Ad Plan'),
(11, 20, 1000, 100, 8, 'Equipment Ad Plan'),
(13, 21, 1000, 100, 8, 'Edibles Ad Plan');

-- --------------------------------------------------------

--
-- Table structure for table `advertising_products`
--

CREATE TABLE `advertising_products` (
  `id` int(11) UNSIGNED NOT NULL,
  `adplan_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `viewed_count` int(11) NOT NULL DEFAULT '0',
  `vendor_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `advertising_products`
--

INSERT INTO `advertising_products` (`id`, `adplan_id`, `product_id`, `category_id`, `viewed_count`, `vendor_id`, `created_at`) VALUES
(6, 1, 270, 0, 1000, 68, '2021-03-08 15:37:32'),
(7, 1, 237, 0, 1000, 68, '2021-03-08 15:55:52'),
(8, 1, 220, 0, 1000, 68, '2021-03-08 15:56:02'),
(12, 1, 279, 0, 1000, 68, '2021-03-08 21:26:07'),
(13, 1, 276, 0, 1000, 68, '2021-03-08 21:26:15'),
(14, 1, 289, 0, 1000, 68, '2021-03-09 02:17:47');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `attributable_id` int(11) DEFAULT NULL,
  `attributable_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `input_name` varchar(255) DEFAULT NULL,
  `price_status` int(3) NOT NULL DEFAULT '1' COMMENT '0 - hide, 1- show	',
  `details_status` int(3) NOT NULL DEFAULT '1' COMMENT '0 - hide, 1- show	',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `attributable_id`, `attributable_type`, `name`, `input_name`, `price_status`, `details_status`, `created_at`, `updated_at`) VALUES
(36, 9, 'App\\Models\\Childcategory', 'Volume', 'volume', 1, 1, '2021-02-01 12:29:32', '2021-02-01 12:29:32'),
(37, 17, 'App\\Models\\Category', 'Weight', 'weight', 1, 1, '2021-02-01 12:31:33', '2021-02-01 12:31:33'),
(39, 12, 'App\\Models\\Subcategory', 'Weight', 'weight', 1, 1, '2021-02-01 12:33:36', '2021-02-01 12:33:36'),
(40, 12, 'App\\Models\\Subcategory', 'Volume', 'volume', 1, 1, '2021-02-01 12:34:33', '2021-02-01 12:34:33'),
(41, 11, 'App\\Models\\Subcategory', 'Weight', 'weight', 1, 1, '2021-02-01 12:35:28', '2021-02-01 12:35:28'),
(42, 10, 'App\\Models\\Subcategory', 'Weight', 'weight', 1, 1, '2021-02-01 12:38:54', '2021-02-01 12:38:54'),
(43, 9, 'App\\Models\\Subcategory', 'Weight', 'weight', 1, 1, '2021-02-01 12:39:28', '2021-02-01 12:39:28'),
(45, 8, 'App\\Models\\Subcategory', 'Volume', 'volume', 1, 1, '2021-02-01 12:40:49', '2021-02-01 12:40:49'),
(46, 4, 'App\\Models\\Subcategory', 'Volume', 'volume', 1, 1, '2021-02-01 12:52:27', '2021-02-01 12:52:27'),
(47, 23, 'App\\Models\\Subcategory', 'Select Color', 'select_color', 1, 1, '2021-02-01 13:17:33', '2021-02-01 13:17:33');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_options`
--

CREATE TABLE `attribute_options` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attribute_options`
--

INSERT INTO `attribute_options` (`id`, `attribute_id`, `name`, `created_at`, `updated_at`) VALUES
(263, 36, '1ml', '2021-02-01 12:29:32', '2021-02-01 12:29:32'),
(264, 36, '.5ml', '2021-02-01 12:29:32', '2021-02-01 12:29:32'),
(265, 37, '1g', '2021-02-01 12:31:33', '2021-02-01 12:31:33'),
(266, 37, '3.5g', '2021-02-01 12:31:33', '2021-02-01 12:31:33'),
(267, 37, '7g', '2021-02-01 12:31:33', '2021-02-01 12:31:33'),
(268, 37, '1g', '2021-02-01 12:31:33', '2021-02-01 12:31:33'),
(269, 37, '28g', '2021-02-01 12:31:33', '2021-02-01 12:31:33'),
(270, 37, '1 pound', '2021-02-01 12:31:33', '2021-02-01 12:31:33'),
(277, 39, '1g', '2021-02-01 12:33:36', '2021-02-01 12:33:36'),
(278, 39, '3.5g', '2021-02-01 12:33:36', '2021-02-01 12:33:36'),
(279, 39, '7g', '2021-02-01 12:33:36', '2021-02-01 12:33:36'),
(280, 39, '14g', '2021-02-01 12:33:36', '2021-02-01 12:33:36'),
(281, 39, '28g', '2021-02-01 12:33:36', '2021-02-01 12:33:36'),
(282, 39, '1 pound', '2021-02-01 12:33:36', '2021-02-01 12:33:36'),
(283, 40, '.5ml', '2021-02-01 12:34:33', '2021-02-01 12:34:33'),
(284, 40, '1ml', '2021-02-01 12:34:33', '2021-02-01 12:34:33'),
(285, 40, '1 liter', '2021-02-01 12:34:33', '2021-02-01 12:34:33'),
(286, 41, '1g', '2021-02-01 12:35:28', '2021-02-01 12:35:28'),
(287, 41, '3.5g', '2021-02-01 12:35:28', '2021-02-01 12:35:28'),
(288, 41, '7g', '2021-02-01 12:35:28', '2021-02-01 12:35:28'),
(289, 41, '14g', '2021-02-01 12:35:28', '2021-02-01 12:35:28'),
(290, 41, '28g', '2021-02-01 12:35:28', '2021-02-01 12:35:28'),
(291, 41, '1 pound', '2021-02-01 12:35:28', '2021-02-01 12:35:28'),
(292, 42, '1g', '2021-02-01 12:38:54', '2021-02-01 12:38:54'),
(293, 42, '3.5g', '2021-02-01 12:38:54', '2021-02-01 12:38:54'),
(294, 42, '7g', '2021-02-01 12:38:54', '2021-02-01 12:38:54'),
(295, 42, '14g', '2021-02-01 12:38:54', '2021-02-01 12:38:54'),
(296, 42, '28g', '2021-02-01 12:38:54', '2021-02-01 12:38:54'),
(297, 42, '1 pound', '2021-02-01 12:38:54', '2021-02-01 12:38:54'),
(298, 43, '1g', '2021-02-01 12:39:28', '2021-02-01 12:39:28'),
(299, 43, '3.5g', '2021-02-01 12:39:28', '2021-02-01 12:39:28'),
(300, 43, '7g', '2021-02-01 12:39:28', '2021-02-01 12:39:28'),
(301, 43, '14g', '2021-02-01 12:39:28', '2021-02-01 12:39:28'),
(302, 43, '28g', '2021-02-01 12:39:28', '2021-02-01 12:39:28'),
(303, 43, '1 pound', '2021-02-01 12:39:28', '2021-02-01 12:39:28'),
(305, 45, '1 liter', '2021-02-01 12:40:49', '2021-02-01 12:40:49'),
(306, 46, '.5ml', '2021-02-01 12:52:27', '2021-02-01 12:52:27'),
(307, 46, '1ml', '2021-02-01 12:52:27', '2021-02-01 12:52:27'),
(308, 47, 'black', '2021-02-01 13:17:33', '2021-02-01 13:17:33'),
(309, 47, 'White', '2021-02-01 13:17:33', '2021-02-01 13:17:33'),
(310, 47, 'Silver', '2021-02-01 13:17:33', '2021-02-01 13:17:33'),
(311, 47, 'Blue', '2021-02-01 13:17:33', '2021-02-01 13:17:33'),
(312, 47, 'Pink', '2021-02-01 13:17:33', '2021-02-01 13:17:33'),
(313, 47, 'Red', '2021-02-01 13:17:33', '2021-02-01 13:17:33'),
(314, 47, 'Purple', '2021-02-01 13:17:33', '2021-02-01 13:17:33'),
(315, 47, 'Yellow', '2021-02-01 13:17:33', '2021-02-01 13:17:33');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(191) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Large','TopSmall','BottomSmall') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `link`, `type`) VALUES
(2, '1568889146top1.jpg', NULL, 'TopSmall'),
(3, '1568889164bottom1.jpg', 'https://www.google.com/', 'Large'),
(4, '1564398600side-triple3.jpg', 'https://www.google.com/', 'BottomSmall'),
(5, '1564398579side-triple2.jpg', 'https://www.google.com/', 'BottomSmall'),
(6, '1564398571side-triple1.jpg', 'https://www.google.com/', 'BottomSmall');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(191) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `meta_tag` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `tags` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `title`, `details`, `photo`, `source`, `views`, `status`, `meta_tag`, `meta_description`, `tags`, `created_at`) VALUES
(9, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700986-min.jpg', 'www.geniusocean.com', 36, 1, 'b1,b2,b3', 'Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level.', 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-02-06 09:53:41'),
(10, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700902-min.jpg', 'www.geniusocean.com', 14, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-03-06 09:54:21'),
(12, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700821-min.jpg', 'www.geniusocean.com', 19, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-04-06 22:04:20'),
(13, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700676-min.jpg', 'www.geniusocean.com', 57, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-05-06 22:04:36'),
(14, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700595-min.jpg', 'www.geniusocean.com', 4, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-06-03 06:02:30'),
(15, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700464-min.jpg', 'www.geniusocean.com', 6, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-07-03 06:02:53'),
(16, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700383-min.jpg', 'www.geniusocean.com', 5, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14'),
(17, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700322-min.jpg', 'www.geniusocean.com', 50, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37'),
(18, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700251-min.jpg', 'www.geniusocean.com', 156, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59'),
(20, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542699136-min.jpg', 'www.geniusocean.com', 10, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14'),
(21, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542699045-min.jpg', 'www.geniusocean.com', 36, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37'),
(22, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698954-min.jpg', 'www.geniusocean.com', 70, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59'),
(23, 7, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698893-min.jpg', 'www.geniusocean.com', 5, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14'),
(24, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698832-min.jpg', 'www.geniusocean.com', 34, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37');
INSERT INTO `blogs` (`id`, `category_id`, `title`, `details`, `photo`, `source`, `views`, `status`, `meta_tag`, `meta_description`, `tags`, `created_at`) VALUES
(25, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15557542831-min.jpg', 'www.geniusocean.com', 40, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`) VALUES
(2, 'Oil & gas', 'oil-and-gas'),
(3, 'Manufacturing', 'manufacturing'),
(4, 'Chemical Research', 'chemical_research'),
(5, 'Agriculture', 'agriculture'),
(6, 'Mechanical', 'mechanical'),
(7, 'Entrepreneurs', 'entrepreneurs'),
(8, 'Technology', 'technology');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skip_license` tinyint(1) DEFAULT '0',
  `cod` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `photo`, `is_featured`, `image`, `skip_license`, `cod`) VALUES
(15, 'Accessories', 'accessories', 1, '1611870695accessories-icon-1.png', 1, '1611854492accessories-carts.jpg', 1, NULL),
(16, 'Concentrates', 'concentrates', 1, '1611870662concentrates-icon-1.png', 1, '1611853597concentrates.png', 0, NULL),
(17, 'Flower', 'flower', 1, '1611870641flower-icon-1.jpg', 1, '1611853221flower-buds.jpg', 0, NULL),
(18, 'Genetics', 'genetics', 1, '1611891160genetics-icon-1.png', 1, '1611891250Obama-Kush-Autoflowering-Feminized-Marijuana-Seeds..jpg', 0, NULL),
(20, 'Equipment', 'Equipment', 1, '1611848226icon-category-equipment.png', 1, '1611848226aeroponics-AeroFlo60.jpg', 1, NULL),
(21, 'Edibles', 'Edibles', 1, '1611870562edibles-icon-1.png', 1, '1611862863Cannabis-Edibles.jpg', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `childcategories`
--

CREATE TABLE `childcategories` (
  `id` int(191) NOT NULL,
  `subcategory_id` int(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cod` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `childcategories`
--

INSERT INTO `childcategories` (`id`, `subcategory_id`, `user_id`, `name`, `slug`, `status`, `cod`) VALUES
(5, 3, 0, 'Screens', 'pipe-screens', 1, NULL),
(6, 3, 0, 'Electric', 'electric-pipes', 1, NULL),
(7, 3, 0, 'Bongs', 'bongs', 1, NULL),
(8, 3, 0, 'Pipes', 'pipes', 1, NULL),
(9, 4, 0, 'Bulk Cartridges', 'bulk-cartridges', 1, NULL),
(10, 4, 0, 'Concentrate Vaporizers', 'concentrate-vaporizers', 1, NULL),
(11, 4, 0, 'Batteries', 'vape-batteries', 1, NULL),
(12, 4, 0, 'Vaporizers', 'vaporizers', 1, NULL),
(13, 5, 0, 'Propane', 'propane', 1, NULL),
(14, 5, 0, 'Torches', 'torches', 1, NULL),
(15, 5, 0, 'Buckets', 'buckets', 1, NULL),
(16, 5, 0, 'Dab Rigs', 'dab-rigs', 1, NULL),
(22, 15, 0, 'Fresh Cuts', 'Fresh-Cuts', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `colorsetting`
--

CREATE TABLE `colorsetting` (
  `id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `style_id` int(11) DEFAULT NULL,
  `title_color` varchar(110) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag_bg_color` varchar(110) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag_color` varchar(110) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail_color` varchar(110) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_detail_color` varchar(110) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price_color` varchar(110) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buttons_color` varchar(110) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colorsetting`
--

INSERT INTO `colorsetting` (`id`, `type`, `style_id`, `title_color`, `tag_bg_color`, `tag_color`, `detail_color`, `sub_detail_color`, `price_color`, `buttons_color`) VALUES
(1, 1, 1, '#4e584d', '#84a45a', '#ffffff', NULL, NULL, '#4e584d', '#84a45a'),
(2, 1, 2, '#4e584d', '#818a6f', '#e4ebf2', '#4e584d', '#4e584d', '#4e584d', '#818a6f'),
(3, 3, 2, '#4e584d', '#84a45a', '#e4ebf2', '#4e584d', '#4e584d', '#4e584d', '#84a45a'),
(4, 2, 2, '#565456', '#84a45a', '#e4ebf2', '#565456', '#565456', '#565456', '#84a45a'),
(5, 2, 1, '#4e584d', '#84a45a', '#ffffff', NULL, NULL, '#4e584d', '#84a45a'),
(6, 3, 1, '#4e584d', '#84a45a', '#ffffff', NULL, NULL, '#4e584d', '#84a45a');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(191) NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(191) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(191) NOT NULL,
  `recieved_user` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` int(11) NOT NULL,
  `type` enum('referral','browser') NOT NULL DEFAULT 'referral',
  `referral` varchar(255) DEFAULT NULL,
  `total_count` int(11) NOT NULL DEFAULT '0',
  `todays_count` int(11) NOT NULL DEFAULT '0',
  `today` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `type`, `referral`, `total_count`, `todays_count`, `today`) VALUES
(1, 'referral', 'www.facebook.com', 5, 0, NULL),
(2, 'referral', 'geniusocean.com', 2, 0, NULL),
(3, 'browser', 'Windows 10', 1497, 0, NULL),
(4, 'browser', 'Linux', 222, 0, NULL),
(5, 'browser', 'Unknown OS Platform', 385, 0, NULL),
(6, 'browser', 'Windows 7', 425, 0, NULL),
(7, 'referral', 'yandex.ru', 15, 0, NULL),
(8, 'browser', 'Windows 8.1', 540, 0, NULL),
(9, 'referral', 'www.google.com', 6, 0, NULL),
(10, 'browser', 'Android', 362, 0, NULL),
(11, 'browser', 'Mac OS X', 511, 0, NULL),
(12, 'referral', 'l.facebook.com', 1, 0, NULL),
(13, 'referral', 'codecanyon.net', 6, 0, NULL),
(14, 'browser', 'Windows XP', 2, 0, NULL),
(15, 'browser', 'Windows 8', 1, 0, NULL),
(16, 'browser', 'iPad', 4, 0, NULL),
(17, 'browser', 'Ubuntu', 1, 0, NULL),
(18, 'browser', 'iPhone', 21, 0, NULL),
(19, 'referral', 'com.google.android.googlequicksearchbox', 3, 0, NULL),
(20, 'referral', 'davehansen.com', 2, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'DS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua and Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CD', 'Democratic Republic of the Congo'),
(50, 'CG', 'Republic of Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GK', 'Guernsey'),
(85, 'GR', 'Greece'),
(86, 'GL', 'Greenland'),
(87, 'GD', 'Grenada'),
(88, 'GP', 'Guadeloupe'),
(89, 'GU', 'Guam'),
(90, 'GT', 'Guatemala'),
(91, 'GN', 'Guinea'),
(92, 'GW', 'Guinea-Bissau'),
(93, 'GY', 'Guyana'),
(94, 'HT', 'Haiti'),
(95, 'HM', 'Heard and Mc Donald Islands'),
(96, 'HN', 'Honduras'),
(97, 'HK', 'Hong Kong'),
(98, 'HU', 'Hungary'),
(99, 'IS', 'Iceland'),
(100, 'IN', 'India'),
(101, 'IM', 'Isle of Man'),
(102, 'ID', 'Indonesia'),
(103, 'IR', 'Iran (Islamic Republic of)'),
(104, 'IQ', 'Iraq'),
(105, 'IE', 'Ireland'),
(106, 'IL', 'Israel'),
(107, 'IT', 'Italy'),
(108, 'CI', 'Ivory Coast'),
(109, 'JE', 'Jersey'),
(110, 'JM', 'Jamaica'),
(111, 'JP', 'Japan'),
(112, 'JO', 'Jordan'),
(113, 'KZ', 'Kazakhstan'),
(114, 'KE', 'Kenya'),
(115, 'KI', 'Kiribati'),
(116, 'KP', 'Korea, Democratic People\'s Republic of'),
(117, 'KR', 'Korea, Republic of'),
(118, 'XK', 'Kosovo'),
(119, 'KW', 'Kuwait'),
(120, 'KG', 'Kyrgyzstan'),
(121, 'LA', 'Lao People\'s Democratic Republic'),
(122, 'LV', 'Latvia'),
(123, 'LB', 'Lebanon'),
(124, 'LS', 'Lesotho'),
(125, 'LR', 'Liberia'),
(126, 'LY', 'Libyan Arab Jamahiriya'),
(127, 'LI', 'Liechtenstein'),
(128, 'LT', 'Lithuania'),
(129, 'LU', 'Luxembourg'),
(130, 'MO', 'Macau'),
(131, 'MK', 'North Macedonia'),
(132, 'MG', 'Madagascar'),
(133, 'MW', 'Malawi'),
(134, 'MY', 'Malaysia'),
(135, 'MV', 'Maldives'),
(136, 'ML', 'Mali'),
(137, 'MT', 'Malta'),
(138, 'MH', 'Marshall Islands'),
(139, 'MQ', 'Martinique'),
(140, 'MR', 'Mauritania'),
(141, 'MU', 'Mauritius'),
(142, 'TY', 'Mayotte'),
(143, 'MX', 'Mexico'),
(144, 'FM', 'Micronesia, Federated States of'),
(145, 'MD', 'Moldova, Republic of'),
(146, 'MC', 'Monaco'),
(147, 'MN', 'Mongolia'),
(148, 'ME', 'Montenegro'),
(149, 'MS', 'Montserrat'),
(150, 'MA', 'Morocco'),
(151, 'MZ', 'Mozambique'),
(152, 'MM', 'Myanmar'),
(153, 'NA', 'Namibia'),
(154, 'NR', 'Nauru'),
(155, 'NP', 'Nepal'),
(156, 'NL', 'Netherlands'),
(157, 'AN', 'Netherlands Antilles'),
(158, 'NC', 'New Caledonia'),
(159, 'NZ', 'New Zealand'),
(160, 'NI', 'Nicaragua'),
(161, 'NE', 'Niger'),
(162, 'NG', 'Nigeria'),
(163, 'NU', 'Niue'),
(164, 'NF', 'Norfolk Island'),
(165, 'MP', 'Northern Mariana Islands'),
(166, 'NO', 'Norway'),
(167, 'OM', 'Oman'),
(168, 'PK', 'Pakistan'),
(169, 'PW', 'Palau'),
(170, 'PS', 'Palestine'),
(171, 'PA', 'Panama'),
(172, 'PG', 'Papua New Guinea'),
(173, 'PY', 'Paraguay'),
(174, 'PE', 'Peru'),
(175, 'PH', 'Philippines'),
(176, 'PN', 'Pitcairn'),
(177, 'PL', 'Poland'),
(178, 'PT', 'Portugal'),
(179, 'PR', 'Puerto Rico'),
(180, 'QA', 'Qatar'),
(181, 'RE', 'Reunion'),
(182, 'RO', 'Romania'),
(183, 'RU', 'Russian Federation'),
(184, 'RW', 'Rwanda'),
(185, 'KN', 'Saint Kitts and Nevis'),
(186, 'LC', 'Saint Lucia'),
(187, 'VC', 'Saint Vincent and the Grenadines'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'Sao Tome and Principe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SK', 'Slovakia'),
(198, 'SI', 'Slovenia'),
(199, 'SB', 'Solomon Islands'),
(200, 'SO', 'Somalia'),
(201, 'ZA', 'South Africa'),
(202, 'GS', 'South Georgia South Sandwich Islands'),
(203, 'SS', 'South Sudan'),
(204, 'ES', 'Spain'),
(205, 'LK', 'Sri Lanka'),
(206, 'SH', 'St. Helena'),
(207, 'PM', 'St. Pierre and Miquelon'),
(208, 'SD', 'Sudan'),
(209, 'SR', 'Suriname'),
(210, 'SJ', 'Svalbard and Jan Mayen Islands'),
(211, 'SZ', 'Swaziland'),
(212, 'SE', 'Sweden'),
(213, 'CH', 'Switzerland'),
(214, 'SY', 'Syrian Arab Republic'),
(215, 'TW', 'Taiwan'),
(216, 'TJ', 'Tajikistan'),
(217, 'TZ', 'Tanzania, United Republic of'),
(218, 'TH', 'Thailand'),
(219, 'TG', 'Togo'),
(220, 'TK', 'Tokelau'),
(221, 'TO', 'Tonga'),
(222, 'TT', 'Trinidad and Tobago'),
(223, 'TN', 'Tunisia'),
(224, 'TR', 'Turkey'),
(225, 'TM', 'Turkmenistan'),
(226, 'TC', 'Turks and Caicos Islands'),
(227, 'TV', 'Tuvalu'),
(228, 'UG', 'Uganda'),
(229, 'UA', 'Ukraine'),
(230, 'AE', 'United Arab Emirates'),
(231, 'GB', 'United Kingdom'),
(232, 'US', 'United States'),
(233, 'UM', 'United States minor outlying islands'),
(234, 'UY', 'Uruguay'),
(235, 'UZ', 'Uzbekistan'),
(236, 'VU', 'Vanuatu'),
(237, 'VA', 'Vatican City State'),
(238, 'VE', 'Venezuela'),
(239, 'VN', 'Vietnam'),
(240, 'VG', 'Virgin Islands (British)'),
(241, 'VI', 'Virgin Islands (U.S.)'),
(242, 'WF', 'Wallis and Futuna Islands'),
(243, 'EH', 'Western Sahara'),
(244, 'YE', 'Yemen'),
(245, 'ZM', 'Zambia'),
(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `price` double NOT NULL,
  `times` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used` int(191) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `price`, `times`, `used`, `status`, `start_date`, `end_date`) VALUES
(3, 'OGLifeSaver', 0, 5, NULL, 3, 1, '2021-01-29', '2021-07-11');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(191) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `sign`, `value`, `is_default`) VALUES
(1, 'USD', '$', 1, 1),
(4, 'BDT', '৳', 84.63, 0),
(6, 'EUR', '€', 0.89, 0),
(8, 'INR', '₹', 68.95, 0),
(9, 'NGN', '₦', 363.919, 0);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `email_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_subject` mediumtext COLLATE utf8_unicode_ci,
  `email_body` longtext COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_type`, `email_subject`, `email_body`, `status`) VALUES
(1, 'new_order', 'Your Order Placed Successfully', '<p>Hello {customer_name},<br>Your Order Number is {order_number}<br>Your order has been placed successfully</p>', 1),
(2, 'new_registration', 'Welcome To Royal Commerce', '<p>Hello {customer_name},<br>You have successfully registered to {website_title}, We wish you will have a wonderful experience using our service.</p><p>Thank You<br></p>', 1),
(3, 'vendor_accept', 'Your Vendor Account Activated', '<p>Hello {customer_name},<br>Your Vendor Account Activated Successfully. Please Login to your account and build your own shop.</p><p>Thank You<br></p>', 1),
(4, 'subscription_warning', 'Your subscrption plan will end after five days', '<p>Hello {customer_name},<br>Your subscription plan duration will end after five days. Please renew your plan otherwise all of your products will be deactivated.</p><p>Thank You<br></p>', 1),
(5, 'vendor_verification', 'Request for verification.', '<p>Hello {customer_name},<br>You are requested verify your account. Please send us photo of your passport.</p><p>Thank You<br></p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `details`, `status`) VALUES
(1, 'Right my front it wound cause fully', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 1),
(3, 'Man particular insensible celebrated', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 1),
(4, 'Civilly why how end viewing related', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 0),
(5, 'Six started far placing saw respect', '<span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 0),
(6, 'She jointure goodness interest debat', '<div style=\"text-align: center;\"><div style=\"text-align: center;\"><img src=\"https://i.imgur.com/MGucWKc.jpg\" width=\"350\"></div></div><div style=\"text-align: center;\"><br></div><div style=\"text-align: center;\"><span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.<br></span></div>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `favorite_sellers`
--

CREATE TABLE `favorite_sellers` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `vendor_id` int(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favorite_sellers`
--

INSERT INTO `favorite_sellers` (`id`, `user_id`, `vendor_id`) VALUES
(2, 68, 68);

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `product_id`, `photo`) VALUES
(235, 220, '1614789968wedding-cake__primary_985f.jpg'),
(236, 219, '1614790385kLwc5Dki.jpg'),
(237, 253, '1614950253CRgP74KQ.png'),
(238, 254, '1614950446fdwX7whv.png'),
(239, 258, '1614952142LWY4BLR6.png'),
(240, 258, '1614952142aohQRiWf.png'),
(241, 258, '1614952142QZZTO1AF.png'),
(242, 260, '1614953686jaijIGgn.png'),
(243, 260, '16149536863ksknS7y.png'),
(244, 260, '1614953686X05KOFFT.png'),
(245, 260, '1614953686SgOW7Xps.png'),
(246, 260, '1614953686P59IUdRv.png'),
(247, 275, '1615200360GdPJF7js.png'),
(248, 275, '1615200360uAnsto5n.png'),
(249, 275, '1615200360djzFzQxt.png'),
(250, 275, '1615200360JhfSERA2.png'),
(251, 275, '1615200360CEkrMgdz.png'),
(252, 275, '1615200360Vetg4k7V.png'),
(253, 286, '1615218150MrvMKhzX.png'),
(254, 286, '1615218150ZbJvJR5D.png'),
(255, 286, '1615218150Ws3L0DO9.png'),
(256, 300, '1615238153QeNjLvF5.png'),
(257, 300, '16152381533xemndsV.png'),
(258, 300, '1615238153X9WW8VeU.png'),
(259, 300, '1615238153WbVnaFZp.png'),
(260, 300, '1615238153sFLGX7cN.png'),
(261, 310, '1615276316XdykVScD.png'),
(262, 311, '1615276769GnikiRxE.png'),
(263, 311, '1615276769DCelLIsl.png'),
(264, 311, '1615276769ulkXhKeZ.png'),
(265, 311, '1615276769Nce1eYiJ.png'),
(266, 311, '1615276769I8TT1pu7.png'),
(267, 317, '1615318630JOHL7CW0.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `generalsettings`
--

CREATE TABLE `generalsettings` (
  `id` int(191) NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prod_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_email` text COLLATE utf8mb4_unicode_ci,
  `header_phone` text COLLATE utf8mb4_unicode_ci,
  `footer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `colors` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loader` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_loader` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_talkto` tinyint(1) NOT NULL DEFAULT '1',
  `talkto` text COLLATE utf8mb4_unicode_ci,
  `is_language` tinyint(1) NOT NULL DEFAULT '1',
  `is_loader` tinyint(1) NOT NULL DEFAULT '1',
  `map_key` text COLLATE utf8mb4_unicode_ci,
  `is_disqus` tinyint(1) NOT NULL DEFAULT '0',
  `disqus` longtext COLLATE utf8mb4_unicode_ci,
  `is_contact` tinyint(1) NOT NULL DEFAULT '0',
  `is_faq` tinyint(1) NOT NULL DEFAULT '0',
  `guest_checkout` tinyint(1) NOT NULL DEFAULT '0',
  `stripe_check` tinyint(1) NOT NULL DEFAULT '0',
  `cod_check` tinyint(1) NOT NULL DEFAULT '0',
  `stripe_key` text COLLATE utf8mb4_unicode_ci,
  `stripe_secret` text COLLATE utf8mb4_unicode_ci,
  `currency_format` tinyint(1) NOT NULL DEFAULT '0',
  `withdraw_fee` double NOT NULL DEFAULT '0',
  `withdraw_charge` double NOT NULL DEFAULT '0',
  `tax` double NOT NULL DEFAULT '0',
  `shipping_cost` double NOT NULL DEFAULT '0',
  `smtp_host` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_pass` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_smtp` tinyint(1) NOT NULL DEFAULT '0',
  `is_comment` tinyint(1) NOT NULL DEFAULT '1',
  `is_currency` tinyint(1) NOT NULL DEFAULT '1',
  `add_cart` text COLLATE utf8mb4_unicode_ci,
  `out_stock` text COLLATE utf8mb4_unicode_ci,
  `add_wish` text COLLATE utf8mb4_unicode_ci,
  `already_wish` text COLLATE utf8mb4_unicode_ci,
  `wish_remove` text COLLATE utf8mb4_unicode_ci,
  `add_compare` text COLLATE utf8mb4_unicode_ci,
  `already_compare` text COLLATE utf8mb4_unicode_ci,
  `compare_remove` text COLLATE utf8mb4_unicode_ci,
  `color_change` text COLLATE utf8mb4_unicode_ci,
  `coupon_found` text COLLATE utf8mb4_unicode_ci,
  `no_coupon` text COLLATE utf8mb4_unicode_ci,
  `already_coupon` text COLLATE utf8mb4_unicode_ci,
  `order_title` text COLLATE utf8mb4_unicode_ci,
  `order_text` text COLLATE utf8mb4_unicode_ci,
  `is_affilate` tinyint(1) NOT NULL DEFAULT '1',
  `affilate_charge` int(100) NOT NULL DEFAULT '0',
  `affilate_banner` text COLLATE utf8mb4_unicode_ci,
  `already_cart` text COLLATE utf8mb4_unicode_ci,
  `fixed_commission` double NOT NULL DEFAULT '0',
  `percentage_commission` double NOT NULL DEFAULT '0',
  `multiple_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `multiple_packaging` tinyint(4) NOT NULL DEFAULT '0',
  `vendor_ship_info` tinyint(1) NOT NULL DEFAULT '0',
  `reg_vendor` tinyint(1) NOT NULL DEFAULT '0',
  `cod_text` text COLLATE utf8mb4_unicode_ci,
  `paypal_text` text COLLATE utf8mb4_unicode_ci,
  `stripe_text` text COLLATE utf8mb4_unicode_ci,
  `category_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_slug_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin_loader` tinyint(1) NOT NULL DEFAULT '0',
  `menu_bg_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_hover_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_home` tinyint(1) NOT NULL DEFAULT '0',
  `is_verification_email` tinyint(1) NOT NULL DEFAULT '0',
  `instamojo_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instamojo_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instamojo_text` text COLLATE utf8mb4_unicode_ci,
  `is_instamojo` tinyint(1) NOT NULL DEFAULT '0',
  `instamojo_sandbox` tinyint(1) NOT NULL DEFAULT '0',
  `is_paystack` tinyint(1) NOT NULL DEFAULT '0',
  `paystack_key` text COLLATE utf8mb4_unicode_ci,
  `paystack_email` text COLLATE utf8mb4_unicode_ci,
  `paystack_text` text COLLATE utf8mb4_unicode_ci,
  `wholesale` int(191) NOT NULL DEFAULT '0',
  `is_capcha` tinyint(1) NOT NULL DEFAULT '0',
  `error_banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_popup` tinyint(1) NOT NULL DEFAULT '0',
  `popup_title` text COLLATE utf8mb4_unicode_ci,
  `popup_text` text COLLATE utf8mb4_unicode_ci,
  `popup_background` text COLLATE utf8mb4_unicode_ci,
  `invoice_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_secure` tinyint(1) NOT NULL DEFAULT '0',
  `is_report` tinyint(1) NOT NULL,
  `paypal_check` tinyint(1) DEFAULT '0',
  `paypal_business` text COLLATE utf8mb4_unicode_ci,
  `footer_logo` text COLLATE utf8mb4_unicode_ci,
  `email_encryption` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytm_merchant` text COLLATE utf8mb4_unicode_ci,
  `paytm_secret` text COLLATE utf8mb4_unicode_ci,
  `paytm_website` text COLLATE utf8mb4_unicode_ci,
  `paytm_industry` text COLLATE utf8mb4_unicode_ci,
  `is_paytm` int(11) NOT NULL DEFAULT '1',
  `paytm_text` text COLLATE utf8mb4_unicode_ci,
  `paytm_mode` enum('sandbox','live') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_molly` tinyint(1) NOT NULL DEFAULT '0',
  `molly_key` text COLLATE utf8mb4_unicode_ci,
  `molly_text` text COLLATE utf8mb4_unicode_ci,
  `is_razorpay` int(11) NOT NULL DEFAULT '1',
  `razorpay_key` text COLLATE utf8mb4_unicode_ci,
  `razorpay_secret` text COLLATE utf8mb4_unicode_ci,
  `razorpay_text` text COLLATE utf8mb4_unicode_ci,
  `show_stock` tinyint(1) NOT NULL DEFAULT '0',
  `is_maintain` tinyint(1) NOT NULL DEFAULT '0',
  `maintain_text` text COLLATE utf8mb4_unicode_ci,
  `product_view` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_product_location` tinyint(1) DEFAULT '0',
  `banner_product_background` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age_checker` tinyint(4) NOT NULL DEFAULT '0',
  `solo_mode` tinyint(1) DEFAULT '0',
  `solo_category` int(11) DEFAULT NULL,
  `agepopup_text` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generalsettings`
--

INSERT INTO `generalsettings` (`id`, `logo`, `favicon`, `prod_image`, `title`, `header_email`, `header_phone`, `footer`, `copyright`, `colors`, `loader`, `admin_loader`, `is_talkto`, `talkto`, `is_language`, `is_loader`, `map_key`, `is_disqus`, `disqus`, `is_contact`, `is_faq`, `guest_checkout`, `stripe_check`, `cod_check`, `stripe_key`, `stripe_secret`, `currency_format`, `withdraw_fee`, `withdraw_charge`, `tax`, `shipping_cost`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `from_email`, `from_name`, `is_smtp`, `is_comment`, `is_currency`, `add_cart`, `out_stock`, `add_wish`, `already_wish`, `wish_remove`, `add_compare`, `already_compare`, `compare_remove`, `color_change`, `coupon_found`, `no_coupon`, `already_coupon`, `order_title`, `order_text`, `is_affilate`, `affilate_charge`, `affilate_banner`, `already_cart`, `fixed_commission`, `percentage_commission`, `multiple_shipping`, `multiple_packaging`, `vendor_ship_info`, `reg_vendor`, `cod_text`, `paypal_text`, `stripe_text`, `category_color`, `header_color`, `footer_color`, `footer_text_color`, `copyright_color`, `product_slug_color`, `is_admin_loader`, `menu_bg_color`, `menu_color`, `menu_hover_color`, `is_home`, `is_verification_email`, `instamojo_key`, `instamojo_token`, `instamojo_text`, `is_instamojo`, `instamojo_sandbox`, `is_paystack`, `paystack_key`, `paystack_email`, `paystack_text`, `wholesale`, `is_capcha`, `error_banner`, `is_popup`, `popup_title`, `popup_text`, `popup_background`, `invoice_logo`, `user_image`, `vendor_color`, `is_secure`, `is_report`, `paypal_check`, `paypal_business`, `footer_logo`, `email_encryption`, `paytm_merchant`, `paytm_secret`, `paytm_website`, `paytm_industry`, `is_paytm`, `paytm_text`, `paytm_mode`, `is_molly`, `molly_key`, `molly_text`, `is_razorpay`, `razorpay_key`, `razorpay_secret`, `razorpay_text`, `show_stock`, `is_maintain`, `maintain_text`, `product_view`, `banner_product_location`, `banner_product_background`, `age_checker`, `solo_mode`, `solo_category`, `agepopup_text`) VALUES
(1, '1611892278oglife-logo-100.png', '1611868996oglife-logo-tiny.png', '1614955341flower.jpg', 'OG.Life', 'sendmail', '0123 456789', 'California\'s number one B2B cannabis delivery service.', 'COPYRIGHT © 2019. All Rights Reserved By OG.Life', '#84a45a', '1564224328loading3.gif', '1564224329loading3.gif', 0, '<script type=\"text/javascript\">\r\nvar Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n(function(){\r\nvar s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\ns1.async=true;\r\ns1.src=\'https://embed.tawk.to/5bc2019c61d0b77092512d03/default\';\r\ns1.charset=\'UTF-8\';\r\ns1.setAttribute(\'crossorigin\',\'*\');\r\ns0.parentNode.insertBefore(s1,s0);\r\n})();\r\n</script>', 1, 1, 'AIzaSyB1GpE4qeoJ__70UZxvX9CTMUTZRZNHcu8', 0, '<div id=\"disqus_thread\">         \r\n    <script>\r\n    /**\r\n    *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.\r\n    *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/\r\n    /*\r\n    var disqus_config = function () {\r\n    this.page.url = PAGE_URL;  // Replace PAGE_URL with your page\'s canonical URL variable\r\n    this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page\'s unique identifier variable\r\n    };\r\n    */\r\n    (function() { // DON\'T EDIT BELOW THIS LINE\r\n    var d = document, s = d.createElement(\'script\');\r\n    s.src = \'https://junnun.disqus.com/embed.js\';\r\n    s.setAttribute(\'data-timestamp\', +new Date());\r\n    (d.head || d.body).appendChild(s);\r\n    })();\r\n    </script>\r\n    <noscript>Please enable JavaScript to view the <a href=\"https://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>\r\n    </div>', 1, 1, 0, 1, 1, 'pk_test_lRibEPIgICrFdOeeIrZCmuYK008mlH6Gh4', 'sk_test_0miJWt1aMMpidGDIIHKICWOu0063qIhsO8', 0, 5, 0, 0, 5, 'mail.davehansen.com', '465', '_mainaccount@davehansen.com', 'D@v3!sg0v3', '_mainaccount@davehansen.com', 'OG.Life Deliveries', 1, 1, 0, 'Successfully Added To Cart', 'Out Of Stock', 'Add To Wishlist', 'Already Added To Wishlist', 'Successfully Removed From The Wishlist', 'Successfully Added To Compare', 'Already Added To Compare', 'Successfully Removed From The Compare', 'Successfully Changed The Color', 'Coupon Found', 'No Coupon Found', 'Coupon Already Applied', 'THANK YOU FOR YOUR PURCHASE.', 'We\'ll email you an order confirmation with details and tracking info.', 0, 0, '15587771131554048228onepiece.jpeg', 'Already Added To Cart', 0, 5, 1, 1, 0, 0, 'Pay with cash upon delivery.', 'Pay via your PayPal account.', 'Pay via your Credit Card.', '#ffffff', '#ffffff', '#715e4e', '#e4ebf2', '#52733b', '#818a6f', 1, '#f1f4f7', '#333333', '#2b8f03', 1, 1, 'test_172371aa837ae5cad6047dc3052', 'test_4ac5a785e25fc596b67dbc5c267', 'Pay via your Instamojo account.', 0, 0, 0, 'pk_test_162a56d42131cbb01932ed0d2c48f9cb99d8e8e2', 'oglife@gmail.com', 'Pay via your Paystack account.', 100000, 1, '1566878455404.png', 0, 'GET ALERTS!', 'Subscribe to our alerts. Get informed as new products become available.', '1611110829clones.jpg', '1611873958logo-2.jpg', '1567655174profile.jpg', '#f7eeee', 1, 1, 0, 'shaon143-facilitator-1@gmail.com', '1611874354logo-2-mock.jpg', 'SSL', 'tkogux49985047638244', 'LhNGUUKE9xCQ9xY8', 'WEBSTAGING', 'Retail', 0, 'Pay via your Paytm account.', 'live', 0, 'test_5HcWVs9qc5pzy36H9Tu9mwAyats33J', 'Pay with Molly Payment.', 0, 'rzp_test_xDH74d48cwl8DF', 'cr0H1BiQ20hVzhpHfHuNbGri', 'Pay via your Razorpay account.', 1, 0, '<div style=\"text-align: center;\"><font size=\"5\"><br></font></div><h1 style=\"text-align: center;\"><font size=\"6\">UNDER MAINTENANCE</font></h1>', '{\"home\":\"1\",\"filtered\":\"1\",\"product\":\"1\"}', 1, NULL, 1, 1, 18, 'Please enter your age here');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(191) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `is_default`, `language`, `file`) VALUES
(1, 1, 'English', '1615325804kBY7VLlo.json'),
(4, 0, 'RTL English', '16131453447wItoahL.json');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(191) NOT NULL,
  `conversation_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(191) DEFAULT NULL,
  `recieved_user` int(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(191) NOT NULL,
  `order_id` int(191) UNSIGNED DEFAULT NULL,
  `user_id` int(191) DEFAULT NULL,
  `vendor_id` int(191) DEFAULT NULL,
  `product_id` int(191) DEFAULT NULL,
  `conversation_id` int(191) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `order_id`, `user_id`, `vendor_id`, `product_id`, `conversation_id`, `is_read`, `created_at`, `updated_at`) VALUES
(6, NULL, NULL, NULL, 184, NULL, 1, '2021-01-20 22:14:32', '2021-01-20 22:59:06'),
(35, 6, NULL, NULL, NULL, NULL, 1, '2021-03-11 02:08:39', '2021-03-14 07:33:32');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `cart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalQty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_amount` float NOT NULL,
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `customer_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `customer_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_zip` varchar(255) DEFAULT NULL,
  `shipping_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `affilate_user` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affilate_charge` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_value` double NOT NULL,
  `shipping_cost` double NOT NULL,
  `packing_cost` double NOT NULL DEFAULT '0',
  `tax` int(191) NOT NULL,
  `dp` tinyint(1) NOT NULL DEFAULT '0',
  `pay_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `vendor_shipping_id` int(191) NOT NULL DEFAULT '0',
  `vendor_packing_id` int(191) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `cart`, `method`, `shipping`, `pickup_location`, `totalQty`, `pay_amount`, `txnid`, `charge_id`, `order_number`, `payment_status`, `customer_email`, `customer_name`, `customer_country`, `customer_phone`, `customer_address`, `customer_city`, `customer_zip`, `shipping_name`, `shipping_country`, `shipping_email`, `shipping_phone`, `shipping_address`, `shipping_city`, `shipping_zip`, `order_note`, `coupon_code`, `coupon_discount`, `status`, `created_at`, `updated_at`, `affilate_user`, `affilate_charge`, `currency_sign`, `currency_value`, `shipping_cost`, `packing_cost`, `tax`, `dp`, `pay_id`, `vendor_shipping_id`, `vendor_packing_id`) VALUES
(1, 32, 'BZh91AY&SYUòv\0¨_@\0ø+ôÄ¿ÿÿúPÞg-·,\0Pä£SÓIâ\0\0\0\0\0\"§´¤\ZzMê\0yOP\0I¥\nj@h4h\0ÂF0\0\0\0\Z\0\0\0\0$Òe0\0Jz¨=@\Zby$h	é$¹öor>e!÷8ñ£R\ZèA7g1;=6¼¡Ág2ïþÌ\ZìevE¡fU£ÚÈÿ!´5nI±kHÐárÜdkÖDñ#¡yp)Á\0HºÈP\n¤Ò5»gãGA]ÍÌ$¢H#!Akm³4´%·.u¸À\ZEÍÕôFDÁ6°j¥bb·ÈE¢A.:ÂtÜLE\ZM¢äwK4ELgÒQ.1	¼R=&LeP±RAàH¨¡P« Ì,¢Ô¨=oZ55V]y¼¨´S8­*¨&3v,j%)Ð²;)ecÙZ¿*_TÁr@@X´àÊ<rÊbÃ2Rð1hF ÀÅCØicÖkzx\Zô´h{Æ3hm6.b¬{=ÔnªÔÎy²u¨´RnÊ9V!AªJÍYHtb`Z»©I[¦6*°9Ôn!æ(³zÿ>¢Þ¦N\'°¦=ç=³ëd¢P`ÚU´j>rþF|Ýf Úygíè}K\nDo<×ÂÔ°Èt3ÚdÍÊã^%3Ï)ÚÀÈ© ÑÿPàGeØÕ¬\ZLädfWV¨À2QÍg©\nQÙº¶ï±u&2ÛÝZ«Cæfl.PiHpa,KNa3`uc5ï\r[\'J¼w×ÈjÍpæA~ºGÎDÊX!@ø!gÿÏ#Ùy$6$ØPÆ\"y#ìx÷©.bÝ#qâ`Aß %6¯©dLg±#pKD/ôêrÍÌ+¬8³`åÐëÄc\nÇaH&²¨¦VýY}uà+¿c-s(CBÓm\"3i%QÂi}Âà]­Ã©©n ·pEÐÓ-ó*wî¯a¦b|F¯ç`Ù.Ðhr*\ZÇ$l8Ðcltñ5zU*5¨9 Äè¶¹MÓ×gâÒ¸ÊBÆã!AØiXÞAzÓcÃ¿êâÝÆñ>Ø D¾ô°AF\n$Y$XIYa`îÇL¸B)±.B¢÷©¨`1&D.:ApéÅÀQ¼fxÊÆ&s5Råå¾(LÁ`Y(L*µïKÕ´ù}æ\'2ùfv\\BWG^£ã¸Å%a7½¢5Y¯að<y¡zýüPÅ/ÅÜN$|¡\0', 'Cash On Delivery', 'pickup', NULL, '1', 17.6, NULL, NULL, 'STSv1611155672', 'Completed', 'kosong@gmail.com', 'Joe', 'Bahamas', '+1234567890', 'St corner, B. Valdez, Makati Ave, Makati, 1210 Metro Manila,', 'dd', 'ddd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dd', NULL, NULL, 'completed', '2021-01-20 22:14:32', '2021-03-06 04:32:20', NULL, NULL, '$', 1, 0, 0, 0, 0, NULL, 0, 0),
(2, 68, 'BZh91AY&SYdF\0Þß@\0Pÿø;«ü¿ïÿúPûÝ0Ê\0 `\0\0	\0\0\0Q©DÔSM4ÐÄÐ\0hF\0¥*G¨Â\0ÈÁ4hÀ0\0\0\0\0\0	~@4z¨`) )¶~O¹®peW{¨Äw¹ÈÐò¡ýÏó&\n¼#÷jI\'ÉX½Î\ZÝÝä2×ÝÌÙêM×V7Ä6bVkði¦Õ°4±B í;»/ëïÀõIÄöfnê[T\0\"\'p3C±¡©ÄþÎòçbÇs»U\'cRMÌ=aì>rI¤P%Õ¥=Ô4\r¦ãà³=£,@Æ ÓY³9AY@¡	@:Ú­@i±1ÒÖ½Tmma¼Y­©ouQ,A.²«ï& Ú*ëm\röFé5·À1É\\VhLu>e$M*b#´Aq±$råËòÂfE[ðÊåVëæqc\Z g*Ô÷	hgMyk&²µ/S#_\0Â©p¥IWVÔ1R«Í-éú]P4%HiË8Ua%:8w\Z0ÃB\r¬YIH¡4Á \nP¸3`ÖµxÏ&¬Q×uB	Ê8çQb SoQ|=ìgbkil1£YLÌª51teåÇª	îXË©wªÉ­kZË`­sJLÂlÕ%Õ´P|Gx:ù!ÒÓÒ|Ãà`°zÅüðAç6½\rá#üOUxÛÅ2pE°Á´¯`I¸@PÔe¡ä\rõþ öé×OÒkë±ü4q5\'CtI\rcN}xç¼z88ÀðÊ­_\"Ä¡Úÿs`l7Lô2Ìx,Ø6Ò7«Ü;¨x\ZËi¤`JUhb`3qÿ¼Óqå©F¦ØbXTõ+¼E|\'Ôú&El<ÉPf*#ôIJp ¡Bêã½Ø3ñ}u\Zfq¶À¦æ_1¨<\ZçÔË¶å_$S© Îóôf«Öf}¤bHíÍb!¤XgbáßqMEÆÀÄ¿@UgëtPgøIÈ\'r4tpÔ½wÙÀ§N§O0ÆÂ,µBmTM	Ér\'È,AeèX©%	`h¡*`rÃ+ab¡T¼$CÞhÔÌâwT<MÊ{oÓ/PÔädwýJíYà4Ì¼k?(Ù´àk¼ºT7ÿ¡ãc¨Ï¦UJlT`v\\lu«ºPÏsK ð©$^¢d(<ÎDo.k«¥»Þ­{PxoÞÈ%HÂ\Z(W%DÚ¡¼Èé8Ex%¨ª½¬l!ÔpB!k¾Ã3U¼Ìfæ&Ì[TdÌÌçUPÅbZ$T Y#&½©Ì/´gÝ©Z0¨¨¢ë#+ä>}Ä\0Â>0kP\\3W¢û§´ôuBú?ÐACXÿÅÜN$£@', 'Cash On Delivery', 'shipto', NULL, '1', 130.88, NULL, NULL, 'NSrf1612160936', 'Completed', 'usamtg@hotmail.com', 'Dave Hoover', 'United States', '4124034110', '1133 Camelback Street', 'Newport Beach', '92660', NULL, 'United States', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2021-02-01 13:28:56', '2021-02-01 13:53:03', NULL, NULL, '$', 1, 39, 0, 0, 0, NULL, 0, 0),
(3, 74, 'BZh91AY&SYêwÎ\0ß@\0Pÿø+ô¿ïÿú`]÷-4Ë \0\0ÐG0\0\0\0\0\0\0\0B`D Ð\0\0\0\0\00\0\0\0\0\0\0\0$¢bAaÌ\0\0\0\0\0\0\0\0!\0	¦SSm&LOSjmOS2z¦LNXõ(1Ø{%Ö Ôì@©ó$þ(\ZAsFK_ðb+ûE$Ì±Qúd¨2X0¤ö6:SB¢ÎU*VJ´|1+ÉaFøÖaCPgÈî2aDVà¹´ÿaN\ZôÕ+ñ5ÉêS¹Oô ! LB\'@ó#÷\rÓâi0{ChØ\"$rÁÎO2\nØºc4\ZA±\r\"RÍT§Z@Î Å`i k³Á I jÁbwÅ1]æ\'àË(bÔÑ£FÎ!Õ&Á§KM­XÞV¶¥à²yu45òÅó¨Tb(ÂZí\rÅfÇz^·¨Xs2ñÒ(fA¢¥rH*X±!°U$©ÌÁaÄI$Ãi-(Hfaíí\01)\ZÅª¦ÄÈR×­El\nJ¥Â\nu%][\"ñRUUjpGýH_UüµQØ\r ¤@à«1%985\Z=&FFb ¬,L$¤1)B¡E\"Üe¯a·ee!XÌfæRKL±í­IÊ¥sHG\r\'jQpÏG@Á+²Ô*ÉCa. (Ì]nn¢õH1| `9Roxß:!_Ôñ3ô>±Ù${àf{*ð\\óÿ#°~gyºË|$Ø4¬ØÅñ:ÄO±¤ýòÝð?cîÆ|¹&õ$Tø¯Î¥fgSZâ²%×È/#\"§Ç]¾eÄs`k2 Úfj6\Z³ê§Th2ë@Ím#r½Ã}CqmAP5HN	PË.F³31ORf;§.b1Æmr,U±XmàWºÁ÷>ÆÂ&ew4	Á÷6èAB×P©s=£8Gi ð V59[`Qe§Óù\ZäyÊÆ·¨;I°*fÁÜ(/ÀZü°ú/`^79£  °YgAûA=EÁIÀò0AÓ@U\Z3Êånõ$â±©Ìc7t/ò-ÄÞÚõ àºø¼0´y\nH°Ö»\nÚ¨¢¢èWw.JP_ìý\0´Ê+¦,9¶ *K rBh¸ >æÅ=§DvZ%	°u8þå|Ö¬\r3ÐÑ\Z|8Æ½§M¥i@úâxä1¶5QfuE\Z5ò<R2;-ã¾ó«ºPÏÉ 4,B¤drC¸ÒÁÈ\rñûzÛ½à:²ä¿PcûÙ f%\"G\nbSÚq¡ãªrÒê+/BÖ5ìI8Ê£2¤BðÝ]%Vò:å*æ0®±ó\"ªëAñF°,T0a\Z4{ý±e´g-[ËJ®hÄ£û>$$0pmph2ä\rZÔe?ÏªÃ9\'±\Z\nAt>bîH§\nNð9À', 'Cash On Delivery', 'shipto', NULL, '1', 148.35, NULL, NULL, 'XNNw1612539068', 'Completed', 'kosong0926@hotmail.com', 'Cristina Duran', 'United States', '+8612345646768', '203 USA Parkway', 'Sparks', '89434', NULL, 'United States', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2021-02-05 22:31:08', '2021-02-06 01:36:17', NULL, NULL, '$', 1, 39, 0, 0, 0, NULL, 0, 0),
(4, 74, 'BZh91AY&SYGbn\0_@\0Pÿø+ô¿ïÿú`]ð\0¬@\r\0PG0\0\0\0\0\0\0\0TÉ£MB#M \r\0Ð\0À\0\0\0\0\0\0\0T4ô\0hÑé=@\r\0s\0\0\0\0\0\0\0\0$D@	f4Ñ£M4Ú%Jeê§9XE°\"è=\Z>Å$j=	XÓzX Ò^¢)æ(­2g¨å	ìÁÁßîHdz;+Hµ±3J\ZI«i^Ç·B\r+Scb\\Èæ8Ì¦1¶0>Lþ|mÐÎ( , ü@À9Ãxé6\n¡®kdQ\\o*PcbèvÀ5¡¤AJY)ê¡BÞBLV°Ë9¼jÇ  P5`±	@;âÁÌÀÂèô¦@i±1ÛÅÄÒ°Á°M l\Zt´ÚÙQ=ekj^\'AÔÐÔzÊ,bÃÄNyÔ*40£¤Ö»Cc%eqY¡1Þ¦¦U;\"¯zÒÊ@A¨©B\\\n,Hl$T³,<]EÓ´_;WPÁZ»VáUDáRöªS!K^µ°)**QÔulÅIUU©ÁâBù¯ JÚ`6b\0 mÄÐÚfòI(0\rÂLF!°\nÐRI$PAn2×°Û²²¬â3s)%¦XöÖ¤åB,-JY\'\\R° +¨¦HPT\"kí2ÕR$)\'(¥P£BUµT¾.K­÷ÞUZË*;ª±sÜÃÙÕÜoh:Ì¦aKôé~s3ð«ÁsÄ#ôØxÍÖX÷3Û&ÄY¥fÆ(/Ö  *}M\'ä0Ìõfì¨´iï7ÿ(ÌgÀò$Þ¤Åì©E\'ÁTÖ¸¬¡Éf5ð!ÀÈ©î×oqÌ\rfDLÍFÃV`ÑÿTê]h°m¤nW¸o¡ÐÐÜ[PT\rRT2Ë¬ÌÌfÓî@B¬ÇaåÌF8Í±bbE¶+\r¼\n÷X<©°]ÃÍBdpe=¥:P¡uà êAØÏhÎ#ÑÚH:+\ZÌ­°(²ÆÓåô\ZàxÊóNfNÛÔòA¬\n0`7\nËÎ-}\rÂ®+Æúa\Z B\\6#HKx ¢à¤àx ç I*år·E}É8ìBêwfîeþ¸Û_xJ\0[¯ïè1£ÀREµØT&ÕDÐd­2½ÖØºxU*AAú\nÓ(¬J°äJØX¨U,É\n¢ânò6)ïÑÞ´J1`êq4;yñZ°4ÏA¢4öñ{N{K%&Òó¸èGÆØÕFxÕhÔ/QæHÈï[Ç}\rçWt¡¦\0Ð ±\nEf2ÉÃK\"7Ä:_óën×êÈ`zRýL7ëe1R\Z		di0hM©7\ZmPwJ*oK¨¬½¬k!ÞI8Ê£2¤Béº\r¹¸J­äu3ÊUÌa\r#3\\c39î\"ªëAñF°,T0a\Z4zQöbËhÎÝµl;×rJ®äFâQöwB¸6¸4Ar­E÷OÈÇÂRñ[q£ H4;\n¿âîH§\n(ìMÀ', 'Stripe', 'shipto', NULL, '1', 132.35, 'txn_1IHXYCJlIV5dN9n7obmBj338', 'ch_1IHXYCJlIV5dN9n7xeZwwUdC', 'WYAN1612543974', 'Completed', 'kosong0926@hotmail.com', 'Cristina Duran', 'United States', '+8612345646768', '203 USA Parkway', 'Sparks', '89434', NULL, 'United States', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-02-05 23:52:56', '2021-02-05 23:52:56', NULL, NULL, '$', 1, 39, 0, 0, 0, NULL, 0, 0),
(5, 68, 'BZh91AY&SY}ùÉæ\0Kß@\0Pÿø;«ü®¿ïÿú`¼øª\0P (!Í10¦a\0\0\0F4ÄÀF`\0\0aÓ\Z`F\0\0	`\0z@ÐG¨H4hsLLiF\0\0\0& 4\'Âj7ª=OSÈjzOÒ$dHÖú¶:+vBa\'áÊån0ªõºäÑU&×2Xs´\r*¹«&ÜÛvá¡¥Ò2ZúF7^²Iõ+7ÁÃZÒRì¢?fe.õ5µ\"¾7R*V2¾SµU-¥YÏ\"ë¶ÈÔy¥ô44½çªz:a»yÐ~\r<]j©5¹Ù&òÈÍa%XèTY\'ÀI}C¡°Î\' ê6,z±R§Ü±×â½Gk²qea*CüÉ\'v,ØI8j´§ºÎyðZ´aÞ]$!1f\r4Õ¹Ò\rZÔdB:Ú­DB11Å­z¨ÛÚÃ\n¤ÖÔ¥½Ö\nM¤¤ZÙòj\r¢®±7¾ãÄªÂ®³kÞOg¢Â\n4&<gÉÖ©¡Rµ¥)±BÄfT¡.IK$7B* Ô±aKÒTY:Òm¬WPÁZ»VáUDáRöªS!K^µ`VUnT£©*êÐZJUYÍý\\ÂP&Ò@Ú	³ç\nÜA\r\r©PQ6p$ÉYn$¥Y,,FXÅ±bC÷(\"Þe»c£ue!XBæ3¡Ó&úÔªW`½Ëaß*3-Ý0YVD3*ÆF\'V;ÜÊÁfI·{äio<+ÓM2\"ÆTV÷¡ó¡q|Y_­÷ìkzCäÔÈó2ha¦ÄOmÍCØnàH73zBCýé,ñäÏ):Qf ¾\'Äc.yRVGþÆ¶?\rJãÈù}3>fR*{×¾¥gÐ4:U6(×Öµ\ZýK\"ÇjüäÀÜ3y©±¦¡m£ø$v; ÌhÃF&ÚFõ{MSymCXÁ*U¡±¸fc:Á®cÄe8ó#¦ØÈ±,©ë=e¥ão!_#Ìû[É$âf[¤Á\ZPjÌ¹J\rgÐo%)ÈC\nãC¨ô¼gæÕ{Æ¦VÜX¾óé÷\ZàxÊóNÃ\'mêüTOaà)/3Ô-»°Ôû.8ojnÅT`UãMJ­ægþÆ}ôÖ¿r§#ò3 ñé6\nUhÝ¦\náû(r\npBæw\rc\Z:»K×~¼A^Þóº\n0´x\nªØ\n5¥EAjµýJ­òÿE,³]åPÒ*¦,:I]B© rB~f©ÆCÈèSÚ-¹¹&z¥Øq3?/üWe¦ð4FgvÇó	PÞP8b?3°±«ö*4v\Z0w.¡Û3¨ãjï3ÖÐdf\\I,Mì$ÒÁÈ\rñ»ú{m×xæÔ0¡üÒò\n©E[ÉXYeXbaE©\0Ø\r&!¤CT7ÁÊQSR¹ËÖM@vNr¨Ì©¹ðC.·	TÈì3ÊUÌaÌhÔHÁ44DUPÉdZ4T \\ºÚ=óbÆÃ=ÜÌ´Üw.@BTT;Æ§­È|×Ä± @OZf»0­M*ÉfçB³ò8¼173%¥©]§ü]ÉáBA÷ç\'', 'Cash On Delivery', 'shipto', NULL, '1', 130.88, NULL, NULL, 'N3Mo1612781036', 'Pending', 'usamtg@hotmail.com', 'Dave Hoover', 'United States', '4124034110', '1133 Camelback Street', 'Newport Beach', '92660', NULL, 'United States', NULL, NULL, NULL, NULL, NULL, 'a', NULL, NULL, 'pending', '2021-02-08 17:43:56', '2021-02-08 17:43:56', NULL, NULL, '$', 1, 39, 0, 0, 0, NULL, 0, 0),
(6, 79, 'BZh91AY&SYÂ}=\Z\0Îß@\0Pÿø+ü¿ïÿúPÏfÎíÙØÐ\nMÛÔÔzMLÑ=&z¦L#1¢4Ä&©ê&\0\0&¤©ú¦M4 \0\0\0\0`\0\0\0\0\0\0\04M¤ò\"¦ÔÐÍAê\r6MF# <.¡%È_Æ8pr7s8ñ¡rJ£_!þFZhPù¢Åÿn\ZÛ0mÛû)·\'CB®8ÈËÇ¶üJ[ÞnIÉ[$9GÔ;h×«Ò7BøÌ£}²h@À	D¼\"RK1äNWõ=Ç	L=Ä	/LÎR`4@\r0\Z³%Ò°Y c¹\r&¶µ«þ.1b5 0R#|3÷Á°TªokÞâ¢»¼²g@ò\n¨QMM0H$(CV¾ð¨¥¡2ÑkZ±01¨5®ELÈ HRÇ:GRLR¤´¤Yjá@­©ÓhÒL¥kSa)¬u(ìÎás\"VB\"Á!dt-)*IÕRB{LahB(ÕDý©RÂ¶¢,Ê^)EÓbÔFA`Fª@¦,ã3ÝF(HX KsIóËÞ&ÒÄÅJë+& á²o$dÐ\'\ncxÃ)ÖnÕ1*.2Y,Rµf1¾¼.ÊÞöRÔd2MÁåXxòàÄú2ÆÂ<¥	ww¡)¯#ø	31\'È¡ßr+|Yñ¡ª,Õ\r¥âl-ÂBÇÔÎ1>vyä~æ¾^g¡¢¡<Â¤ª\ZÍM©Hu,¼ÈG  a\'«¥Bò(F8°T?2mÄºÄ!m!æ°À7Tí6ÚmPÊ­¦%Æh}]TC\'§¬Åú©kâX¢eIlUx\n¶XÔÌS\"½:DÍ¢©J©ÈÜ}Ä¥9T©u¹Ì}:Gá¡c3ª¹*a¦Ïè5QÈçiSÄÛWn\ZISï.\\;EßÞ,ø/²ðBMXÐÌ(Áø!äoîÃ&EÓC¸¹=BZ2Ç¦Å\rB\\¶5¦ó\nô³4z¸y)»¢8Ôªnë¤\"HÚsË\"®¤\næRô¤U%LXjAe		K¸N@²Z@zªpÎ´daaHo19zÍl¸Ó27lüu»¾ÂÉPè%`\'ô¡ØG±Øg¼ÚlªRÖ\"íEÎAÛ#C[W¢gK0!M`±7Àd(9):È Ö ¹Û·Ã¹àG´<PyoÞÈF1Da(@R\0¤`Rjm8æû3!:Rà+/qÄ  È!nÒcU»Lñ¦îFFj1J8#jH10-6/*\nIe¡µNtOó3]+ÙæLEPEQ5eBÄw%j/qE]mA´Ä¬%w(^ ¿¿zAIH5?ÅÜN$0OF', 'Cash On Delivery', 'shipto', NULL, '1', 54, NULL, NULL, 'C0EB1615403319', 'Pending', 'kosong0926@hotmail.com', 'Joe Andrei', 'United States', '+8612345646768', '1200 Waters Place', 'EE', '10461', NULL, 'United States', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-03-11 02:08:39', '2021-03-11 02:08:39', NULL, NULL, '$', 1, 39, 0, 0, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_tracks`
--

CREATE TABLE `order_tracks` (
  `id` int(191) NOT NULL,
  `order_id` int(191) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_tracks`
--

INSERT INTO `order_tracks` (`id`, `order_id`, `title`, `text`, `created_at`, `updated_at`) VALUES
(2, 2, 'Pending', 'You have successfully placed your order.', '2021-02-01 13:28:56', '2021-02-01 13:28:56'),
(3, 2, 'Completed', 'test', '2021-02-01 13:53:03', '2021-02-01 13:53:03'),
(4, 3, 'Pending', 'You have successfully placed your order.', '2021-02-05 22:31:08', '2021-02-05 22:31:08'),
(5, 4, 'Pending', 'You have successfully placed your order.', '2021-02-05 23:52:56', '2021-02-05 23:52:56'),
(6, 3, 'Completed', 'Completed Your Order', '2021-02-06 01:36:17', '2021-02-06 01:36:17'),
(7, 5, 'Pending', 'You have successfully placed your order.', '2021-02-08 17:43:56', '2021-02-08 17:43:56'),
(8, 6, 'Pending', 'You have successfully placed your order.', '2021-03-11 02:08:39', '2021-03-11 02:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT '0',
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(191) NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `header` tinyint(1) NOT NULL DEFAULT '0',
  `footer` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `details`, `meta_tag`, `meta_description`, `header`, `footer`) VALUES
(1, 'About Us', 'about', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 1</font><br></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" style=\"font-family: \" 51);\"=\"\"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', NULL, NULL, 0, 0),
(2, 'Privacy & Policy', 'privacy', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><img src=\"https://i.imgur.com/BobQuyA.jpg\" width=\"591\"></h2><h2><font size=\"6\">Title number 1</font></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" 51);\"=\"\" style=\"font-family: \"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'test,test1,test2,test3', 'Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 0, 1),
(3, 'Terms & Condition', 'terms', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 1</font><br></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" 51);\"=\"\" style=\"font-family: \"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 't1,t2,t3,t4', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pagesettings`
--

CREATE TABLE `pagesettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_success` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_title` text COLLATE utf8mb4_unicode_ci,
  `contact_text` text COLLATE utf8mb4_unicode_ci,
  `side_title` text COLLATE utf8mb4_unicode_ci,
  `side_text` text COLLATE utf8mb4_unicode_ci,
  `street` text COLLATE utf8mb4_unicode_ci,
  `phone` text COLLATE utf8mb4_unicode_ci,
  `fax` text COLLATE utf8mb4_unicode_ci,
  `email` text COLLATE utf8mb4_unicode_ci,
  `site` text COLLATE utf8mb4_unicode_ci,
  `slider` tinyint(1) NOT NULL DEFAULT '1',
  `service` tinyint(1) NOT NULL DEFAULT '1',
  `featured` tinyint(1) NOT NULL DEFAULT '1',
  `small_banner` tinyint(1) NOT NULL DEFAULT '1',
  `best` tinyint(1) NOT NULL DEFAULT '1',
  `top_rated` tinyint(1) NOT NULL DEFAULT '1',
  `large_banner` tinyint(1) NOT NULL DEFAULT '1',
  `big` tinyint(1) NOT NULL DEFAULT '1',
  `hot_sale` tinyint(1) NOT NULL DEFAULT '1',
  `partners` tinyint(1) NOT NULL DEFAULT '0',
  `review_blog` tinyint(1) NOT NULL DEFAULT '1',
  `best_seller_banner` text COLLATE utf8mb4_unicode_ci,
  `best_seller_banner_link` text COLLATE utf8mb4_unicode_ci,
  `big_save_banner` text COLLATE utf8mb4_unicode_ci,
  `big_save_banner_link` text COLLATE utf8mb4_unicode_ci,
  `bottom_small` tinyint(1) NOT NULL DEFAULT '0',
  `flash_deal` tinyint(1) NOT NULL DEFAULT '0',
  `best_seller_banner1` text COLLATE utf8mb4_unicode_ci,
  `best_seller_banner_link1` text COLLATE utf8mb4_unicode_ci,
  `big_save_banner1` text COLLATE utf8mb4_unicode_ci,
  `big_save_banner_link1` text COLLATE utf8mb4_unicode_ci,
  `featured_category` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pagesettings`
--

INSERT INTO `pagesettings` (`id`, `contact_success`, `contact_email`, `contact_title`, `contact_text`, `side_title`, `side_text`, `street`, `phone`, `fax`, `email`, `site`, `slider`, `service`, `featured`, `small_banner`, `best`, `top_rated`, `large_banner`, `big`, `hot_sale`, `partners`, `review_blog`, `best_seller_banner`, `best_seller_banner_link`, `big_save_banner`, `big_save_banner_link`, `bottom_small`, `flash_deal`, `best_seller_banner1`, `best_seller_banner_link1`, `big_save_banner1`, `big_save_banner_link1`, `featured_category`) VALUES
(1, 'Success! Thanks for contacting us, we will get back to you shortly.', 'help@og.life', '<h4 class=\"subtitle\" style=\"margin-bottom: 6px; font-weight: 600; line-height: 28px; font-size: 28px; text-transform: uppercase;\">WE\'D LOVE TO</h4><h2 class=\"title\" style=\"margin-bottom: 13px;font-weight: 600;line-height: 50px;font-size: 40px;color: #0f78f2;text-transform: uppercase;\">HEAR FROM YOU</h2>', '<span style=\"color: rgb(119, 119, 119);\">Send us a message and we\' ll respond as soon as possible</span><br>', '<h4 class=\"title\" style=\"margin-bottom: 10px; font-weight: 600; line-height: 28px; font-size: 28px;\">Let\'s Connect</h4>', '<span style=\"color: rgb(51, 51, 51);\">Get in touch with us</span>', 'Newport Beach, CA', '00 000 000 000', '00 000 000 000', 'brendon@og.life', 'https://og.life/', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1611266255a-m-s.jpg', 'https://davehansen.com/demo1/item/top-rated-product-title-will-be-here-according-to-your-wish-96-pr601jsv', '1612369336blue-cookies__primary_de7b.jpg', '/', 0, 0, '1611266255gorilla-glue.png', 'https://davehansen.com/demo1/item/physical-product-title-title-will-be-here-97-pr602jsv', '1611111270acapulco-gold.jpg', '/', 0);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(191) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `photo`, `link`) VALUES
(1, '1563165366brand-1.png', 'https://www.google.com/'),
(2, '1563165383brand-2.png', 'https://www.google.com/'),
(3, '1563165393brand-3.png', 'https://www.google.com/');

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(191) NOT NULL,
  `subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `subtitle`, `title`, `details`, `status`) VALUES
(46, 'Pay via your Mobile Money.', 'Mobile Money', '<font size=\"3\"><b style=\"\">Mobile Money</b><b>&nbsp;No: 6528068515</b><br><br></font>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pending_strains`
--

CREATE TABLE `pending_strains` (
  `product_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pickups`
--

CREATE TABLE `pickups` (
  `id` int(191) UNSIGNED NOT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(191) UNSIGNED NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `product_type` enum('normal','affiliate') NOT NULL DEFAULT 'normal',
  `affiliate_link` text,
  `user_id` int(191) NOT NULL DEFAULT '0',
  `category_id` int(191) UNSIGNED NOT NULL,
  `subcategory_id` int(191) UNSIGNED DEFAULT NULL,
  `childcategory_id` int(191) UNSIGNED DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_qty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL,
  `previous_price` double DEFAULT NULL,
  `details` longtext,
  `stock` int(191) DEFAULT NULL,
  `policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '1',
  `views` int(191) UNSIGNED NOT NULL DEFAULT '0',
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text,
  `colors` text,
  `product_condition` tinyint(1) NOT NULL DEFAULT '0',
  `ship` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_meta` tinyint(1) NOT NULL DEFAULT '0',
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `youtube` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Physical','Digital','License') NOT NULL,
  `license` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `license_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `platform` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `licence_type` varchar(255) DEFAULT NULL,
  `measure` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `best` tinyint(10) UNSIGNED NOT NULL DEFAULT '0',
  `top` tinyint(10) UNSIGNED NOT NULL DEFAULT '0',
  `hot` tinyint(10) UNSIGNED NOT NULL DEFAULT '0',
  `latest` tinyint(10) UNSIGNED NOT NULL DEFAULT '0',
  `big` tinyint(10) UNSIGNED NOT NULL DEFAULT '0',
  `trending` tinyint(1) NOT NULL DEFAULT '0',
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_date` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `whole_sell_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `whole_sell_discount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_catalog` tinyint(1) NOT NULL DEFAULT '0',
  `catalog_id` int(191) NOT NULL DEFAULT '0',
  `parent` longtext,
  `effects` longtext,
  `is_verified` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `product_type`, `affiliate_link`, `user_id`, `category_id`, `subcategory_id`, `childcategory_id`, `location_id`, `attributes`, `name`, `slug`, `photo`, `thumbnail`, `file`, `size`, `size_qty`, `size_price`, `color`, `price`, `previous_price`, `details`, `stock`, `policy`, `status`, `views`, `tags`, `features`, `colors`, `product_condition`, `ship`, `is_meta`, `meta_tag`, `meta_description`, `youtube`, `type`, `license`, `license_qty`, `link`, `platform`, `region`, `licence_type`, `measure`, `featured`, `best`, `top`, `hot`, `latest`, `big`, `trending`, `sale`, `created_at`, `updated_at`, `is_discount`, `discount_date`, `whole_sell_qty`, `whole_sell_discount`, `is_catalog`, `catalog_id`, `parent`, `effects`, `is_verified`) VALUES
(218, 'dY96026itW', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'Orange MAC', 'orange-mac-dy96026itw', 'vendor/68/Genetics-Clones-Orange-MAC.png', 'product-vendor-68-Genetics-Clones-Orange-MAC-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Strong aroma of citrus that closely resembles the flavor of Orange Cookies', NULL, 'Free Exchange within 24 hours of purchase.<br>', 1, 9, NULL, 'Orange MAC Clones', '#000000', 0, NULL, 0, 'Orange MAC,clones', 'Orange MAC clones', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-03 22:46:49', '2021-03-10 04:14:52', 0, NULL, NULL, NULL, 0, 0, 'Orange Juice, Girl Scout Cookies', 'pain relief, relaxed, sleepy', 0),
(219, 'uUW8990ZbM', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Gelatamo', 'gelatamo-uuw8990zbm', 'vendor/68/Genetics-Clones-Gelatamo.png', 'product-vendor-68-Genetics-Clones-Gelatamo-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Taking the famous Gelato strain to the next level.', 100, 'Free exchanges within 48 hours of delivery.', 1, 8, 'Gelatamo,clones', 'Gelatamo Clones', '#000000', 0, NULL, 0, 'Gelatamo,clones', 'Gelatamo clones', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-03 23:34:33', '2021-03-10 05:23:10', 0, NULL, NULL, NULL, 0, 0, 'Gelato, Cookies, GMO', 'euphoric, relaxed', 0),
(220, 'poY9679Q2u', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Ice Cream Sandwich', 'ice-cream-sandwich-poy9679q2u', 'vendor/68/Genetics-Clones-+-Ice Cream Sandwich.png', 'product-vendor-68-Genetics-Clones-+-Ice Cream Sandwich-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Ice Cream Sandwich features a creamy flavor profile with sweet hints of vanilla and sugary dough.', 100, 'Free exchanges within 48 hours of delivery.', 1, 4, 'Ice Cream Sandwich,clones', 'Ice Cream Sandwich Clones', '#000000', 0, NULL, 0, 'Ice Cream Sandwich clones', 'Ice Cream Sandwich clones', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-03 23:46:04', '2021-03-08 23:14:42', 0, NULL, NULL, NULL, 0, 0, 'Ice Cream Cake, ?', 'relaxed', 0),
(221, 'DuF2363SGS', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'I-95 GMO', 'i-95-gmo-duf2363sgs', 'vendor/68/Genetics-Clones-I-95-GMO.png', 'product-vendor-68-Genetics-Clones-I-95-GMO-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Produce dense, light green buds covered in glistening trichomes.Has a pungent bouquet of diesel fuel and sour funk.', 100, 'Free exchanges within 48 hours of delivery.', 1, 13, 'I-95 GMO,Clone', 'I-95 GMO Clones', '#000000', 0, NULL, 0, 'I-95 GMO Clone', 'I-95 GMO Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 15:22:45', '2021-03-11 20:57:49', 0, NULL, NULL, NULL, 0, 0, 'Triangle Kush, Legend OG, Stardawg IX2', 'relaxed', 0),
(222, 'rfb3603Qwu', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Lava Flow', 'lava-flow-rfb3603qwu', 'vendor/68/Genetics-Clones-+-Lava Flow.png', 'product-vendor-68-Genetics-Clones-+-Lava Flow-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'This fire strain features an earthy sweet flavoring that will fill a room with a strong, pungent fragrance.', 100, 'Free exchanges within 48 hours of delivery.', 1, 3, 'Lava,Lava Flow,Clone', 'Lava Flow Clones', '#000000', 0, NULL, 0, 'Lava Flow Clone', 'Lava Flow Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 15:56:21', '2021-03-11 15:15:52', 0, NULL, NULL, NULL, 0, 0, 'Melonade and Lava Cakes', 'relaxed', 0),
(223, 'Lu446006Y3', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Runtz', 'runtz-lu446006y3', 'vendor/68/Genetics-Clones-+-Runtz.png', 'product-vendor-68-Genetics-Clones-+-Runtz-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, '', 100, 'Free exchanges within 48 hours of delivery.', 1, 4, 'Runtz,Clone', 'Runtz Clones', '#000000', 0, NULL, 0, 'Runtz Clone', 'Runtz Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 15:59:47', '2021-03-10 15:47:06', 0, NULL, NULL, NULL, 0, 0, 'Zkittlez, Gelato', 'euphoric, uplifted', 0),
(224, 'JPM5307d22', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Puffo Gelato', 'puffo-gelato-jpm5307d22', 'vendor/68/Genetics-Clones-+-Puffo Gelato.png', 'product-vendor-68-Genetics-Clones-+-Puffo Gelato-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, '', 100, 'Free exchanges within 48 hours of delivery.', 1, 1, 'Puffo Gelato,Gelato,Clone', 'Puffo Gelato Clones', '#000000', 0, NULL, 0, 'Puffo Gelato Clone', 'Puffo Gelato Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 16:16:25', '2021-03-10 02:41:30', 0, NULL, NULL, NULL, 0, 0, 'Blue Sherbert, French Toast', NULL, 0),
(225, 'kxG5808MZP', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Apricot Gelato', 'apricot-gelato-kxg5808mzp', '', NULL, NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'It is extremely fruity with flavors of Apricot and smooth as a cold scoop of Gelato', 100, 'Free exchanges within 48 hours of delivery.', 1, 4, 'Apricot,Gelato,Clone', 'Apricot Gelato Clones', '#000000', 0, NULL, 0, 'Apricot Gelato Clone', 'Apricot Gelato Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 16:25:11', '2021-03-10 17:30:44', 0, NULL, NULL, NULL, 0, 0, 'Gelato and Orange Apricot', 'euphoric, relaxed', 0),
(226, 'nL06369ba4', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Biscotti', 'biscotti-nl06369ba4', 'vendor/68/Genetics-Clones-Biscotti.png', 'product-vendor-68-Genetics-Clones-Biscotti-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Gelato #25, South Florida OG', 100, 'Free exchanges within 48 hours of delivery.', 1, 1, 'Biscotti,Menthol,Clone', 'Biscotti Clones', '#000000', 0, NULL, 0, 'Biscotti Clone', 'Biscotti Clone', 'Briscotti', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 16:37:54', '2021-03-08 23:26:57', 0, NULL, NULL, NULL, 0, 0, '', 'euphoric, happy, energetic', 0),
(227, 'oyr7388XTT', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Mentholato', 'erty', '', NULL, NULL, NULL, NULL, NULL, NULL, 14.29, 0, '', 100, 'Free exchanges within 48 hours of delivery.', 1, 4, 'Mentholato,Clone', 'Mentholato Clones', '#000000', 0, NULL, 0, 'Mentholato Clone', 'Mentholato Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 16:46:27', '2021-03-09 00:14:39', 0, NULL, NULL, NULL, 0, 0, '', NULL, 0),
(228, 'xfe7854YAQ', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Sour Bubba', 'sour-bubba-xfe7854yaq', 'vendor/68/Genetics-Clones-+-Sour Bubba.png', 'product-vendor-68-Genetics-Clones-+-Sour Bubba-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Show unique flavors and effects that speak to their long, potent lineages.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Sour Bubba,Clone', 'Sour Bubba Clones', '#000000', 0, NULL, 0, 'Sour bubba Clone', 'Sour Bubba Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 16:53:54', '2021-03-05 16:54:00', 0, NULL, NULL, NULL, 0, 0, 'Diesel, Bubba Kush', 'relaxed, energetic', 0),
(229, 'EpY8099tHL', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Pink Panties', 'pink-panties-epy8099thl', 'vendor/68/Genetics-Clones-+-Pink Panties.png', 'product-vendor-68-Genetics-Clones-+-Pink Panties-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Delivers a smooth smoking experience that is citrus-forward, but lightly herbal on the exhale.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Pink Panties,Clone', 'Pink Panties Clones', '#000000', 0, NULL, 0, 'Pink Panties Clone', 'Pink Panties Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 17:03:12', '2021-03-05 17:03:17', 0, NULL, NULL, NULL, 0, 0, 'Florida Kush and Burmese Landrace strain.', 'relaxed', 0),
(230, 'aIF86097UH', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Jungle Cake', 'jungle-cake-aif86097uh', 'vendor/68/Genetics-Clones-+-Jungle Cake.png', 'product-vendor-68-Genetics-Clones-+-Jungle Cake-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'It has a really sweet taste and a truly balanced set of effects.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Jungle Cake,Clone', 'Jungle Cake Clones', '#000000', 0, NULL, 0, 'Jungle Cake Clone', 'Jungle Cake Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 17:11:22', '2021-03-05 17:11:27', 0, NULL, NULL, NULL, 0, 0, '', 'happy , euphoric', 0),
(231, 'OEy9141ity', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Dosilato', 'dosilato-oey9141ity', 'vendor/68/Genetics-Clones-Dosilato.png', 'product-vendor-68-Genetics-Clones-Dosilato-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Dolato is a sweet-smelling cannabis strain that has notes of pine and earth.', 100, 'Free exchanges within 48 hours of delivery.', 1, 1, 'Dosilato,Clone', 'Dosilato Clones', '#000000', 0, NULL, 0, 'Dosilato Clone', 'Dosilato Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 17:21:06', '2021-03-08 23:27:27', 0, NULL, NULL, NULL, 0, 0, 'Gelato #41 and Do-Si-Dos', 'relaxed, dazed', 0),
(232, 'm3t0263462', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'MR E', 'mr-e-m3t0263462', 'vendor/68/Genetics-Clones-MR-E.png', 'product-vendor-68-Genetics-Clones-MR-E-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Mr. E is an indica variety from MassMedicalStrains and can be cultivated indoors (where the plants will need a flowering time of ±63 days), outdoors and in the greenhouse.', 100, 'Free exchanges within 48 hours of delivery.', 1, 2, 'Mr. E,Clone', 'MR E Clones', '#000000', 0, NULL, 0, 'Mr. E Clone', 'Mr. E Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 17:32:34', '2021-03-09 22:46:22', 0, NULL, NULL, NULL, 0, 0, '?', 'euphoric, happy', 0),
(233, 'Hwa0508qAX', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Blue Dragon', 'blue-dragon-hwa0508qax', 'vendor/68/Genetics-Clones-+-Blue Dragon.png', 'product-vendor-68-Genetics-Clones-+-Blue Dragon-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'The flowers of this strain often turn dark purple and are covered in bright orange pistils and white trichomes.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Blue Dragon,Clone', 'Blue Dragon Clones', '#000000', 0, NULL, 0, 'Blue Dragon Clone', 'Blue Dragon Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 17:37:41', '2021-03-05 17:37:45', 0, NULL, NULL, NULL, 0, 0, 'Blueberry, Sour Diesel', 'euphoric, uplifted', 0),
(234, 'q3a0689tom', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Ice Cream Cake', 'ice-cream-cake-q3a0689tom', 'vendor/68/Genetics-Clones-+-Ice Cream Cake.png', 'product-vendor-68-Genetics-Clones-+-Ice Cream Cake-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Expect a creamy vanilla-like aroma from these buds with a slightly nutty and sometimes cheesy undertone.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Ice Cream Cake,Clone', 'Ice Cream Cake Clones', '#000000', 0, NULL, 0, 'Ice Cream Cake Clone', 'Ice Cream Cake Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 17:43:04', '2021-03-05 17:43:07', 0, NULL, NULL, NULL, 0, 0, 'Wedding Cake, Gelato#33', 'relaxed, pain relief, sleepy', 0),
(235, 'ooe1029hk8', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Wedding Pie', 'wedding-pie-ooe1029hk8', 'vendor/68/Genetics-Clones-Wedding-Pie.png', 'product-vendor-68-Genetics-Clones-Wedding-Pie-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Puts out a fragrant, fruity dessert aroma that is sweet, lemony, and gassy.', 100, 'Free exchanges within 48 hours of delivery.', 1, 1, 'Wedding Pie,Clone', 'Wedding Pie Clones', '#000000', 0, NULL, 0, 'Wedding Pie Clone', 'Wedding Pie Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 17:47:39', '2021-03-09 00:15:44', 0, NULL, NULL, NULL, 0, 0, 'Wedding Cake and Grape Pie', 'relaxed, relaxed', 0),
(236, 'qf715131Np', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Xanadu', 'xanadu-qf715131np', 'vendor/68/Genetics-Clones-+-Xanadu.png', 'product-vendor-68-Genetics-Clones-+-Xanadu-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'It produces a lovely scent reminiscent of sweet butter, blueberries, and\r\n vanilla. Its flavor is that of blueberry pie and lemony undertones.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Xanadu,Clone', 'Xanadu Clones', '#000000', 0, NULL, 0, 'Xanadu Clone', 'Xanadu Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 17:56:01', '2021-03-05 17:56:05', 0, NULL, NULL, NULL, 0, 0, 'X18, DC 99', 'euphoric', 0),
(237, '30u1859lUj', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Stuffed French Toast', 'stuffed-french-toast-30u1859luj', 'vendor/68/Genetics-Clones-+-Stuffed French Toast.png', 'product-vendor-68-Genetics-Clones-+-Stuffed French Toast-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'This strain carries a pungent cinnamon, orange, pine and herbal aroma and flavor', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Stuffed French Toast,Clone', 'Stuffed French Toast Clones', '#000000', 0, NULL, 0, 'Stuffed French Toast Clone', 'Stuffed French Toast Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 18:03:31', '2021-03-05 18:03:35', 0, NULL, NULL, NULL, 0, 0, '', '', 0),
(238, 'ibZ2345eXZ', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Triangle Mintz', 'triangle-mintz-ibz2345exz', 'vendor/68/Genetics-Clones-Triangle-Mintz.png', 'product-vendor-68-Genetics-Clones-Triangle-Mintz-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Has a rich herbal overtones and a spicy mint as you exhale.', 100, 'Free exchanges within 48 hours of delivery.', 1, 1, 'Triangle Mintz,Clone', 'Triangle Mintz Clones', '#000000', 0, NULL, 0, 'Triangle Mintz Clone', 'Triangle Mintz Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 18:10:12', '2021-03-08 23:25:07', 0, NULL, NULL, NULL, 0, 0, '', '', 0),
(239, 'tjB2827soH', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Planet Dosilato#1', 'planet-dosilato1-tjb2827soh', 'vendor/68/Genetics-Clones-Planet-Dosilato1.png', 'product-vendor-68-Genetics-Clones-Planet-Dosilato1-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'This bud brings on a super sweet and nutty cookie taste with hints of sour citrus and fresh berries.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Planet Dosilato#1,Clone', 'Planet Dosilato#1 Clones', '#000000', 0, NULL, 0, 'Planet Dosilato#1 Clone', 'Planet Dosilato#1 Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 18:16:58', '2021-03-10 02:18:27', 0, NULL, NULL, NULL, 0, 0, 'Gelato, Dosi Do', NULL, 0),
(240, '0UF3102b1L', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Planet Dosilato #5', 'planet-dosilato-5-0uf3102b1l', 'vendor/68/Genetics-Clones-Planet-Dosilato-5.png', 'product-vendor-68-Genetics-Clones-Planet-Dosilato-5-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'This bud brings on a super sweet and nutty cookie taste with hints of sour citrus and fresh berries', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Planet Dosilato #5,Clone', 'Planet Dosilato #5 Clones', '#000000', 0, NULL, 0, 'Planet Dosilato #5 Clone', 'Planet Dosilato #5 Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 18:19:51', '2021-03-10 02:20:23', 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 0),
(241, 'U6k3562uQU', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Cake Mintz', 'cake-mintz-u6k3562uqu', 'vendor/68/Genetics-Clones-+-Cake Mintz.png', 'product-vendor-68-Genetics-Clones-+-Cake Mintz-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Nice cool gas aroma', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Cake Mintz,Clone', 'Cake Mintz Clones', '#000000', 0, NULL, 0, 'Cake Mintz Clone', 'Cake Mintz Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 18:29:34', '2021-03-05 18:29:40', 0, NULL, NULL, NULL, 0, 0, '?', 'relaxed, uplifted', 0),
(242, 'ZTQ3809NPy', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'GMO Cookies', 'gmo-cookies-ztq3809npy', 'vendor/68/Genetics-Clones-+-GMO Cookies.png', 'product-vendor-68-Genetics-Clones-+-GMO Cookies-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, '', 100, 'Free exchanges within 48 hours of delivery.', 1, 2, 'GMO Cookies,Clone', 'GMO Cookies Clones', '#000000', 0, NULL, 0, 'GMO Cookies  Clone', 'GMO Cookies Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 18:40:41', '2021-03-05 23:04:00', 0, NULL, NULL, NULL, 0, 0, 'Chemdog, Girl Scout Cookies', 'relaxed, pain relief', 0),
(243, 'x7V4463DYD', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Mars OG', 'mars-og-x7v4463dyd', 'vendor/68/Genetics-Clones-+-Mars OG.png', 'product-vendor-68-Genetics-Clones-+-Mars OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Has a  dense bud, a high flower-to-leaf ratio.Features a hearty, thick taste and pungent smell', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Mars OG,Clone', 'Mars OG Clones', '#000000', 0, NULL, 0, 'Mars OG Clone', 'Mars OG Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 18:44:50', '2021-03-05 18:44:54', 0, NULL, NULL, NULL, 0, 0, 'Mars and OG', 'pain relief, sleepy', 0),
(244, '1d34742NyF', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Purple Larry', 'sdfg', '', NULL, NULL, NULL, NULL, NULL, NULL, 14.29, 0, '', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Purple Larry,Clone', 'Purple Larry Clones', '#000000', 0, NULL, 0, 'Purple Larry Clone', 'Purple Larry Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 18:46:44', '2021-03-05 18:46:44', 0, NULL, NULL, NULL, 0, 0, '', NULL, 0),
(245, 'pVN4919gVn', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Blue Dream', 'blue-dream-pvn4919gvn', 'vendor/68/Genetics-Clones-+-Blue Dream.png', 'product-vendor-68-Genetics-Clones-+-Blue Dream-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, '', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Blue Dream,Clone', 'Blue Dream Clones', '#000000', 0, NULL, 0, 'Blue Dream Clone', 'Blue Dream Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 18:51:58', '2021-03-05 18:52:04', 0, NULL, NULL, NULL, 0, 0, 'Bluebery, Haze', 'euphoric, relaxed', 0),
(246, 'g6k5201fUA', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Gorilla Butter OG', 'gorilla-butter-og-g6k5201fua', '', NULL, NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Very powerful strain with big taste.<br>', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Gorilla Butter OG,Clone', 'Gorilla Butter OG Clones', '#000000', 0, NULL, 0, 'Gorilla Butter OG Clone', 'Gorilla Butter OG Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 18:54:38', '2021-03-08 21:28:59', 0, NULL, NULL, NULL, 0, 0, 'GG4, OG Kush', 'relaxed, euphoric', 0),
(247, 'eOa5878H7h', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'King Kush', 'king-kush-eoa5878h7h', 'vendor/68/Genetics-Clones-+-King Kush.png', 'product-vendor-68-Genetics-Clones-+-King Kush-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'The buds are densely covered by dark green leaves with hues of purple \r\nand abnormal looking calyxes. It has a tangy and intense aroma with an \r\nunforgettable taste of grapefruit but with woody undertones', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'King Kush,Clone', 'King Kush Clones', '#000000', 0, NULL, 0, 'King Kush Clone', 'King Kush Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 19:10:20', '2021-03-05 19:10:24', 0, NULL, NULL, NULL, 0, 0, 'OG Kush and Grape Ape', 'euphoric, relaxed', 0),
(248, 'IFe6270Hx9', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'King Louis XIII', 'king-louis-xiii-ife6270hx9', 'vendor/68/Genetics-Clones-+-King Louis XIII.png', 'product-vendor-68-Genetics-Clones-+-King Louis XIII-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Odor that’s meant to be enjoyed\r\nDense nugs have an overwhelmingly piney smell with an earthy musk\r\nSpicy kush aroma', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'King Louis XIII,Clone', 'King Louis XIII Clones', '#000000', 0, NULL, 0, 'King Louis XIII Clone', 'King Louis XIII Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 19:14:47', '2021-03-05 19:14:52', 0, NULL, NULL, NULL, 0, 0, 'OG Kush, LA Confidential', 'relaxed, pain relief, happy', 0),
(249, 'JaZ6608PkV', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'BTY OG', 'bty-og-jaz6608pkv', 'vendor/68/Genetics-Clones-+-BTY OG.png', 'product-vendor-68-Genetics-Clones-+-BTY OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'The flavor and aroma of this strain is unique with earth, pine, and wood with elements of sour lemon come through on the exhale.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'BTY OG,Clone', 'BTY OG Clones', '#000000', 0, NULL, 0, 'BTY OG Clone', 'BTY OG Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 19:21:53', '2021-03-05 19:21:56', 0, NULL, NULL, NULL, 0, 0, 'OG Kush genetics with two Unknowns', 'relaxed, euphoric', 0),
(250, 'CdR715302V', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Bubba Fire', 'bubba-fire-cdr715302v', 'vendor/68/Genetics-Clones-Bubba-Fire.png', 'product-vendor-68-Genetics-Clones-Bubba-Fire-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'It tastes like pine and sweet oranges, while the aroma  is piquant lemons and kush', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Bubba Fire,Clone', 'Bubba Fire Clones', '#000000', 0, NULL, 0, 'Bubba Fire Clone', 'Bubba Fire Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 19:29:28', '2021-03-05 19:34:31', 0, NULL, NULL, NULL, 0, 0, 'White Fire OG and Bubba Kush', 'happy, relaxed, sleepy', 0),
(251, 'DsE8706s4g', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Sunset Sherbet', 'sunset-sherbet-dse8706s4g', 'vendor/68/Genetics-Clones-+-Sunset Sherbet.png', 'product-vendor-68-Genetics-Clones-+-Sunset Sherbet-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Sunset Sherbet smells of honey dipped skunk and when it’s burned, it tastes like a peach yogurt with honey drizzled over the top.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Sunset Sherbet,Clone', 'Sunset Sherbet Clones', '#000000', 0, NULL, 0, 'Sunset Sherbet Clone', 'Sunset Sherbet Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 19:54:50', '2021-03-05 19:54:55', 0, NULL, NULL, NULL, 0, 0, 'Pink Panties and GSC.', 'relaxed', 0),
(252, 'Mth9873glj', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Doggystyle Cookies', 'dfghj', '', NULL, NULL, NULL, NULL, NULL, NULL, 14.29, 0, '', 100, 'Free exchanges within 48 hours of delivery.', 1, 1, 'Doggystyle Cookies,Clone', 'Doggystyle Cookies Clones', '#000000', 0, NULL, 0, 'Doggystyle Cookies Clone', 'Doggystyle Cookies Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 20:12:35', '2021-03-09 06:42:31', 0, NULL, NULL, NULL, 0, 0, '', NULL, 0),
(253, 'sq70188ARL', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Slimer OG', 'slimer-og-sq70188arl', 'vendor/68/Genetics-Clones-+-Slimer OG.png', 'product-vendor-68-Genetics-Clones-+-Slimer OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Offers a delicious earthy aroma, an air of OG Kush on the finish.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Slimer OG,Clone', 'Slimer OG Clones', '#000000', 0, NULL, 0, 'Slimer OG Clone', 'Slimer OG Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 20:17:29', '2021-03-05 20:17:33', 0, NULL, NULL, NULL, 0, 0, 'Ghost OG, White Fire', 'hungry', 0),
(254, 'mGI0287ZX5', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'GSC', 'gsc-mgi0287zx5', 'vendor/68/Genetics-Clones-+-GSC.png', 'product-vendor-68-Genetics-Clones-+-GSC-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'GSC is loved for its sweet and pungent flavor profile with notes of mint, cherry and lemon.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'GSC,Clone', 'GSC Clones', '#000000', 0, NULL, 0, 'GSC Clone', 'GSC Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 20:20:42', '2021-03-05 20:20:46', 0, NULL, NULL, NULL, 0, 0, 'OG Kush, Durban Poison', 'euphoric, relaxed, pain relief, hungry', 0),
(255, 'dPz0483nbD', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'SFV OG', 'sfv-og-dpz0483nbd', 'vendor/68/Genetics-Clones-+-SFV OG.png', 'product-vendor-68-Genetics-Clones-+-SFV OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Leading with aromatic notes of earthy pine and lemon, its body effects take a little longer to feel than the initial head haziness', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'SFV OG,Clone', 'SFV OG Clones', '#000000', 0, NULL, 0, 'SFV OG Clone', 'SFV OG Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 20:24:49', '2021-03-05 20:24:53', 0, NULL, NULL, NULL, 0, 0, 'Afghani, SFV OG', 'pain relief, energetic, uplifted', 0),
(256, 'F4e0743w0q', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'OG #18', 'og-18-f4e0743w0q', 'vendor/68/Genetics-Clones-OG--18.png', 'product-vendor-68-Genetics-Clones-OG-18-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'OG #18 has a distinct&nbsp;diesel Kush flavor&nbsp;with sour undertones.', 100, 'Free exchanges within 48 hours of delivery.', 1, 2, 'OG #18,Clone', 'OG #18 Clones', '#000000', 0, NULL, 0, 'OG #18 Clone', 'OG #18 Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 20:30:59', '2021-03-05 22:52:09', 0, NULL, NULL, NULL, 0, 0, 'OG Kush', 'relaxed', 0),
(257, 'fJm1267koG', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Gorilla Glue #4', 'gorilla-glue-4-fjm1267kog', '', NULL, NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'It smells of diesel and pine, while having a distinct chocolatey and coffee-like aftertaste.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Gorilla Glue #4,Clone', 'Gorilla Glue #4 Clones', '#000000', 0, NULL, 0, 'Gorilla Glue #4 Clone', 'Gorilla Glue #4 Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 20:36:17', '2021-03-05 22:33:57', 0, NULL, NULL, NULL, 0, 0, 'Sour Diesel, Sour Dubb, Chem’s Sister, Chocolate Diesel', 'euphoric, relaxed', 0),
(258, '1nd1911OLW', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Blueberry OG', 'blueberry-og-1nd1911olw', 'vendor/68/Genetics-Clones-Blueberry-OG.png', 'product-vendor-68-Genetics-Clones-Blueberry-OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Has exceptional CBD yielding qualities and flavors of sweet camphor and sandalwood.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Blueberry OG,Clone', 'Blueberry OG Clones', '#000000', 0, NULL, 0, 'Blueberry OG Clone', 'Blueberry OG Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 20:48:59', '2021-03-05 20:53:01', 0, NULL, NULL, NULL, 0, 0, 'Blueberry and OG Kush', 'relaxed', 0),
(259, '2yF29453IP', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'OG #9', 'qwee', '', NULL, NULL, NULL, NULL, NULL, NULL, 14.29, 0, '', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'OG #9,Clone', 'OG #9 Clones', '#000000', 0, NULL, 0, 'OG #9 Clone', 'OG #9 Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 21:03:46', '2021-03-05 21:03:46', 0, NULL, NULL, NULL, 0, 0, '', NULL, 0),
(260, 'nYB3445cDq', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Jack Herer', 'jack-herer-nyb3445cdq', 'vendor/68/Genetics-Clones-+-Jack Herer.png', 'product-vendor-68-Genetics-Clones-+-Jack Herer-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Has a  light floral scent having undertones of fresh soil and lemon zest', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Jack Herer,Clone', 'Jack Herer Clones', '#000000', 0, NULL, 0, 'Jack Herer Clone', 'Jack Herer Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 21:14:42', '2021-03-05 21:18:34', 0, NULL, NULL, NULL, 0, 0, 'Haze, Northern Lights #5, Shiva Skunk', 'euphoric, creative, focused', 0),
(261, 'Bvq3932mEi', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Green Crack', 'green-crack-bvq3932mei', 'vendor/68/Genetics-Clones-Green-Crack.png', 'product-vendor-68-Genetics-Clones-Green-Crack-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Green Crack often smells of lemon tea, being rich and earthy with a light citrusy undertone.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Green Crack,Clone', 'Green Crack Clones', '#000000', 0, NULL, 0, 'Green Crack Clone', 'Green Crack Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 21:23:16', '2021-03-05 21:30:31', 0, NULL, NULL, NULL, 0, 0, 'Skunk #1 and an Unknown Indica', 'energetic, happy', 0),
(262, 'C704661lRW', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Super Lemon Haze', 'super-lemon-haze-c704661lrw', 'vendor/68/Genetics-Clones-+-Super Lemon Haze.png', 'product-vendor-68-Genetics-Clones-+-Super Lemon Haze-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'The smell is zesty, citrusy, and a little sweet.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Super Lemon Haze,Clone', 'Super Lemon Haze Clones', '#000000', 0, NULL, 0, 'Super Lemon Haze Clone', 'Super Lemon Haze Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 21:36:09', '2021-03-05 21:36:13', 0, NULL, NULL, NULL, 0, 0, 'Lemon Skunk, Super Silver Haze', 'energetic, uplifted', 0),
(263, 'OHN5037nQ8', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Chernobyl', 'chernobyl-ohn5037nq8', 'vendor/68/Genetics-Clones-+-Chernobyl.png', 'product-vendor-68-Genetics-Clones-+-Chernobyl-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'This strain produces dreamy effects that are long-lasting and may boost your mood.It smells like lime sherbet.', 100, 'Free exchanges within 48 hours of delivery.', 1, 1, 'Chernobyl,Clone', 'Chernobyl Clones', '#000000', 0, NULL, 0, 'Chernobyl Clone', 'Chernobyl Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 21:39:54', '2021-03-06 03:02:15', 0, NULL, NULL, NULL, 0, 0, 'Trainwreck, Jack the Ripper, Trinity', 'happy, uplifted, relaxed', 0),
(264, 'l0u52677RK', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Kushberry', 'kushberry-l0u52677rk', 'vendor/68/Genetics-Clones-+-Kushberry.png', 'product-vendor-68-Genetics-Clones-+-Kushberry-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Emits an exotic flavor.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Kushberry,Clone', 'Kushberry Clones', '#000000', 0, NULL, 0, 'Kushberry Clone', 'Kushberry Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 21:42:39', '2021-03-05 21:42:42', 0, NULL, NULL, NULL, 0, 0, 'Blueberry,  OG Kush', 'pain relief', 0),
(265, 'gfM5444tAn', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Raskal OG', 'raskal-og-gfm5444tan', 'vendor/68/Genetics-Clones-+-Raskal OG.png', 'product-vendor-68-Genetics-Clones-+-Raskal OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Features smells of lemon and pine, a musty and grassy taste.Eshibits dense light and dark green colored buds.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Raskal OG,Clone', 'Raskal OG Clones', '#000000', 0, NULL, 0, 'Raskal OG Clone', 'Raskal OG Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 21:46:54', '2021-03-05 21:46:57', 0, NULL, NULL, NULL, 0, 0, 'OG Kush, SFV OG Kush', 'relaxed, euphoric', 0),
(266, '6aR5688LnK', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Tahoe OG', 'tahoe-og-6ar5688lnk', 'vendor/68/Genetics-Clones-+-Tahoe OG.png', 'product-vendor-68-Genetics-Clones-+-Tahoe OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Aromatic notes of earthy pine, lemon', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Tahoe OG,Clone', 'Tahoe OG Clones', '#000000', 0, NULL, 0, 'Tahoe OG Clone', 'Tahoe OG Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-05 21:49:59', '2021-03-06 21:30:37', 0, NULL, NULL, NULL, 0, 0, '', 'pain relief, relaxed', 0),
(267, 'CWj5417OQI', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'DJ Shorts Blueberry', 'dj-shorts-blueberry-cwj5417oqi', 'vendor/68/Genetics-Clones-+-DJ Shorts Blueberry.png', 'product-vendor-68-Genetics-Clones-+-DJ Shorts Blueberry-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Its scent and flavor are reminiscent of sweet blueberries, with undertones of skunk.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'DJ Shorts Blueberry,Clone', 'DJ Shorts Blueberry Clones', '#000000', 0, NULL, 0, 'DJ Shorts Blueberry Clone', 'DJ Shorts Blueberry Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-06 03:24:40', '2021-03-06 03:24:44', 0, NULL, NULL, NULL, 0, 0, ' Purple Thai, Sativa Thai', 'relaxed, happy, euphoric,', 0),
(268, '4A25976ZUO', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Diamond OG', 'diamond-og-4a25976zuo', 'admin/Genetics-Clones-Diamond-OG.png', 'product-vendor-68-Genetics-Clones-Diamond-OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Has the familiar OG aroma of citrus-pine supported by diesel undertones  \r\nThese sparkling nugs will be condensed, have a strong odor', 100, 'Free exchanges within 48 hours of delivery.', 1, 3, 'Diamond OG,Clone', 'Diamond OG Clones', '#000000', 0, NULL, 0, 'Diamond OG Clone', 'Diamond OG Clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-06 03:30:06', '2021-03-07 03:00:42', 0, NULL, NULL, NULL, 0, 0, 'OG Kush, ?', 'relaxed, euphoric', 0),
(269, '2R35170R2z', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'madman OG', 'madman-og-2r35170r2z', 'vendor/68/Genetics-Clones-+-madman OG.png', 'product-vendor-68-Genetics-Clones-+-madman OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, '', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'madman OG,clone', 'madman OG Clones', '#000000', 0, NULL, 0, 'madman OG clone', 'madman OG clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 02:28:17', '2021-03-08 02:28:21', 0, NULL, NULL, NULL, 0, 0, '', '', 0),
(270, '6p153937fI', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Skywalker OG', 'skywalker-og-6p153937fi', 'vendor/68/Genetics-Clones-+-Skywalker OG.png', 'product-vendor-68-Genetics-Clones-+-Skywalker OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Brings smells of spicy diesel and leaves, an mild herbal aftertaste. The bud are dense, medium sized, with olive colored with fuzzy burnt orange pistils. When harvested the buds are very sticky and covered in trichomes.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Skywalker OG,clone', 'Skywalker OG Clones', '#000000', 0, NULL, 0, 'Skywalker OG clone', 'Skywalker OG clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 02:43:36', '2021-03-08 21:38:02', 0, NULL, NULL, NULL, 0, 0, 'Skywalker, OG Kush', 'pain relief, relaxed', 0),
(271, 'Lme6669ryt', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Alien OG', 'alien-og-lme6669ryt', 'vendor/68/Genetics-Clones-+-Alien OG.png', 'product-vendor-68-Genetics-Clones-+-Alien OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'It has an incredibly sweet piney smell and pungent taste with some crops emitting a lemony zest.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Alien OG,clone', 'Alien OG Clones', '#000000', 0, NULL, 0, 'Alien OG clone', 'Alien OG clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 02:53:54', '2021-03-08 16:17:30', 0, NULL, NULL, NULL, 0, 0, 'Tahoe OG, Alien Kush', 'pain-relief, relaxed, sleepy', 0),
(272, 'vQr5419Dnf', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Motorbreath', 'motorbreath-og-vqr5419dnf', 'vendor/68/Genetics-Clones-+-Motorbreath OG.png', 'product-vendor-68-Genetics-Clones-+-Motorbreath OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Has a pungent diesel-like scent that it emits once its ready for harvest', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Motorbreath,clone', 'Motorbreath Clones', '#000000', 0, NULL, 0, 'Motorbreath clone', 'Motorbreath clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 16:25:29', '2021-03-08 16:50:10', 0, NULL, NULL, NULL, 0, 0, 'Chem D, SFV OG Kush', 'relaxed, focused', 0),
(273, 'c9d64442V8', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'LA Confidential', 'la-confidential-c9d64442v8', 'vendor/68/Genetics-Clones-+-LA Confidential.png', 'product-vendor-68-Genetics-Clones-+-LA Confidential-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'The buds are various shades of green, teal, and sometimes purple with frosty patches of crystal trichomes.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'LA Confidential,clone', 'LA Confidential Clones', '#000000', 0, NULL, 0, 'LA Confidential clone', 'LA Confidential clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 16:43:16', '2021-03-08 16:43:19', 0, NULL, NULL, NULL, 0, 0, 'OG LA Affie', 'euphoric, relaxed, pain-relief, happy, sleepy', 0),
(274, 'fBh92917zs', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Larry OG', 'larry-og-fbh92917zs', 'vendor/68/Genetics-Clones-Larry-OG.png', 'product-vendor-68-Genetics-Clones-Larry-OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Its buds are quite dense and produce pistils that are distinctly longer than average with a burnt orange color.', 100, 'Free exchanges within 48 hours of delivery.', 1, 3, 'Larry OG,clone', 'Larry OG Clones', '#000000', 0, NULL, 0, 'Larry OG clone', 'Larry OG clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 17:34:49', '2021-03-10 15:46:46', 0, NULL, NULL, NULL, 0, 0, 'OG Kush, SFV OG', 'happy, relaxed, pain-relief, uplifted', 0),
(275, 'vN997833pu', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Chemdawg', 'chemdawg-vn997833pu', 'vendor/68/Genetics-Clones-+-Chemdawg.png', 'product-vendor-68-Genetics-Clones-+-Chemdawg-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Its scent and taste are of diesel and spicy wet earth. Its harvest-ready buds are bulbous and vivid green.', 100, 'Free exchanges within 48 hours of delivery.', 1, 1, 'Chemdawg,clone', 'Chemdawg Clones', '#000000', 0, NULL, 0, 'Chemdawg clone', 'Chemdawg clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 17:45:56', '2021-03-10 17:30:15', 0, NULL, NULL, NULL, 0, 0, 'Nepalese, Thai', 'euphoric, happy, relaxed, pain-relief,', 0),
(276, 'wPf0590x2g', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Earth OG', 'earth-og-wpf0590x2g', 'vendor/68/Genetics-Clones-+-Earth OG.png', 'product-vendor-68-Genetics-Clones-+-Earth OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Delivering a spicy, earthy scent and flavor it produces with undertones of citrus/lemon. Its harvest-ready buds are small and fluffy, popcorn- corn shaped, minty green, and speckled with long fiery orange pistils.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Earth OG,clone', 'Earth OG Clones', '#000000', 0, NULL, 0, 'Earth OG clone', 'Earth OG clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 17:56:51', '2021-03-08 17:56:55', 0, NULL, NULL, NULL, 0, 0, 'Sour Diesel, Ghost OG', 'creative, energetic, uplifted, euphoric, relaxed', 0),
(277, 'BTf1071mZM', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Diablo', 'diablo-btf1071mzm', 'vendor/68/Genetics-Clones-+-Diablo.png', 'product-vendor-68-Genetics-Clones-+-Diablo-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'It produces a scent and flavor that are reminiscent of both its parents, being sweet in flavor and having hints of berries buried beneath its spicy earthen overtones.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Diablo,clone', 'Diablo Clones', '#000000', 0, NULL, 0, 'Diablo  clone', 'Diablo  clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 18:07:32', '2021-03-08 18:07:36', 0, NULL, NULL, NULL, 0, 0, 'Grapefruit, Blueberry', 'uplifted, relaxed, euphoric, pain-relief', 0),
(278, '2mp1753n91', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Apple Fritter', 'apple-fritter-2mp1753n91', 'vendor/68/Genetics-Clones-+-Apple Fritter.png', 'product-vendor-68-Genetics-Clones-+-Apple Fritter-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Has a flavor and aroma that come off as sweet and earthy, with a light cheesy apple pastry influence', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Apple Fritter,clone', 'Apple Fritter Clones', '#000000', 0, NULL, 0, 'Apple Fritter clone', 'Apple Fritter clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 18:13:59', '2021-03-08 18:14:02', 0, NULL, NULL, NULL, 0, 0, '??', 'relaxed', 0),
(279, 'zwt2111tfN', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Platinum Bubba', 'platinum-bubba-zwt2111tfn', 'vendor/68/Genetics-Clones-+-Platinum Bubba.png', 'product-vendor-68-Genetics-Clones-+-Platinum Bubba-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'The buds have silver color that jumps out as the first noticeable trait. The layer of trichome frost is bright white and the silver covering over vivid green leaves gives it a metallic appearance, like platinum. Wisps of orange pistils accentuate the platinum-covered green. It blends well with pungent, sweet, and floral notes. Spicy flavors meld with earthiness and sweetness to make a smooth and enjoyable smoking experience.', 100, 'Free exchanges within 48 hours of delivery.', 1, 1, 'Platinum Bubba,clone', 'Platinum Bubba Clones', '#000000', 0, NULL, 0, 'Platinum Bubba clone', 'Platinum Bubba clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 18:57:00', '2021-03-09 15:35:32', 0, NULL, NULL, NULL, 0, 0, 'Bubba Kush, OG Kush', 'relaxed, pain-relief, sleepy, hungry', 0),
(280, 'tON4648TTL', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Hindu Kush', 'hindu-kush-ton4648ttl', 'vendor/68/Genetics-Clones-+-Hindu Kush.png', 'product-vendor-68-Genetics-Clones-+-Hindu Kush-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, '', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Hindu Kush,clone', 'Hindu Kush Clones', '#000000', 0, NULL, 0, 'Hindu Kush clone', 'Hindu Kush clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 19:21:21', '2021-03-08 19:21:25', 0, NULL, NULL, NULL, 0, 0, '', 'pain-relief, euphoric, relaxed, happy, sleepy, anxious&nbsp;', 0),
(281, 'AVc6146atu', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'XXX Headband OG', 'xxx-headband-og-avc6146atu', 'vendor/68/Genetics-Clones-+-XXX Headband OG.png', 'product-vendor-68-Genetics-Clones-+-XXX Headband OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, '', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'XXX Headband OG,clone', 'XXX Headband OG Clones', '#000000', 0, NULL, 0, 'XXX Headband OG clone', 'XXX Headband OG clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 19:34:11', '2021-03-08 19:34:15', 0, NULL, NULL, NULL, 0, 0, '', '', 0),
(282, 'DBs6958EOS', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Thai Fire', 'thai-fire-dbs6958eos', '1614955341flower.jpg', 'product-vendor-68-1614955341flower.jpg', NULL, NULL, NULL, NULL, NULL, 14.29, 0, '', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Thai Fire,clone', 'Thai Fire Clones', '#000000', 0, NULL, 0, 'Thai Fire clone', 'Thai Fire clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 19:46:05', '2021-03-08 19:46:07', 0, NULL, NULL, NULL, 0, 0, '', '', 0),
(283, 'A2t7757h2F', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Jupiter OG', 'jupiter-og-a2t7757h2f', 'vendor/68/Genetics-Clones-+-Jupiter OG.png', 'product-vendor-68-Genetics-Clones-+-Jupiter OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Delivering harvest-ready buds are quite dense and dark forest green with deep orange pistils, and it smells and tastes like skunk and freshly churned soil.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Jupiter OG,clone', 'Jupiter OG Clones', '#000000', 0, NULL, 0, 'Jupiter OG clone', 'Jupiter OG clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 19:54:05', '2021-03-08 19:54:11', 0, NULL, NULL, NULL, 0, 0, '', 'creative, sleepy, pain-relief', 0),
(284, '1Gi8065Bko', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Diamond Og', 'diamond-og-1gi8065bko', 'vendor/68/Genetics-Clones-+-Diamond Og.png', 'product-vendor-68-Genetics-Clones-+-Diamond Og-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Known to harvest buds that sparkle with trichomes, creating a\r dazzle that’s reminiscent of diamonds. Their aroma and taste is of citrus and\r pine, with undertones of diesel and fresh earth.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'OG Kush,clone', 'Diamond Og Clones', '#000000', 0, NULL, 0, 'OG Kush clone', 'OG Kush clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 20:20:42', '2021-03-08 22:45:59', 0, NULL, NULL, NULL, 0, 0, 'OG Kush, ?', 'relaxed, sleepy, hungry', 0),
(285, 'UuI96623vS', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Kimbo Kush', 'kimbo-kush-uui96623vs', 'vendor/68/Genetics-Clones-+-Kimbo Kush.png', 'product-vendor-68-Genetics-Clones-+-Kimbo Kush-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'The berry flavors of Kimbo Kush come through in the smoke,\r coupled with the qualities of burnt wood.', 100, 'Free exchanges within 48 hours of delivery.', 1, 3, 'Kimbo Kush,clone', 'Kimbo Kush Clones', '#000000', 0, NULL, 0, 'Kimbo Kush clone', 'Kimbo Kush clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 20:35:55', '2021-03-08 23:14:34', 0, NULL, NULL, NULL, 0, 0, '', 'relaxed, pain-relief, anxious', 0),
(286, '7Qc0784HQp', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Gelato', 'gelato-7qc0784hqp', 'vendor/68/Genetics-Clones-+-Gelato.png', 'product-vendor-68-Genetics-Clones-+-Gelato-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Has a fruity, dessert-like aroma and produces buds that\r bloom in dark purple hues and is illuminated by fiery orange hairs and a\r shining white coat of crystal resin./p>', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Gelato,clone', 'Gelato Clones', '#000000', 0, NULL, 0, 'Gelato clone', 'Gelato clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 22:42:27', '2021-03-08 22:42:30', 0, NULL, NULL, NULL, 0, 0, 'Sunset Sherbet, Thin Mint Scout Girl Cookies', 'euphoric, relaxed, creative', 0),
(287, 'XEN8529sYV', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Birthday Cake', 'birthday-cake-xen8529syv', 'vendor/68/Genetics-Clones-+-Birthday Cake.png', 'product-vendor-68-Genetics-Clones-+-Birthday Cake-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Has a delicious vanilla flavor that’s sweet with a slightly nutty undertone and has dense, round buds that are a deep green and loaded with purple hues while covered in a thick coat of trichomes that make it look like its been dipped in frosting.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Birthday Cake,clone', 'Birthday Cake Clones', '#000000', 0, NULL, 0, 'Birthday Cake clone', 'Birthday Cake clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 22:54:29', '2021-03-08 22:54:34', 0, NULL, NULL, NULL, 0, 0, 'Girl Scout Cookies, Cherry Pie', 'relaxed, pain-relief, happy', 0);
INSERT INTO `products` (`id`, `sku`, `product_type`, `affiliate_link`, `user_id`, `category_id`, `subcategory_id`, `childcategory_id`, `location_id`, `attributes`, `name`, `slug`, `photo`, `thumbnail`, `file`, `size`, `size_qty`, `size_price`, `color`, `price`, `previous_price`, `details`, `stock`, `policy`, `status`, `views`, `tags`, `features`, `colors`, `product_condition`, `ship`, `is_meta`, `meta_tag`, `meta_description`, `youtube`, `type`, `license`, `license_qty`, `link`, `platform`, `region`, `licence_type`, `measure`, `featured`, `best`, `top`, `hot`, `latest`, `big`, `trending`, `sale`, `created_at`, `updated_at`, `is_discount`, `discount_date`, `whole_sell_qty`, `whole_sell_discount`, `is_catalog`, `catalog_id`, `parent`, `effects`, `is_verified`) VALUES
(288, '4sd890481a', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'OG kush Skunk', 'og-kush-skunk-4sd890481a', 'vendor/68/Genetics-Clones-+-OG kush Skunk.png', 'product-vendor-68-Genetics-Clones-+-OG kush Skunk-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Has a complex aroma with notes of fuel, skunk, and spice.', 100, 'Free exchanges within 48 hours of delivery.', 1, 1, 'OG kush Skunk,clone', 'OG kush Skunk Clones', '#000000', 0, NULL, 0, 'OG kush Skunk clone', 'OG kush Skunk clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 23:03:25', '2021-03-09 04:17:42', 0, NULL, NULL, NULL, 0, 0, 'Hindu Kush', 'happy, euphoric, relaxed', 0),
(289, 'vkP9436t7o', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Strawberry Milkshake', 'strawberry-milkshake-vkp9436t7o', 'vendor/68/Genetics-Clones-+-Strawberry Milkshake.png', 'product-vendor-68-Genetics-Clones-+-Strawberry Milkshake-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Has a fruity flavor.', 100, 'Free exchanges within 48 hours of delivery.', 1, 1, 'Strawberry Milkshake,clone', 'Strawberry Milkshake Clones', '#000000', 0, NULL, 0, 'Strawberry Milkshake clone', 'Strawberry Milkshake clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 23:08:00', '2021-03-11 15:15:41', 0, NULL, NULL, NULL, 0, 0, 'Strawberry Soda, White Fire Alien OG', 'relaxed, happy, energetic, sleepy', 0),
(290, '9iV9696LFJ', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Cracker Jack', 'cracker-jack-9iv9696lfj', 'vendor/68/Genetics-Clones-+-Cracker Jack.png', 'product-vendor-68-Genetics-Clones-+-Cracker Jack-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, '', 100, 'Free exchanges within 48 hours of delivery.', 1, 1, 'Cracker Jack,clone', 'Cracker Jack Clones', '#000000', 0, NULL, 0, 'Cracker Jack clone', 'Cracker Jack clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 23:13:38', '2021-03-09 02:19:31', 0, NULL, NULL, NULL, 0, 0, 'Jack Herer, Green Crack', 'energetic, focused, euphoric', 0),
(291, 'SvG0260nfu', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Corleone Kush', 'corleone-kush-svg0260nfu', 'vendor/68/Genetics-Clones-+-Corleone Kush.png', 'product-vendor-68-Genetics-Clones-+-Corleone Kush-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Has sweet fragrances of citrus, lemon,\r\n and skunk, with buds that\r\n are deep green with orange pistils all over and a generous portion of resin\r\n covering everything.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Corleone Kush,clone', 'Corleone Kush Clones', '#000000', 0, NULL, 0, 'Corleone Kush clone', 'Corleone Kush clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-08 23:28:54', '2021-03-09 02:23:06', 0, NULL, NULL, NULL, 0, 0, 'Pre-98 Bubba Kush, SFV OG Kush', 'pain-relief, sleepy, energetic, relaxed, creativity', 0),
(292, 'r7G35435tk', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'White Gorilla', 'white-gorilla-r7g35435tk', 'vendor/68/Genetics-Clones-+-white Gorilla.png', 'product-vendor-68-Genetics-Clones-+-white Gorilla-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Flowering  occurs in about 8 to 9 weeks.', 100, 'Free exchanges within 48 hours of delivery.', 1, 1, 'white Gorilla,clone', 'White Gorilla Clones', '#000000', 0, NULL, 0, 'white Gorilla clone', 'white Gorilla clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 00:28:47', '2021-03-09 04:42:09', 0, NULL, NULL, NULL, 0, 0, 'Gorilla Glue #4, White Fire Alien OG', 'uplifted', 0),
(293, 'FiD35833Nt', 'normal', NULL, 68, 18, NULL, NULL, 5, NULL, 'Chem dawg #91', 'chem-dawg-91-fid35833nt', 'vendor/68/Genetics-+-+-Chem dawg 91.png', 'product-vendor-68-Genetics-+-+-Chem dawg 91-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, '<p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size:13.5pt;\r\nline-height:107%;font-family:&quot;Segoe UI&quot;,&quot;sans-serif&quot;;color:#484848\">It packs a\r\npowerfully pungent aroma, something between a wild skunk and the diesel scent\r\nfamiliar in the Chemdawg line. Its smoke leaves a piney, citrus-like aftertaste.</span><o:p></o:p></p>', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Chem dawg #91,clone', 'Chem dawg #91 Clones', '#000000', 0, NULL, 0, 'Chem dawg #91 clone', 'Chem dawg #91 clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 03:12:17', '2021-03-09 03:12:21', 0, NULL, NULL, NULL, 0, 0, 'Hashplant,\r Skunk, Kush, Northern Lights, Diesel, Thai landrace', 'uplifted, energetic, pain-relief, euphoric,&nbsp;', 0),
(294, 'RYV4420qDb', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Skunk 1', 'skunk-1-ryv4420qdb', 'vendor/68/Genetics-Clones-+-Skunk 1.png', 'product-vendor-68-Genetics-Clones-+-Skunk 1-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, '<p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size:13.5pt;\r\nline-height:107%;font-family:&quot;Segoe UI&quot;,&quot;sans-serif&quot;;color:#484848\">Radiates\r\nwith an aromatic blend of sour skunkiness and subtle earthy notes.<o:p></o:p></span></p>', 100, 'Free exchanges within 48 hours of delivery.', 1, 1, 'Skunk 1,clone', 'Skunk 1 Clones', '#000000', 0, NULL, 0, 'Skunk 1 clone', 'Skunk 1 clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 03:35:10', '2021-03-11 01:30:35', 0, NULL, NULL, NULL, 0, 0, 'Afghani,\r Acapulco Gold, Colombian Gold', 'creative, energetic, hungry&nbsp;', 0),
(295, 'Iay5732eZY', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Venom OG', 'venom-og-iay5732ezy', 'vendor/68/Genetics-Clones-+-Venom OG.png', 'product-vendor-68-Genetics-Clones-+-Venom OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Has&nbsp;<span style=\"color: rgb(72, 72, 72); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Open Sans&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 18px;\">natural scents of pine, lemon, and diesel all mixed into one pungent but appealing aroma.</span>', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Venom OG,clone', 'Venom OG Clones', '#000000', 0, NULL, 0, 'Venom OG clone', 'Venom OG clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 03:42:44', '2021-03-09 03:42:46', 0, NULL, NULL, NULL, 0, 0, 'Poison OG, Rare Dankness #1', 'relaxed, pain-relief, sleepy', 0),
(296, 'MKR6180kKJ', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Fire OG', 'fire-og-mkr6180kkj', 'vendor/68/Genetics-Clones-+-Fire OG.png', 'product-vendor-68-Genetics-Clones-+-Fire OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, '<span style=\"color: rgb(72, 72, 72); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\",=\"\" \"open=\"\" sans\",=\"\" roboto,=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 18px;\"=\"\">It emits an earthy lemon zest smell and tastes similar, with undertones of diesel in the mix. When harvest-ready, its buds have a frosty appeal and bare red hairs, with the impression that it’s on fire.</span><br>', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Fire OG,clone', 'Fire OG Clones', '#000000', 0, NULL, 0, 'Fire OG clone', 'Fire OG clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 03:48:36', '2021-03-09 04:09:03', 0, NULL, NULL, NULL, 0, 0, 'SFV OG, OG Kush', 'relaxed, sleepy, euphoric', 0),
(297, 'u6U6557lMW', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Sour Kosher', 'sour-kosher-u6u6557lmw', 'vendor/68/Genetics-Clones-+-Sour Kosher.png', 'product-vendor-68-Genetics-Clones-+-Sour Kosher-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, '<p class=\"MsoNormal\"><span style=\"font-family: &quot;Segoe UI&quot;, sans-serif; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><font size=\"3\">Buds produce a gassy, piney, and sour aroma and flavor that\r\nmay perk you up even before you pack a bowl.</font></span><o:p></o:p></p>', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Sour Kosher clone', 'Sour Kosher Clones', '#000000', 0, NULL, 0, 'Sour Kosher clone', 'Sour Kosher clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 03:56:57', '2021-03-09 03:57:03', 0, NULL, NULL, NULL, 0, 0, 'Sour Diesel, Kosher Kush', 'relaxed', 0),
(298, 'XHa7042Duf', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Big Bud', 'big-bud-xha7042duf', 'vendor/68/Genetics-Clones-+-Big Bud.png', 'product-vendor-68-Genetics-Clones-+-Big Bud-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Produces massive yields with few leaves and large buds.', 100, NULL, 1, 0, 'Big Bud,clone', 'Big Bud Clones', '#000000', 0, NULL, 0, 'Big Bud clone', 'Big Bud clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 04:03:40', '2021-03-09 04:03:43', 0, NULL, NULL, NULL, 0, 0, 'Afghani, Northern Lights, Skunk #1', 'relaxed, energized', 0),
(299, '4l47530HC0', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Herojuana', 'herojuana-4l47530hc0', 'vendor/68/Genetics-Clones-+-Herojuana.png', 'product-vendor-68-Genetics-Clones-+-Herojuana-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Produces small, lime-colored cured buds with thin wispy pistils. Its scent and flavor are similar to lemon-lime and spices mixed pleasantly together.', 100, 'Free exchanges within 48 hours of delivery.', 1, 2, 'Herojuana,clone', 'Herojuana Clones', '#000000', 0, NULL, 0, 'Herojuana clone', 'Herojuana clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 04:09:48', '2021-03-09 04:41:32', 0, NULL, NULL, NULL, 0, 0, 'Herojuana, OG Kush', 'sleepy, relaxed, pain-relief', 0),
(300, 'hR07848OtK', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Sour Diesel', 'sour-diesel-hr07848otk', 'vendor/68/Genetics-Clones-+-Sour Diesel.png', 'product-vendor-68-Genetics-Clones-+-Sour Diesel-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'It exudes a citrusy, sour pungent odor with a zesty, earthy taste. Its leaves are a deep green, with calyxes covered in white trichomes and thin hairs when ready to harvest.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Sour Diesel,clone', 'Sour Diesel Clones', '#000000', 0, NULL, 0, 'Sour Diesel clone', 'Sour Diesel clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 04:15:50', '2021-03-09 04:15:53', 0, NULL, NULL, NULL, 0, 0, 'Chemdawg, Northern Lights', 'euphoric, relaxed, pain-relief, energetic,', 0),
(301, 'fT581691c1', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Sour Tangie', 'sour-tangie-ft581691c1', 'vendor/68/Genetics-Clones-+-Sour Tangie.png', 'product-vendor-68-Genetics-Clones-+-Sour Tangie-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Produces small, tightly bound petals dusted in kief across long buds. The flowers smell of a strong pungency mixed in with the bitter citrus of lemon and lime peels. When burned, Sour Tangie’s initial flavor resembles sour fruit peels followed by an aftertaste of dirt and diesel.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Sour Tangie,clone', 'Sour Tangie Clones', '#000000', 0, NULL, 0, 'Sour Tangie clone', 'Sour Tangie clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 04:20:58', '2021-03-09 04:21:00', 0, NULL, NULL, NULL, 0, 0, 'East Coast Sour Diesel, Tangie', 'relaxed, pain-relief, hungry', 0),
(302, 'mwI8469DEu', 'normal', NULL, 68, 18, 15, NULL, 5, NULL, 'Cataract Kush', 'cataract-kush-mwi8469deu', 'vendor/68/Genetics-Clones-+-Cataract Kush.png', 'product-vendor-68-Genetics-Clones-+-Cataract Kush-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Produces harvest-ready buds that are gray-black in color amidst dark leaves, covered in a layer of white crystal trichomes. Its flavor is spicy and earthy, with a scent reminiscent of wood and soil.', 100, 'Free exchanges within 48 hours of delivery.', 1, 0, 'Cataract Kush,clone', 'Cataract Kush Clones', '#000000', 0, NULL, 0, 'Cataract Kush clone', 'Cataract Kush clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 04:25:53', '2021-03-09 04:25:56', 0, NULL, NULL, NULL, 0, 0, 'LA Confidential, OG Kush', 'pain-relief, sleepy, hungry, anxious', 0),
(303, 'cpv0038xYx', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'White  Runtz', 'white-runtz-cpv0038xyx', 'vendor/68/Genetics-Clones-+-White  Runtz.png', 'product-vendor-68-Genetics-Clones-+-White  Runtz-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Its cured nuggets are filled with an array of color, ranging from mossy greens to deep purples, small blushes of yellows, and a bit of tan in its pistils. The nuggets look like candy, and are covered in a thick layer of crystalline trichomes. The scent and flavor of White Runtz weed is sweeter and fruitier.', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 0, 'White  Runtz,clone', 'White  Runtz Clones', '#000000', 0, NULL, 0, 'White  Runtz clone', 'White  Runtz clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 13:19:12', '2021-03-09 13:19:16', 0, NULL, NULL, NULL, 0, 0, 'Zkittlez, Gelato', 'pain-relief, relaxed', 0),
(304, 'NSu0773evU', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'Pink Runtz', 'pink-runtz-nsu0773evu', 'vendor/68/Genetics-Clones-+-Pink Runtz.png', 'product-vendor-68-Genetics-Clones-+-Pink Runtz-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Has a sweet, confection-like scent and taste boasting a colorful appearance. Its scent might remind you of sugary candies since it has a delicious terpene profile that\'s sweet, zesty, and flavorful. However, the scent does tend to be faint, emitting a mild aroma. It has a rainbow of deep colors spanning from greens to purples to blues and even dark pinks. Its cured buds are very dense and often shaped like bumpy pinecones.', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 0, 'Pink Runtz,clone', 'Pink Runtz Clones', '#000000', 0, NULL, 0, 'Pink Runtz clone', 'Pink Runtz  clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 13:36:39', '2021-03-09 13:36:43', 0, NULL, NULL, NULL, 0, 0, 'Zkittlez, Gelato', 'euphoric', 0),
(305, 'JRY1928br1', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'Purple Punch', 'purple-punch-jry1928br1', 'vendor/68/Genetics-Clones-+-Purple Punch.png', 'product-vendor-68-Genetics-Clones-+-Purple Punch-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'It has a distinct aroma coupled with a flavor that’s similar to sweet berries.', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 0, 'Purple Punch,clone', 'Purple Punch Clones', '#000000', 0, NULL, 0, 'Purple Punch  clone', 'Purple Punch  clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 13:46:11', '2021-03-09 13:46:15', 0, NULL, NULL, NULL, 0, 0, 'Larry OG, Granddaddy Purple', 'relaxed, sleepy, pain-relief', 0),
(306, 'HK72389V0f', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'Skywalker OG', 'skywalker-og-hk72389v0f', 'vendor/68/Genetics-Clones-+-Skywalker OG.png', 'product-vendor-68-Genetics-Clones-+-Skywalker OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'It smells of spicy diesel and leaves an herbal aftertaste. Its buds are dense, medium in size, and olive-colored with fuzzy burnt-orange pistils. When harvest-ready, the buds can be quite sticky with trichomes', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 0, 'Skywalker OG,clone', 'Skywalker OG Clones', '#000000', 0, NULL, 0, 'Skywalker OG clone', 'Skywalker OG clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 13:54:27', '2021-03-09 13:54:29', 0, NULL, NULL, NULL, 0, 0, 'Skywalker, OG Kush', 'pain-relief, relaxed', 0),
(307, 'Zui2969mGj', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'SFV OG', 'sfv-og-zui2969mgj', 'vendor/68/Genetics-Clones-+-SFV OG.png', 'product-vendor-68-Genetics-Clones-+-SFV OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Its scent is extremely potent and distinct, and will only get stronger as you break apart the buds. It’s reminiscent of sweet berries combined with the earthy and slightly diesel aroma of a typical OG strain, but can sometimes exude undertones of lemon or pine. Has brownish-orange pistils winding their way through the forest green leaves lightly dusted with trichomes. Its taste is like that of a soapy-like pine or even a green banana flavor that leaves an interesting aftertaste.', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 0, 'SFV OG,clone', 'SFV OG Clones', '#000000', 0, NULL, 0, 'SFV OG clone', 'SFV OG clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 14:13:05', '2021-03-09 14:13:09', 0, NULL, NULL, NULL, 0, 0, 'OG Kush', 'pain-relief, energetic, uplifted, focused, relaxed', 0),
(308, 'kl93998HhR', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'King Louis', 'king-louis-kl93998hhr', 'vendor/68/Genetics-Clones-+-King Louis.png', 'product-vendor-68-Genetics-Clones-+-King Louis-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Emits a musky pine and skunky scent, with just a hint of citrus. Nuggets of this strain can look like spades and have light orange pistils that mimic the flames of fire.', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 0, 'King Louis,clone', 'King Louis Clones', '#000000', 0, NULL, 0, 'King Louis clone', 'King Louis clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 14:32:49', '2021-03-09 14:32:53', 0, NULL, NULL, NULL, 0, 0, 'OG Kush, LA Confidential', 'relaxed, pain-relief, happy', 0),
(309, '8Ab5316Ptr', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'GG4', 'gg4-8ab5316ptr', 'vendor/68/Genetics-Clones-+-GG4.png', 'product-vendor-68-Genetics-Clones-+-GG4-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Has sticky trichomes that collect on scissors when it’s being trimmed. The massive amount of trichomes make the scissors tacky and hard to handle. It smells mostly of diesel and pine while having a distinct chocolatey and coffee-like aftertaste once inhaled.', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 0, 'GG4,clone', 'GG4 Clones', '#000000', 0, NULL, 0, 'GG4 clone', 'GG4 clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 14:46:38', '2021-03-09 14:46:42', 0, NULL, NULL, NULL, 0, 0, 'Sour Diesel, Sour Dubb, Chem’s Sister, Chocolate Diesel', 'euphoric, relaxed', 0),
(310, 'Zdf60335ca', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'GSC', 'gsc-zdf60335ca', 'vendor/68/Genetics-Clones-+-GSC.png', 'product-vendor-68-Genetics-Clones-+-GSC-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'euphoric, relaxed, pain relief, hungry', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 0, 'GSC,clone', 'GSC Clones', '#000000', 0, NULL, 0, 'GSC clone', 'GSC clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 14:51:54', '2021-03-09 14:51:56', 0, NULL, NULL, NULL, 0, 0, 'OG Kush, Durban Poison', 'euphoric, anxious, pain-relief, hungry', 0),
(311, 'q6k6448eGq', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'Royal Kush', 'royal-kush-q6k6448egq', 'vendor/68/Genetics-Clones-+-Royal Kush.png', 'product-vendor-68-Genetics-Clones-+-Royal Kush-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'happy, relaxed, euphoric, pain relief', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 1, 'Royal Kush,clone', 'Royal Kush Clones', '#000000', 0, NULL, 0, 'Royal Kushclone', 'Royal Kush clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 14:59:23', '2021-03-11 03:13:17', 0, NULL, NULL, NULL, 0, 0, 'South American, Neville Haze', 'relaxed, euphoric, sleepy, pain-relief', 0),
(312, 'O0B68546Ta', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'Wifi OG', 'wifi-og-o0b68546ta', 'vendor/68/Genetics-Clones-+-Wifi OG.png', 'product-vendor-68-Genetics-Clones-+-Wifi OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Produces frosty buds that look snow-laden which is where it derives part of its name from. It often smells spicy, earthy, and floral with undertones of diesel OG Kush, Durban Poison, South American, Neville Haze.', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 0, 'Wifi OG,clone', 'Wifi OG Clones', '#000000', 0, NULL, 0, 'Wifi OG clone', 'Wifi OG clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 15:04:51', '2021-03-09 15:04:55', 0, NULL, NULL, NULL, 0, 0, 'Fire OG, The White', 'energetic, focused, uplifted, euphoric', 0),
(313, 'LPa7171ifs', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'Tahoe OG', 'tahoe-og-lpa7171ifs', 'vendor/68/Genetics-Clones-+-Tahoe OG.png', 'product-vendor-68-Genetics-Clones-+-Tahoe OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'It features an earthy, lemon taste', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 0, 'Tahoe OG,clone', 'Tahoe OG Clones', '#000000', 0, NULL, 0, 'Tahoe OG clone', 'Tahoe OG clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 15:14:46', '2021-03-09 15:14:50', 0, NULL, NULL, NULL, 0, 0, 'OG Kush, (SFV) OG Kush', 'relaxed, uplifted, euphoric', 0),
(314, 'ZQy7821D7D', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'Blue Cookies', 'blue-cookies-zqy7821d7d', 'vendor/68/Genetics-Clones-+-Blue Cookies.png', 'product-vendor-68-Genetics-Clones-+-Blue Cookies-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Its harvest-ready buds have a bluish and sometimes purple tint beneath a thick layer of frosty crystals. Its scent and flavor are of sweet berries, sometimes cherries, mixed with undertones of a delicious bakery.', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 0, 'Blue Cookies,clone', 'Blue Cookies Clones', '#000000', 0, NULL, 0, 'Blue Cookies  clone', 'Blue Cookies  clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 15:35:15', '2021-03-09 15:35:19', 0, NULL, NULL, NULL, 0, 0, 'euphoric, happy', 'uplifted, relaxed, sleepy, anxious', 0),
(315, 'UGz8989Mr8', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'Orange Cookies', 'orange-cookies-ugz8989mr8', 'vendor/68/Genetics-Clones-+-Orange Cookies.png', 'product-vendor-68-Genetics-Clones-+-Orange Cookies-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Its buds smell like tangy citrus fruits, and the smoke tastes like sweet orange cookies, just as its name would imply. In appearance, its buds are covered in resinous trichomes and have fiery orange pistils that stand out against its light green colors.', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 0, 'Orange Cookies,clone', 'Orange Cookies Clones', '#000000', 0, NULL, 0, 'Orange Cookies  clone', 'Orange Cookies  clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 15:41:08', '2021-03-09 15:41:13', 0, NULL, NULL, NULL, 0, 0, 'Orange Juice, GSC', 'uplifted, euphoric, relaxed, focused', 0),
(316, 'B1l928831h', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'Sunday Driver', 'sunday-driver-b1l928831h', 'vendor/68/Genetics-Clones-+-Sunday Driver.png', 'product-vendor-68-Genetics-Clones-+-Sunday Driver-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Buds are light green in color with purple accents and come drenched in trichomes.', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 0, 'Sunday Driver,clone', 'Sunday Driver Clones', '#000000', 0, NULL, 0, 'Sunday Driver  clone', 'Sunday Driver  clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 15:47:37', '2021-03-09 15:47:43', 0, NULL, NULL, NULL, 0, 0, 'FPOG, Grape Pie', 'euphoric, hungry, sleepy, relaxed, happy', 0),
(317, 'YmA9810mhd', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'Gelato 44', 'gelato-44-yma9810mhd', 'vendor/68/Genetics-Clones-+-Gelato 44.png', 'product-vendor-68-Genetics-Clones-+-Gelato 44-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, NULL, 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 1, 'Gelato 44,clone', 'Gelato 44 Clones', '#000000', 0, NULL, 0, 'Gelato 44 clone', 'Gelato 44 clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 15:54:51', '2021-03-10 02:39:31', 0, NULL, NULL, NULL, 0, 0, 'Thin Mint Girl Scout Cookies and Sunset Sherbet', 'relaxed', 0),
(318, 'buG0193Uki', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'Tangie', 'tangie-bug0193uki', 'vendor/68/Genetics-Clones-+-Tangie.png', 'product-vendor-68-Genetics-Clones-+-Tangie-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Produces sticky buds', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 0, 'Tangie,clone', 'Tangie Clones', '#000000', 0, NULL, 0, 'Tangie  clone', 'Tangie  clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 16:00:55', '2021-03-09 16:00:57', 0, NULL, NULL, NULL, 0, 0, 'California Orange, Skunk_1', 'euphoric, relaxed', 0),
(319, '1AA0541STl', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'Zookies', 'zookies-1aa0541stl', 'vendor/68/Genetics-Clones-+-Zookies.png', 'product-vendor-68-Genetics-Clones-+-Zookies-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, '<span style=\"color: rgb(72, 72, 72); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\",=\"\" \"open=\"\" sans\",=\"\" roboto,=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 18px;\"=\"\">Dense with lavender hues amid deep greens and sienna-colored pistils. All coated in a fine layer of trichomes. It brings </span><span style=\"color: rgb(72, 72, 72); font-family: -apple-system, BlinkMacSystemFont, \" segoe=\"\" ui\",=\"\" \"open=\"\" sans\",=\"\" roboto,=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 18px;\"=\"\">a unique flavor profile, being of sweet nutty cookies with \r\nnotes of chocolate or coffee, a bit of pepper, with diesel undertones.<br></span>', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 1, 'Zookies,clone', 'Zookies Clones', '#000000', 0, NULL, 0, 'Zookies  clone', 'Zookies  clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 16:04:18', '2021-03-12 05:07:27', 0, NULL, NULL, NULL, 0, 0, 'Animal Cookies, GG4', 'pain-relief, energetic', 0),
(320, 'uG10874EGd', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'ICC', 'icc-ug10874egd', 'vendor/68/Genetics-Clones-+-ICC.png', 'product-vendor-68-Genetics-Clones-+-ICC-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Has a creamy vanilla-like aroma from these buds with a slightly nutty and sometimes cheesy undertone. The cured nuggets are a colorful assortment of light and dark greens intertwined with deep shades of purple and copper pistils.', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 0, 'ICC,clone', 'ICC Clones', '#000000', 0, NULL, 0, 'ICC clone', 'ICC clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 16:12:15', '2021-03-09 16:12:18', 0, NULL, NULL, NULL, 0, 0, 'Wedding Cake, Gelato #33', 'relaxed, pain-relief, sleepy', 0),
(321, 'c0k1169ytH', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'Monkey Breath', 'monkey-breath-c0k1169yth', 'vendor/68/Genetics-Clones-+-Monkey Breath.png', 'product-vendor-68-Genetics-Clones-+-Monkey Breath-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'The bud has a rich chocolaty diesel flavor with a touch of vanilla and earth to it. The aroma takes a pungent turn, with a woody overtone and a pretty hard hit of spicy fuel', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 0, 'Monkey Breath,clone', 'Monkey Breath Clones', '#000000', 0, NULL, 0, 'Monkey Breath clone', 'Monkey Breath clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 16:18:00', '2021-03-09 16:18:04', 0, NULL, NULL, NULL, 0, 0, NULL, 'happy, relaxed', 0),
(322, 'euO1565y90', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'OG #18', 'og-18-euo1565y90', 'vendor/68/Genetics-Clones-+-OG 18.png', 'product-vendor-68-Genetics-Clones-+-OG 18-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Provides a pungent odor as it grows that becomes more pronounced as the flowering time approaches. It also has some earthiness with hints of citrus. It also bursts of diesel flavor and one may experience sourness. Buds are often dense, thick, and resinous. The stickiness is due to the smattering of white trichomes. There are also plenty of orange pistils.', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 0, 'OG #18,clone', 'OG #18 Clones', '#000000', 0, NULL, 0, 'OG #18 clone', 'OG #18 clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 16:29:56', '2021-03-09 16:30:01', 0, NULL, NULL, NULL, 0, 0, 'OG Kush', 'sleepy, happy, relaxed', 0),
(323, 'v232579wCK', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'Snoop Dogg OG', 'snoop-dogg-og-v232579wck', 'vendor/68/Genetics-Clones-+-Snoop Dogg OG.png', 'product-vendor-68-Genetics-Clones-+-Snoop Dogg OG-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Aroma dominates the less prominent lemon notes', 100, 'Free Exchange within 24 hours of purchase.<br>', 1, 0, 'Snoop Dogg OG,clone', 'Snoop Dogg OG Clones', '#000000', 0, NULL, 0, 'Snoop Dogg OGclone', 'Snoop Dogg OG clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 16:43:45', '2021-03-09 16:43:49', 0, NULL, NULL, NULL, 0, 0, 'Lemon OG, Sour Diesel', 'creative, focused, hungry', 0),
(324, 'MWI3036UCE', 'normal', NULL, 68, 18, 15, NULL, 6, NULL, 'Tropicana  GSC', 'tropicana-gsc-mwi3036uce', 'vendor/68/Genetics-Clones-+-Tropicana  GSC.png', 'product-vendor-68-Genetics-Clones-+-Tropicana  GSC-tn.png', NULL, NULL, NULL, NULL, NULL, 14.29, 0, 'Has a scent and taste that justifies its name. It has a terpene profile that gives it a remarkably citrusy smell resembling oranges and a taste that’s both sweet and slightly floral while having those citrusy undertones as well.', 99, 'Free Exchange within 24 hours of purchase.<br>', 1, 1, 'Tropicana  GSC,clone', 'Tropicana  GSC Clones', '#000000', 0, NULL, 0, 'Tropicana  GSC clone', 'Tropicana  GSC clone', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-09 16:48:58', '2021-03-11 03:40:04', 0, NULL, NULL, NULL, 0, 0, 'GSC, Tangie', 'uplifted, energetic, giggly', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_clicks`
--

CREATE TABLE `product_clicks` (
  `id` int(191) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(191) DEFAULT NULL,
  `search_term` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_clicks`
--

INSERT INTO `product_clicks` (`id`, `user_id`, `category_id`, `product_id`, `search_term`, `action`, `date`) VALUES
(334, 0, 18, 0, NULL, 'menu_category', '2021-03-05'),
(335, 0, 18, 0, NULL, 'menu_category', '2021-03-05'),
(336, 0, 18, 0, NULL, 'menu_category', '2021-03-05'),
(337, 0, 15, 0, NULL, 'menu_category', '2021-03-05'),
(338, 0, 18, 0, NULL, 'menu_category', '2021-03-05'),
(339, 0, 18, 0, NULL, 'menu_category', '2021-03-05'),
(340, 0, 18, 256, '', 'view', '2021-03-05'),
(341, 0, 18, 256, '', 'view', '2021-03-05'),
(342, 0, 18, 242, '', 'view', '2021-03-05'),
(343, 0, 18, 242, '', 'view', '2021-03-05'),
(344, 0, 18, 0, NULL, 'menu_category', '2021-03-05'),
(345, 0, 18, 0, NULL, 'menu_category', '2021-03-05'),
(346, 0, 18, 0, NULL, 'menu_category', '2021-03-05'),
(347, 0, 18, 0, NULL, 'menu_category', '2021-03-05'),
(348, 0, 18, 0, NULL, 'menu_category', '2021-03-05'),
(349, 0, 18, 0, NULL, 'menu_category', '2021-03-05'),
(350, 0, 18, 0, NULL, 'menu_category', '2021-03-05'),
(351, 0, 18, 0, NULL, 'menu_category', '2021-03-05'),
(352, 0, 18, 0, NULL, 'menu_category', '2021-03-05'),
(353, 0, 18, 0, NULL, 'menu_category', '2021-03-05'),
(354, 0, 18, 0, NULL, 'menu_category', '2021-03-05'),
(355, 68, 18, 239, '', 'quick_view', '2021-03-05'),
(356, 68, 18, 238, '', 'quick_view', '2021-03-05'),
(357, 68, 18, 263, '', 'view', '2021-03-05'),
(358, 68, 18, 0, NULL, 'menu_category', '2021-03-05'),
(359, 68, 18, 268, '', 'view', '2021-03-05'),
(360, 68, 18, 0, 'gg4', 'search', '2021-03-05'),
(361, 68, 18, 0, 'Ordsa', 'search', '2021-03-05'),
(362, 68, 18, 219, '', 'view', '2021-03-05'),
(363, 68, 18, 219, '', 'view', '2021-03-05'),
(364, 0, 18, 0, NULL, 'menu_category', '2021-03-05'),
(365, 0, 18, 0, 'cake', 'search', '2021-03-05'),
(366, 0, 18, 0, 'cake', 'search', '2021-03-05'),
(367, 0, 18, 241, '', 'quick_view', '2021-03-05'),
(368, 0, 18, 0, NULL, 'menu_category', '2021-03-06'),
(369, 68, 18, 268, '', 'view', '2021-03-06'),
(370, 68, 18, 0, NULL, 'menu_category', '2021-03-06'),
(371, 68, 18, 268, '', 'view', '2021-03-06'),
(372, 0, 15, 0, NULL, 'menu_category', '2021-03-08'),
(373, 68, 18, 220, '', 'view', '2021-03-08'),
(374, 68, 18, 219, '', 'view', '2021-03-08'),
(375, 68, 18, 0, NULL, 'menu_category', '2021-03-08'),
(376, 68, 18, 285, '', 'view', '2021-03-08'),
(377, 0, 18, 285, '', 'view', '2021-03-08'),
(378, 68, 18, 218, '', 'view', '2021-03-08'),
(379, 68, 18, 222, '', 'view', '2021-03-08'),
(380, 68, 18, 219, '', 'view', '2021-03-08'),
(381, 68, 18, 218, '', 'view', '2021-03-08'),
(382, 68, 18, 221, '', 'view', '2021-03-08'),
(383, 68, 18, 221, '', 'view', '2021-03-08'),
(384, 0, 18, 221, '', 'view', '2021-03-08'),
(385, 0, 18, 220, '', 'view', '2021-03-08'),
(386, 0, 18, 220, '', 'view', '2021-03-08'),
(387, 0, 18, 221, '', 'view', '2021-03-08'),
(388, 68, 18, 285, '', 'view', '2021-03-08'),
(389, 68, 18, 220, '', 'view', '2021-03-08'),
(390, 68, 18, 222, '', 'view', '2021-03-08'),
(391, 68, 18, 221, '', 'view', '2021-03-08'),
(392, 0, 18, 225, '', 'view', '2021-03-08'),
(393, 0, 18, 225, '', 'view', '2021-03-08'),
(394, 0, 18, 225, '', 'view', '2021-03-08'),
(395, 0, 18, 224, '', 'view', '2021-03-08'),
(396, 0, 18, 238, '', 'view', '2021-03-08'),
(397, 0, 18, 226, '', 'view', '2021-03-08'),
(398, 0, 18, 231, '', 'view', '2021-03-08'),
(399, 0, 18, 227, '', 'view', '2021-03-08'),
(400, 0, 18, 0, NULL, 'menu_category', '2021-03-08'),
(401, 0, 18, 221, '', 'view', '2021-03-08'),
(402, 0, 18, 221, '', 'view', '2021-03-08'),
(403, 0, 18, 227, '', 'view', '2021-03-08'),
(404, 68, 18, 223, '', 'view', '2021-03-08'),
(405, 68, 18, 223, '', 'view', '2021-03-08'),
(406, 0, 18, 227, '', 'view', '2021-03-08'),
(407, 0, 18, 227, '', 'view', '2021-03-08'),
(408, 68, 18, 223, '', 'view', '2021-03-08'),
(409, 0, 18, 235, '', 'view', '2021-03-08'),
(410, 79, 18, 219, '', 'view', '2021-03-08'),
(411, 80, 18, 232, '', 'view', '2021-03-08'),
(412, 80, 18, 221, '', 'view', '2021-03-08'),
(413, 68, 18, 219, '', 'view', '2021-03-08'),
(414, 68, 18, 290, '', 'view', '2021-03-08'),
(415, 0, 18, 0, NULL, 'menu_category', '2021-03-08'),
(416, 0, 18, 232, '', 'view', '2021-03-08'),
(417, 0, 18, 0, NULL, 'menu_category', '2021-03-08'),
(418, 0, 18, 0, NULL, 'menu_category', '2021-03-08'),
(419, 0, 18, 0, NULL, 'menu_category', '2021-03-08'),
(420, 0, 18, 300, '', 'quick_view', '2021-03-08'),
(421, 0, 18, 218, '', 'view', '2021-03-08'),
(422, 0, 18, 300, '', 'quick_view', '2021-03-08'),
(423, 0, 18, 288, '', 'view', '2021-03-08'),
(424, 0, 18, 0, NULL, 'menu_category', '2021-03-08'),
(425, 0, 18, 218, '', 'view', '2021-03-08'),
(426, 0, 18, 218, '', 'view', '2021-03-08'),
(427, 0, 18, 218, '', 'view', '2021-03-08'),
(428, 0, 18, 0, NULL, 'menu_category', '2021-03-08'),
(429, 0, 18, 299, '', 'view', '2021-03-08'),
(430, 0, 18, 299, '', 'view', '2021-03-08'),
(431, 0, 18, 292, '', 'view', '2021-03-08'),
(432, 68, 18, 0, NULL, 'menu_category', '2021-03-08'),
(433, 68, 18, 0, NULL, 'menu_category', '2021-03-08'),
(434, 0, 18, 0, NULL, 'menu_category', '2021-03-08'),
(435, 0, 18, 302, '', 'compare', '2021-03-08'),
(436, 0, 18, 0, NULL, 'menu_category', '2021-03-08'),
(437, 0, 18, 0, NULL, 'menu_category', '2021-03-08'),
(438, 0, 18, 277, '', 'quick_view', '2021-03-08'),
(439, 0, 18, 0, NULL, 'menu_category', '2021-03-08'),
(440, 0, 18, 252, '', 'view', '2021-03-08'),
(441, 0, 18, 0, NULL, 'menu_category', '2021-03-09'),
(442, 0, 18, 0, NULL, 'menu_category', '2021-03-09'),
(443, 0, 18, 0, NULL, 'menu_category', '2021-03-09'),
(444, 0, 18, 279, '', 'view', '2021-03-09'),
(445, 0, 18, 314, '', 'compare', '2021-03-09'),
(446, 0, 18, 0, NULL, 'menu_category', '2021-03-09'),
(447, 0, 18, 0, NULL, 'menu_category', '2021-03-09'),
(448, 80, 18, 0, NULL, 'menu_category', '2021-03-09'),
(449, 68, 18, 232, '', 'quick_view', '2021-03-09'),
(450, 0, 18, 0, NULL, 'menu_category', '2021-03-09'),
(451, 0, 18, 0, NULL, 'menu_category', '2021-03-09'),
(452, 0, 15, 0, NULL, 'menu_category', '2021-03-09'),
(453, 0, 18, 221, '', 'view', '2021-03-09'),
(454, 0, 18, 219, '', 'view', '2021-03-09'),
(455, 0, 18, 221, '', 'view', '2021-03-09'),
(456, 0, 18, 0, NULL, 'menu_category', '2021-03-09'),
(457, 0, 18, 0, NULL, 'menu_category', '2021-03-09'),
(458, 0, 18, 289, '', 'quick_view', '2021-03-09'),
(459, 0, 18, 288, '', 'compare', '2021-03-09'),
(460, 0, 18, 319, '', 'compare', '2021-03-09'),
(461, 0, 18, 320, '', 'compare', '2021-03-09'),
(462, 0, 18, 321, '', 'compare', '2021-03-09'),
(463, 68, 18, 0, NULL, 'menu_category', '2021-03-09'),
(464, 68, 18, 274, '', 'view', '2021-03-09'),
(465, 68, 18, 317, '', 'view', '2021-03-09'),
(466, 0, 18, 218, '', 'view', '2021-03-09'),
(467, 68, 18, 274, '', 'view', '2021-03-09'),
(468, 0, 18, 0, NULL, 'menu_category', '2021-03-10'),
(469, 0, 18, 0, NULL, 'menu_category', '2021-03-10'),
(470, 0, 18, 324, '', 'quick_view', '2021-03-10'),
(471, 0, 18, 274, '', 'view', '2021-03-10'),
(472, 0, 18, 223, '', 'view', '2021-03-10'),
(473, 79, 18, 275, '', 'view', '2021-03-10'),
(474, 79, 18, 225, '', 'view', '2021-03-10'),
(475, 68, 18, 221, '', 'view', '2021-03-10'),
(476, 79, 18, 294, '', 'view', '2021-03-10'),
(477, 79, 18, 221, '', 'view', '2021-03-10'),
(478, 79, 18, 0, NULL, 'menu_category', '2021-03-10'),
(479, 79, 18, 311, '', 'view', '2021-03-10'),
(480, 79, 18, 0, NULL, 'menu_category', '2021-03-10'),
(481, 79, 18, 0, NULL, 'menu_category', '2021-03-10'),
(482, 79, 18, 0, NULL, 'menu_category', '2021-03-10'),
(483, 79, 18, 0, NULL, 'menu_category', '2021-03-10'),
(484, 79, 18, 0, NULL, 'menu_category', '2021-03-10'),
(485, 79, 18, 0, NULL, 'menu_category', '2021-03-10'),
(486, 79, 18, 324, '', 'view', '2021-03-10'),
(487, 79, 18, 289, '', 'view', '2021-03-11'),
(488, 79, 18, 222, '', 'view', '2021-03-11'),
(489, 68, 18, 221, '', 'view', '2021-03-11'),
(490, 68, 18, 319, '', 'view', '2021-03-11'),
(491, 0, 15, 0, NULL, 'menu_category', '2021-03-11'),
(492, 0, 18, 0, NULL, 'menu_category', '2021-03-12');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rating` tinyint(2) NOT NULL,
  `review_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `comment_id` int(191) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `product_id` int(192) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `photo`, `title`, `subtitle`, `details`) VALUES
(6, '1557343024img.jpg', 'Josh Smith', 'CEO & Founder', 'Josh is an owner of several cannabis businesses and built the OG.Life site and network to optimize his time for his growing and manufacturing operations.');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `section`) VALUES
(16, 'Manager', 'orders , products , affilate_products , customers , vendors , vendor_subscription_plans , categories , bulk_product_upload , product_discussion , set_coupons , blog , messages , general_settings , home_page_settings , menu_page_settings , emails_settings , payment_settings , social_settings , language_settings , seo_tools , subscribers'),
(17, 'Moderator', 'orders , products , customers , vendors , categories , blog , messages , home_page_settings , payment_settings , social_settings , language_settings , seo_tools , subscribers'),
(18, 'Staff', 'orders , products , vendors , vendor_subscription_plans , categories , blog , home_page_settings , menu_page_settings , language_settings , seo_tools , subscribers');

-- --------------------------------------------------------

--
-- Table structure for table `seotools`
--

CREATE TABLE `seotools` (
  `id` int(10) UNSIGNED NOT NULL,
  `google_analytics` text COLLATE utf8mb4_unicode_ci,
  `meta_keys` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seotools`
--

INSERT INTO `seotools` (`id`, `google_analytics`, `meta_keys`) VALUES
(1, '<script>//Google Analytics Scriptfffffffffffffffffffffffssssfffffs</script>', 'California\'s best way to get cannabis products delivered. OG.Life is the easy to use, cannabis delivery source, whethere you are a consumer or own manage multpile licensed operations, OG.Life is a partner you can count on.');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT '0',
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `title`, `details`, `photo`) VALUES
(2, 0, 'FAST SHIPPING', 'Fast shipping to your door.', '1561348133service1.png'),
(3, 0, 'PAYMENT METHODS', 'Secure Payment', '1561348138service2.png'),
(4, 0, 'HASSLE FREE RETURNS', 'Hassle Free Return Policy', '1561348143service3.png'),
(5, 0, 'HELP CENTER', '24/7 Support System', '1561348147service4.png');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` int(11) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT '0',
  `title` text,
  `subtitle` text,
  `price` double NOT NULL DEFAULT '0',
  `triggerprice` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `user_id`, `title`, `subtitle`, `price`, `triggerprice`) VALUES
(1, 0, 'Standard Shipping + $1 per mile, one way', '2 - 4 days', 39, NULL),
(2, 0, 'Express Shipping + $1 per mile, both ways', '1 - 2 days, depending on the time the order is placed', 79, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(191) UNSIGNED NOT NULL,
  `subtitle_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subtitle_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_anime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `title_size` varchar(50) DEFAULT NULL,
  `title_color` varchar(50) DEFAULT NULL,
  `title_anime` varchar(50) DEFAULT NULL,
  `details_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details_size` varchar(50) DEFAULT NULL,
  `details_color` varchar(50) DEFAULT NULL,
  `details_anime` varchar(50) DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `subtitle_text`, `subtitle_size`, `subtitle_color`, `subtitle_anime`, `title_text`, `title_size`, `title_color`, `title_anime`, `details_text`, `details_size`, `details_color`, `details_anime`, `photo`, `position`, `link`) VALUES
(8, NULL, '24', '#000000', 'slideInUp', NULL, '60', '#ffffff', 'slideInDown', NULL, '16', '#ffffff', 'slideInRight', '1612980951slider-verified-orange.png', 'slide-one', 'https://davehansen.com/demo1/user/verified/get'),
(9, NULL, '24', '#ffffff', 'slideInUp', NULL, '60', '#157042', 'slideInRight', NULL, '16', '#ffffff', 'slideInDown', '1612901423slider-accessories-dkorange.png', 'slide-one', 'category/accessories'),
(10, NULL, '24', '#c32d2d', 'slideInUp', NULL, '60', '#bc2727', 'slideInDown', NULL, '16', '#c51d1d', 'slideInLeft', '1612905329slider-all.png', 'slide-one', 'category/genetics'),
(11, NULL, NULL, '#000000', 'fadeIn', NULL, NULL, '#000000', 'fadeIn', NULL, NULL, '#000000', 'fadeIn', '1614028019slider-join.png', 'slide-one', 'https://davehansen.com/demo1/user/register');

-- --------------------------------------------------------

--
-- Table structure for table `socialsettings`
--

CREATE TABLE `socialsettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gplus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dribble` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_status` tinyint(4) NOT NULL DEFAULT '1',
  `g_status` tinyint(4) NOT NULL DEFAULT '1',
  `t_status` tinyint(4) NOT NULL DEFAULT '1',
  `l_status` tinyint(4) NOT NULL DEFAULT '1',
  `d_status` tinyint(4) NOT NULL DEFAULT '1',
  `f_check` tinyint(10) DEFAULT NULL,
  `g_check` tinyint(10) DEFAULT NULL,
  `fclient_id` text COLLATE utf8mb4_unicode_ci,
  `fclient_secret` text COLLATE utf8mb4_unicode_ci,
  `fredirect` text COLLATE utf8mb4_unicode_ci,
  `gclient_id` text COLLATE utf8mb4_unicode_ci,
  `gclient_secret` text COLLATE utf8mb4_unicode_ci,
  `gredirect` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socialsettings`
--

INSERT INTO `socialsettings` (`id`, `facebook`, `gplus`, `twitter`, `linkedin`, `dribble`, `f_status`, `g_status`, `t_status`, `l_status`, `d_status`, `f_check`, `g_check`, `fclient_id`, `fclient_secret`, `fredirect`, `gclient_id`, `gclient_secret`, `gredirect`) VALUES
(1, 'https://www.facebook.com/', 'https://plus.google.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://dribbble.com/', 0, 0, 0, 0, 0, 1, 1, '503140663460329', 'f66cd670ec43d14209a2728af26dcc43', 'https://localhost/geniuscart/geniuscart1.7-fast/auth/facebook/callback', '904681031719-sh1aolu42k7l93ik0bkiddcboghbpcfi.apps.googleusercontent.com', 'yGBWmUpPtn5yWhDAsXnswEX3', 'http://localhost/geniuscart/geniuscart1.7-fast/auth/google/callback');

-- --------------------------------------------------------

--
-- Table structure for table `social_providers`
--

CREATE TABLE `social_providers` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `store_locations`
--

CREATE TABLE `store_locations` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `country` varchar(50) NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `location_name` varchar(50) NOT NULL,
  `contact_name` varchar(50) NOT NULL,
  `contact_number` varchar(50) NOT NULL,
  `contact_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `store_locations`
--

INSERT INTO `store_locations` (`id`, `user_id`, `address`, `city`, `state`, `zip`, `country`, `lat`, `lng`, `location_name`, `contact_name`, `contact_number`, `contact_email`) VALUES
(4, 69, '1230 Metcalf Avenue', 'New York', 'NY', '10472', 'United States', 40.8303, -73.8724, 'My Location', 'Joe', '123456789', 'kosong0926@hotmail.com'),
(5, 68, '1311 Camelback Street', 'Newport Beach', 'CA', '92660', 'United States', 33.6386, -117.865, 'camel city cannabis', 'contact one', '4124034110', 'usamtg@hotmail.com'),
(6, 68, '61 Acorn Glen', 'Irvine', 'CA', '92620', 'United States', 33.6895, -117.755, 'Acorn Budz', 'Location Contact Dave', '412-403-4110', 'dave@davehansen.com'),
(7, 80, '1520 West Laurel Street', 'Independence', 'KS', '67301', 'United States', 37.2257, -95.726, 'ChangStore', 'Chang', '+8612345646768', 'cpduran0622@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `strains`
--

CREATE TABLE `strains` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `effect` longtext COLLATE utf8_bin NOT NULL,
  `description` longtext COLLATE utf8_bin NOT NULL,
  `parent` longtext COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `strains`
--

INSERT INTO `strains` (`id`, `name`, `effect`, `description`, `parent`, `created_at`, `updated_at`) VALUES
(450, 'GG4', 'euphoric, relaxed', 'Chem\'s Sister, Sour Dubb, Chocolate Diesel', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(451, 'Wedding Cake', 'relaxed, euphoric', 'Cherry Pie, Girl Scout Cookies', '', '2021-02-12 20:57:09', '0000-00-00 00:00:00'),
(452, 'Gelato', 'euphoric, relaxad', 'Sunset Sherbet, Thin Mint Scout Girl Cookies', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(453, 'Blue Dream ', 'euphoric, relaxed', 'Bluebery, Haze', '', '2021-02-12 20:55:33', '0000-00-00 00:00:00'),
(454, 'Purple Punch ', 'pain relief, sleepy', 'Larry OG, Grandaddy Purple ', '', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(455, 'Ice Cream Cake ', 'relaxed, pain relief, sleepy', 'Wedding Cake, Gelato#33', '', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(456, 'GSC', 'euphoric, relaxed, pain relief, hungry', 'OG Kush, Durban Poison ', '', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(457, 'Sour Diesel', 'euphoric, relaxed, pain relief, hungry', 'Chemdawg, Super Skunk', '', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(458, 'OG Kush ', 'euphoric, happy, sleepy, pain relief', 'Nothern California Strain, Hindu Kush', '', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(459, 'Runtz ', 'euphoric, uplifted', 'Zkittlez, Gelato', '', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(460, 'Jack Herer', 'blissful, creative, clear-headed ', 'Haze, Northern Lights #5, Shiva Skunk', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(461, 'Sherbert ', 'energetic', 'Girl Scout Cookies, Pink Panties ', '', '2021-02-12 20:57:09', '0000-00-00 00:00:00'),
(462, 'White Widow ', 'talkative, energetic', 'Brazilian Sativa, Landrace', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(463, 'Mimosa ', 'relaxed, sleepy', 'Clementine, Purple Punch ', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(464, 'Zkittlez', 'relaxed, euphoric, happy', 'Grape Ape, Grapefruit, Undisclosed  ', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(465, 'Pineapple Express ', 'energetic', 'Trainwreck, Hawaiian ', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(466, 'Granddaddy Purple ', 'pain relief, relaxed', 'Purple Urkle, Big Bud ', '', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(467, 'Do-Si-Dos', 'relaxed', 'OGKB, Girl Scout Cookies', '', '2021-02-12 20:55:12', '0000-00-00 00:00:00'),
(468, 'Green Crack ', 'energetic, happy', 'Undisclosed', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(469, 'Durban Poison ', 'energetic, uplifted ', 'Undisclosed', '', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(470, 'Bubba Kush ', 'sleepy, pain relief', 'Undisclosed', '', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(471, 'Northern Lights ', 'sleepy, pain relief', 'Undisclosed', '', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(472, 'Sundae Driver ', 'happy, relaxed', 'FPOG, Grape Pie ', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(473, 'GMO Cookies ', 'relaxed, pain relief', 'Chemdog, Girl Scout Cookies', '', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(474, 'SFV OG ', 'pain relief, energetic, uplifted', 'Afghani, SFV OG ', '', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(475, 'Chemdawg', 'euphoric, happy', 'Sour Diesel, OG Kush ', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(476, 'Cherry Pie ', 'euphoric, happy', 'Granddaddy Purple, Durban Poison ', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(477, 'MAC', 'euphoric, happy', 'Alien Cookies, Starfighter, Columbian ', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(478, 'Strawberry Cough ', 'euphoric, happy', 'Strawberry Fields', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(479, 'Mac 1', 'energetic, happy', 'Alien Cookies, F2, Miracle 15', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(480, 'Wedding Crusher', 'euphoric, relaxed', 'Wedding Cake, Purple Punch ', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(481, 'Stardawg', 'euphoric, happy', 'Chemdog 4, Tres Dawg', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(482, 'Amnesia Haze ', 'energetic, uplifted', 'South Asian, Jamaican Landrace ', '', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(483, 'Biscotti', 'euphoric, happy, energetic', 'Gelato #25, South Florida OG ', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(484, 'Bruce Banner ', 'relaxed, happy', 'OG Kush, Strawberry Diesel ', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(485, 'Slurricane ', 'relaxed, euphoric', 'Do-Si-Dos, Purple Punch ', '', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(486, 'Trainwreck', 'pain relief, sleepy, euphoric', 'Mexican, Thai, Afghani', '', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(487, 'Gushers ', 'pain relief, relaxed, sleepy', 'Gelato #41, Triangle Kush ', '', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(488, 'Mendo Breath ', 'pain relief, relaxed, sleepy', 'OGKB, Mendo Montage ', '', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(489, 'AK-47', 'pain relief, relaxed, sleepy', 'Colombian, Thai, Mexican, Afghani', '', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(490, 'Lava Cake ', 'pain relief, relaxed, sleepy', 'Thin Mint Girl Scout Cookies, Grape Pie ', '', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(491, 'Forbidden Fruit ', 'pain relief, relaxed, sleepy', 'Cherry Pie, Tangie', '', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(492, 'Peanut Butter Breath ', 'pain relief, relaxed, sleepy', 'Do-Si-Dos, Mendo Breath', '', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(493, 'Zookies', 'euphoric, relaxed, pain-relief', 'It’s a 50/50 hybrid, giving it the potential to produce both sativa and indica effects ranging from energy and inspiration to full body relaxation.\r\n\r\nIts unique scent and flavor profile is reminiscient of nuts with notes of chocolate or coffee, a bit of pepper, and diesel. \r\n\r\nTHC levels can reach 30%.', 'Animals Cookies, Original Glue', '2021-03-11 16:18:16', '2021-03-11 23:18:16'),
(494, 'Super Lemon Haze ', 'energetic, uplifted', 'Lemon Skunk, Super Silver Haze', '', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(495, 'Cookies and Cream ', 'pain relief, relaxed, sleepy', 'Starfighter, Girl Scout Cookies', '', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(542, 'Blue Cookies ', 'euphoric, happy', 'Sweet berry flavors fused with earthy cherry notes in a flavor profile as enticing as the bud’s thick coat of frosty resin that stretches over twisting hues of green, purple', 'Girl Scout Cookies, Blueberry', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(543, 'Blueberry ', 'euphoric, happy', 'Sweet flavors of fresh blueberries', 'Purple Thai, Thai', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(544, 'Tahoe OG', 'pain relief, relaxed, sleepy', 'Aromatic notes of earthy pine, lemon ', '', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(545, 'Cereal Milk', 'energetic, uplifted', 'Has a loud flavor with a sweet milk, ice cream nose that will keep you dipping back into your stash \nYou can expect dense, quality nugs dripping with trichomes, a potent high ', 'Cookies', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(546, 'White Fire OG', 'uplifted, energetic, euphoric, happy', 'Features notable aromas that are sour, earthy \nThe appearance  resembles a dusty snowfall of crystals \nDense, barrel-like buds, others with pointed, conic formations \nGrowers can raise their high-yielding plants indoor or outdoors with a 65-day flowering period ', 'Fire OG, The White', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(547, 'Lemon Haze', 'energetic, uplifted', '', 'Lemon Skunk, Silver Haze', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(548, 'Strawberry Banana', 'energetic, uplifted', 'Sweet, fruity flavor\nHeavy resin production, high-THC content', 'Crockett’s Banana Kush, Strawberry Bubble Gum', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(549, 'Super Silver Haze ', 'euphoric, happy, hungry', 'Beautiful, sticky strain', 'Skunk, Northern Lights, Haze ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(550, 'Grease Monkey ', 'euphoric, hunger, happy, relaxed', 'Earthy, skunky overtones', 'GG4, Cookies and Cream', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(551, 'Birthday Cake', 'relaxed, pain relief, happy', 'Sweet cake-like flavor \nBuds bloom with a crystalline icing of THC-rich resin ', 'Girl Scout Cookies, Cherry Pie', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(552, 'Animal cookies', 'pain relief, relaxed, sleepy', 'Flowers in 9-10 weeks, grows dense, frosty green buds tipped with purple\nSweet, sour aroma', 'Girl Scout Cookies, Fire OG', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(553, 'Candyland', 'uplifted, energetic, euphoric, happy', 'Golden hairs weave through Candyland’s thick coat of sugar-like trichomes, highlight the compact, camouflage-colored buds \nGrows well indoors, out ', 'Granddaddy Purple, Bay Platinum Cookies', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(554, 'Bubble Gum ', 'uplifted, energetic', 'Sweet, fruity flavors\nEasy to grow, has a flowering time of 7-9 weeks ', 'Indiana Bubble Gum, ? ', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(555, 'Jet Fuel', 'uplifted, energetic, pain relief', 'Exudes a  sweet, pungent aroma of diesel fumes  ', '? Diesel', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(556, 'FPOG', 'euphoric, sleepy, relaxed', 'Tropical, berry flavor reminiscent of the cereal', 'Green Ribbon, Granddaddy Purple, Tahoe Alien', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(557, 'White  Runtz', 'pain relief, relaxed, sleepy', 'Sweet flavor profile \nStriking white trichomes that make its buds look white like snow', 'Gelato, Zkittlez', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(558, 'Blue Cheese', 'pain relief, relaxed, sleepy', 'Sweet, savory smells of berry, blue cheese combine to create a creamy, unique flavor reminiscent of the original Cheese \n', 'Blueberry, U K  Cheese', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(559, 'Alien OG', 'pain relief, relaxed, sleepy', 'Typical lemon, pine OG smell, flavor', 'Tahoe OG, Alien Kush', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(560, 'Gelato 33', 'uplifted, energetic', 'Covered with fiery orange hairs while its buds can be dark green to purple\nSweet citrus, fruity flavors', 'Sunset Sherbet, Thin Mint Girl Scout Cookies', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(562, 'Grape Ape', 'euphoric, relaxed', 'One of the strongest OG strains, is a fan favorite among consumers who have a high THC tolerance\nFrosty red hairs that make the strain appear to look like it is on fire\nPlants typically flower in 9-10 weeks ', 'OG Kush, SFV OG, Kush', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(563, 'King Louis ', 'relaxed, pain relief, happy', 'Odor that’s meant to be enjoyed\nDense nugs have an overwhelmingly piney smell with an earthy musk\nSpicy kush aroma', 'OG Kush, LA Confidential', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(564, 'Platinum Cookies', 'pain relief, relaxed, sleepy', 'Fills your nose, lungs with sweet notes of berry, candy  followed by a fruity spiciness \nFlaunts a heavy coat of crystal trichomes over its sage green leaves, assuring its potency to any consumer in doubt ', 'OG Kush, Durban Poison, ?', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(565, 'Motorbreath', 'pain relief, relaxed, sleepy', 'Flavorful smoke with notes of fuel, earth, citrus\nGassy flavor, smell', 'Chemdog, SFV OG, Kush', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(566, 'Black Diamond', 'giggly, happy, euphoric', 'Its flowers have a glittery trichome covering, purple coloring that make it a beautiful gem to look at  \nAroma is musky, earthy, almost like a deep red wine ', 'Blackberry, Diamond OG', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(567, 'Venom OG', 'uplifted', 'Dense, forest-green buds with a tangle of bright orange hairs\nAroma of skunk, pine, lemon, diesel\nSuitable for outdoor or indoor gardens\nBreeders suggest a 50 to 65-day flowering period\nBred by Rare Darkness Seeds', 'Poison OG, Rare Dankness', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(568, 'Tropicana Cookies', 'uplifted, energetic', 'Results in an infusion of citrus notes backed up by a smooth cookies flavor \nProduces purple buds that have hints of dark green with orange hairs ', 'GSC, Tangie', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(569, 'Platinum OG', 'pain relief, relaxed, sleepy', 'Flowers are lime green, plump, with prominent orange hairs, a platinum coating thanks to the abundance of THC crystals \nA powerful physical sedation suitable for nighttime use, pain, stress, or anxiety relief ', 'Master Kush, OG Kush, ?', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(570, 'Tangie ', 'euphoric, relaxed', 'Refreshing tangerine aroma\nGrows best outside, producing sticky buds', 'California Orange, Skunk #1', '2021-02-12 20:55:33', '0000-00-00 00:00:00'),
(571, 'Gary Payton', 'euphoric, relaxed', 'Bred by Cookies cultivar, named after the NBA Hall of Famereautiful, sticky strain \nCombining the Y, Snowman breeds a potent, flavorful, colorful strain ', 'Cookies, Powerzzz', '2021-02-12 20:55:33', '0000-00-00 00:00:00'),
(572, 'Headband ', 'euphoric, relaxed', 'Smooth, creamy smoke accented by flavors of lemons, diesel', 'OG Kush, Sour Diesel', '2021-02-12 20:55:33', '0000-00-00 00:00:00'),
(573, 'Apple Fritter', 'energetic, uplifted', '', '??', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(574, 'Orange Cookies ', 'pain relief, relaxed, sleepy', 'Strong aroma of sweet citrus that closely resembles a fresh tangerine\nFlavors of Orange Cookies', 'Orange Juice, Girl Scout Cookies', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(575, 'Maui Wowie', 'energetic, happy, euphoric', 'Features tropical flavors \nSweet pineapple flavors \nBest suited for cultivation in warm, tropical climates that mirror its homeland \nBright environment, nutrient-rich soil are typically adequate for indoor growing   ', 'Hawaiian, ?', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(576, 'Cookies Kush ', 'pain relief, relaxed, sleepy', 'Potent indica', 'Girl Scout Cookies, OG Kush', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(577, 'Thin Mint GSC', 'pain relief, relaxed, sleepy', 'Dark green, royal purple hues peek through a heavy coat of crystals\nSweet minty smell', 'Durban Poison, OG Kush', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(578, 'White Rhino', 'relaxed, pain relief', 'Bushy, stout plant ', 'White Widow, North American Indica', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(579, 'Kush Mints ', 'uplifted, happy, hungry', 'Unique minty taste\nComplex flavor profile that tastes like mint, cookies\nGrows best when indoors', 'Animal Mints, Bubba Kush', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(580, 'Banana Kush', 'euphoric, energetic, uplifted', 'Tastes, smells like a bushel of fresh bananas ', 'Ghost OG, Skunk Haze', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(581, 'Purple Haze', 'euphoric, energetic, uplifted', 'Sweet, earthy flavors underscored by notes of berry, sharp spice\nBuds acquire vibrant hues of lavender', 'Purple Thai, Haze', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(582, 'Pound Cake', 'euphoric, energetic, uplifted', 'Offers a loud berry, grape flavor that’s backed by sharp lemon, citrus overtones ', 'Sunset Sherbert, ?', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(583, 'Alaskan Thunder Fuck ', 'euphoric, energetic, uplifted', 'Presents large, beautifully frosted buds with incredibly strong odors of pine, lemon, menthol, skunk', 'Northern California sativa, Russian ruderalis, Afghani', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(584, 'Berry White', 'energetic, happy', 'Flowers have a light sour berry, pine smell, a fresh taste similar to their scent \nStrong blue coloring contrasted by orange hairs ', 'Blueberry, White Widow', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(585, 'G13', 'euphoric, happy, energetic, uplifted', '', '?', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(586, 'Mango Kush', 'energetic, happy', 'Tastes similar to the actual mango fruit, with a distinct kush flavor, hints of pine on the exhale \nBuds are covered with orange pistils, are described as very dense \nHas an average growth height of 4-5 feet \nFlowering is 9-11 weeks, is a favorite with both indoor, outdoor growers  \nBuds have thick shiny trichomes which are evident when the bud is broken apart \nSmell, taste are the same, described as mango, banana ', '?', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(587, 'Ice cream ', 'energetic, happy', 'Exotic, potent\nDense nugs with tightly clustered trichomes\nTasty terpenes offer flavors of vanilla, pine while the aroma is pure skunk', '?', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(588, 'Khalifa Kush', 'energetic, happy', 'Sour lemon, pine ', '?', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(589, 'Ghost Train Haize', 'energetic, happy', 'Grows dense buds blanketed in white, crystal-capped trichomes\nSour citrus, floral aroma\n', 'Sativa Ghost OG, Neville’s Wreck', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(590, 'Superglue', 'pain relief, relaxed, sleepy', 'Relaxing', 'Afghani, Northern Light ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(591, 'Gelato #41', 'pain relief, relaxed, sleepy', 'Buds that grow in an array of colors, from light green to purple, with trichomes that put out a sweet, earthy aroma alongside hints of lavender, pine \nPotent ', 'Sunset Sherbert, Thin Mint Cookies', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(592, 'Platinum Kush ', 'pain relief, relaxed, sleepy', 'Takes on a platinum-silver shade due to its thick coat of crystal resin\nPurple hues, bright orange hairs\nBuds grow dense with a sweet fruity, hashy aroma', 'OG Kush, Afghani', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(593, 'Purple Kush', 'pain relief, relaxed, sleepy', 'Aroma is subtle, earthy with sweet overtones typical of Kush varieties \nGrow wide rather than tall, will be ready for harvest following an 8-week flowering time ', 'Hindu Kush, Purple Afghani', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(594, 'Blueberry Muffin ', 'euphoric, energetic, uplifted', 'Uniform bud structure, purple-tinted flowers\nSmells like a tray of fresh baked muffins\nBerry sweetness is softened by a smooth, creamy finish, makes for a tasty joint', 'Blueberry, Purple Panty Dropper', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(595, 'Master Kush ', 'euphoric, energetic, uplifted', 'Taste of Master Kush is reminiscent of the famous hard-rubbed charas hash\nProduces a subtle earthy, citrus smell with a hint of incense, which is often described as a vintage flavor', 'Landrace, ?', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(596, 'Cheese', 'relaxed, happy', 'Named for its sharply sour aroma \nUnique flavor, consistent potency ', 'Skunk #1, ? ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(597, 'Papaya ', 'energetic, happy', 'Smells uncannily like its namesake\nThe taste is similar to its tropical fruit counterpart, with a spicy, peppery side \nThe plants stay fairly short, thin, producing lots of fluffy buds with papaya-orange hairs in 8 or 9 weeks', 'Citral #13, Ice #2', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(598, '9 lb Hammer', 'pain relief, relaxed, sleepy', 'Dense buds are coated in resin, offering sweet grape, lime flavors \nHosts a terpene profile abundant in myrcene, pinene, caryophyllene with THC levels ranging between 17-21% \nBest grown indoors,\nFlowers between 50-60 days ', 'Gooberry, Hells OG, Jack the Ripper ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(599, 'Lemon Cake ', 'relaxed, hungry', 'Emits a pungent citrus aroma with a musky Cheese undertone\nSweet, musky aromas\n 9-10 week flowering time', 'Lemon Skunk, a “dangerously powerful Cheese,”', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(600, 'Lemon OG', 'euphoric, relaxed, sleepy', 'Skunky aroma\nMild tasting, pleasant smelling with fruity undertones\nFlower in 8-10 weeks ', 'the mythical Las Vegas Lemon Skunk, The OG #18', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(601, 'Lemon Kush', 'uplifted, creative', 'Sweet flavors of lemon, citrus mix exceptionally well with the earthy kush undertones \nLight green buds are covered in a white frosting of trichomes ', 'Master Kush, Lemon Joy ', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(602, 'God\'s Gift', 'euphoric, happy', 'Contains flavors of grape, citrus, hash\nFlowering time usually takes approximately 8-9 weeks', 'Parents are Granddaddy Purple, OG Kush', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(603, 'Black Jack', 'euphoric, happy', 'Produces thick buds with huge calyxes that are completely encrusted with trichomes \nHeavy, flavorful taste ', 'Black Domina, Jack Herer  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(604, 'Sour Tangie', 'energetic, happy', 'Brings together the classic Sour Diesel aroma with Tangie’s creative, elevating buzz, strong citrus overtones\nGrows quickly in its vegetative cycle, finishes flowering in 9 to 10 weeks indoors', 'East Coast Sour Diesel, Tangie', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(605, 'Acapulco Gold', 'energetic, happy', 'Orange hairs, with gold, green, and brown colors and plenty of crystal on the buds.', 'Acapulco Gold, ?', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(606, 'Chocolope', 'euphoric, happy, relaxed', 'Hefty buds give earthy, sweet coffee flavors', 'Chocolate Thai, Cannalope Haze', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(607, 'Blue Diesel ', 'energetic, happy', 'Flower emanates a light berry aroma that is smooth, expansive, fast-acting', 'Blueberry, NYC Diesel', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(608, 'Amnesia', 'euphoric, relaxed', '9-10 week flowering period with moderate yields ', ' Cinderella 99, Jack Herer  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(609, 'Orange Creamsicle', 'happy, hungry', 'Tall structure, heavy colas, pungent flavor\nStrong citrus flavor\nFlowers in 9 weeks with beautiful orange-white coloring, a thick coating of resin', 'Best attributes of parent strains Orange Crush, Juicy Fruit', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(610, 'True OG', 'euphoric, pain relief', 'Potent \nPungent, crisp citrus, pine scent ', 'Bred genetics from OG Kush ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(611, 'Haze', 'energetic, creative', 'Spicy scent accented by hints of citrus with an earthy sweetness.', 'Sativa marijuana strain', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(612, 'NYC Diesel', 'happy, talkative, relaxed', 'Pungent lime, grapefruit aroma', 'Mexican, Afghani landraces', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(613, 'White Tahoe Cookies', 'pain relief, happy ', 'Exemplifies attributes of each in trichome coverage, effect, aroma \nEnhanced through this cross, offering up sweet, hashy notes with distant OG undertones  ', 'The White, Tahoe OG, an unknown Girl Scout Cookies cut ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(614, 'Super Skunk', 'relaxed, pain relief  ', 'Extra skunky aroma ', 'Skunk #1 Afghani  ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(615, 'Dutch Treat', 'euphoric, relaxed', 'Features a flavor profile that smells like sweet fruits mixed with pine, eucalyptus trees\nDense, sticky buds that are pungent', 'Northern Lights Haze', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(616, 'Lamb\'s Bread', 'energetic, uplifted, pain relief', 'Bright green buds that are sticky, dense ', 'Origins in Jamaica  ', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(617, 'Lemon Meringue', 'uplifted, energetic, pain relief    ', 'Citrus, diesel, with a hint of nuttiness are at the center of this bouquet.', 'Lemon Skunk, Cookies, Cream  ', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(618, 'Orange Crush ', 'uplifted', 'Offers a super sweet, tangy flavor profile', 'California Orange, Blueberry', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(619, 'MK Ultra', 'euphoric, pain relief', 'Short stature\nDelivers particularly sticky, dense, pungent flowers', 'OG Kush G13', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(620, 'The White', 'sleepy, relaxed', 'Distinct lack of odor or flavor \nCovered with so many white trichomes that buds look like they were rolled in confectioner’s sugar \nPotency associated with the best OG Kush cuts, it has little of the smell or flavor found in those West Coast favorites  ', 'From somewhere in Florida ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(621, 'Pink Lemonade ', 'energetic, creative, happy', 'Smells like fruity, mentholated tea, has flavors of lemon, grapefruit on the exhale\nSmall buds that are coated in a generous layer of trichomes atop jade foliage, bronze pistils', 'Lemon Skunk Purple Kush', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(622, 'Jager', 'euphoric, a ', 'Tastes, smells like black licorice  ', 'LA Confidential, Blue Dream  ', '2021-02-12 20:55:33', '0000-00-00 00:00:00'),
(623, 'Blueberry Cookies', 'relaxed, creative, happy', 'Unique flavor is a mixture of roasted nuts,  blueberries and mint. The bouquet provides an earthier, berry-forward aroma', 'Blueberry Tahoe, Thin Mint GSC (f k a  Girl Scout Cookies)', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(624, 'Kimbo Kush', 'relaxed, pain relief  ', 'Potent ', 'Blackberry Kush Starfighter ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(625, 'Mango Haze', 'uplifted, happy', 'Mango flavored.', 'Northern Lights #5, Skunk, Haze', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(626, 'Cannatonic', 'uplifted, relaxed, pain relief', 'Slightly earthy with a sweet citrus flavor.', 'MK Ultra, G13 Haze  ', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(627, 'Strawberry Diesel', 'energetic, relaxed', 'Incredibly versatile\nFast-acting, intense\nGreat for indoor growing\nFlowers between 9, 10 weeks\nFruity scent while providing a thick, diesel-like taste', 'NYC Diesel, Strawberry Cough ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(628, 'Goji OG', 'uplifted, relaxed, pain relief', 'The flavor is as unique as the berry it\'s named after \nDynamic aroma including red berry, black cherry, strawberry, hawaiian punch, licorice \nIndoor or outdoor grows offer high yields with a flowering time of around 9 weeks ', 'Crossed between Nepali OG, Snow Lotus  ', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(629, 'Pineapple Chunk', 'uplifted, relaxed, pain relief', 'Flavors that are tart, skunky, earthy, cheesy with undertones of pineapple\nResistant to mold, disease\nflowering time of 55 days, is best grown indoors', 'Cheese Skunk #1, Pineapple', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(630, 'Liberty Haze', 'uplifted, happy', 'Fast flowering time, unique taste \nMatures as a medium-tall, bushy plant in 8-9 weeks \nBuds are lime-green, heavy with crystals, usually have plenty of red hairs  \nRefreshing lime taste, potent \n', 'G13, Chemdawg 91 ', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(631, 'Pink Champagne', 'pain relief, happy ', 'Notes of grape, berry', 'Ken’s Granddaddy Purple, Cherry Pie', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(632, 'Lavender', 'relaxed, happy', 'Dense buds that give off a floral, spicy aroma \nDark purple coloration at the ends of its leaves ', 'Origins from Super Skunk, Big Skunk Korean, Afghani Hawaiian  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(633, 'Sour Tsunami', 'pain relief, happy ', 'Flowers within 9 weeks, producing dense, dark green buds with dark green, purple-tinged leaves \nBuds have a familiar musky diesel smell with sweet undertones ', 'Sour Diesel plants NYC Diesel  ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(634, 'Blueberry Cheesescake', 'pain relief, happy ', 'Smell distinctly of blueberry cheesecake', 'Bred from Blueberry, Cheese', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(635, 'Cinex', 'uplifted, creative, happy', 'Mixture of flavors ranging from sweet citrus to earthy skunk  ', 'Hybrid of parents Cinderella 99, Vortex', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(636, 'Raspberry Kush ', 'relaxed, sleepy', 'Raspberries, cream aroma', 'Great-tasting indica strain', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(637, 'Snoop\'s Dream', 'euphoric, happy', 'Medium-sized dense buds covered in orange hairs  \nSweet blueberry flavors are there with a pine aftertaste ', 'Mix of Blue Dream, Master Kush, ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(638, 'Blueberry Diesel', 'happy, relaxed', 'Strong blueberry smell with hints of fuel from its Diesel lineage \nBlueberry flavors overwhelm its sticky flowers, which should have plenty of trichomes, long orange hairs  ', 'two favorite strains, Blueberry, Sour Diesel ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(639, 'Black Cherry Pie', 'relaxed, sleepy, hungry', 'Deep purple hues overlaid by jade green buds with orange hairs, as well as in the pungent woody aroma smeared with tart blackberry ', 'Genetic offspring of Blackberry Kush, Cherry Pie  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(640, 'Cheese Quake', 'uplifted, creative, happy', 'A hint of grape is detectable, but its aroma is led by the funky sour aroma ', 'Cheese, Querkle ', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(641, 'Plushberry', 'relaxed, happy', 'Aromatic berry scent \nHeavy resin production \nThere are two main phenotypes of Plushberry: one that grows smaller, pink-tinted plants, another with bulkier, more indica-like formations \n Flowers in 55 to 65 days with medium to heavy yields  ', 'Black Cherry Soda, Space Queen,', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(642, 'Allen Wrench ', 'euphoric, happy', 'Crisp flavors of sour fruit\nSour, flowery, leaving a lingering scent of fruit\nBuds have a dark-green color, dark foliage with orange pistils growing out\nHas a 10-11 week flowering time, medium to medium-high THC content ', 'Best qualities of its parents, Trainwreck, NYC Diesel ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(643, 'Frankenstein ', 'euphoric, happy, sleepy, pain relief', 'This strain is a monster!', 'Unknown', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(644, 'Lemon Garlic OG', 'euphoric, sleepy, pain relief', 'The aroma is a bit spicy with notes of garlic, citrus, pine \nDensely stacked buds are frosty lime green, produce heaps of trichomes ', 'Desirable cuts of True OG, L', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(645, 'Primus', 'euphoric', 'Sour fruit flavors\n', 'Combination of Arcata, Trainwreck, 303 OG', '2021-02-12 20:55:45', '0000-00-00 00:00:00'),
(646, 'Dutch Treat Haze', 'energetic, uplifted, hungry', 'Potent, flavorful \nUndoubtable Haze aroma of pungent earthy tones from Super Silver Haze with the influence of Dutch Treat’s crisp, fruity, floral flavors\n ', '. ', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(647, 'Pineapple Super Silver Haze', 'euphoric, energetic, talkative, creative', 'Spicy, zesty flavor\nAroma is more of a tropical medley of candied mango, pineapple, oranges', 'Modifies Super Silver Haze a Pineapple hybrid strain', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(648, 'Orange Skunk', 'euphoric, happy, sleepy, pain relief', 'Smell that is as sweet as it is sour\nFlower in 8 to 10 weeks in indoor gardens', 'Clear-headed hybrid Californian Orange, Skunk', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(649, 'Very Berry Haze', 'creative, relaxed', 'Best grown indoors or in warm climates, plants flour at about 10 weeks \nGrow fast, tall, usually produce a large number of flowers  \nApparent in its smell, fruity aftertaste ', 'Combination of the popular sativas Strawberry Cough, Super Silver Haze ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(650, 'Green Queen', 'euphoric, creative, relaxed', 'Aroma is skunky, subtly sweet, with hints of citrus, pepper on the finish  \nBud is deep green with bright orange pistils \n\n ', 'Green Crack, Space Queen ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(651, 'Alien Walker', 'pain relief, sleepy', 'Fast-growing plant with a short vegetative cycle\nProduces large yields of frost-covered buds as hairy as fictitious space bears\nPungent fruity notes of tangerine, lemon', 'Albert Walker, Tahoe Alien', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(652, 'City of God', 'functional, relaxed  ', 'Start praying!', ' NYC Diesel, God Bud,', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(653, 'Monkey Thunder ', 'energetic, happy', 'Fruity, tropical terpenes\nNotes of pineapple, citrus peel\nAddition of Monkey Face helped stabilize the morphology, flowering time of the plant\nSnappy 50-day flowering cycle, has been known to reach about 8 feet tall', 'Lemon Pineapple, Maui Wowie, Tropic Thunder, Monkey Face', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(654, 'Larry OG', 'happy, relaxed', 'Clean, piney aroma \nThe nugs tend to be dense, feature distinct burnt orange hairs that are longer than average ', 'OG Kush, SFV OG ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(655, 'LA Confidential', 'euphoric, relaxed, pain relief', 'Buds have a frosty, lime green appearance, little purple leaves  \nSmooth, piney taste,\nClassic skunky aroma that does not linger for too long  ', '. ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(656, 'Gorilla Cookies', 'pain relief, relaxed, happy', 'Aroma is loud, but Thin Mint’s exotic terpene profile adds nuance to the bouquet \nResin-coated buds that harden like stones after curing  ', 'Union of Gorilla Glue #4, Thin Mint Girl Scout Cookies  ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(657, 'Cinderella 99', 'euphoric, uplifted', 'Potent cerebral high, sweet fruity flavors, epic yields  \nVery popular with indoor growers because of its short, bushy stature, high yields, short flowering time, high THC content ', 'Jack Herer, ?', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(658, 'Critical Kush', 'pain relief', 'Aromatic notes of earthiness, spice \nHigh THC content with a moderate dose of CBD', 'Critical Mass, OG Kush ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(659, 'Pink Kush', 'pain relief', 'Pink hairs burst from bright green buds barely visible under a blanket of sugar-like trichomes \nTraces of a sweet vanilla, candy perfume \nPotency of this strain could be considered overpowering\n10 to 11 weeks for Pink Kush’s flowering, but high yields of top-shelf buds ', '. ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(660, 'Ghost OG', 'pain relief, relaxed, sleepy', 'Simultaneously potent, non-intrusive \nStrong citrus smell, crystal-covered buds ', 'OG Kush, ?', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(661, 'Kosher Kush', 'pain relief, relaxed, sleepy', 'Produces staggering levels of THC \nUnique yet familiar smell reminiscent of rich earth, fruit,\nThe high experienced is typical of many heavy strains ', 'Originated in Los Angeles as a clone-only strain ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(662, 'Harlequin', 'pain relief, relaxed, sleepy', 'High levels of CBD \nFeatures flavors that range from earthy musk to sweet mango ', 'Descendant of Colombian Gold, a Nepali indica, Thai, Swiss landrace strains  ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(663, 'XXX OG', 'pain relief, relaxed, sleepy', 'Bulky, conic buds glow with a heavy \nWhite coat of oozing trichomes \nEmitts earthy, pine, lemon notes that combine for a sap-like aroma ', 'From parent strains OG Kush, XXX ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(664, 'Lemon Skunk', 'happy, energetic', 'Skunky, citrus flavor', 'Bred from two separate Skunk phenotypes that displayed exceptionally zesty lemon traits ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(665, 'Blackberry Kush', 'pain relief', 'Dense, beautiful nugs of purple, orange \nHashy, jet fuel taste, aroma that is balanced by sweet berries \nTakes approximately 7-8 to flower although it does not typically have a high yeild \n\n ', 'Combination of Afghani, Blackberry ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(666, 'platinum Bubba Kush', 'pain relief', 'Floral, full of kush spiciness in aroma \nFhe flowers of this strain will have a surprisingly sweet flavor \nFlowering in 8 to 9 weeks  \nDense, purple-hued nugs', 'Platinum OG Kush, Bubba Kush', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(667, 'Banana OG', 'pain relief', 'With a smell, flavor of overripe bananas \nHas a reputation as a creeper ', 'OG Kush, Banana ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(668, 'LSD', 'pain relief, euphoric', 'Aa disease-resistant plant that does well in most growing conditions \nBuds form in curved triangles, yielding approximately 600 grams per square meter \nFlowering time is approximately 8-9 weeks ', 'Lineage from Mazar-I-Sharif, Skunk #1 ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(669, 'Obama Kush', 'euphoric, happy', 'Flowers are frosty with a purple hue, reddish hairs, giving off a light aroma ', 'Afghani, OG Kush,', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(670, 'Hindu Kush', 'pain relief', 'Express a thick, protective coat of crystal trichomes \nSubtle sweet, earthy sandalwood aroma ', '. ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(671, 'Death Star', 'relaxed, euphoric', 'Combines sweet skunk, fuel aromas into a pungent fragrance ', 'Sensi Star, Sour Diesel ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(672, 'Clementine', 'energy, focus', 'Sweet taste, citrus aroma ', ' Tangie Lemon Skunk  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(673, 'Kandy Kush', 'relaxed, pain relief', 'The flavor is sweet like candy with a strong lemon-Kush scent  ', 'Combines two California classics, OG Kush (thought to be the “Christopher Wallace” cut), Trainwreck', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(674, 'Sour OG', 'relaxed, pain relief', 'Most samples express dense, round, OG Kush-type buds laden with large, sticky trichomes \nOdor, taste are usually an equal mix of both parents ', 'Sour Diesel, OG Kush ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(675, 'Black Mamba', 'relaxed, pain relief', 'Features dark green, dense nugs that have a strong perfumey aroma \nDistinctly sweet grape taste  \nPoduce dark green to purple leaves,', 'Granddaddy Purple, Black Domina ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(676, 'Purple Urkle', 'relaxed, pain relief', '. ', 'Blend of skunk, berry, fresh grapes ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(677, 'Afghan Kush', 'relaxed, sleepy, happy', 'Buds of Afghan Kush develop into massive, blunt-topped nuggets full of resin, coming in big yields  \nHeavy resin content', '. ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(678, 'Watermelon', 'relaxed, hungry, sleepy', 'Distinct fruity watermelon flavor profile, reminiscent of grape with hashy undertones  \nHigh yield, potency, requiring 55 to 60 days flowering time  \nLarge, dense buds that are valued for their high THC content  ', ' two unknown parents ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(679, 'Tangerine Dream', 'happy, uplifted, euphoric, energetic', 'Delivers a light, citrusy aroma.', 'G13, Afghani, Neville\'s A5 Haze  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(680, 'Key Lime Pie', 'relaxed, energizing, pain relief', 'Features flavors of lime candy, mint, spice  \nFlavors are earthy, chocolatey \nBuds show traces of purple hues due to the plant’s affinity towards colder temperatures  ', '. ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(682, 'Island Sweet Skunk', 'energetic, uplifted, relaxed', 'Offers a sweet, skunky flavor with undertones of grapefruit \nFlowering time of 7-8 weeks \nBuds  are green with bright yellow, orange hairs \n', ' Sweet Pink Grapefruit Skunk #1 ', '2021-03-05 17:06:53', '0000-00-00 00:00:00'),
(683, 'Silver Haze', 'calming', 'Massive amount of shiny THC glands covering the buds  ', 'Haze Northern Lights,', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(684, 'Skunk 1', 'creative, energetic, hungry , happy', 'An aromatic blend of sour skunkiness, with subtle earthy notes.', 'Sacred Seed Co  originally bred Skunk #1 using diverse genetics from around the world; Afghani, Acapulco Gold, Colombian Gold varieties ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(685, 'Fruit Punch', 'creative, energetic', 'Sweet, fruity, tropical flavors.', ' Skunk, Haze, Northern Lights  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(686, 'Afghani', 'relaxed, euphoric, pain relief', 'Sweet, earthy flavors.', '. ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(687, 'XJ-13', 'euphoric, creative, talkative', 'Strong citrus aroma accented by notes of earthy pine.', ' Jack Herer, G13 Haze  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(688, 'Diamond OG', 'relaxed, euphoric', 'Has the familiar OG aroma of citrus-pine supported by diesel undertones  \nThese sparkling nugs will be condensed, have a strong odor', 'OG Kush, ?', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(689, 'Lemon Tree', 'happy, relaxed, euphoric, pain relief', 'Features a flavor profile that tastes like fresh lemons with undertones of diesel.', ' Lemon Skunk, Sour Diesel  ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(690, 'ACDC', 'pain relief', 'Produces little to no intoxicating effects ', 'Cannatonic , ?', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(691, 'Holy Grail Kush', 'relaxed', 'The aroma of this plant is kushy, has a strong spicy citrus smell \nEasy to grow, features large, dense buds that appear at 9-10 weeks ', ' OG #18, Kosher Kush  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(692, 'Critical Mass', 'creative, relaxed, sleepy', 'Huge, heavy, dense, tasty  buds.', 'Afghani, Skunk #1 ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(693, 'Blueberry Kush', 'relaxed, euphoric, sleepy', 'Produces effects that slowly brings on a heavy body sensation ', 'Blueberry, OG Kush  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(694, 'Monster Cookies', 'relaxed, euphoric', 'Features an aroma dominated by earthy notes, enriched by a grape, berry scent  \nFeatures hues of purple, green woven together under a silver blanket of crystal trichomes ', 'Girl Scout Cookies, Granddaddy Purple  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(695, 'Super Sour Diesel', 'relaxed, euphoric, pain relief, creative, energetic, talkative', 'Very potent\nProduce strong cerebral effects that may overpower a novice smoker  \nPungent, tastes like fuel when smoked ', 'Super Silver Haze, Sour Diesel ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(696, 'Agent Orange', 'uplifted, energetic', 'Aroma of fresh-cut citrus \nBuds have pigments of both deep maroon, purple ', 'Orange Velvet, Jack the Ripper ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(698, 'White Russian', 'euphoric, relaxed', 'Extremely fragrant plant, with aromas of sweet fruit, skunk ', ' White Widow, AK-47  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(699, 'Cotton Candy', 'euphoric, relaxed, pain relief', 'Big, bold cherry flavors with undertones of flowers  ', 'Lavende,r Power Plant  ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(700, 'Jillybean', 'creative, euphoric, uplifted, happy', 'The flavor  tastes like tangy oranges, mango ', 'Orange Velvet, Space Queen ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(701, 'Death Bubba', 'pain relief', 'Pungent strain that produces semi-sedating effects \nTastes sweet, earthy, clean on the palate \nThe aroma is stinky, skunky  \nGrowers say this strain has beautiful purple hues with trichomes, terpenes abound ', ' Death Star, Bubba Kush ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(702, 'Sunshine', 'happy, uplifted, pain relief', 'Offers fruity citrus flavors with tropical undertones \nLight green buds that glisten with trichomes ', 'Chemdawg, Sunshine Daydream ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(703, 'OG #18', 'relaxed', 'Has a distinct diesel kush flavor with sour undertones \nIndoor flowering time of 9 weeks ', '. ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(704, '24k Gold', 'euphoric, relaxed', 'Offers a sweet critrus flavor when smoked or vaped  \nGrowers say this strain has dark colored buds like its parent, Kosher Kush', 'Kosher Kush, Tangie  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(705, 'Godfather OG', 'relaxed, pain relief, seepy', 'Features a flavor profile that is spicy, kushy, with undertones of subtle grape \nHigh THC levels ', 'XXX OG, Alpha OG ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(706, 'Moby Dick', 'energetic', 'Sweet  citrus aroma  that gives way to vanilla, eucalyptus notes \nShort flowering period, is resistant to mold, provides a high yield  ', ' White Widow, Haze ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(707, 'Orange Kush', 'relaxed, uplifted', 'Sweet, tangy citrus flavor \nResistant to most pests, mold \nIt has long, dense buds with many orange hairs, trichome crystals ', 'Orange Bud, OG Kush ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(708, 'White Buffalo', 'uplifted, euphoric', 'Sweet, sour flavor \nBuds are covered in a snowy white coating of crystal trichomes ', ' Romulan Blackberry Kush, Bay 11  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(709, 'Juicy Fruit', 'creative', 'Tangy, sweet aroma with notes of fruit punch, lemon, plums, tropical pina colada \nFlowering time of 7-9 weeks, with THC levels ', 'Afghani, Thai ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(710, 'Rainbow', 'creative, pain relief', 'Compact, fast flowering strain with little side-branching \nDoes very well when grown in the “sea-of-green” style \nPesents a wide array of colors towards the end of flowering, hence the moniker \nSpicy-sweet fruity flavor,', ' Dancehall, Blueberry  ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(711, 'Blueberry Headband', 'euphoric, relaxed', 'Offers a sweet, blueberry flavor, aroma \nProduces medium to tall plants that are bushy, provide large yields with reinous colas ', ' Headband, Blueberry ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(712, 'White 99', 'uplifted, happy, relaxed', 'Tastes fresh, bright, like tart oranges mixed with lemons, kush  \n', ' Cinderella 99, The White ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(713, 'El Jefe', 'relaxed, sleepy', 'Offers an earthy, lemon aroma with undertones of spice  ', 'Abusive OG, Rare Dankness #1  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(714, 'Apple Jack', 'uplifted, pain relief', 'Features a flavor profile that is skunky, earthy with undertones of sliced apple ', 'Jack Herer, White Widow  ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(715, 'Bio-Jesus', 'pain relief, euphoric, sleepy', '. ', ' Gumbo, Bio-Diesel,  Bio-Jesus ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(716, 'Peyote Cookies', 'euphoric, pain relief', 'Features a unique flavor profile with hints of guava, vanilla, coffee, earth \nEasy to grow, is resistant to mold  \nWhen flowering, you\'ll get to enjoy vivid colors like red, purple  ', 'Peyote, Purple Cookies, Kush ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(717, 'Pink Cookies', 'energetic, relaxed', 'Rich with tangy sweet earth, pepper,taking notes, dimension from its OG, Durban Poison parentage ', 'Girl Scout Cookies, Cherry Pie  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(718, 'Cali Kush', 'uplifted, energetic', 'Offers fruity, citrus flavors with spicy hints of coffee, kush \nProduces buds that are large, dense ', '. ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(719, 'Blue Zkittlez', 'pain relief, hungry, uplifted', 'Odoriferous flower offers a terpene profile of tart citrus, sweet earth, wildflowers  \n', ' Blue Diamond, Zkittlez ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(720, 'Mango', 'euphoric, uplifted', 'Known to be a creeper strain, meaning that the effects come on slowly  \nSmells, tastes like its namesake, a bright juicy mango  \nLarge buds that are the size of a softball, takes 9-11 weeks to flower ', ' KC 33, Afghani ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(721, 'Sensi Star', 'relaxed, sleepy', 'Has crystal trichomes that sparkle against dark green, purple coloration \nCan be grown both indoors, outdoors ', '. ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(722, 'Grapefruit', 'energetic, happy', 'Features a tropical flavor profile, citrus aroma ', 'Cinderella 99 , ?', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(723, 'Deadhead OG', 'relaxed\n', 'Average flowering time of 63 days\nHearty, pungent strain that smells piney, earthy ', 'Chemdog 91, SFV OG, Kush  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(724, 'Blackberry', 'relaxed, happy', 'Pungent aroma that smells like fruit, fuel \nComes in a tight leaf struture with frosty buds  \nGrows best indoors, has a flowering time of 9-11 weeks', ' Black Domina, Raspberry Cough  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(725, 'Member Berry', 'euphoric, happy', 'Features an aroma that smells tart, fruity  \nDense green buds that are beautiful to behold ', 'Skunkberry, Mandarin Sunset ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(726, 'Strawberry Kush', 'anxious', 'Features a musky strawberry taste that lives up to its name \nFlowering time of 8-9 weeks ', ' Strawberry Cough, OG Kush ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(727, 'Legend OG', 'relaxed, pain relief, happy', 'Has a tart, floral aroma, a pungent flavor \n\n ', 'OG Kush, ?', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(728, 'Rockstar', 'euphoric, anxious, pain relief', 'Grows best outdoors \nSmells like sweet grapes with undertones of spice  ', 'Rockbud, Sensi Star  ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(729, 'Strawberry Cheesecake', 'pain relief, creative, energetic, uplifted', 'Features THC levels over 20%, CBD levels of 2% or more  \nTastes like its namesake suggests – sweet, creamy with undertones of berry  ', ' Chronic, White Widow, Cheese ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(730, 'Big Bud', 'relaxed', 'Features an earthy, spicy aroma  \nPoduces high yields, massive buds with very few leaves  \nBest for indoor growing, has a flowering time of 57 days ', 'Afghani, Northern Lights, Skunk #1  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(731, 'Blackwater', 'euphoric, pain relief, hungry', 'Has a flowering time of 8-10 weeks, produces moderate yields when grown indoors  \nOffers a sweet grape aroma that belnds well with subtle undertones of lemon, pine  ', 'Mendo Purps, San Fernando Valley OG', '2021-03-05 16:06:39', '0000-00-00 00:00:00');
INSERT INTO `strains` (`id`, `name`, `effect`, `description`, `parent`, `created_at`, `updated_at`) VALUES
(732, 'SFV OG Kush', 'relaxed, anxious , pain relief', 'Pungent, commonly described as smelling like lemon scented cleaner mixed with pine ', ' SFV OG, OG Kush  ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(733, 'Skywalker Alien', 'relaxed, happy', 'Inherits a staggering THC content from its parent strains ', 'Skywalker, Alien OG', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(734, 'Romulan', 'anxious, relaxed', 'Produces dense, frosty buds, is a popular choice among growers in the Pacific Northwest \nPine-scented strain', 'White Rhino , ?', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(735, 'Pineapple', 'uplifted, relaxed', 'Features intense tropical flavors with undertones of pineapple, diesel  ', 'ERSB), ?', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(736, 'Jack Frost', 'happy, creative, energetic ', 'Has a flavor profile featuring sweet, woody scents with just a hint of lemon ', ' White Widow, Northern Lights #5 ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(737, 'Sour Apple', 'relaxed, pain relief', 'Extremely potent, may make your tastebuds tingle ', ' Sour Diesel, Cinderella 99', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(738, 'Mazar x Blueberry OG', 'relaxed, pain relief', 'Has the strong aroma characteristic to kush strains that includes a spicy herbal scent tinged with jet fuel ', 'Mazar, Bluebery, OG Kush', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(739, 'Laughing Buddha', 'happy, uplifted, giggly', 'Provides a rich pungent smoke \nSweet, fruity smell \nFrosty buds cover almost the entire plant ', 'Thai, Jamaican', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(740, 'Black Domina', 'relaxed, anxious, sleepy', 'Features a spicy pepper aroma, flavor \nHas a rapid flowering time, produces buds that are coated in trichome crystals ', ' Northern Lights, Ortega, Hash Plant, Afghani ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(741, 'Red Dragon', 'happy, uplifted, anxious', 'Best grown indoors, has a flowering time of 8-10 weeks \nSweet, fruity aroma ', ' South American Afghani ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(742, 'Lemon Diesel', 'relaxed, focused', 'Offers a delicious flavor that is fruity, sweet with hints of citrus, pepper  \nHas a flowering time of 9-10 weeks ', 'California Sour, Lost Coast OG ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(743, 'Face Off OG', 'euphoric, relaxed', '. ', '. ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(744, 'Dogwalker OG', 'relaxed, focused, sleepy, pain relief, hungry', 'Features a complex flavor profile that is woody, skunky ', ' Albert Walker OG, Chemdawg 91 ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(745, 'Lucky Charms', 'euphoric, creative, happy', 'Tastes like bright, tangy fruit \nCoated in sugary resin \nBest grown indoors, has a flowering time of 9 weeks ', 'The White, Appalachia  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(746, 'Ice', 'anxious, relaxed', 'Produces high yields with incredible trichome production \nHroduces high yields with incredible trichome production ', 'Skunk #1, Afghani, Northern Lights, Shiva  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(747, 'Sweet Tooth', 'euphoric, uplifted, pain relief', 'Growers say the colas on this strain are candy-coated with trichomes  ', 'Hawaiian, Nepali  ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(748, 'Recon', 'euphoric, sleepy', '. ', 'LA Confidential, Cannadential  ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(749, 'Cookie Dough', 'hungry, pain relief, uplifted', 'Best reserved for users with a high THC tolerance ', 'Girl Scout Cookies, ? ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(750, 'Pineapple Kush', 'relaxation, pain relief', 'Subtle, sweet pineapple notes with minty undertones.', 'Pineapple, Master Kush  ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(751, 'Hawaiian', 'happy, creative, relaxed, pain relief', 'Features an aroma reminiscient of tropical fruits.', '. ', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(752, 'Power Plant', 'happy, creative, pain relief', 'Has an aroma that is woody, earthy, pungent  The taste is sharp, peppery  Has a fast growing time, will grow well in just about any environment  ', 'African Sativa , ?', '2021-03-05 16:06:39', '0000-00-00 00:00:00'),
(753, 'Cherry Diesel', 'uplifted', 'This strain blooms with dense, sticky buds that give off a fragrant cherry aroma after its 8 to 9 week flowering cycle  ', ' Cherry OG, Turbo Diesel ', '2021-02-12 20:59:38', '0000-00-00 00:00:00'),
(754, 'Orange MAC', 'pain relief, relaxed, sleepy', 'Strong aroma of citrus that closely resembles the flavor of Orange Cookies', 'Orange Juice, Girl Scout Cookies', '2021-03-05 16:06:39', '2021-03-04 00:48:57'),
(755, 'Gelatamo', 'relaxed, euphoric', 'Building on the popularity of the Gelato strains, Gelatamo takes it to another level with beautiful flower and high yield plants.<br>', 'Gelato, GMO<br>', '2021-03-03 19:38:41', '2021-03-04 01:58:59'),
(1520, 'Great White Shark', 'relaxed, happy, euphoric, pain relief', 'Has a bold, fruity aroma, undertones of skunk.Grows best indoors and has a flowering time of 8-10 weeks. It\'s buds are white, a blanket of crystals outlined, orange and brown hairs.', 'Super Skunk #1, South American, South Indian Sativa. ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1521, 'Purple OG Kush', 'relaxed, sleepy, euphoric', 'This strain has a thick and musty aroma, undertones of berries and pine.', ' OG Kush, Purple Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1522, 'Truffle Butter', 'hungry, relaxed', 'Features an aroma of a mixture of fruit, caramel, and floral notes.', 'Gelato, Chocolate Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1523, 'Strawberry', 'relaxed, energetic , happy', 'Grows well both indoors and outdoors and has a 9 week flowering time.', 'Originating from the Netherlands', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1524, 'Gummy Bears', 'uplifted, happy, tingly ', 'This strain achieves a unique array of colored leaves and outstanding resin production. The flavor has been described as “berries soaked in lemonade.”It has a 60-day growth cycle.', 'Trueberry, Big Lemon', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1525, 'Inredible Hulk', 'uplifted, happy, talkative ', 'Features a blueberry, pineapple, and earthy flavors.', 'Green Crack, Jack Herer', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1526, 'Chernobyl ', 'happy, uplifted, relaxed', 'This strain produces dreamy effects that are long-lasting and may boost your mood.It smells like lime sherbet.', 'Trainwreck, Jack the Ripper, Trinity', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1527, 'GG5', 'relaxed, happy, uplifted', 'It has a strong diesel flavor.Grows as a branchy plant, large buds.', 'Sister Glue (GG1), Original Glue (GG4)', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1528, 'Purple Gorilla', 'relaxed, euphoric, sleepy, pain relief', 'This strain has Violet, oversized buds and purple, trichome-speckled buds. It has a short flowering time of 7 to 8 weeks.', '?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1529, 'Chronic', 'uplifted, happy, euphoric', 'Features a flavor profile of sweet honey, flower, and spice.Grown outdoors but should be somewhat sheltered for protection. and has a flowering time of 63 days.', ' Northern Lights, Skunk, AK-47', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1530, 'UK Cheese', 'relaxed, happy, euphoric', 'Features a flavor profile that is unique, undertones of berry and spicy cheese. Has dense nugs that are light green and coated in orange hairs.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1531, 'Hawaiian Punch', 'happy, euphoric, uplifted', 'This strain is extremely potent, a flowering time is 55-60 days as well as a THC content up to 21%.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1532, 'Black Widow', 'relaxed, happy, euphoric', 'It\'s Smell is  fruity and a little bit skunky.This Starin is extremely potent.', 'South American, South Indian Sativa', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1533, 'Alien Dawg', 'relaxed, happy, euphoric', 'This strain has  a sour and pungent odor as well as a light, bitter taste.', 'Chemdawg, Alien Technology', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1534, 'Cat Piss', 'uplifted, happy, pain relief, relaxed', 'Features sweet and piney flavors and it\'s uniquely pungent aroma is reminiscent of cat piss.', 'Phenotype of Super Silver Haze', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1535, 'Purple Chemdawg', 'relaxed, creative, pain relief  ', 'This strain has a sweet grape aroma.', 'Chemdawg, Granddaddy Purple', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1536, 'Snowcap', 'happy, creative, gigly', 'Features a bright and lemony flavor, just a hint of menthol.', 'Snow White, Haze', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1537, 'Black Tuna', 'pain relief', 'Flowers are compact, trichome-covered and has a strong smell.', 'Herijuana, Lamb\'s Bread cross', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1538, 'I-95', 'relaxed', 'Produce dense, light green buds covered in glistening trichomes.Has a pungent bouquet of diesel fuel and sour funk.', 'Legend OG, Triangle Kush, Stardawg IX2', '2021-03-11 13:58:19', '2021-03-11 20:58:19'),
(1539, 'THC Bomb', 'energetic, happy', 'Tastes like citrus, woody undertones.Has large buds that have a covering of bright orange hairs. It\'s flowering time  is 7-9 weeks.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1540, 'OG Chem', 'creative, relaxed', 'The diesel notes of Chemdawg combine, the sour, piney scent of OG Kush to create a pungent skunky aroma.', 'Chemdawg, OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1541, 'California Orange', 'uplifted', 'It is easy to grow, and produces a sweet citrus aroma reminiscent of orange zest. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1542, 'Strawberry Lemonade', 'relaxed', 'This Strain stays true to form, exhibiting tangy aromas and flavors. ', 'Strawberry Cough, Lemon OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1543, 'White Cookies', 'relaxed, pain relief, euphoric', 'It has a high potency.', 'White Widow, Girl Scout Cookies', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1544, 'Mint Chocolate Chip', 'uplifted, relaxed', 'The Aroma is sweet, minty, and herbal.  Has  buds are dense are dense , resin.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1545, 'Hippie Crippler', 'uplifted', 'This strain has a sweet smell and taste.', 'AK-47, Blue Satellite', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1546, 'Sour Banana Sherbet', 'relaxed, sleepy', 'Features a mix of sour fruit and diesel flavors.It is easy to grow but stretches a great deal.', ' Sour Diesel, Banana Sherbet', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1547, 'Purple Trainwreck', 'relaxed , happy, euphoric', 'Has a rich aroma of bright citrus, pine, and lavendar.Grows best in a warm, dry climate.', 'Trainwreck, Mendocino Purps', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1548, 'Sugar Cookie', 'relaxed , sleepy', 'This Strain tastes like tropical fruit and sweet, sugary berries. ', 'Crystal Gayle, Blue Hawaiian, Sensi Star', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1549, 'Lavender Jones', 'relaxed, euphoric', 'Has Vibrant hues of purple and green.', 'Hybrid parent, Casey Jones', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1550, 'Sour Grapes', 'tingly', 'Features a strong, fruity aroma similar to grape candy. ', 'Purple Elephant, Chemdawg Sour Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1551, 'God Bud', 'anxious, sleepy', 'Features tropical fruit flavors, undertones of berry, lavender, and pine.Has dense buds that are short and tinged, purple. ', 'Hawaiian, Purple Skunk', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1552, 'Sour Kush', 'uplifted, gigly, euphoric', 'Extremely pungent, so it’s best stored in tightly sealed containers.', 'Sour Diesel, OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1553, 'Dream Queen', 'euphoric, sleepy', 'This strain has a pungent and reminiscent of pineapple, bubblegum, citrus and menthol.It comes in very frosty, light green buds. ', ' Blue Dream, Space Queen', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1554, 'Garlic', 'euphoric, sleepy, pain relief', 'It smells a lot more like tangy musk and spice. Has a  flowering time of 7 or 8 weeks.', 'Afghani ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1555, 'Larry Bird', 'uplifted', 'Has a sweet aroma of grape and tan.This strain comes in adeep purple shade and features dense layers of thrichomes.', 'Sunset Sherbet, Thin Mint Girl Scout Cookies', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1556, 'Pre-98 Bubba Kush', 'pain relief, relaxed', 'Has a flowering time of  around 10 weeks.Features a pungent, musky scent and coffee-like taste. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1557, 'OG #18', 'anxious, relaxed', 'Has a distinct diesel kush flavor, sour undertones. and an indoor flowering time of 9 weeks.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1558, 'Bubba Fett', 'relaxed, anxious, hungry', 'Has an aroma that is pungent, skunky and dank, a hint of sweetness. ', 'Stardawg, Pre-98 Bubba Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1559, 'Cherry Bomb', 'uplifted, happy, focused', 'Flowers  have a musky, berry aroma and a mild flavor.', 'California indica, Hawaiian', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1560, 'Sour Cookies', 'uplifted, ', 'This Strain smells doughy and pungent, overtones of hash and fuel.', 'Girl Scout Cookies, Sour Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1561, 'Blueberry Pie', 'relaxed', '', 'Girl Scout Cookies, Blue Dream', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1562, 'Presidential OG', 'anxious, sleepy', ' Has an intense citrus and pine smell.As far as taste is concerned , it maintains the pine flavor and heads into a more earthy terrain. ', 'Bubble Gum, OG Kush ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1563, 'Wookie', 'happy, relaxed', 'It\'s odoriferous combination blends an intensely floral aroma, sour terpenes, creating a unique fragrance.', 'Lavender, Appalachia', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1564, 'Elmer\'s Glue', 'happy, uplifted', 'Features aromas of pine and diesel, but tastes sweet and earthy on the exhale.Has incredible trichome coverage.  ', ' GG4, The White', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1565, 'Black Cherry Soda', 'relaxed, happy, uplifted', 'It is known for It\'s fruity, soda-like taste and unusually dark purple color. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1566, 'Black Afghan', 'relaxed, euphoric, uplifted', 'Flowers develop as jade, pine tree-shaped colas, dark green, nearly black sugar leaves.This strain\'s  terpene profile is an aromatic mixture of pepper, earth, and sage smothered in dark berries.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1567, 'King Tut', 'uplifted, creative, pain relief', 'Features flavors that are sour, skunky and fruity.It is sensitive to high humidity and fungus.', 'AK-47', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1568, 'Wappa', 'happy, uplifted', 'Has an intense fruity flavor.', '', '2021-03-05 17:06:53', '2021-03-05 02:23:46'),
(1569, 'Golden Pineapple', 'creative, uplifted', 'Has a fruity, tropical flavor.The aroma of this strain is remarkably similar to sour pineapple', 'Golden Goat, Pineapple Kush ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1570, 'Purple Diesel', 'euphoric, gigly, uplifted, focused', 'It tastes sour, a fuel-like aroma.Has dense, dark purple buds.Has an early flowering time of around 8 weeks.', 'Pre-98 Bubba Kush, Sour Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1571, 'Bubblegum Kush', 'relaxed', 'Produces huge yields of frosty, resinous buds.Has a sour smell and flavor.', 'Bubble Gum, Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1572, 'Hawaiian Haze', 'talkative, euphoric', 'This strain has a floral smell and taste of tropical fruit.It grows  tall and flowers slowly, taking between 12 and 14 weeks.', 'Hawaiian, Haze', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1573, 'Snoop Dogg OG', 'creative, focused, hungry', 'The diesel aroma of Snoop Dogg OG dominates the less prominent lemon notes.', 'Lemon OG, Sour Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1574, 'OG Shark', 'relaxed, pain relief, sleepy', 'Has a high potency, earthy aroma and therapeutic qualities.Grows best in a dry, outdoor climate.', 'Primarily found in Canada', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1575, 'Purple Bubba', 'euphoric, pain relief', '', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1576, 'Alien Rock Candy', 'relaxed, euphoric, sleepy', 'Finishes around 8 weeks into its flowering cycle. ', 'Sour Dubble, Tahoe Alien ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1577, 'Chem 4', 'uplifted, relaxed', 'It\'s smell has been likened to citrus or even Pine-Sol, a lemon flavor. Has Light-green buds and  grows to be a fairly tall plant, reaching up to 7 feet outdoors and 4-5 feet indoors.Has a fowering time is 9-10 weeks.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1578, 'RudeBoi OG', 'relaxed', 'Typically found in OG varieties comes out strong in this hybrid, providing a flavorful introduction, a refreshing finish.', 'Irene OG, Face Off OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1579, 'Shishkaberry', 'happy, talkative', 'Matures in 8 to 9 weeks and should yield a fairly high amount of flowers. Buds have a fruit and berry aroma and are painted, shades of purple.', ' DJ Short Blueberry, Afghan Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1580, 'Mob Boss', 'uplifted, hungry', 'Hides behind a light, sweet floral aroma, undertones of citrus and herbs.Finishes flowering in 60 to 70 days indoors.', 'Chemdawg D, Tang Tang', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1581, 'Star Killer', 'pain relief, sleepy', 'The dense, purple buds offer a sweet, lemon flavor.Medium to high yields can be achieved both indoors and outdoors, a flowering time of 65 days.', 'Mazar x Blueberry OG, Rare Dankness #2', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1582, 'ECSD', 'uplifted', 'Has a sour lemon smell and taste that’s crisp ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1583, 'Orange Bud', 'euphoric, creative', 'Contains a high amount of THC. Features an aroma of orange and nectarines.Comes in dense buds and has orange hairs coating the surface. Flowering time  is 8-9 weeks,', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1584, 'Bubba OG', 'relaxed, talkative', 'Has a super potent, sweet smelling indica. ', 'Pre -98 Bubba Kush, Ghost OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1585, 'Paris OG', 'relaxed', 'This strain has a sweet blend of fruity, citrus flavors.', 'Headband, Lemon OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1586, 'Ecto Cooler', 'uplifted, happyy', 'Its flavor is citrusy and fuel-like. It smells  like a skunkowever, dipped in orange juice, gasoline, and Pinesol.', 'California Orange, Gorilla Biscuit', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1587, 'King\'s Kush', 'relaxed, euphoric', 'Features a flavor profile that is tangy, grape and undertones of lavender.Comes in purple and blue nugs that are covered in trichomes.Has a flowering time of 9 weeks', 'OG Kush, Grape.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1588, 'Nuken', 'uplifted', 'Has a sweet, earthy aroma of fresh herbs and grass.Blooms, round, dense buds that are covered in a blanket of crystal resin.', 'Shishkaberry, God Bod', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1589, 'Mr. Nice Guy', 'relaxed, uplifted', 'Feartures a sweet smell and taste.Has extremely dense buds.', 'G13, Hash Plant', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1590, 'Jenny Kush', 'relaxed, uplifted', 'Features a s weet earthy aroma cut, the sharp zesty sweetness of citrus and lemon. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1591, 'G13 Haze', 'uplifted', 'Was bred for maximum potency and renowned for its medical utility', 'G13, Haze', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1592, 'Cannalope Haze', 'uplifted, hungry', 'Offers a sweet mix of tropical, melon, and floral flavors. ', 'Haze, Mexican landrace', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1593, 'Purple Panty Dropper', 'energetic, euphoric', 'Named for its deep purple hues and supposed aphrodisiac effects.This beautiful indica-dominant flowers produce a rich, sweet aroma.', 'Purple Haze, Oregon Grape, Matanuskan Mist', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1594, 'Outer Space', 'uplifted, creative', 'Has a citrusy odor that is strong and produces a flavorful smoke.', 'Island Sweet Skunk, Trinity ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1595, 'Jean Guy', 'energetic, uplifted', 'Frosted dark green leaves hide pastel buds loaded, golden crystal trichomes. Has hints of lemon and pine that  come through in Jean Guy’s flavor.', 'Canadadian', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1596, 'Cherry Cookies', 'uplifted', 'Preserves the tight, slightly purple buds and deep orange pistils.', 'Girl Scout Cookies', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1597, 'Black Cherry OG', 'relaxed, uplifted, sleepy', 'Its dense buds take on an intense purple hue at the end of Black Cherry OG’s maturation and develop a sweet aroma like fruity tea.', 'Ken’s OG, Granddaddy Purple ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1598, 'Rollex OG Kush', 'uplifted, energetic, relaxed', 'Creates a complex flavor profile that mixes the skunky, pine flavors of OG Kush, sharp cheesy undertones.', '?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1599, 'Sour Dubb', 'relaxed', 'Has dense buds, copious amounts of trichomes produce a pungent.This strain has a sweet n’ sour odor and a strong diesel flavor, a sweet fruity aftertaste. ', 'Sour Diesel, Sour Bubble B.O.G.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1600, 'Colombian Gold', 'pain relief, uplifted, focused', 'The buds are fluffy and crystal-covered, radiating skunky, sweet notes of lemon and lime.', 'Colombian ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1601, 'Lemon G', 'uplifted, euphoric, giggly', 'Has a strong lemon fragrance.Taste-wise, this strain is fairly mellow.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1602, 'Huckleberry', 'relaxed', 'The flower is compact, light green in color, and generally covered in orange hairs. Has a flowering time of 8-9 weeks and produce average yields. ', '?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1603, 'Cherry Kush', 'relaxed', 'The flowers range from a bright, vibrant green to a darker, purple-tinged red color, and boast a dense coating of trichomes. The flavor is reminiscent of cherries, a woody, hashy undertone.', 'Purple Afghani, OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1604, 'Royal Highness', 'energetic, focused, pain relief', 'Has a smooth flavor that is fruity, spicy and a little skunky.', 'Dancehall', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1605, 'Lemon Drop', 'giggly, euphoric, focused', 'Has a clean taste that is reminiscent of the candy of the same name.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1606, 'Sugar Black Rose', 'relaxed', 'Has a sweet taste, hints of fruit and fresh flowers. The aroma takes on a pungent, earthy musk .', 'Critical Mass, Black Domina ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1607, 'White Diesel', 'uplifted, relaxed', 'The buds from White Diesel produce a zesty combination of lemon, grapefruit.', 'White Widow, NYC Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1608, '3Kings', 'pain relief', 'Has a sour tanginess reek from the sage green buds, and its frosty coat.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1609, 'Purple Candy', 'euphoric, sleepy, relaxed', 'This Strain has frosty buds that leave your hands sticky.Has large flowers, rich purple coloring and it is sugary-sweet in scent and taste.', 'BC Sweet Tooth, Mendocino Purps', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1610, 'Cold Creek Kush', 'relaxed', 'Flowers at 9 to 11 weeks.It is  piney and sour.', 'MK Ultra, Chemdawg 91', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1611, 'Purple Hindu Kush', 'relaxed, pain relief', 'Featuring dense lavender flowers, bright orange pistils and a thick blanket of trichomes.Has a pungent sour grape and citrus flavor.', 'Hindu Kush, Purple Afghani', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1612, 'Chocolate Kush', 'euphoric', 'It has resin-oozing buds.This strain has a pungent aroma of hashy incense and chocolate.Grows into medium-sized plants, a Christmas tree structure and flowers in 56 to 60 days.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1613, 'Yoda OG', 'relaxed, euphoric, hungry', 'Features chunky pale buds, a tangle of orange hairs, and a pungent citrus aroma.', 'OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1614, 'Blue Magoo', 'pain relief, sleepy, relaxed', 'Offers a fusion of berry, fruit, and other floral notes makes up the aroma and taste of Blue Magoo.Has a palate as colorful as its pastel purple and green buds.', 'DJ Short Blueberry, Major League Bud', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1615, 'Strawberry Amnesia', 'euphoric, energetic, uplifted', 'It delivers the familiar sweet strawberry and earthy flavors of its parents.Characterized by dark green buds that  are very dense and heavily coated in resin.', 'Strawberry Cough, Amnesia', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1616, 'Scooby Snacks', 'relaxed, happy, uplifted', 'This strain has dense purple buds that are full of piney OG Kush flavor and a sweet aftertaste.', 'Platinum Girl Scout Cookies, Face Off OG.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1617, 'Blue Widow', 'uplifted, relaxed, sleepy', 'It\'s flowers  have a strong, sweet aroma that may also include sour citrus or pine.The Buds can be colorful, tints of blue and purple, and should have a coat of long orange hairs.', 'Blueberry, White Widow', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1618, 'Lemonhead OG', 'euphoric, uplifted, happy', 'It is sweet on the nose and the palate.Offers  a clean, zestful lemon flavor coupled, a lung-expanding mint/eucalyptus.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1619, 'Red Headed Stranger', 'uplifted, creative, focused, energetic', 'Takes on a sharp spicy aroma, subtle herbal notes.', 'Tom Hill’s Haze, William’s Wonder', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1620, 'Cherry AK-47', 'uplifted, relaxed', 'Features a reddish-purple coloration and berry aroma.The flavors are described as smooth cherry, a creamy sandalwood aftertaste.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1621, 'Sage and Sour', 'euphoric, happy, energetic', 'Has an aroma that closely matches the subtle herbal notes of sage and a 60 to 65 day flowering cycle.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1622, 'Panama Red', 'uplifted', 'Has a flowering time of at least 11 weeks.', 'Panama', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1623, 'Flo', 'energetic, focused', 'Characterized by pear-shaped buds, purple calyxesIt can potentially be harvested multiple times, creating a \"flo\" of buds.', '?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1624, 'Cherry OG', 'euphoric', 'Features a fruity cherry aroma and can sometimes express more sour and diesel-like flavors. ', '?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1625, 'Hellfire OG', 'euphoric, relaxed', 'It carries that signature OG smell of lemon diesel and earthy spice.', 'Rascal’s OG Kush, SFV OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1626, 'Green Goblin', 'happy, creative, focused, relaxed', 'The pungent aroma  is overall musky and skunky, hints of that diesel fuel.The buds will be a forest green, rusty orange hairs. ', 'Northern Lights, Skunk #1', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1627, 'Kali Mist', 'energetic, focused', '', '?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1628, 'Starfighter', 'uplifted', 'This strain is  sweetly aromatic.', '?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1629, 'Sour Grape', 'energetic, relaxed', 'Has a sour, fuel-like scent, fruity aftertones.', 'Sour Diesel, Granddaddy Purple', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1630, 'Pineapple OG', 'uplifted', 'Features a sweet-spicy pineapple flavor and odors of lemon, pine and fuel.', 'Pineapple Express, OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1631, 'Alien Kush', 'uplifted, relaxed', 'They are hardy, easy-to-grow plants, indoors or out.It\'s light green buds have a covering of red or orange hairs and should be airy.Has a piney smell, but the taste is a subtle spiciness that is reminiscent of tea.', 'LVPK, Alien Dawg ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1632, 'Big Smooth', 'euphoric, pain relief, relaxed', 'Offers a delicious terpene profile that smells sweet and doughy, like blueberry pancakes.Grows bushy, medium-tall plants and has a flowering time of 55 to 66 days.', 'OG Blueberry, Cookies, Cream', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1633, 'Pennywise', 'relaxed, focused, euphoric, uplifted', 'Flowers in 60 to 67 days and is suitable for either indoor or outdoor gardens.Has purple-fringed flowers, undertones of lemon and bubblegum.', 'Harlequin, Jack the Ripper', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1634, 'Apple Kush', 'relaxed, uplifted', '', 'Sour Diesel, Pure Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1635, 'Crystal Coma', 'relaxed, pain relief, sleepy', 'The  pastel green breaks through this sativa’s thick blanket of crystal trichomes.', 'Cheese, Skunk #1', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1636, 'Double Dream', 'relaxed, pain relief, uplifted', 'Has a complex flavor profile that synchronizes sweet floral notes, berries and spice.', 'Blue Dream, Dream Star', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1637, 'Tropic Thunder', 'uplifted, relaxed', 'It exhibits colorful buds and floral aromas that transforms into a bitter, herbaceous mixture of flavors upon combustion or vaporization.', 'Maui Wowie cross', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1638, 'Fruit Loops', 'relaxed, focused, happy', 'It smells as good as it sounds, Tucan sold separately. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1639, 'El Chapo OG', 'relaxed', 'Features smells of rich earth and pine.Has dense jade popcorn buds that exhibit a shimmering coat of trichomes.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1640, 'Afgoo', 'uplifted, relaxed, sleepy', 'Have a better chance of success indoors, but this indica can also thrive in Mediterranean climates outdoors.', 'Afghani, Maui Haze', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1641, 'Cookie Monster', 'relaxed, sleepy', 'The dense frosted buds, hints of purple and orange hairs throughout.', 'Girl Scout Cookies, OG Kush.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1642, '3X Crazy', 'relaxed, focused, pain relief', 'Features flavors like grape, spicy pepper, and earthy notes.', ' OG Kush, Bubba Kush, Granddaddy Purple', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1643, 'Chocolate Diesel', 'euphoric', 'Its flavors offer a little part of both parents, notes of both earthy chocolate and skunky diesel.', 'Sour Diesel, Chocolate Thai', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1644, 'Mazar x Blueberry', 'pain relief, relaxed, sleepy', 'Combines the sweet fruity aroma of Blueberry, the growing strengths of the hardy, high-yielding Mazar.This strain is great for indoor growing and  flowering in 8 to 9 weeks.The plant stays shorter and bushy, ', 'Blueberry, Mazar', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1645, 'Hell\'s OG', 'uplifted, pain relief', 'The plant has large, heavy buds that flower in 8 to 9 weeks indoors.Outdoor plants are ready for harvest during the September-October transition.', 'OG Kush, Blackberry  ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1646, 'Dutch Hawaiian', 'uplifted', 'Its beautiful stinky buds offer an earthy citrus smell.', 'Dutch Treat, Hawaiian Sativa.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1647, 'Extreme Cream', 'uplifted, talkative, euphoric, hungry', 'Develop deep purple colas dusted, trichomes and emits a strong earthy aroma.', 'Extreme OG, Cookies & Cream', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1648, 'Green Line OG', 'focused, pain relief, uplifted', 'Features notes of sweet citrus and forest floor fill the nose, a refreshing aroma.', 'Lime Skunk, Ghost OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1649, 'Champagne Kush', 'focused, relaxed', 'Offers a variety of attributes suited to different tastes and ailments.It has  a pleasant and palpable weight on the limbs.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1650, 'Phantom Cookies', 'relaxed, creative, happy, pain relief, euphoric', 'Its green and purple hues weave through the buds beneath a crystalline layer of trichomes from which sprout orange hairs.Its aroma is an intricate blend of earthiness and roasted nuts, accented by sweeter notes of grape and berry.', 'Cherry Pie, Granddaddy Purple', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1651, 'Purple Dream', 'relaxed, tingly', 'Features a strong sour grape smell and musty taste.', 'Granddaddy Purple, Blue Dream', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1652, 'Hardcore OG', 'relaxed, pain relief', 'The dense, pungent buds produce thick coats of resin.', 'Big Bud, DJ Short Blueberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1653, 'LA Kush', 'uplifted, relaxed, creative, happy, ', 'Presents itself as an earthy mix of pine and menthol flavors.', 'OG Kush, Abusive OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1654, 'Ayahuasca Purple', 'relaxed', 'The aromas are unique, expressing hints of hazelnut and papaya.Develops deep purple foliage and is sensitive to overfeeding.', 'Master Kush, Red River Delta', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1655, 'Cream Caramel', 'relaxed', 'The plant is covered in a sugary coat of THC-rich resin.Indoor gardens should be harvested after a 7 to 8 week flowering period and early October is the finish line for outdoor.', 'BlueBlack, Maple Leaf Indica, White Rhino. ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1656, 'Blueberry OG', 'relaxed', 'Has exceptional CBD yielding qualities and flavors of sweet camphor and sandalwood.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1657, 'Golden Lemon', 'euphoric', 'Emits a distinctly pungent herbal, citrus aroma.Has a citrusy strain, a potent punch.', 'Kosher Kush, Lemon Skunk', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1658, 'The Black', 'pain relief, sleepy', 'Its frosty leaves turn from a dark purple to black during flowering.Reaches maturity between 8 to 10 weeks.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1659, 'Jesus OG', 'relaxed, focused', 'Produces tall plants and heavy yields.Consumers enjoy the lemony kush aroma of this indica-dominant cross.', 'Hell\'s OG, Jack the Ripper ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1660, 'Blueberry Haze', 'euphoric', 'Provides a sweet flavor.', 'Blueberry, Haze', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1661, 'Pop Rox', 'relaxed, euphoric, focused', 'Carries a sweet, candy-like aroma that translates to a fruity flavor on the inhale.', 'From a private seed collection in Las Vegas', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1662, 'Strawberry Fields', 'pain relief', 'Destined for consumers who love that strawberry aroma.', 'Strawberry Cough, undisclosed indica ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1663, 'Phantom OG', 'euphoric, happy, gigly, focused', 'Its aroma is a rich combination of pine and lemon accented by a subtle menthol flavor.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1664, 'Snow White', 'uplifted', ' Features an early and abundant resin production.Flowering finishes in a standard 60 to 70 days. ', 'Bred by Nirvana Seeds', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1665, 'God\'s Green Crack', 'relaxed', 'Its buds take on a deep purple coloration toward the end of its maturation.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1666, 'Tutti Frutti', 'euphoric', 'Provides a blast of fruit flavor', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1667, 'King Kong', 'uplifted, focused', 'Dense conic buds come frosted in crystals and ribboned in hairsShort flowering time of only 7 to 8 weeksPungent sour, skunky smell', 'Super Bud', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1668, 'Herijuana', 'uplifted, ', 'Produces large dense flowers on an open, stretchy plantAromas and flavors ranging from spicy earth and sandalwood to hashy fruit', 'Petrolia Headstash, Killer New Haven', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1669, '707', 'relaxed, creative', 'Flowers in 9 to 11 weeks and usually have large yieldsHas high THC levels.', 'Sour Diesel, OG Kush, Master Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1670, 'Purple Monkey Balls', 'relaxed, pain relief', 'Its bulbous purple buds produces a fruity grape aroma.Offers sweet flavors of pine and berry.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1671, 'Lime Sorbet', 'relaxed', 'This Strain has a pungent earthy aroma intermixed, the tart and a fresh flavor of lime.', 'Bubba Kush, Lime Skunk', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1672, 'J1', 'uplifted', 'Flowers are emerald green and frosty. Has a sweet aroma resembling the unmistakable Jack Herer pungency', 'Skunk #1, Jack Herer', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1673, '', 'sleepy, pain relief', 'Features a strong skunk-like scent and piney taste.It is extremely pungent and not for the novice patient.', 'Tahoe OG, Bubba Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1674, 'Sour Jack', 'uplifted, energetic', 'Features a combination of tropical, sweet flavors that mix, pungent tones of citrus and diesel.', 'Sour Diesel, Jack Herer', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1675, 'Blissful Wizard', 'pain relief, happy, euphoric', 'Has a decadent fusion of lemon, lime, and cream flavors.', 'Captain\'s Cookies, Girl Scout Cookies', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1676, 'Raskal OG', 'relaxed, euphoric', 'Features smells of lemon and pine, a musty and grassy taste.Eshibits dense light and dark green colored buds.', 'OG Kush, SFV OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1677, 'Green Poison', 'euphoric, relaxed, pain relief', 'This strain is particularly susceptible to fungi and has 7 weeks  flowering indoors or near the end of September outside.Featues a fruity and floral aroma.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1678, 'Mazar I Sharif', 'relaxed', 'Has intensely resinous flowers and it is capable of reaching 4 metres in height or more.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1679, 'Violator Kush', 'relaxed', 'Features large yields of super-resinous flowers on a short, bushy plant.', 'Malana, Hindu Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1680, 'Bruce Banner #3', 'euphoric, relaxed, creative', 'This strain offers a diesel aroma, sweet undertones and flowers  in 8 to 10 weeks.', 'OG Kush, Strawberry Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1681, 'SinMint Cookies', 'euphoric, relaxed', 'The aroma is a subtle mix of earthy sweetness, a trace of sharp mint. ', 'Girl Scout Cookies, Blue Power', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1682, 'Pure Kush', 'relaxed, pain relief', 'Has the signature kush aroma that is extremely pungent and skunky.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1683, 'Red Congolese', 'euphoric, focused, energetic', 'This strain has colorful palette of landrace strains.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1684, 'Dragon\'s Breath', 'focused, pain relief', 'Offers a distinctive spicy aroma.', 'Jack Herer, Northern Lights.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1685, 'Shark Shock', 'uplifted', 'Features a  fruity tasteIt is a densely compacted white skunk, extreme aromas.', ' White Widow, Skunk #1', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1686, 'Pluto Kush', 'uplifted', 'The fluffy, soft flowers emanate a pungent aroma.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1687, 'Mai Tai Cookies', 'relaxed, pain relief', 'The flowers have a dense structure and a flowering cycle of 50-55 days.', 'Alien Orange Cookies, ACDC', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1688, 'Chiesel', 'euphoric', 'Produce a very high yield under optimum conditions.', 'Big Buddha Cheese, NYC Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1689, 'Strawberry OG', 'euphoric, relaxed, creative, ', 'Has an exceptional structure, yield, and early flowering schedule.', 'SFV OG, Bruce Banner, Strawberry Diesel ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1690, 'Midnight', 'uplifted, pain relief', 'It is a very popular strain in Israel.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1691, 'Rockstar Kush', 'relaxed, pain relief, hungry', 'Emits a heavy odor of skunk and piney Kush.', 'Rockstar, Bubba Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1692, 'Captain\'s Cake', 'relaxed, euphoric', 'Offers a sweet doughy earth aroma.', 'Girl Scout Cookies, White Fire Alien OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1693, 'Grape God', 'relaxed, euphoric', 'Has a sweet grape aroma, earthy notes.', 'God Bud, Grapefruit ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1694, 'Bio-Diesel', 'relaxed', 'Excels at delivering both intense and balanced effects.', ' Sour Diesel, Sensi Star, Original Diesel, NYC Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1695, 'Royal Kush', 'happy, relaxed, euphoric, pain relief', 'Has a unique coverage of white pistil hairs and  an earthy, skunky aroma.Has an 8 to 13 week flowering time indoor.', 'Afghani, Skunk #1', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1696, 'Mother\'s Milk', 'uplifted, relaxed', 'Offers smells of powdered milk and delicate earthy terpenes.It is layered in a coat of sparkling trichomes', 'Nepali OG, Appalachia', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1697, 'Pineapple Skunk', 'relaxed', 'Offers a sweet, pineapple aroma.Exhibit higher yields indoors flowering around 8 weeks.', 'Pineapple, Skunk #1, Cheese. ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1698, 'Silverback Gorilla', 'relaxed, uplifted', 'Features a musky, piney aroma.', 'Grape Ape, Super Silver Haze', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1699, 'Dark Star', 'relaxed, uplifted', 'Has a 10-week flowering period.Its Sour-smelling buds are dense and compact, ornamented, crystals and copper hairs.', 'Purple Kush, Mazar-I-Sharif', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1700, 'Crunch Berry Kush', 'relaxed', 'Has a sweet fruity aroma counterbalanced by a hint of spice. ', 'Encanto Green Cross ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1701, 'Lodi Dodi', 'creative, energetic', 'This strain has a s weet, unique flavor of tropical fruit and fresh wildflowers and a pungent aroma.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1702, 'OJ Kush', 'relaxed, happy, uplifted', 'It erupts, a blast of orange and lemon notes that combine, diesel undertones.Has an inviting aroma and a mouthful of sweet earthy citrus.', 'California Orange, OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1703, 'Blue Frost', 'relaxed, happy', 'Produces a pungent mixture of aromas.Dense buds that show a range of deep violet hues Flavor is sweet fruity notes, a sharp cheese-like undertone', 'Blue Monster, Jack Frost', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1704, 'MTF', 'uplifted', 'The plant smells like hot chocolate, fruit and its flowers develop a frosting of icy white hairs.Has rugged rootsand do  best indoors but will still yield well in outdoor dry climates.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1705, 'Jack Flash', 'uplifted', 'Offers an earthy citrus aroma.', 'Super Skunk, Haze', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1706, 'Casey Jones', 'uplifted, creative', 'Provides an earthy, sweet palate, subtle hints of citrus.', 'Oriental Express, East Coast Sour Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1707, 'Grape Kush', 'euphoric, relaxed', 'Features sharp and fruity aromas.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1708, 'Remedy', 'relaxed, uplifted', 'The yellow-tinted buds hide under a sheath of crystal trichomes and carry a lemon-pine scent.Has a sweet, floral notes  and a 6 to 8 week flowering time in indoor gardens.', 'Cannatonic, Afghan Skunk', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1709, 'Harle-Tsu', 'pain relief, euphoric', 'Flowers in 8 weeks and  ha a high CBD content and virtually non-existent THC content.', 'Harlequin, Sour Tsunami', '2021-03-05 16:05:06', '2021-03-05 02:23:46'),
(1710, 'Gucci OG', 'energetic, euphoric, creative', 'Has an aroma of pine and lemon, but, a unique hint of sweet berry.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1711, 'Candy Jack', 'creative, focused', 'This strain offers a sweet, citrus aroma and a fragrant smell.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1712, 'Ultra Sour', 'uplifted, creative, euphoric', 'Features smells of pine and diesel, and its buds are deep green, rusty orange pistils.', ' MK Ultra, East Coast Sour Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1713, 'Zombie OG', 'hungry, pain relief, energetic', '', 'OG Kush, Blackberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1714, 'Lemonberry', 'uplifted, creative, giggly, happy', 'Offers a collage of flavor.', 'Dabney Blue, Lemon Thai ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1715, 'Space Candy', 'euphoric, relaxed', 'Features a unique flavor profile of candied apples and sweet cherry, counterbalanced by more tame earthy notes', 'Cherry Space Queen, Cotton Candy', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1716, 'Blue God', 'uplifted, pain relief', 'This strain has  a sweet berry aroma and deep purple leaves freckled in frosty resin.The flowering period is  between 55 and 60 days.', 'God Bud, Blueberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1717, 'Tyson', 'relaxed, pain relief', 'Offers a pungent diesel aroma.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1718, 'Sunshine Daydream', 'pain relief', 'Flavors are an elaborate blend of tangy diesel and fruit, accented by sweet berry undertones.', 'Appalachia, Bubbashine', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1719, 'Peaches and Cream', 'euphoric, creative, focused', 'Has a sweet fruity taste underscored by a subtle spiciness.Buds take on a soft pink-orange color during maturation.', 'The Peaches, Cream', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1720, 'Chemo', 'pain relief', 'Has a subtle woody aroma.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1721, 'Willie Nelson', 'euphoric, creative', 'It flowers between 10 and 14 weeks.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1722, 'White Gorilla', 'uplifted', 'Flowering  occurs in about 8 to 9 weeks.', 'Gorilla Glue #4, White Fire Alien OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1723, 'Jedi Kush', 'euphoric, energetic, pain relief', 'The timid aroma isn’t fully realized until a bud is cracked open.The plant thrives indoors, a flowering time of 8 to 9 weeks.They show resilience in outdoor gardens.', 'Death Star, SFV OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1724, 'Skunkberry', 'pain relief, uplifted, euphoric', '', 'Skunk, Blueberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1725, 'Captain America OG', 'euphoric, uplifted', 'Offers a bright citrus flavor.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1726, 'Lemon Jack', 'focused, energetic, pain relief', 'Features a distinct, chemical-like lemon smell.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1727, 'Pineapple Haze', 'creative, energetic', 'Its tall plants bloom, large colas that look and smell much like pineapples.Combines the tropical aroma of Pineapple, the racing cerebral energy of Haze.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1728, 'Tiger\'s Milk', 'euphoric, relaxed, sleepy, pain relief', 'Its aroma is a complex mix of earthy notes, led by hints of sweet honey and hashy spice. ', 'Bubba Kush, Appalachia', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1729, 'Incredible Bulk', 'relaxed', 'Emmits sweet earthy flavors.Characterized by  heavy yields and ease of growth.It is a very stable plant that makes a compelling case for indoor cultivation.The buds are known to explode in size when grown hydroponically.', 'Super Skunk, Green Spirit', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1730, 'Jack Haze', 'energetic, uplifted, giggly', '', 'Jack Herer, Super Silver Haze', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1731, 'Kushberry', 'pain relief', 'Emits an exotic flavor.', 'Blueberry,  OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1732, 'Pakistani Chitral Kush', 'relaxed, sleepy', 'Emits a diverse bouquet of aromas ranging from earthy caramel to sweet notes of fruits and berries.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1733, 'Tangerine Kush', 'relaxed, uplifted, energetic, happy, ', 'Offers a citrusy flavor. Has bright orange hairs covering the bud.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1734, 'Black Lime', 'euphoric, uplifted, tingly, relaxed', 'Features flavors of pine, lemon, and black pepper.', 'Lime Afghani, Northern Lights, Purple Kush, Chemdawg Special Reserve', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1735, '$100 OG', 'pain relief, focused', 'Produce large dark green buds, few stems.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1736, 'Pie Face', 'focused, hungry, euphoric', 'Has a sweet cherry and earthy hash flavor', ' Cherry Pie, Face Off OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46');
INSERT INTO `strains` (`id`, `name`, `effect`, `description`, `parent`, `created_at`, `updated_at`) VALUES
(1737, 'Citrus Kush', 'uplifted, happy', 'Emits a deep citrus aroma, darker, muskier tones.The taste follows suit, a sweet and sour mix that will bring to mind a bright bowl of lemons, limes, and oranges.It is a fresh and fruity blast for the senses.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1738, 'Pie Face', 'focused, hungry, euphoric', 'It carries a sweet cherry and earthy hash flavor.', 'Cherry Pie, Face Off OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1739, 'Jungle Juice', 'pain relief, ', 'Has balancing sweet and sour citrus flavors.', 'Animal Cookies, Tangie', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1740, 'Sour Patch Kiss', 'euphoric, focused', 'It is a heavy-yielding trichome producer, a pungent odor and generous production.', ' Kimbo Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1741, 'Critical Hog', 'relaxed', 'Critical Hog puts off a sweet aroma of earthy and floral flavors.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1742, 'Dirty Girl', 'creative, happy', 'It produces a tropical aroma of pineapples and citrus fruit, a sharp pungent note reminiscent of Pine-Sol.The flavor of Dirty Girl is like sweet lemon candy.', 'Arcata Lemon Wreck, Cinderella 99', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1743, 'Candy Cane', 'euphoric', 'Has a sour, fruity taste  and autoflowers in 7 weeks.It also roduces moderately high yields in both indoor and outdoor gardens.', 'AK-47, Mango, White Widow', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1744, 'Night Terror', 'relaxed', 'Night Terror tastes like blueberries, subtle notes of lemon, pine, and diesel.', ' Blue Dream, Rare Darkness', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1745, 'Purple Passion', 'relaxed, creative', 'Purple Passion’s taste is harsh but pleasant and smells like fruity candy.This strain typically matures in around 9 weeks and produces large, dense buds.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1746, 'Gobbstopper', 'relaxed, euphoric', 'Gobbstopper’s long-lasting fruity flavor opens up on the nose, sweet, tart fruit and savory earthiness.This strain’s aroma ranges from grape Pez, hints of tapioca to Mt. Hood raspberries and sandalwood.', 'Purple Urkle, Sin City Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1747, 'Butter OG', 'relaxed, giggly, sleepy, pain relief', 'Its dense, sparkly buds give off a fruity scent, slight undertones of ammonia.The smoke is very light and smooth, sweet flavors on the inhale and, like its name suggests, a buttery aftertaste.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1748, 'Tangerine Haze', 'uplifted', 'It is treasured for its distinct citrus smell and taste.Has  a zesty tangerine aroma accented, floral notes.Growers recommend a 65-day flowering period for Tangerine Haze, when its citrus flavor peaks.', 'G13 Haze, NYC Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1749, 'Game Changer', 'pain relief, euphoric', 'This strain features a loud aroma of tropical fruit, grape and floral undertones.Growers say Game Changer has twisting hues of vibrant green and deep purple.', ' Purple Dragon, Green Thai', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1750, 'Stardawg Guava', 'uplifted', 'Its aroma is mild but doesn’t lack nuance, expressing notes of pine, cheese, and tartness.A latent chemical flavor rolls off the palate, a clean, earthy finish', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1751, 'Lime Skunk', 'uplifted', 'This sativa-dominant strain by Exotic Genetix boasts THC content and an unparalleled aroma of fresh limes', 'Lemon Skunk, Green Ribbon BX', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1752, 'Dr. Who', 'pain relief, ', 'Has a sweet and sour aroma of pineapple and grape and flowers in 56 to 63 days indoors, but also grows well in outdoor gardens.', 'Mad Scientist, Timewreck', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1753, 'Somango', 'uplifted, focused, creative, euphoric', 'Soma recommends cultivating Somango in indoor soil gardens, organic nutrients, and, a 9 to 10 week flowering time.', 'Jack Herer, Super Skunk, Big Skunk Korean', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1754, 'Critical Jack', 'uplifted, focused', 'Its harvest falls between late September and early October outdoors, while indoor gardens will finish around day 60 of flowering.It delivers functional cerebral effects, a flavorful blend of lemon, pine, and floral aromas', 'Critical Plus, Jack Herer', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1755, 'Whitewalker OG', 'uplifted, ', 'It is wrapped in a sparkling coat of crystal trichomes and a heavy resin production is treasured by extract artists', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1756, 'Chocolate Hashberry', 'relaxed, focused', 'Has a smell indicative of its name, Chocolate Hashberry reeks of chocolate, hashy spice, and sweet berries as well as excellent flavor and aroma', 'Chocolate Kush, Blackberry Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1757, 'Julius Caesar', 'relaxed', 'Plants have average growing and yield characteristics, including a flowering time of 8 to 10 weeks.', 'Master Kush, SFV OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1758, 'Purple Skunk', 'euphoric, happy', 'Its small to medium flowers will mature at 8 to 9 weeks.Have a distinctive skunky smell and an earthy, almost wine-like taste.', 'Skunk #1, Purple strain', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1759, 'Shiva Skunk', 'relaxed', 'It inherits the sweet, pungent aroma typical of Skunk varieties and the high-yielding potential of its Northern Lights mother', 'Skunk #1, Northern Lights #5', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1760, 'Purple Dragon', 'energetic, uplifted, pain relief, relaxed', 'Has a smooth aroma.This strain features a musky scent and floral taste.', 'Purple Urkle, Blue Dragon', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1761, 'Crown Royale', 'pain relief', 'This flower is a feast for the eyes, bright purple hues and deep green foliage.Crown Royale exhibits notes of the forest floor, piney aromas and a telltale berry tartness.', 'Blueberry, Purple Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1762, 'Sour Joker', 'uplifted, focused, relaxed', '', 'Amnesia Haze, East Coast Sour Diesel (ECSD)', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1763, 'Mars OG', 'pain relief, sleepy', 'Has a  dense bud, a high flower-to-leaf ratio.Features a hearty, thick taste and pungent smell', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1764, 'Slimer OG', 'hungry', 'Offers a delicious earthy aroma, an air of OG Kush on the finish.', 'Ghost OG, White Fire', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1765, 'Bugatti', 'relaxed, uplifted, pain relief', 'A sweet pine aroma familiar to OG Kush enthusiasts emanates from Bugatti OG’s resin-caked buds.', 'OG Kush ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1766, 'Pineapple Diesel', 'energetic, focused', 'The aroma is equally diverse, a citrus and diesel dual pungency.', 'Pineapple, Sour Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1767, 'Biochem', 'relaxed', 'The aroma and taste are rich, notes of fuel, citrus, and herbaceous greenery.The appearance is bright green, a peppering of purple entangled in orange pistils.', 'Chemdawg 4, Sensi Star', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1768, 'Ringo\'s Gift', 'relaxed', 'Comes in several different phenotypes and ratios.', 'Harle-Tsu, ACDC', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1769, 'Hawaiian Snow', 'uplifted, creative, giggly', 'Has a slow flowering time (up to 14 weeks), intense spicy-incense aroma, hints of citrus and eucalyptus, and generous amounts of THC.', 'Neville’s Haze, Pure Haze, Hawaiian Haze', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1770, 'Nightmare Cookies', 'uplifted, relaxed, euphoric, hungry', 'Exhibits beautiful purple hues, bright orange pistils, and an aroma that is thick, pine sap, earth, and sweetness.', 'White Nightmare, Girl Scout Cookies', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1771, 'Sour Chem', 'uplifted, euphoric', 'Has a funky fuel and earthy pine aroma that stuns the senses.', 'Chemdog D, Sour Diesel.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1772, 'Gooberry', 'giggly, pain relief', 'Gooberry will flower in 7-9 weeks, a short, bushy structure. It is a fruity, spicy strain.', 'Afgoo, Blueberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1773, 'Critical Plus', 'relaxed, creative', 'This fast growing strain produces huge yields of dense, extremely resinous flowers, an intense aroma of skunk and citrus.Featuring a delicious lemon-lime flavor.', 'Skunk, Big Bud', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1774, 'Dancehall', 'uplifted, talkative, creative, happy', 'As its flowers mature, vibrant shades of green, blue, purple, and red twist underneath its crystal trichomes.The  aromas are both sweet and spicy dance from cracked buds. ', 'Blue Heaven, Mexican-Afghani ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1775, 'Money Maker', 'relaxed, hungry', 'Its aroma is a sharp mixture of spiced berries and piney kush. Money Maker provides an earthy mix of flavors reminiscent of dried fruits and roasted nuts.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1776, 'Rolls Choice', 'pain relief', 'Exhibits a pungent bouquet of diesel, pine, and sour, skunky earth.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1777, 'Critical Haze', 'relaxed', 'Most phenotypes flower in 8 to 10 weeks.Inherits the sweet citrus smell from a Haze ancestor.', 'Critical Mass, Afghan Haze', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1778, 'Orange Haze', 'energetic, creative, euphoric, focused', 'Orange Haze’s dense, sticky buds are threaded, fiery copper hairs.Green Devil Genetics recommends a 64-day flowering time indoors, or a mid-October harvest for outdoor gardens.', 'Orange Bud, Haze', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1779, 'Stevie Wonder', 'relaxed, uplifted, focused', 'These large, frosted buds are a patchwork of sage and dark greens, scented, sweet berry and earthy notes.', 'Trainwreck, Sensi Star, Bubba Kush, Blueberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1780, 'Chocolate Fondue', 'uplifted, relaxed', 'Its complex bouquet and sweet flavors  make this cannabis strain enjoyable day or night.', 'Chocolope, Exodus Cheese', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1781, 'Super Jack', 'creative, uplifted, energetic', 'Has  a  sweet, spiced blend, a rich buttery aroma.', 'Super Silver Haze, Jack Herer', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1782, 'Canna-Tsu', 'pain relief', 'Sweet earthy flavors activate on the exhale, complementing the subtle citrus aroma that radiates from Canna-Tsu’s buds.', 'Cannatonic, Sour Tsunami', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1783, 'Grapefruit Kush', 'uplifted', 'Large buds, a fruity hash taste, produces enjoyable smooth and creamy smoke, a great high.', 'BC Kush, Grapefruit', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1784, 'Euphoria Cookies', 'uplifted', 'The colorful buds exhibit sweet, doughy terpenes that smell like vanilla, rose, and tropical fruit.', 'Girl Scout Cookies, Euphoria', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1785, 'Hibiscus Sunrise', 'relaxed, focused', 'Offers a mental clarity that enables activity.Hibiscus Sunrise also provides a body high that is dense but not weighted.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1786, 'Happy Rancher', 'euphoric', 'Coated, a sticky blanket of sugar-like resin, Happy Rancher is a treat for all the senses.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1787, 'Monster OG', 'relaxed, pain relief', 'Stout plants produce tights resin-packed buds that carry a blend of deep, earthy diesel and subtle burnt spice notes.', 'OG Kush, SFV OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1788, 'Silver Kush', 'uplifted, relaxed, happy, giggly', '', 'Silver Bubble, OG #18', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1789, 'Dream Lotus', 'uplifted', 'Has an an accentuated chunky bud structure and a fragrant blueberry aroma. Hashy spice and sweet herbal notes can be detected on the exhale in a flavor.', 'Blue Dream, Bodhi’s Snow Lotus', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1790, 'Duke Nukem', 'uplifted, creative', 'Flowers in 9 to 11 weeks.The strain is a fairly easy plant to grow and should give medium to high yields. Its buds are known to be especially colorful, shades of frosty pinks and oranges.', 'Chemmando, Chernobyl', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1791, 'Chem Sis', 'uplifted', 'Offers strong cerebral effects come coupled, a distinct skunky diesel aroma underscored by accents of sweet sandalwood and citrus', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1792, 'Hurricane', 'giggly, pain relief', 'These flowers give off a mix of fruity smells, undertones of spice, and an earthy, herbal flavor when smoked or vaporized.', 'Panama Punch, LA Confidential', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1793, 'Maui', 'uplifted', 'The musky overtones for this easy sativa are complemented by its fruity aftertaste and floral aroma.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1794, 'Killer Queen', 'uplifted , energetic', 'The tropical flavor, however, is quickly followed by an earthy, herbal tone.Takes up the fruity characteristics of Cinderella 99.', 'G13, Cinderella 99', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1795, 'Future', 'euphoric, relaxed', 'Future is a wonderfully potent hybrid cross, aromas of chemical and chocolate, a light, earthy sweetness', 'Gorilla Glue #4, Starfighter F2', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1796, 'Wifi 43', 'pain relief, sleepy, relaxed', 'Has  a pungent earthy aroma that is amplified by flavors of lemons and sour citrus. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1797, 'Blueberry Yum Yum', 'uplifted, happy', 'Though dominated by an unmistakable blueberry aroma, accents of earthy mint and pine can also be detected on the palate. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1798, 'Lemon Pie', 'relaxed, creative', 'It carries hints of citrus, spice, and diesel flavor in dense, orange-haired buds. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1799, 'GG1', 'pain relief, sleepy', 'Has a more piney aroma.Potent and flavorful sister strain to Original Glue', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1800, 'Kryptonite', 'pain relief', 'Kryptonite features a musty tropical fruit smell and a sweet, sugary flavor reminiscent of Cinderella 99', 'Mendocino Purps, Killer Queen', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1801, 'Gumbo', 'pain relief, hungry', 'Has a smooth taste and finish.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1802, 'Blue Power', 'uplifted, focused, happy', 'Blue Power offers a sweet fusion of lemon and berry flavors, an earthy finish.It is cherished for its fragrant buds.', 'Sour Double, Master Kush, The White, Blue Moonshine ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1803, 'Nebula', 'uplifted', 'The buds have been known to smell and taste like honey, and flowering time is a minimum of 9 weeks.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1804, 'OG Skunk', 'relxed, uplifted', 'Flavors of sour fuel and skunky citrus are sure to please fans of both parent strains', 'OG #18, Skunk #1', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1805, 'Chocolate OG', 'relaxed, giggly, euphoric', 'The taste takes on a cheesy, nutty flavor upon combustion, leaving a savory note on the palate.    ', 'True OG, Chocolate Rain.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1806, 'White Fire Alien OG', 'pain relief', 'Has a sweet lemon aroma.', 'The White, Fire Alien Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1807, 'Sour Lemon', 'uplfted', 'Named after its aromatic sour smell, recognizable notes of lemon, lime, and apple.During its vegetative cycle and has a  74 day flowering period.', 'California Sour, Lemon OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1808, 'Pink Panther', 'pain relief', 'This strain has a sweet terpene profile mixed, scents of pine and pears.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1809, 'Golden Ticket', 'relaxed, euphoric', 'Its aroma is an enticing mix of tangy lemon, sweet lime, and sour skunk. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1810, 'Pineapple Trainwreck', 'pain relief, happy', 'Has an earthy aroma and a fruity flavor.', 'Pineapple Express, Trainwreck', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1811, 'Citrus Sunshine Haze', 'uplifted', 'Share a magnificent citrus aroma that runs the gamut from lemon and lime candy, orange, and tangerine, a hint of herbaceous spice.', ' Super Lemon Haze, Kosher Tangie #2', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1812, 'Abusive OG', 'relaxed, pain relief', 'Has an earthy spice aroma, subtle lemon undertones. Abusive OG may not produce the highest yields in the garden, but makes up for it, resin-caked buds.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1813, 'Y  Griega', 'energetic, relaxed, pain relief', 'Has a sweet floral, citrus aroma.Produces large, resin-coated buds on tall stalks and has a 85 to 95-day flowering time.', 'Amnesia Haze, Kali Mist ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1814, 'Nicole Kush', 'relaxed', 'Create a dynamic variety that captures sweet and woody flavors, a touch of lemon.Its buds bloom, chunky calyxes that may take on a stunning blue hue.', 'Kosher Kush,  Marimberos', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1815, 'Northern Berry', 'uplifted, sleepy, pain relief', 'Her father passes on that signature blueberry aroma underscored by notes of earthy hash.', 'Northern Lights #5, Blueberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1816, 'Bay 11', 'relaxed, pain relief, hungry', 'Its dense, pale buds are coated in amber resin, a sweet, fruity aroma.Has a 67 day flowering period indoors, and outdoor gardens will be ready for harvest near the end of October.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1817, 'Blue Dragon', 'euphoric, uplifted', 'The flowers of this strain often turn dark purple and are covered in bright orange pistils and white trichomes.', 'Blueberry, Sour Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1818, 'DelaHaze', 'energetic, uplifted, creative, focused, happy, relaxed', 'Offers  sizeable yields and a moderate flowering time. Mango and citrus notes express themselves loudly and bring a sweet overtone to the strain\'s earthy, spicy aroma.', 'Mango Haze, California Lemon Skunk', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1819, 'Pure Power Plant', 'focused, sleepy', 'Featuring a musky, citrus smell, this strain is fairly pungent and skunk-like. This strain is easy to grow both indoors and outdoors.Known for its high yields and typically flowers in 8-10 weeks.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1820, 'Honey Bananas', 'uplifted, euphoric', 'Earns its name, a resinous coat as sticky as honey and an unmistakable banana aroma. ', 'Strawberry Banana, Honey Boo Boo', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1821, 'Cookie Breath', 'uplifted, ', 'Emits the earthy, doughy aroma.It is known for, intermixed, notes of grape and wine. The dark nugs are coated, glittering purple trichomes said to produce purple-tinted rosin and hash.', 'Thin Mint Girl Scout Cookies, Forum Cut GSC, OG Kush Breath 2.0', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1822, 'Euphoria', 'uplifted, sleepy', 'Euforia may have Skunk parents, but the aroma is sweeter and more floral than skunky. These plant requires minimal fuss when growing and can even produce a bumper crop.', 'Skunk strains', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1823, 'Fortune Cookies', 'uplifted, creative', 'It is a potent mix of earthy, honeyed flavors. ', 'Girl Scout Cookies, OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1824, 'Lemon OG Haze', 'euphoric, focused', 'Has  excess limonene and alpha-pinene.', 'Lemon OG, Haze', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1825, 'Purple Raine', 'euphoric, relaxed', 'It  is bursting, sweet, fruity aromas.', 'Purple Candy Kush, OG Kush, Chemdawg', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1826, 'Irene OG', 'energetic, focused, relaxed', 'Features an earthy pine aroma.Has a distinctive diesel smell that deviates from the typical OG flavor. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1827, 'Alien Bubba', 'uplifted', 'Its bouquet is earthy and floral, and when combusted, shows off a pungent tea and herbaceous grassiness that is smooth on the exhale.', 'Bubba Kush, Alien Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1828, 'Lemon Thai', 'focused', 'This strain features a pleasant lemony-mint taste and typically flowers in 10 weeks.Produces high yields both indoors and outdoors but appreciates a lot of space to grow.', 'Thai , Hawaiian', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1829, 'Dog Shit', 'euphoric, uplifted', '', 'Purple Zacatecas, Colombian Gold, Cambodian, Hippie Trail Afghani.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1830, 'White Berry', 'relaxed, creative, happy', '', 'Blueberry, White Widow', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1831, 'Alaska', 'uplifted, pain relief', '', 'An Israeli strain comprised of 70% sativa genetics', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1832, 'Master OG', 'pain relief, sleepy', 'Produces large, dense buds that tend to bend branches under the weight.Has colorful, pine-scented flowers.', 'Master Kush, Empress Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1833, 'Shoreline', 'relaxed', 'Its super strong skunky smell may border on unappetizing, but its large, hairy buds make up for it.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1834, 'Black Cherry Cheesecake', 'focused', 'These large, pink-tinged purple flowers smell like cherries and sugar, and possess a flavor that is aptly described by the name. ', 'Black Cherry Soda, Super Silver Haze, Cheese.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1835, '501st OG', 'pain relief, sleepy', 'The colorful flowers are tinged, a wide spectrum of green, blue, red, and purple hues that give off a deep piney kush aroma that mixes, the sweetness of grape flavors. ', 'Skywalker OG, Rare Dankness #1', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1836, 'White Dawg', 'relaxed', 'Buds have dark green calyxes, rich orange hairs that give off earthy, fruity, and gassy aromas.', 'Chemdog, White Fire OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1837, 'Alien Technology', 'uplifted', 'Features light green buds, incredible trichome production, and a spicy, hashy flavor/aroma, fuel undertones.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1838, 'White Nightmare', 'euphoric, relaxed, uplifted', 'Brings a forceful, sweet aroma of berries and Haze.The flavor stays true to its Blue Dream genetics but, an earthy, hash-like aftertaste.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1839, 'Purple Tangie', 'euphoric, creative, uplifted', '', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1840, 'Mother of Berries', 'relaxed, sleepy', 'Its chunky buds are wreathed in interweaving hues of purple and green, which are obscured under a dense blanket of crystal trichomes. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1841, 'LA OG', 'uplifted', 'Has a an earthy taste', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1842, 'Purple Ice', 'euphoric, focused, relaxed', 'Features a slight blueberry scent and a mellow taste.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1843, 'Orange Diesel', 'energetic, focused, ', 'Has an Orange Diesel’s sweet citrus flavor which is accented by a subtle diesel aftertaste.', 'Sour Diesel, Agent Orange', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1844, 'Sweet and Sour Widow', 'relaxed', 'Has a 1:1 CBD-THC ratio and a subtle sweet onion aroma.', 'White Widow, ? ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1845, 'Pine Tar', 'relaxed, talkative', 'Features a  bright green hues and a skunky aroma.The rich Kush flavor of pine mixes, sweet undertones.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1846, 'Northern Lights #5 x Haze', 'uplifted', 'It  is a vigorous strain bred to improve upon Haze’s flowering time and bud structure. Has zesty flavors of pungent spice.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1847, 'Cataract Kush', 'pain relief, uplifted, hungry', 'Has blankets of crystals and looks almost grayish-black.', 'LA Confidential, OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1848, 'Jupiter OG', 'pain relief, hungry', 'Known among the celestials for its particularly dense nugs, an abundance of reddish hairs.This strain features a pungent fuel smell and overpowering taste. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1849, 'Pink Bubba', 'relaxed, euphoric', 'Earthy pine flavors lead the way, slight floral highlights that bring out this strain’s sweet notes.', 'Bubba Kush, Pink Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1850, 'Apollo 13', 'uplifted, energetic', 'Its scent has been described as peppery and earthy, a punch of both sour fruit and citrus.The taste takes on the herbal notes of tea, a skunky aftertaste. It also flowers very quickly at 7-8 weeks, producing large sticky buds.', 'P75, Genius', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1851, 'Chiquita Banana', 'relaxed, pain relief', 'Has enormous quantity of THC.', 'OG Kush, Banana', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1852, '1024', 'uplifted', 'Features a sweet and spicy bouquet. Subtle fruit flavors mix, an herbal musk.It is noted for having a pungent odor that fills a room, similar to burning incense.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1853, 'Sour Dream', 'energetic, uplifted, euphoric', 'Featuring a strong, sour, fuel-like aroma, this hybrid takes after its Diesel heritage.', 'Blue Dream, Sour Diesel ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1854, 'Viper', 'uplifted', 'Has a  a spicy, citrus aroma.Viper grows tall and bears fluffy buds that finish their flowering cycle in about 10 weeks.', 'Burmese landrace, Blackseed', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1855, 'Afgooey', 'uplifted, relaxed, creative , sleepy', 'Has an earthy pine flavor.It has a better chance of success indoors, but this indica can also thrive in Mediterranean climates outdoors.', 'Afghani, Maui Haze', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1856, 'Purple Berry', 'focused', 'Produces dense green flowers that are streaked, purples and blues, and sometimes pinks and oranges.Gives off a sweet smell, just a hint of nuttiness; the taste follows suit, an overwhelmingly blueberry flavor.', 'Grandaddy Purp, Blueberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1857, 'Locktite', 'uplifted', 'Scents of citrus and diesel overwhelm you as you enjoy this tasty flower engulfed in trichomes.', 'Mt. Rainier, Original Glue', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1858, 'SAGE', 'uplifted', 'Has a spicy sandalwood flavor.', 'Haze, ?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1859, 'Rose Bud', 'relaxed', 'Known for its skunky rose smell and dense node clusters.Has an enticing floral aroma.', 'Afghani, Northern Lights', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1860, 'Aurora Indica', 'sleepy, pain relief, relaxed', 'The short plants produce dense, bulky buds dusted in a thick layer of crystal resin.Different phenotypes emerge under different growing conditions, giving way to variable bud structures and aromas.Has a 9 to 11-week flowering time for indoor gardens, or a mid-September harvest for outdoor growers.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1861, 'Trinity', 'uplifted', 'Known to have a strong skunk-like smell ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1862, 'The Hog', 'uplifted, pain relief', 'This strain is recognized by its pungent aroma.The short plant is relatively easy to grow indoors or outdoors  and has a flowering time between 8 to 10 weeks.The yield is high given the plant’s size, producing buds, high THC content.', 'White Widow, Purple Power', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1863, 'Purple Widow', 'uplifted', 'Results in a large, sturdy plant that produces fat, resin-covered purple flowers.The aroma ranges from incense to fruit, floral overtones, and the taste from light berry to citrusy.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1864, 'Purple Crack', 'energetic, uplifted, creative', 'Features  flavors ranging from floral earthy notes of pine to fresh citrus fruit.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1865, 'Hulkamania', 'relaxed, creative, uplifted', 'The strain smells doughy, notes of sweet earth on the exhale.  ', 'Monster Cookies, Bruce Banner', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1866, 'Bakerstreet', 'relaxed, pain relief', 'Has a subtle sweet and earthy sandalwood aroma.', 'Hindu Kush ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1867, 'Darth Vader OG', 'relaxed, sleepy', 'Has a sweet grape smell but a comparatively subdued taste.Features violet and forest green flowers.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1868, 'Blue Hawaiian', 'uplifted', 'This strain has light green to orange buds are covered in rich orange and red hairs and are coated, sparkling trichomes.Blue Hawaiian is fruity and smooth.Flowers appear at about ten weeks.', 'Blueberry, Hawaiian Sativa', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1869, 'Lucid Dream', 'energetic, uplifted', 'Provides a stimulating mix of uplifting Haze effects, the sweet blueberry notes of Blue Dream', 'Amnesia Haze, Blue Dream', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1870, 'White Lightning', 'relaxed, pain relief', 'Dusted in a heavy coat of sugary trichome crystals.Has a sweet, fruity aroma, floral, skunky undertones.White Lightning flowers in 8 weeks, and grows best in hydroponic systems and sea of green environments', 'White Widow, Northern Lights #5', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1871, 'Cornbread', 'relaxed, hungry', 'Its aroma is a sweet mix of lemons and incense.', 'Katsu Bubba Kush, Rare Dankness #2', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1872, 'Sour Amnesia', 'uplifted', 'Has an earthy, floral aroma that is enhanced by the citrus, diesel zest of Sour Diesel. ', 'Sour Diesel, Amnesia', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1873, 'Deep Sleep', 'relaxed, sleepy', 'The flavor of Deep Sleep is very sweet and fruity on the inhale, a nice OG funk on the exhale.Has thick, resinous, purple-tinted flowers.', ' Larry OG, Pre-98 Bubba Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1874, 'Bordello', 'tingly, relaxed, pain relief, euphoric, uplifted', 'Bordello’s flowers will be loose, some curly leaves and have a subtle fruit and herb aroma.', 'Blueberry Apocalypse, Alexis ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1875, 'Elephant', 'creative, hungry', 'The chunky flowers express a sweet and sour aroma that is reminiscent of candy and citrus while also retaining a subtle spiciness.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1876, 'Humboldt', 'uplifted, ', 'Humboldt’s aroma is floral and sweet.Given proper care, they grow well indoors and out, flower in 8 weeks.These plants are fast, tall growers that need lots of attention.', 'Afghani Humboldt', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1877, 'Quantum Kush', 'relaxed', 'Passes on a complex aroma that is both earthy and sweet.', 'Sweet Irish Kush, Timewreck', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1878, 'Goo', 'energetic, hungry', 'Has a fruity, blueberry flavor, earthy and sour notes. Has a 7 to 8 week flowering time indoors or in early October for outdoor gardens.', 'Blueberry, Hindu Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1879, 'Strawberry Ice', 'creative , euphoric', 'Emits  fruit flavors and subtle mint undertones.With big colorful flowers that emit an aroma of fresh strawberries.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1880, 'Purple Alien OG', 'pain relief, relaxed', 'Produces thick cone-shaped buds.Tones of pine, earth, and citrus combine to create a pungent flavor.', 'Alien Kush, Tahoe OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1881, 'Outlaw', 'uplifted', ' It inherits a sweet aroma from its Haze parent, intermixing fresh earthiness, sour lemon. Grown  using the screen of green (SCROG) method, a 12-week flowering in order to capture its full flavor.', 'Super Haze, Amnesia', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1882, 'Green Kush', 'uplifted', 'It is dense, orange hair and a sweet pine aroma.Thrive indoors or outdoors and matures at around 8 weeks. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1883, 'Head Cheese', 'pain relief, euphoric, relaxed', 'Bulky yellow-green buds carry the sharp cheese aroma and savory taste.', '707 Headband, UK Cheese.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1884, 'Ray Charles', 'relaxed', 'This hard-hitter introduces itself, an earthy, skunky aroma that reveals itself strongest on the exhale. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1885, 'Blue OG', 'relaxed, euphoric', 'These dark, cone-shaped buds characteristic of OG genes emanate notes of berry and citrus.Has  an eight week flowering period, ideal conditions outdoors.', 'Blueberry F3, Blue Moonshine, OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1886, 'Tangilope', 'happy, giggly, creative', 'It is best known for its intense terpene profile and exotic smell. ', 'Tangie, Chocolope', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1887, 'Sojay Haze', 'uplifted, energetic, euphoric', 'Features a pungent floral undertones and a bright citrus aroma.Has  a sweet, satisfying flavor.', ' BC Big Bud, Grape FX ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1888, 'Burkle', 'relaxed, sleepy, pain relief, hungry, ', 'Its sweet flavor profile is a blend of spiced licorice aromas and an earthy peppermint aftertaste.', 'Pre-98 Bubba Kush, Granddaddy Purple', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1889, 'Pink Berry', 'euphoric, energetic, uplifted, relaxed', 'Offers a sweet, fruity overtones while keeping a root firmly planted in OG genetics.', 'Combination of Pink Champagne, Blackberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1890, '13 Dawgs', 'happy, relaxed, creative, focused', 'Has a sweet earthy musk that brings a blend of woody citrus flavors.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1891, 'Galactic Jack', 'uplifted, energetic', 'Provides an aroma of sweet lemons mixed, flavors of skunky grapefruit.', 'Jack Herer, Space Queen', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1892, 'White Walker Kush', 'relaxed', 'This strain comes blanketed in a snow-like layer of crystal resin. ', 'White Widow, Skywalker', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1893, 'Cookie Wreck', 'euphoric', 'A subtle cookie-like aroma radiates from its dense buds, but more distinct fruity flavors come out on the exhale.', 'Girl Scout Cookies, Trainwreck', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1894, 'Dragon OG', 'euphoric, relaxed, creative, pain relief', '', 'Red Dragon, OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1895, 'OG Cheese', 'euphoric', 'Has  a funky aroma somewhat similar to that of cheese.Growers also cherish this strain for its short flowering cycle and heavy yields. Indoors,  finishes flowering in 50 to 60 days while outdoor plants are ready to harvest by mid-October.', 'OG Skunk #1, Afghani', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1896, 'Blue Moon Rocks', 'relaxed', 'It has a sweet blueberry lavender aroma', 'Blue Moon, BOG Bubble', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1897, 'Sour Bubble', 'relaxed, uplifted, pain relief', 'These sticky buds offer a sweet, fruity aroma, diesel undertones.Indoor or outdoor grows are recommended,  a flowering time between 7 and 8 weeks.', 'BOG Bubble', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1898, 'Cactus', 'pain relief, uplifted, energetic', 'Cactus buds are conic, knobby formations and emit an organic earthy aroma, citrus notes.', 'Afghani, Northern Lights', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1899, 'Alien Rift', 'pain relief', 'Has  a tart scent of lemon and spice, and buds dense, trichomes. ', 'Alien Abduction, Alien Dawg, Alien OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1900, 'Vortex', 'energetic, euphoric', 'Has a sweet and sour lemon aroma accented by notes of tropical mango.', 'Space Queen, Apollo 13', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1901, 'Purple Cheese', 'pain relief', 'Has  a palatable fruit aroma.', 'Purple #1, Blue Cheese, Lowryder', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1902, 'Wet Dream', 'relaxed, uplifted, energetic, euphoric', 'Ushered in by a spicy lemongrass aroma and a woody pine flavor. ', 'Blue Dream, OB Haze ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1903, 'Blueberry Pancakes', 'relaxed', 'Has a dense, slightly purple buds, this strain exhibits an aroma of blueberries.Tastes like blueberry pancakes.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1904, 'Salmon River OG', 'pain relief', 'Easy-to-grow plant that finishes flowering in 7-8 weeks.Features a strong berry scent, underlined, hints of chocolate, coffee, lemon, and gasoline, and a similar taste when vaporized or smoked', 'Pre-98 Bubba Kush, Blue Heron ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1905, 'Marionberry Kush', 'uplifted, relaxed, relaxed', 'The aroma is smooth, sweet, and earthy, a sour twist.', 'Raspberry Kush, Space Queen ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1906, 'Honey Boo Boo', 'euphoric', 'Has a sweet flavor.Her dense buds finish flowering after 8 to 9 weeks, and maturation is often marked by darkened purple leaf tips.', 'Bubba Kush,  Captain Krypt OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1907, 'OG Diesel Kush', 'relaxed', 'This strain has bulky, crystalline buds. Features a clean, green grass smell that has hints of herbs.', 'Jah OG Kush, DS Gold', '2021-03-05 02:23:46', '2021-03-05 02:23:46'),
(1908, 'Cali Gold', 'relaxed', '', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1909, 'Purple Cream', 'relaxed', 'Purple Cream’s aroma is sweet, floral, and earthy.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1910, 'Golden Nugget', 'creative, relaxed', 'The strain is emerald green, bright pistils and has a tart, sweet terpene profile intermixed, a tropical fruit and spice. ', 'Stardawg, Golden Goat', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1911, 'Yeti OG', 'relaxed, pain relief', 'Featuring a rich, creamy-tasting smoke, strong undertones of diesel fuel and hints of lemon and pine.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1912, 'Blueberry Blast', 'relaxed', 'These flowers smell strongly of blueberry, musk, and sweet candy, and taste like cedar and berries when smoked or vaped. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1913, 'Citrix', 'focused, euphoric', 'Named for its intense orange aroma.Features a pungent aroma, disease resistance, heavy yields, rapid vegetative growth, and a dense bud structure.', 'Grapefruit, LA Confidential', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1914, 'Blue Goo', 'uplifted, energetic', 'Offers a smooth smoke and berry taste.', 'Blue Dream, Afgoo', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1915, 'Emerald OG', 'relaxed', 'Emerald OG has a blend of mild floral and melon flavors that mix, pungent citrus notes.', 'Fire OG, Emerald Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1916, 'C4', 'relaxed', 'The fruity aroma is highlighted by a thick, earthy tones that mixes, flavors of pine and citrus. ', 'Cotton Candy, Shiskaberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1917, 'Pineapple Punch', 'uplifted, energetic', 'Delivers a medley of pineapple, tropical citrus, and sweet floral flavors.', 'Skunk #1, Real McCoy', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1918, 'Sour Power', 'anxious', 'Sour Power plants thrive indoors, a flowering time of 9 to 11 weeks and heavy yields.Sour Power buds are crowned, pale pointed leaves and a garland of orange hairs.', 'StarBud, East Coast Sour Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1919, 'CBD Critical Mass', 'pain relief', 'Known to yield an abundant harvest, but plan on supporting the plant’s vigorous growth before flowering.', 'Critical Mass, ?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1920, 'BC Big Bud', 'pain relief', 'Has a fruity, citrus-smelling.Plants produce colossal harvests after its 8 to 9 week flowering period.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1921, 'Blueberry Skunk', 'euphoric, giggly', 'Features a sweet berry flavors, which blend, an earthy, skunky musk.It produces fat, resin-crusted buds during flowering', 'Blueberry, Skunk #1', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1922, 'Grapefruit Diesel', 'energetic, focused', 'These plants show more of their indica side when growing, staying short and branchy and flowering within 8 weeks.Flowers sometimes have hints of pink coloring and a potent smell of over ripe citrus fruit.', 'Grapefruit, NYC Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1923, 'Double OG', 'relaxed, pain relief', '', 'Big Bud Afgoo, SFV OG.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1924, 'Astroboy', 'energetic, happy, focused, uplifted', 'A mix of sweet and sour fruit flavors, like citrus and cherry.', 'Apollo 13, Ortega, Cinderella 99', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1925, 'Blue Kush', 'uplifted', 'Features hints of pine, lemon, and berries.Combines the sweet berry flavors of Blueberry, the powerful and pungent OG Kush.', 'Blueberry,  OG Kush.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1926, 'Super Sour OG', 'euphoric, uplifted, relaxed', 'With tight internodal spacing and minimal fan leaves, Super Sour OG offers fantastic yields of frosty, uniform colas.The smell and flavor are very sour, a hint of berry.', 'Blueberry, Sour Diesel, OG Kush, Lost Coast OG ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1927, 'Purple Sour Diesel', 'energetic, relaxed', 'This strain features a sour, fruity aroma similar to sour grapes.', 'Sour Diesel, Purple Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1928, 'Purple Rhino', 'relaxed, sleepy, hungry, pain relief', 'Combines White Rhino’s skunky aroma, the sweet piney flavors of The Purps. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1929, 'K2', 'relaxed', 'The mellow flavor is accented, hints of fruit and spice', 'White Widow, Hindu Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1930, 'Critical Plus 2.0', 'relaxed', 'Known for its speedy flowering time and zesty lemon aroma.It exhibits exceptionally pungent notes of lemon, incense, and exotic wood.Dinafem recommends using a strong carbon filter during flowering as the aroma of the maturing buds is robust.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1931, 'Disco Glitter', 'uplifted, creative, relaxed', 'Features a unique terpene profile that smells like sweet basil and licorice and produces frosty purple, green, and yellow flowers.', 'Granddaddy Purple, Mystic Gem', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1932, 'Funky Monkey', 'giggly , talkative, euphoric', '', 'Grape Ape, Mendo Purps', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1933, 'Lost Coast', 'creative, talkative, euphoric', 'Flavors of sour citrus and earthy musk burst through on the exhale in show of its signature OG terpene profile. ', 'Chemdawg 4, ?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1934, 'Chemmy Jones', 'uplifted, energetic', 'Diesel flavors are counterbalanced by a floral sweetness', 'Chemdawg D, Casey Jones', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1935, 'Black Ice', 'pain relief', 'Although this flower has a pleasant aroma, its potency sets it apart from the rest. ', 'Black Domina, White Widow', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1936, 'Blue Rhino', 'focused, relaxed', 'This plant may be of special interest to growers for its large flowers.Has a unique fruity aroma mixed, some skunky harshness.', 'Blueberry, White Rhino', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1937, 'Jamaican Dream', 'uplifted, euphoric', 'The compact buds will finish their flowering cycle after 42 to 45 days indoors, or at the end of September in outdoor gardens.Has a subtle and sweet flavor ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1938, 'Night Nurse', 'relaxed, sleepy', '', 'BC Hash Plant, Harmony, Fire OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1939, 'Cactus Cooler', 'uplifted, euphoric, focused', 'With notes of sharp lemon and sweet wildflowers, Cactus Cooler takes after both parents in its fragrance.', 'Blue Dream, OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1940, 'Durban Cookies', 'energetic, pain relief', '', 'Girl Scout Cookies', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1941, 'Grape Krush', 'energetic, relaxed, focused', 'Inherited their purple to blue coloring and their namesake berry flavor.', 'Blueberry  ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1942, 'Raspberry Cough', 'uplifted, focused', '', 'Cambodian landrace, ICE, Raspberry Cough', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1943, 'AK-48', 'uplifted, euphoric', 'This strain is known for its dense buds, fast flowering cycle, and exceptional aroma.', 'Colombian Gold, Thai, Mexican, Afghani ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1944, 'Electric Kool Aid', 'uplifted, relaxed', 'Hashy notes of sweet lavender and grape flavor the sparkling crystal-covered buds, which can take on a stunning periwinkle blue coloration. ', 'Purple Diesel, Cherry Pie', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1945, 'Green Ribbon', 'energetic', 'The light green buds have a subtle floral scent and are slightly fruity, lending an earthy taste.', 'Green Crack, Trainwreck, Afghanica, White Rhino', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1946, 'Martian Candy', 'relaxed', 'This strain smells rich, herbaceous notes and just a hint of eucalyptus.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1947, 'Mataro Blue', 'relaxed, pain relief', 'This strain is a stable, high yield producer on top of having flavorful.', 'Black Domina, Mazar, Sharif, Blue Monster', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1948, 'Snow Dog', 'relaxed', 'This fast-flowering strain has a sweet fruity and citrus aroma.', 'Chemdawg ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1949, 'Area 51', 'euphoric, relaxed, focused', 'Has a sweet smell, citrus and floral undertones and a smooth flowery smoke. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1950, 'Petrolia Headstash', 'relaxed, euphoric, pain relief', 'Its pungent, compact buds have a hashy taste, flavors of pine, wood, and earth.A thick coating of trichomes makes it great for producing hash and other concentrates.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1951, 'Mango Tango', 'relaxed', 'Has a pungent, fruity flavor profile.A subtle pine flavor can be detected on the exhale, creating a complex taste', 'True OG ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1952, 'Godzilla Glue', 'euphoric, ', 'This sticky, tropical coupling produces monstrous green stalks, fat, resinous colas that reek of pungent earth and pine, a hint of sweet tropical breeze.', 'Gorilla Glue #4, Kailua-Kona Gold', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1953, 'Dr. Grinspoon', 'creative, focused, pain relief, euphoric', 'Imbued, rich earthy and honey flavors, grow like berries on twig stalks in unusually gapped popcorn formations.Delivers smaller harvests after a 13-14 week flowering time. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1954, 'Appalachia', 'euphoric, pain relief, hungry, relaxed', 'Alayer of white, cloudy trichomes gives the buds a sage green color, darker leaves and fiery hairs peeking out from underneath.Has an aroma of earthy pine and subtle fruit', 'Green Crack, Tres Dawg', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1955, 'Papa\'s OG', 'uplifted, relaxed, pain relief', 'Inherits a sweet and earthy grape aroma.', 'Skywalker OG, OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1956, 'Bubblicious', 'relaxed', 'Bubblicious captures the signature bubble gum flavor.', 'Indiana Bubble Gum', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1957, 'Cannalope Kush', 'euphoric, energetic', 'Delivers a pleasant light smoke, woody undertones.', 'OG #18, Cannalope Haze.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1958, 'Lemon Alien Dawg', 'relaxed, euphoric, happy', 'Large chunky buds radiate, sweet and sour fruity notes dominated by the zesty scent of lemon. ', 'Alien Dawg, Lemon Kush ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1959, 'Kong', 'relaxed, happy', 'Has hairy buds that secrete massive amounts of THC-rich resin. ', 'Motavation,  White Russian.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1960, 'Permafrost', 'relaxed, focused', 'Named for its frosty coat of crystal trichomes and fresh pine aroma. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1961, 'Lime Green Skunk', 'energetic, relaxed, euphoric', 'Features vibrant lime-colored leaves, a hefty amount of burnt orange hairs. The taste is a strong, sweet citrus, and the smell is equally as tropical. ', 'Super Skunk, Northern Lights', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1962, 'Bob Saget', 'energetic, uplifted, anxious', '', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1963, 'Sour Haze', 'focued, uplifted', 'The crystal-coated flowers are potent.', 'Sour Diesel, Haze ', '2021-03-05 13:36:02', '2021-03-05 02:23:46');
INSERT INTO `strains` (`id`, `name`, `effect`, `description`, `parent`, `created_at`, `updated_at`) VALUES
(1964, 'Chronic Thunder', 'relaxed, pain relief', 'Offers a funky diesel and spicy pepper aroma.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1965, 'Blucifer', 'focused, relaxed', 'Radiates, the smell of blueberries and cream, a spicy finish. Works well in indoor gardens, minimal direct sunlight, and it should finish flowering in 55 to 60 days.', 'Conspiracy Kush, Blue Dream', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1966, 'Darkside OG', 'relaxed', 'The dark, frosted buds emanate an earthy, floral aroma that lingers in the air. ', 'Dark Star OG, Rug Burn OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1967, 'Trix', 'uplifted, relaxed, pain relief', 'the sweet fruity smell of Colombian Gold, the fuel scents of Chemdawg makes Trix a delicious smoke. Finishing in 10 weeks and producing massive yields.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1968, 'Sweet Kush', 'relaxed, pain relief, euphoric', 'Sweet Kush tastes just like a lemon drop candy.', 'Sweet Tooth, OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1969, 'Sin City Kush', 'uplifted, ', 'The buds of Sin City Kush are a mix of deep purple and green hues, a glossy coat of white trichomes and a compelling floral aroma.', 'LVPK, Snowdawg ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1970, 'Jacky White', 'euphoric, uplifted, relaxed', 'She introduces herself, a sweet grapefruit and citrus aroma.Growers have cherished Jacky White for her hardiness, stability, fast flowering, and plentiful yields.', 'Jack Herer, White Widow', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1971, 'Riddler OG', 'uplifted, happy, euphoric', 'It  is a trichome-rich hybrid', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1972, 'Dakini Kush', 'relaxed, pain relief', 'This strain’s sweet and herbaceous flavors leave the taste of hops, caramel, and berry on the palate', 'Pre-98 Bubba Kush, Hindu Kush.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1973, 'Super Kush', 'focused, relaxed', '. This strain grows best indoors and typically has an early flowering time of 7-8 weeks.', 'Northern Lights #5, Hindu Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1974, 'Dairy Queen', 'relaxed', 'Its flavor has a smoothness that many users describe as creamy, just like your favorite frozen dairy treat. Plants will be bushy and flower in 7-8 weeks and its  unique aroma is very potent.', 'Cheese, Space Queen ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1975, 'Orange Velvet', 'euphoric, focused, pain relief', 'Tastes and smells remarkably like Orange Dreamsicles; the orange-y, creamy, frozen desert on a stick.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1976, 'Godzilla', 'euphoric, pain relief', 'Has a sour berry flavor accented, subtle notes of vanilla. This indica produces colorfully vibrant buds of green and purple hues.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1977, 'Blue Sky', 'relaxed', 'Beautiful in appearance, these shimmering flowers give off blue and red hues when the light hits them. Blue Sky is the sweet, candy-flavored.', 'LSD, Rocky Mountain Blueberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1978, 'Sirius Black', 'uplifted, euphoric, creative', 'Exhibiting a strong flavor and aroma of sweet grapes, Sirius Black’s palate is tart but smooth on the exhale.It is a deep purple indica strain, a rich terpene profile.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1979, 'Apollo 11', 'euphoric, uplifted', 'This Apollo shares the family trait of an extremely fast flowering time, usually before 8 weeks.The resinous flowers will have a strong, sharp citrus aroma and a slightly subtler lemon flavor. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1980, 'Haze Berry', 'euphoric, creative, relaxed', 'Popular for its combination of sweet berry, indica-like flavors and sativa highs.Provides higher than average yields and a relatively short flowering time of 9-10 weeks.', 'Super Silver Haze, Blueberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1981, 'Citrus Punch', 'uplifted', 'This sativa-dominant strain smells of ripening oranges and tangerines, notes of grapefruit and lime.It  is a tangy splash of bright citrus and good vibes. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1982, 'Purple Headband', 'uplifted, relaxed', 'Features dense pink and purple flowers covered in greenish trichomes. It often produces a strong fruity aroma, just a hint of gasoline, and a similar flavor, undertones of pine. ', 'Headband, unknown “purple” hybrid', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1983, 'Milky Way', 'relaxed', 'Named for the milky white trichomes that cover its buds and sugar leaves, Milky Way has a sweet aroma, flavors of sugar and spice.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1984, 'Tropicali', 'uplifted, pain relief', '. The flowers of the Tc have an alluring frosty mint green color, minimal twists of orange and sticky dewy looking trichomes.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1985, 'Mazar Kush', 'relaxed', 'Two age-old indica strains originating from the Afghanistan-Pakistan region. ', 'Afghani, Mazar I Sharif,', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1986, 'Bubba\'s Gift', 'uplifted, creative', 'It is a sweet, fruity strain. Bubba’s Gift will flower in 6 weeks and can be grown indoors and outdoors.', 'Bubba Kush, God’s Gift', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1987, 'Purple Voodoo', 'relaxed', 'These plants will flower in 8-10 weeks and will produce dark flowers, traces of purple and red.Its purpleness is evident in its pungent taste and smell, which has a musky quality tinged, grapey sweetness. Warm climates or indoors are best for growing.', '?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1988, 'Tokyo OG', 'relxed, pain relief, anxious', 'This cutting preserves the traditional OG aroma that blends lemon and pine, a distinctive diesel bite.Offers a dense, chunky bud structure.', 'OG Kush hybrid', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1989, 'Black Diesel', 'relaxed', 'Black Diesel’s dense purple flowers have not only an impressive appearance, but also an intense, favorable pungence, sour and fruity undertones.', 'NYC Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1990, 'Bananas', 'energetic, creative', 'This shatter intends to capture sweet tropical flavors of fruit and banana.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1991, 'Endless Sky', 'euphoric', 'Suitable for both indoor and outdoor gardens.Endless Sky undergoes a 42 to 50 day flowering period and grows best, hydroponics.', 'Grenadine,  Iranian landrace', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1992, 'Double Purple Doja', 'euphoric', 'Has a a musky blackberry aroma.', 'Sputnik #1, Black Russian', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1993, 'Rare Darkness', 'uplifted, relaxed, sleepy, pain relief', 'The flowers are known for being a deep purple and having a thick coating of trichomes.The flavor is best compared to fresh grapes or berries.', 'Rare Dankness #1, Grape Ape', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1994, 'Black Russian', 'relaxed', 'Notes of mango and citrus collide, lemon candy to create a medley of sweet tropical aromas that burst from Black Russian’s compact buds.', 'Black Domina, White Russian', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1995, 'Blue Crack', 'energetic, focused', 'Although dense by appearance, this flower yields soft, airy buds and a sweet, smooth aroma, blueberry undertones.', 'Blue Dream, Green Crack', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1996, 'Blue Steel', 'uplifted, creative, hungry', 'The flavor and aroma are thick, the scent of blueberries and the nugs are smothered in a layer of frosty trichomes.', 'Blueberry, Starfighter F3 ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1997, 'Sourlope', 'uplifted, energetic, creative', 'Sourlope creates a mix of tropical flavors that are sharpened by a strong diesel note.', 'NYC Diesel, Cannalope Haze ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1998, 'Glass Slipper', 'uplifted', 'Has a sweet, somewhat fruity flavor profile.', 'Cinderella 99, Pineapple 99', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(1999, 'Red Cherry Berry', 'pain relief, sleepy', 'It is a sweet-smelling strain, pungent notes of flowers and fruit.Flowers in 60 to 70 days, but growers cultivating this strain in warm outdoor climates will harvest around the end of September.', 'Skunk #1, ? indica', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2000, 'Aliens On Moonshine', 'uplifted', 'Emits a funky aroma that is a clashing of sour, sweet, and chemicals.', 'Sour Alien, White Moonshine', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2001, 'Ninja Fruit', 'creative, talkative, hungry, uplifted', 'Has a potent Haze aroma and unique purple foliage. ', '  Grapefruit Haze, Grape Ape', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2002, 'Golden State Banana', 'uplifted, euphoric, relaxed', 'The aroma is a mixture of Ghost OG’s pungent, citrus terpenes and Banana Kush’s tropical scents, creating a rich bouquet, bright floral sweetness.', 'Ghost OG, Banana Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2003, 'Moose and Lobsta', 'uplifted, pain relief', 'Produces heavy yields of high-potency flowers in about nine to ten and a half weeks of flowering.It smells strongly of skunk and tropical fruit and has a similar taste, undertones of diesel fuel.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2004, 'Orange Hill Special', 'uplifted, relaxed', 'Known for its bright orange pistils and citrus flavors.', 'Orange Bud, California Orange', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2005, 'Caramel Candy Kush', 'pain relief', 'Expresses itself, flavors of sugary caramel, fruity notes of cherry and grape, and a creamy coffee. The complex terpene profile and excellent resin production make this a great choice for producing hash and other concentrates.', 'Pre-98 Bubba Kush, Ms. Universe', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2006, 'Commerce City Kush', 'relaxed', 'Delivers fuel-forward aromas.', 'Chemdawg 4, Rare Dankness #1', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2007, 'Jack 47', 'pain relief', 'Carries the sweet, captivating aroma of Jack Herer. Growers will appreciate the vigorous growth and large colas this strain produces.', 'CJack Herer, AK-47', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2008, 'Butterscotch', 'relaxed, sleepy', 'Gets its name from its distinctive candy aroma. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2009, 'Big Bang', 'pain relief, sleep', 'Big Bang bursts into flowering, finishing in 8 to 9 weeks indoors or around the end of September in outdoor grows.', 'Skunk, Northern Lights, El Niño', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2010, 'Blue Lights', 'euphoric, pain relief', 'This flower emits a blueberry pungency thanks to the Blueberry influence.Has  a noteworthy THC content.', 'Blueberry, Northern Lights', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2011, 'Sweet Cheese', 'relaxed, euphoric', 'Marked by the fragrant fusion of cheese and spice, a combination of aromas found in few other cannabis varieties. Outdoor Sweet Cheese plants finish flowering in mid-October, while indoor plants bloom in 9 weeks.', 'Cheese, Black Jack', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2012, 'Oregon Diesel', 'relaxed, pain relief', '', 'NYC Diesel, Blackberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2013, 'Black Magic', 'sleepy', 'With jade green foliage and bright orange pistils, Black Magic Kush looks nearly as good as it tastes. Exhibiting a terpene profile soaked in sweetness, berry, and herbaceous overtones,delivers a pleasurable variety of flavors, aromas. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2014, 'Blueberry AK', 'relaxed, uplifted, giggly, pain relief', 'Has a strong musky odor, undertones of berry, and flavors ranging from sweet Kush to the more peppery taste of the AK.', 'Blueberry, AK-47', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2015, 'Flo OG', 'euphoric, relaxed, creative', '', 'Flo, Rare Dankness #1', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2016, 'Extreme OG', 'uplifted, relaxed', '', 'Fire OG, Green Ribbon', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2017, 'Durga Mata', 'relaxed', 'Has flavors best described as reminiscent of Turkish Delight. This strain has a natural resistance to pests and survives through rough treatment.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2018, 'Brooklyn Mango', 'energetic, relaxed', 'The resulting buds carry a mix of diesel and tropical fruit flavors, like pineapple, mango, and lemon. ', 'Super Bud, NYC Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2019, 'Boy Scout Cookies', 'euphoric, relaxed, happy, sleepy', 'Has a   sweet, earthy aromas burst forth, subtle notes of woody pine.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2020, 'Sonoma Coma', 'energetic, creative, euphoric', 'The flavor maintains the aroma’s complex characteristics but provides a smooth mellow finish.Presents itself, tight, electric green buds which produce a thick coat of trichomes that sparkle in the sunlight.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2021, 'Purple Power', 'relaxed, euphoric', 'It is a very popular strain, outdoor and greenhouse growers, but is very unpredictable and difficult to manage when grown indoors.Large yields of resinous purple flowers produce a strong sweet smell and a sweet, skunky flavor when smoked.', 'Dutch Dope, Skunk #1', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2022, 'Sour Headband ', 'pain relief', 'With large, dense, trichome encrusted flowers and an intense aroma/flavor diesel fuel and sour lemon.', ' Sour Diesel, Headband', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2023, 'Sour Candy', 'euphoric, talkative', 'Takes on a mouth-watering array of sweet, tropical fruit flavors, a pungent diesel finish.', 'Sour Diesel, Bubble Gum.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2024, 'Ice Wreck', 'uplifted', 'Has tested at over 27% THC.', 'Ice, Trainwreck', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2025, 'Lemon Sativa', 'relaxed', 'Has an aroma similar to a lemon drop candy.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2026, 'Snow Mountain', 'focused, uplifted', 'Produce large resinous colas that exhibit a sweet hashy aroma and trichome-stacked sugar leaves that hash makers will covet. ', 'Snowcap, Pure Kush, Uzbekistani Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2027, 'Cowboy Kush', 'relaxed', 'This aromatic hybrid combines the sharpness and sweetness of Hell’s Angels OG and the chemical tartness and astringent aromas of the Stardawg to create a unique, if not challenging terpene profile.', 'Hell’s Angels OG, Stardawg', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2028, 'Ash', 'relaxed', 'These buds offer a fruity, berry aroma.', 'Afghan Haze, Afghan Skunk', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2029, 'Double Mint', 'euphoric', 'Has a  sweet, minty terpenes of this strain’s resinous, rock-like buds.Double Mint has a punctual 63-day flowering time and generous resin production.', 'SinMint Cookies, Mint Chocolate Chip, NSG, Mint Chocolate ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2030, 'Angel OG', 'relaxed, pain relief', 'Its lineage gives the buds an aroma of earth, pine, and sweetness.', ' OG Kush, Blackberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2031, 'MediHaze', 'pain relief, uplifted', 'Its THC to CBD ratio typically comes out 1:1, but some seeds will offer a doubled CBD content.', 'Super Silver Haze, Neville’s Haze, ?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2032, 'Pineapple Cookies', 'relaxed, happy', 'This strain\'s aroma is bright and buttery, exhibiting sweet notes from both its parents.', 'Pineapple OG Kush, Platinum GSC', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2033, 'Cherry Cream Pie', 'hungry, relaxed, pain relief', 'Has pronounced OG undertones and hints of tartness and pine, a terpene profile, pronounced OG undertones and hints of tartness and pine', 'Cherry Pie, Cookies, Cream', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2034, 'Tangerine Power ', 'relaxed, euphoric ', 'It carries an unmistakable citrus aroma inherited from the Agent Orange parent', 'Agent Orange, Blue Power', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2035, 'Hawaiian Mayan Gold', 'energetic ', 'It produces massive sativa spears that reach for the sky.', 'Kona Gold, Colombian Mojito landraces', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2036, 'Green Lantern', 'euphoric, focused ', 'It inherits a peppery pine aroma comparable to that of Jack Herer and Its aroma suggests the presence of caryophyllene and pinene.', ' Green Crack, White Rhino', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2037, 'OG Poison', 'sleepy, uplifted', 'It features a pungent and piney aroma.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2038, 'Critical Sensi Star ', 'relaxed, happy, sleepy ', 'Known for producing exceptionally sticky buds, Critical Sensi Star is typically short and dense in stature. Zesty hints of citrus fruit like lemon and grapefruit mix, the strong skunky odor to create a complex flavor combination', 'Critical Mass, Sensi Star', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2039, 'Pacific Blue', 'euphoric, relaxed, pain relief ', 'It\'s robust and flavorful genetics offer aromas of sweet skunk and blueberry, a smooth floral aftertaste', 'Pre-98 Bubba Kush, DJ Short Blueberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2040, 'Devil Fruit', 'uplifted, relaxed', 'Outdoor Devil Fruit plants finish in the first half of October while indoor gardens flower in about 65 days.Offers  high-CBD sweet and spicy in flavor.', ' Shiskaberry, Great White Shark', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2041, '5th Element', 'uplifted', 'Poduces huge yields of sticky buds that feature a powerful earthy, lemony smell and flavor. ', 'Blackberry, All Spark OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2042, 'The Doctor ', 'pain relief , relaxed , ', 'Has  earthy flavors soured by skunky, fruity notes arrive on the inhale, making their exit, the taste of hashy spice', 'Great White Shark, Super Skunk, ?', '2021-03-05 16:02:56', '2021-03-05 02:23:46'),
(2043, 'Blueberry Dream', 'creative, uplifted', 'Has a  sweet flavor of ripe blueberries  and THC content of about 14%.', '?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2044, 'Chunky Diesel ', 'uplifted ', 'Has massive trichome production and a terpene profile of skunk, chocolate-covered espresso beans, and diesel', 'Deep Chunk, Sour Diesel', '2021-03-05 17:06:53', '2021-03-05 02:23:46'),
(2045, 'Medusa', 'pain relief, focused', 'Mixes smooth, sweet flavors, an earthy aroma of fresh blueberries to create a compelling hybrid.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2046, 'Jelly Roll', 'relaxed , energetic', 'Has delicious grape and anise aromas brought by the Jelly Roll #7, Jelly Roll emanates a rich odor that will fill the room', 'God Bud, Grapefruit, Gupta Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2047, 'Vader OG', 'euphoric, pain relief', 'The terpene profile is rich, pinene, spice, and hash.', 'SFV OG, Larry OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2048, 'Super Green Crack', 'energetic, creative', 'Features an extremely pungent aroma,  producing a strong skunk-like scent.', 'Super Silver Haze, Green Crack', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2049, 'Master Yoda', 'uplifted', 'Growers like this strain for its hybrid resilience and its 8 week flowering time.', ' OG Kush, Master Kush ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2050, 'Yumboldt', 'sleepy ', '', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2051, 'Valley Girl', 'euphoric, pain relief', 'Resin-packed buds mark this strain’s elevated THC potential.', 'SFV OG, Face Off OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2052, 'Twisted Citrus', 'energetic, euphoric , uplifted', 'Abold fusion of oranges and banana flavors overwhelm the inhale and fade to subtle earthiness on the release.Has a THC content that can climb to heights as high as 27%. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2053, 'Tillamook Strawberry ', 'focused, relaxed , uplifted ', 'Smells like a gas station in a strawberry field. The strain’s foliage is deep green, tight buds', 'Alphakronik , Dark Horse', '2021-03-05 17:06:53', '2021-03-05 02:23:46'),
(2054, 'Green Dragon', 'pain relief', 'These timeless buds are striking in appearance, aroma, and effects.Suitable for any growing environment, a heavy yield can be expected to flower at around 50 days.', 'Afghani, Turkish Gummy', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2055, 'Red Diesel', 'euphoric, energetic', 'Has a stable heavy producer, to increase the yield and potency.', 'NYC Diesel, California Orange', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2056, 'White Durban ', 'energetic , euphoric, focused', 'Exhibits notes of sweet earth and fuel, and its buds come coated in a dense layer of glimmering trichomes', 'White Fire OG, Durban Poison', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2057, 'Casper OG', 'relaxed', 'The terpene profile is rich, OG notes, including earth and delicate citrus.Known for its squat plants and nine week grow cycle, Casper OG is an ideal indoor grow.', 'Face Off OG, Ghost OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2058, 'Pure Love', 'relaxed', 'Pure Love’s buds are dense, green tones and bright orange pistils caked in sugary trichomes.Growers can expect a flowering period of 8 to 9 weeks and an average yield. ', 'LA Confidential, X18 Pure Pakistani', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2059, 'Alaskan Ice', 'energetic ', 'Frostlike resin blankets the buds in a promise of soaring psychoactivity, anchored only by its slight CBD content. It has sour, spicy buds following a 9 week flowering period and has a high resin content', 'White Widowand Haze', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2060, 'Gorilla Biscuit', 'relaxed', 'Has a strong terpene profile, smelling intensely of Pine Sol and espresso beans. ', 'Sensi Star, Stardawg IX', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2061, 'KC 33', 'uplifted ', 'Has a zesty lemon aroma and was mainly bred for the outdoor cultivator, as these plants thrive in wet, cooler climates.', 'Afghani, Haze, Ukrainian landrace', '2021-03-05 17:06:53', '2021-03-05 02:23:46'),
(2062, 'Bullrider', 'creative , relaxed', 'It is pretty to look at, light green buds covered in orange hairs, and has a strong sweet and sour smell, some piney freshness. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2063, 'Tora Bora ', 'pain relief ', 'Has resin-loaded, spicy-smelling indica that can appear almost blue in its coloration, and finishes its vegetative cycle quickly and flowers in just a short 8 to 9 weeks indoors.', 'L.A. Confidential, X18 Pure Pakistani', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2064, 'Alpha Blue', 'relaxed, uplifted, happy', 'Its buds are glazed, sugary trichomes and take on hues of deep red and violet. The aroma is a combination of tart blueberry and sour candy that create a pungent mixture of earthy berry and Haze upon exhale.Has a  sweet fragrance.', 'Blue Dream, NYC Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2065, 'Querkle', 'euphoric, uplifted, sleepy', 'Carries a strong grape and berry aroma and blooms, vibrant lavender hues and a heavy dusting of crystal resin that blankets its bulky colas in a frost-like coat', 'Purple Urkle, Space Queen', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2066, 'Platinum Huckleberry Cookies', 'euphoric, relaxed', 'Offers growers higher yields, better internodal spacing, and a complexity of flavor few strains achieve. Its aroma is sour berries and mint while the flavor is hashy and floral.', 'Platinum Girl Scout Cookies, Oregon Huckleberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2067, 'Voodoo', 'euphoric, uplifted, energetic', 'A fresh, fruity aroma emanates from the dense, pine-green buds enameled in crystal trichomes, nutty and spicy flavors to follow.This strain prospers both indoors and outdoors, and flowers 8 to 9 weeks after its vegetative cycle.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2068, 'Pineapple Jack ', 'euphoric, energetic', 'Tropical fruit and citrus flavors meet the earthy, piney taste of Jack Herer in an unusual pairing of island and tundra aromas', 'Jack Herer, Pineapple', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2069, 'Crystalberry', 'euphoric, relaxed, pain relief', 'Your senses will instantly notice the notes of sweet blueberry and lemon throughout. ', 'Sensi Star, DJ Short’s Blueberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2070, 'Blue Knight', 'relaxed, ', 'Hues of royal purple twist, deep blues and vivid greens in a visual display as multifaceted as its berry, vanilla aroma.Earthy, woody, and blueberry flavors.', 'Blueberry, Kryptonite', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2071, 'Iron Triangle ', 'uplifted', 'Exhibits an aroma of lemon and fuel and Gupta Kush amps up the yield of its zesty buds', 'OG, Kush ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2072, 'Pineapple Fields', 'energetic', 'Has  a sweet terpene profile and energizing, clear-headed attributes.Known to produce a good yield over its 9-10 week grow cycle.Exhibits purple leaves and chunky buds despite its sativa dominance. ', 'Kali Snapple, Ms. Universe #10', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2073, 'Soul Assassin OG', 'sleepy, pain relief', 'Produces smooth, expansive smoke, and aroma of pungent diesel and citrus fumes. ', 'Lemon Thai, OG Kush ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2074, 'Blue Monster ', 'relaxed , sleepy, euphoric, pain relief ', 'Combines a sweet mix of flavors, strong indica effects. Its complex aroma of berries and tropical fruits exposes the influence of Blueberry and G13 genetics ', 'G13, Blueberry, Northern Lights #5, Mexican landrace', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2075, 'Blue Moonshine', 'uplifted', 'Stays short to medium height and usually flowering by 8 weeks.While growing and after it’s harvested, these plants have a sharp and fruity smell that brings to mind fermentation.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2076, 'Ace Killer OG', 'uplifted', 'Inherits a heavy blanket of snow-like resin.Boasts a high THC content.', 'White Fire OG, King’s Kush, Kosher Kush, ?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2077, 'Flaming Cookies', 'euphoric', 'Woody, earthy, and diesel flavors give away this strain’s OG lineage, an added hint of minty eucalyptus.Scorching orange hairs burst from this indica’s dark buds, giving the flowers themselves an almost fire-like appearance.', 'Girl Scout Cookies, Fire OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2078, 'Strawberry Milkshake', 'relaxed, happy , energetic', '', 'Strawberry Soda, White Fire Alien OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2079, 'Sugar Plum', 'uplifted', 'Has  a tropical and earthy flavor.This strain is a good beginner grow, a recommended flowering period of 35 days for indoor gardens.', 'Berkeley Blues, Hawaiian Haze Plum', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2080, 'B-52', 'relaxed, giggly', 'It is a sweet mix of skunky flavors.It\'s a great strain for commercial production.', 'Skunk, Big Bud', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2081, 'Pakistan Valley ', 'relaxed, pain relief, ', 'Grows squat and resilient, exhibiting deep colors and earthy, floral aromas', 'Hinudu Indica landrace', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2082, 'OGiesel', 'euphoric, happy, uplifted, relaxed', 'The aroma of this hybrid is strong and piney, pleasant lemon undertones. OGiesel typically flowers in 8 weeks and features more indica-like growing characteristics. For best yields, this strain should be grown indoors.', 'SFV OG Kush, Giesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2083, 'Blue Magic ', 'energetic, euphoric, relaxed , focused ', 'Has creamy, fruity flavors reminiscent of its Blueberry ancestry and has a balance of potency and clarity', 'Blue Dream', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2084, 'Grandpa Larry OG', 'creative, relaxed, pain relief', 'These dense dark green and purple buds are covered in trichomes and orange hairs.', 'Granddaddy Purple, Larry OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2085, 'Silvertip ', 'pain relief', '', ' Granddaddy Purple, Super Silver Haze ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2086, 'Cheesewreck', 'euphoric, relaxed, sleepy', 'High yields of Cheesewreck will be ready for harvest following its 9 to 10 week flowering cycle indoors.', 'Cheese, Trainwreck', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2087, 'Ambrosia ', 'uplifted ', 'Popular for it\'s tropical sweet flavor,it produces a large amount of dense and sticky buds, yellow leaves and orange hairs.', 'God Bud, Burmese', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2088, 'Sour Cheese', 'talkative, happy', 'These plants flower in 8 to 9 weeks, grow well indoors and out, and tend to produce high yields.', 'Cheese, Sour Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2089, 'Grape Valley Kush', 'relaxed, energetic', 'The earthy aroma of this strain mixes, flavors of pine and sweet citrus.', 'SFV OG, Grape Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2090, 'Master Bubba ', 'pain relief , relaxed', 'Plants flower at 8 to 9 weeks, smaller, dense buds that can have a fruity, musky aroma. Kush earthiness is the main note in its smooth flavor', 'Master Kush, Bubba Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2091, 'Blue Venom', 'relaxed, pain relief', 'With a sweet, blueberry aroma inherited from its parent strain.', 'Blueberry, White Widow', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2092, 'Sweet Dreams ', 'relaxed, sleepy, pain relief ', 'Has very strong aromas of skunk, berry, Kush, and ammonia, the smoke is quite smooth, a unique musty-earth flavor', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2093, 'Pink Sunset', 'relaxed, pain relief', '', 'Sunset Sherbert', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2094, 'Orange Dream', 'euphoric, relaxed, creative', 'Inviting aromas of citrus and vanilla combine to create a distinct flavor profile that can only be compared to orange creamsicles.', 'Orange Crush, Blue Dream', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2095, 'Maple Leaf Indica', 'relaxed, sleepy', 'The taste of the herb is sweet, somewhat citrusy, and smells of incense.Has fat leaves, plump buds, and caked, crystals.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2096, 'Frisian Dew ', 'euphoric', 'Expresses itself in hues of either green or deep purple, an aroma of spicy pine and citrus. Frisian Dew plants are hardy, mold-resistant, and grow well in Northern European climates. Outdoor flowers will ripen around the beginning of October, while indoor gardens finish their flowering in just 7 to 8 weeks.', 'Super Skunk, Purple Star', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2097, 'LA Chocolat', 'relaxed, hungry', 'This power-couple collectively passes on the best of their qualities: thick resin production, heavy yields, and a sweet, earthy aroma of chocolate and coffee.', 'LA Confidential, Chocolope ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2098, 'Silver Surfer', 'euphoric, energetic, talkative, relaxed', 'Plants flower in 8 to 9 weeks, large, crystal-covered yields.', 'Super Silver Haze, Blue Dream', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2099, 'Madman OG', 'relaxed, sleepy', 'It has been tested at anywhere from 16-24%. Smooth coffee flavors give way to sour earthy undertones, a fresh pine scent typical of many OG Kush varieties.', 'LA Confidential, OG Kush ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2100, 'CBD Shark', 'pain relief ', 'Its aroma is comprised of sweet notes of fruit accented by subtle hints of garlic and herb', 'Shark Shock indica', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2101, 'Four Star General', 'euphoric', 'Its buds are a vibrant show of purple and green calyxes wrapped in red-orange hairs, all shrouded by a sparkling coat of frosty resin. Sweet and earthy, sour notes', 'Stardawg, Tres Dawg', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2102, 'Kurple Fantasy', 'relaxed, euphoric', 'Has a sweet grape aroma accents.Shows off her beauty in deep hues of purple, brightened by a starry coat of crystal trichomes.According to its breeders at Imperial Genetics, Kurple Fantasy is a ’92 OG Kush and Old Man Purps.', '92 OG Kush, Old Man Purps', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2103, 'Walker Kush ', 'uplifted, happy', '', 'Rare Dankness Albert Walker, Rare Dankness #1', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2104, 'Purple Dog Poop', 'pain relief , sleepy, relaxed', 'Described as earthy, a sweet touch of grape.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2105, 'Fire Alien Kush', 'euphoric, relaxed', 'Known for its heavy resin production and lofty buzz.Some phenotypes take after Fire OG, a lemony pine aroma while others lean more towards Alien Kush, an earthy indica.', 'Crosses Alien Kush, Fire OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2106, 'Sonic Screwdriver', 'pain relief , uplifted ', '', 'Orange Cream Soda, Trainwreck', '2021-03-05 17:06:53', '2021-03-05 02:23:46'),
(2107, 'Dynamite', 'relaxed, creative , talkative', 'The subtle, sweet aroma of grapefruit and mixed fruit breaks free from the bud when ground up.Completes its flowering cycle in 7 to 8 weeks, yielding a heavy harvest of buds that may bloom in stunning hues of purple and pink.Dynamite is a short and bushy indica strain that offers an aroma of sweet grapefruit and mixed fruit', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2108, 'Buddha Haze', 'uplifted, energetic', 'Offers a complex aroma that blends together sweet mango and spice.', 'Amnesia Haze, Manga Rosa', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2109, 'Versace', 'relaxed, euphoric, ', 'This trio of trichome-rich strains is combined to offer an array of effects that work off each other.', ' Sour Diesel, OG Kush, Granddaddy Purple', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2110, 'Mexican Sativa', 'uplifted', 'Has a  fresh sandalwood aroma.', 'Durban Poison, Pakistani indica', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2111, 'Power Kush', 'uplifted', 'The aroma is likened to a sweet skunk smell, a light touch of strawberry and orange. The buds of Power Kush have an abundance of resin, white and orange hairs.Has a THC content up to 16% and a CBD of 0.18%. Flowering time is 7-8 weeks. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2112, 'Humboldt Dream', 'creative, hungry', '', 'Purple Panty Dropper, Blue Dream.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2113, 'Lifesaver', 'relaxed, pain relief', 'Has a  grape and bubble gum aroma.Lifesaver flowers quickly, usually within 8 weeks.', 'BOG Bubble, Subcool JCB', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2114, 'Tangie Dream', 'euphoric', 'This strain reeks of orange peel and rock candy. ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2115, 'Sour Cream', 'relaxed', 'Though suited for indoor gardens, this sativa hybrid does well in greenhouse cultivation and has a flowering time of 70 to 77 days.', 'G-13 Haze, Sour Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2116, 'Purple Goo', 'relaxed, euphoric, euphoric, ', 'This is a sweet-tasting strain and has a piney, floral smell.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2117, 'White Urkle', 'relaxed', 'Express themselves, deep violet hues that show the influence of its Purple Urkle mother.This strain is known for having a short stature and a fruity bouquet of flavors that mix, an earthy, pine aroma.', 'Purple Urkle, The White', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2118, 'Chem Scout', 'euphoric, relaxed', '', 'Chemdawg 91, Girl Scout Cookies', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2119, 'Nova', 'pain relief, relaxed, focused', 'The aroma is subtle, but sweet woody notes, spicy pepper undertones can be detected on the exhale.', 'CoJack the Ripper, Harlequin', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2120, 'Purple Champagne', 'uplifted', 'The main appeal of Purple Champagne is her vibrant bud coloration.', 'Granddaddy Purple, Pink Champagne', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2121, 'Narnia', 'energetic, creativity, uplifted, euphoric', 'Has massive trichome production and a terpene profile rich, citrus tang, spice, and a touch of sweetness', 'Jack Herer, Trainwreck', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2122, 'Dank Sinatra', 'happy, euphoric, relaxed', 'Has pungent, earthy flavors intermixed, subtle notes of citrus and diesel', 'LA Affie, Hash Plant', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2123, 'Django', 'energetic, ', '', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2124, 'Timewreck', 'pain relief, euphoric, creativity , energetic', 'Has sour, fruity flavors of Vortex enliven Timewreck’s subtle earthy aromas, pungent notes of lemon, lime, sandalwood, and pear. It typically produces moderate indoor yields following its 60 to 70 day flowering time', 'Vortex, Blood Wreck', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2125, 'Stephen Hawking Kush ', 'relaxed, pain relief', 'Vivid cherry and berry flavors that mix, a minty note', 'Harle-Tsu, Sin City Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2126, 'Tangelo', 'focused , uplifted', 'Has notes of tropical fruit and an unmistakable tangerine/orange juice aroma, Tangelo offers bright, pleasurable aromas and flavors worth sharing', 'Tangerine Sunrise, Gorkle', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2127, 'Buddha Tahoe', 'euphoric', 'Maintains a zesty lemon and earthy hash aroma typical of kush varieties, and is potent and long-lasting', 'Tahoe OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2128, 'Magnum', 'happy, euphoric, uplifted', 'The plant will explode, growth and branches and will provide high yields of spicy-smelling flowers', 'Auto-flowering hybrid', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2129, 'CBD Mango Haze', 'uplifted, pain relief ', 'Has a pleasant and aromatic blend that combines the tropical flavors of Mango Haze, the added benefits from high levels of cannabidiol. The buds of CBD Mango Haze express themselves, spicy and sweet notes reminiscent of mango, pineapple, and black pepper', 'High-CBD strain', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2130, 'Grapefruit Haze', 'uplifted', 'A beautiful blend of fruity and spicy flavours.', 'Grapefruit, Super Silver Haze', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2131, 'Super Lemon OG', 'relaxed, uplifted, energetic', 'Its taste and aroma carry a strong citrus note that is entangled, tones of spicy pepper and pungent diesel fuel. Its complex terpene profile and heavy resin production make Super Lemon OG an excellent choice for producing top-notch concentrates', 'Super Lemon Haze, Captain Krypt OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2132, 'Rockbud', 'energetic , relaxed', 'Leaves darken to a deep red as Rockbud flowers mature, and while yields tend to be on the lighter side.Connoisseurs will appreciate the quality these fast-bloomers have to offer.', 'Super Skunk, Afghani, Big Skunk Korean, Afghan Hawaiian', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2133, 'Snow Bud', 'uplifted, euphoric', 'With sweet cinnamon and sour skunk flavors.These mold and mildew resistant plants do well indoors and flower in 7 to 8 weeks. ', 'Afghani, ? South African strain', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2134, 'Cosmic Collision', 'uplifted, euphoric', 'The exhale releases a tropical medley of pineapple and kiwi that hints at the Pineapple in this strain’s lineage. Boasts both flavor and potency. ', 'Cosmic Charlie, Piña Collision  ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2135, 'A-Dub', 'euphoric, happy, creative', 'Has a solid reputation for its potency.', 'Sour Double, Alien Dawg', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2136, 'Harry Potter', 'pain relief', '', 'Blissful Wizard, Fire Alien Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2137, 'Buddha\'s Sister', 'creative, relaxed', '', 'Reclining Buddha, Afghani,  Hawaiian variets', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2138, 'Cuvee', 'relaxed', 'Has a taste of sweet cherries and chocolate.Rich flavor paired, copious amounts of resin make Cuvee a great strain for making cannabis concentrates.', 'Space Queen, Pinot Noir', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2139, 'Rug Burn OG', 'uplifted', 'Has created a pungent flavor mix of sour citrus and hints of diesel that sting the senses.', 'Ghost OG, Rare Dankness #1', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2140, 'Sweet Skunk', 'uplifted', 'The aroma is a mixture of pine, spice, citrus, and a chemically aftertaste that speaks to the strain’s name.', 'Northern Lights, Skunk', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2141, 'Snow Leopard', 'relaxed, euphoric', 'The majority of observed phenotypes are indica-dominant plants that produce numerous sticky colas and a rich tropical smell, woody undertones.', 'Tigermelon, Snow Lotus', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2142, 'Blue Alien', 'euphoric, sleepy', 'Takes on a sweet berry aroma.', 'Blueberry, Alien Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2143, 'Crown OG', 'euphoric, pain relief', 'Has a sweet pine aroma and potent.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2144, 'Purple Princess', 'relaxed', 'It is ruity and skunky.Characterized by dense, small, purple buds and typically flowers around 5-6 weeks.', 'Cinderella 99, Ice Princess', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2145, 'Tree of Life', 'euphoric, uplifted, creative', 'An early flowerer, Tree of Life will finish its maturation cycle by the third week of September outdoors. Produces fully ripened buds, a rich palate of creamy orange zest and lemon balm. ', 'Trainwreck, Mendocino Purps', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2146, 'Thai Lights', 'energetic, happy', '', 'Thai sativas, Northern Lights', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2147, 'Whiteout', 'uplifted, euphoric, focused', 'These frosty light green buds shimmer in light and will hit you, a pungenst zesty lemon aroma', 'Super Silver Haze, The White', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2148, 'Moonwalker Kush', 'uplifted, relaxed', 'This odoriferous combination speaks volumes through its scent, which is thick, soured earth and a hint of pepper on the finish.', 'Triple OG, Tahoe Alien', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2149, 'CHR Super OG', 'relaxed', 'Carries a pungent sour pine aroma that has come to characterize OG strains', 'Skywalker OG, Tahoe OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2150, 'Mad Dawg', 'euphoric, uplifted, energetic', '', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2151, 'Berry Bomb', 'relaxed', 'Berry Bomb sometimes expresses itself in cool hues of blue in lower temperatures, and it grows tall in outdoor gardens. Thrives in screen of green (SCROG) setups, and indoor plants finish flowering in 8 weeks.Has Sweet blueberry and earthy pine flavors.', 'Blueberry, Bomb #1 ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2152, 'Gigabud', 'relaxed, happy , sleepy', 'Has an earthy aroma of fresh apricots.', 'Big Bud, Northern Lights', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2153, 'Katsu Bubba Kush', 'relaxed, euphoric, hungry', 'Representing its genetic namesake in appearance and bud structure, Katsu Bubba’s nugs are dense and resinous. Has a deep, floral terpene profile.', 'Bubba Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2154, 'Deep Purple', 'relaxed', 'Brings out an incredible grape taste. ', 'Purple Urkle, Querkle ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2155, 'Conspiracy Kush', 'relaxed', 'The dense, trichome-frosted flowers produce a tangy citrus aroma and a peppery aftertaste.', 'Obama Kush, Space Queen', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2156, 'White Cheese', 'euphoric, relaxed', 'The short flowering cycle, compact nature, and large yields make White Cheese especially attractive to growers.It carries the skunky cheese aroma, an earthy note.', 'Super Skunk, Afghani', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2157, 'Dream Star', 'pain relief, relaxed', 'Its aroma is sweet and fruity, sour accents that hint at Dream Star’s Chemdawg lineage. Cultivators of this strain should wait nine weeks for indoor plants to flower.', 'Blue Dream, Stardawg', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2158, 'Hawaiian Diesel', 'energetic, talkative', 'Flowers will have a fresh citrus and pine aroma and a sweet tropical fruit flavor.Hawaiian Diesel plants flower between 8 and 10 weeks and grow best indoors. ', 'Hawaiin, Sour Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2159, 'Kona Gold', 'focused, euphoric', 'A  tropical medley of pineapple and citrus flavors are cut by a sharp sour aroma that could almost be compared to diesel fuel. ', 'Hawaiin, Sour Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2160, 'Heaven Scent', 'relaxed, happy', 'Its buds express themselves in hues that range from deep blue to dark purple.', 'God’s Gift, Green Crack', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2161, 'Blue Zombie', 'uplifted, pain relief', 'With notes of fresh ground coffee, fuel, and skunky grape, this strain packs a surprising diverse array of terpenes.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2162, 'Longbottom Leaf', 'uplifted, relaxed', 'The crystalline buds exhibit notes of citrus and celery, while the flavor is tart and musky.  ', 'Jack’s Cleaner, SFV OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2163, 'Destroyer', 'uplifted, ', 'Emits a delicate fruity aroma intermixed, notes of lavender and floral sweetness. This high-THC strain develops beautiful frosted buds.', 'Meao Thai, Mexican-Colombian ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2164, 'Critical Cure', 'pain relief, relaxed', 'Has a sweet, earthy flavor.', 'Critical Kush, Ruderalis', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2165, 'Dizzy OG', 'uplifted ', '', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2166, 'Panda OG', 'uplifted ', 'Panda OG smells very spicy yet earthy, and tastes sour on the tongue, slight undertones of berry.', 'OG Chem, Berry Sour Cream', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2167, 'Brand X', 'euphoric, relaxed', 'Its buds grow into tightly compacted cones that exude thick layers of frosty resin in a show of Brand X’s high THC content.Earthy pine aromas mingle, notes of hashy mint.', 'It is a decades-old strain from Michigan', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2168, 'Caramelo', 'uplifted, energetic', 'Inherits that signature floral aroma, accents of sweet and spicy fruit.Famous by its complex terpene profile', 'Lavender ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2169, 'Mango Dream', 'pain relief, uplifted, energetic', 'Flowers will be frosty, trichomes and have rich mango-hued hairs.', 'Mango, Blue Dream', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2170, 'Purple Jack', 'energetic, relaxed', 'Enveloped by dark purple leaves, Purple Jack’s buds are typically a dark green color, a heavy sugaring of kief.', 'Jack Herer, Purple Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2171, 'Nevil\'s Wreck', 'uplifted, hungry', 'This clone-only strain has an indoor flowering time that falls between 65 and 115 days.Grows best, hydroponics, but novice growers might need more experience before undertaking this challenging sativa.', 'Arcata Trainwreck, Neville’s Haze', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2172, 'Asian Fantasy', 'creative, focued', 'It is  a beauty, large, curled buds that have a covering of brick red hairs. The flowers emit a sweet and sour fragrance while the taste has a healthy dose of spice.', '?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2173, 'Ortega', 'uplifted, sleepy', ' Oretga has offered growers heavy yields of resinous, sweet-smelling buds that finish flowering in just 6 to 8 weeks.', 'Northern Lights', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2174, 'Lem Chem', 'uplifted', 'The buds have deep green foliage and tan/rusty pistils.Offers both sweet and sour, distinct fuel/chemical nuances in flavor.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2175, 'Sour Bubba', 'relaxed, energetic', 'Show unique flavors and effects that speak to their long, potent lineages.', 'Diesel, Bubba Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2176, 'Blue Boy', 'focused', 'Its plants are bushy and grow large, and the flowers tend to be large and on the looser, leafier side. Blue Boy is a potent strain, THC levels that often test over 20%.', 'Blue Dream, Northern Lights #5', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2177, 'Silver Pearl', 'uplifted', 'Silver Pearl plants are best grown indoors and flower at 7 weeks or even sooner, making them overachievers for sativas. The short plants will have buds, few leaves, bright orange hairs, and a heavy trichome coloring that make these flowers sticky, resin pearls. Smells like dark chocolate and has a sweet honey taste.', 'Early Pearl, Skunk, Northern Lights #5', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2178, 'Space Cream', 'uplifted, focused, pain relief', 'Expect an odor of citrus blossom, pine, and hops which blend into a creamy sweetness on the exhale.  ', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46');
INSERT INTO `strains` (`id`, `name`, `effect`, `description`, `parent`, `created_at`, `updated_at`) VALUES
(2179, 'Sharksbreath', 'focused', 'Its subtle aroma doesn’t smell of the ocean, but more like sweet and sour candy. Sharksbreath plants flower by 9 weeks and will stay short. Its heavy colas make this strain a great choice for Sea of Green-style growing, where it produces very high yields.', 'Great White Shark, Lamb’s Bread', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2180, 'Enemy of the State', 'pain relief, relaxed', '', '?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2181, 'Jamaican Pearl', 'uplifted', 'Has a taste of the Caribbean to cannabis consumers.Jamaica is home to sativas of astounding quality and potency, selectively bred for countless generations.', 'Marley\'s Collie, Early Pearl', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2182, 'Lemon Walker OG', 'uplifted', 'Has bright notes of citrus and a pungent and slightly fruity undertone. ', 'Lemon Skunk, Skywalker OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2183, 'CBD Kush', 'relaxed, euphoric, pain relief', '', 'Kandy Kush, ?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2184, 'Alien Sour Apple', 'euphoric, energetic', 'Alien Sour Apple tastes sweet and sour, like a Granny Smith apple. ', 'Alien Dawg, Sour Apple', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2185, 'Red Haze', 'uplifted, relaxed', 'With a flowering time of 12 to 14 weeks, this strain may be difficult to find in dispensaries. Red Haze is a slow grower.', 'Neville’s Haze, Colombian Red', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2186, 'Cookies and Dream', 'euphoric, energetic', '', 'Blue Dream, Girl Scout Cookies', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2187, 'Sugar Punch', 'euphoric', 'These strong, sweet buds offer a mixed aroma of berry and lemon.', 'Super Silver Haze, The One', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2188, 'Lamborghini', 'energetic, relaxed', 'This strain inherits a complex flavor profile that begins, a sharp piney inhale and ends, a sour lime exhale. Its large buds bloom, a sticky coat of crystal trichomes in a show of Lambo’s potency.', 'Lamb’s Bread, Holy Grail Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2189, 'Hog\'s Breath', 'tingly, uplifted', 'Its dense buds are light and dark green, orange hairs and a healthy amount of crystals. The taste has been described as cheddar.', 'Hindu Kush, Afghani', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2190, 'Cherry Pie Kush', 'uplifted, relaxed', 'Expect earthy and tart notes that linger in the air and coat the palate in a pungent, velvety vapor.', 'Durban Poison, Granddaddy Purple, SFV OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2191, 'Godberry', 'pain relief', 'This fruity strain is a favorite among growers because it easily produces high yields both indoors and out.', 'God, Blueberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2192, 'Alice in Wonderland', 'euphoric, creative', '', 'Willy’s Wonder.', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2193, 'Cadillac Purple', 'relaxed, pain relief, sleepy', 'Buds are deep greens, plenty of purple, making for some very pretty flowers. The aroma, too, is pleasant – mild and like a sweet perfume.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2194, 'Critical Cheese', 'uplifted, euphoric, talkative', 'This outstanding crossbreed is hardy, fast-flowering, and finishes, large, dense buds that are dripping, resinous oils. Critical Cheese has a pungent aroma that combines lemons, pine, and the sharp cheesy notes that have become the signature of Cheese varieties. ', 'Cheese, Critical Plus', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2195, 'Grape Inferno', 'relaxed, euphoric', 'Inherits a dense bud structure and a sweet grape aroma from which this strain gets its name. Has flavorful undertones of hash and berries.', 'Nepali OG, Querkle', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2196, 'Thor\'s Hammer', 'energetic, creative, uplifted', '', 'Vortex, Cinderella 99, Acapulco Gold', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2197, 'Moon Cookies', 'uplifted, relaxed', 'This intergalactic herb’s stinky-sweet terpene profile is a complex melange of dough, earth, and green forest.The buds are resinous rocks that are hard and dense. ', 'A twice deep GSC, GSC Hybrid', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2198, 'G.O.A.T.', 'pain relief', 'Features a flavor profile that is bursting, fragrant cherry aromas.', 'Animal Pie, ACDC', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2199, 'Blue Hash', 'relaxed', 'The aroma is a mixture of fresh berries, a pungent, earthy finish.', 'Blueberry, California Hash Plant', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2200, 'Aloha', 'uplifted, energetic, pain relief', 'Aloha’s flowers will be large and fluffy, plenty of room for white wispy hairs and sparkling crystals. The aroma of this strain is that of grass and citrus.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2201, 'LVPK', 'sleepy, uplifted', 'Has  a dark, herbal taste and skunky smell.', 'Purple Afghani, Hindu Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2202, 'Kraken', 'euphoric', 'Produces chunky, dense buds, a blanket of crystal resin and  big harvests.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2203, 'Redwood Kush', 'relaxed, tingly', 'Features a pine-like, herbal scent.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2204, 'LA Affie', 'pain relief, energetic, uplifted', 'The aroma is a subtle blend of earthy and sweet.', 'LA Confidential', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2205, 'Sunburn', 'uplifted', 'Offers a blend of sweet, pungent, and floral aromas.', 'Island Sweet Skunk, Rug Burn OG, Gupta Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2206, 'OG Trainwreck', 'uplifted, pain relief', 'Its chunky, conic buds characteristic of its OG genes are blanketed, frosty crystal trichomes, accenting the flower, a white--almost blue--hue.Preceded by a sour, skunky aroma and fruity flavor, spicy pepper undertones.', 'OG Kush, Trainwreck', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2207, 'Illuminati OG', 'relaxed, euphoric', 'The colas are a blend of beautiful green tones and its scent is fresh and piney. Illuminati’s denseness hits the tongue, a blast of pine and a touch of tar, just to be followed by a subtle floral sweetness. ', 'Club 33 OG ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2208, 'Aurora Borealis', 'relaxed', 'A vigorous plant, heavy resinous buds, this strain has the best attributes from both its parents.Grows into a medium size plant similar to Skunk#1, and has a sweet and fruity taste, a hashy sharpness.Very high yields and a fast maturation time make this cross an ideal cash-cropper both indoors and out.Features sweet, skunky flavors and earthy undertones.', 'Northern Lights #10, Skunk #1', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2209, 'Seattle Cough', 'uplifted, euphoric, creative', 'Carries a pungent mix of pine and citrus flavors. Has aroma of fresh grapefruit', 'Northern Lights #5, Haze #2', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2210, 'Juicy Jack', 'creative, uplifted, euphoric', 'This hybrid is balanced between its indica and sativa heritage which creates a flavorful mouthful of sweet berry notes that mingle, a spiced, earthy musk ', 'Juicy Fruit, Jack Herer', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2211, 'Sour Poison', 'uplifted, euphoric, relaxed, energetic', 'Has a sweet, earthy arom and pine, berry, and diesel flavors.', 'Sour Diesel, Durban Poison', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2212, 'Monkey Paw', 'relaxed, pain relief, hungry', 'Has buds that resemble the curled paws of primates, a pungent combination of sweet and fruity flavors. Its aroma is reminiscent of the thick musk of Skunk varieties, sharp notes of zesty citrus that cut the senses, an aftertaste of fresh fruits, like grape and blueberry', 'Acapulco Gold, Colombian Gold, Afghani', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2213, 'Super Sour Skunk', 'happy, uplifted, creative', 'Features a combination of sour citrus aromas shift to flavors of earthy Skunk.', 'Super Skunk, East Coast Sour Diesel male', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2214, 'Bluniverse', 'uplifted, euphoric, relaxed', 'Inherits a complex flavor profile of blueberry, cherry, and vanilla spice and may express one of three different phenotypes, one that takes after Blue Magoo, another taking after Ms. Universe, and a third that exhibits a balance of each parent’s characteristics.', 'Blue Magoo, Ms. Universe', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2215, 'Double Diesel', 'happy, uplifted, energetic', 'These plants are easy to grow and their lime green buds will give off a strong diesel-y odor, some grapefruit added in. The grapefruit notes overpower the taste, giving this strain a unique musky fruit flavor.', 'NYC Diesel, Sour Diesel. ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2216, 'MILF', 'euphoric, uplifted', '', 'White Widow, Trainwreck', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2217, 'Northern Wreck', 'euphoric', 'With its heavy yields and fast flowering cycle, Northern Wreck is a blessing to commercial growers looking to harvest a lot of product quickly.', 'Northern Lights, Trainwreck', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2218, 'Luca Brasi x Sour Diesel', 'pain relief, focused ', 'Has dense dark green buds which release aromas of lemon and diesel, skunky undertones.', 'Bred in Denver, Colorado by The Bank', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2219, 'Day Dream', 'focused, euphoric, hungry', 'Passes on a subtle pine aroma coupled, sweet lemon.Bay Dream’s heavy yields make this sativa a favorite among growers, who wait 9 to 10 weeks for it to flower indoors. Outdoor plants sown at the beginning of June will finish flowering near the end of October, heights that stretch as tall as 10 feet.', 'Blue Dream, Bay 11', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2220, 'Killer Grape', 'relaxed, euphoric', 'Lavender and purple hues tinge leaves and buds underneath a dusty coat of snow-white resin. Gets its name from the sour grape aroma its buds carry, which is accented by spicy, hashy undertones.', 'Killer Queen, Querkle', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2221, 'Corleone Kush', 'pain relief, sleepy , energetic', 'Has a sour citrus aroma, darker notes of incense, flowers in 8 weeks and produces dense flowers', 'Pre-98 Bubba Kush, SFV OG Kush ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2222, 'Old Toby', 'uplifted, euphoric', 'Has a terpene profile rich in limonene and pinene.', '?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2223, 'Sweet Diesel', 'uplifted, focused', 'Featuring a moderate fuel scent and earthy taste.Its aroma is much lighter than typical diesels.', 'Sour Diesel, OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2224, 'Super Blue Dream', 'focused, pain relief, energetic', 'Features a sour blueberry aroma.', 'Super Silver Haze, Blue Dream', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2225, 'Woody OG', 'sleepy, pain relief', 'Its heritage comes through in its aroma and features a distinct skunk-like scent and a piney flavor.', 'Master Kush, OG Kush, Hindu Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2226, 'Lucy', 'pain relief', 'This strain packs a ton of cannabinoids into a tiny package, rendering THC and CBD content above 10% each.', 'Luca Brasi, LA Confidential', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2227, 'Cherry Sherbet', 'uplifted, pain relief', 'These heavy-hitting buds will smoke sweet and tangyHas a  stinky sweet herb.', 'Sour Sherbet, Cherry Pie', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2228, 'Buddha’s Hand', 'focused', 'Has pungent aromas of citrus and wildflowers that burst from the dense, trichome-caked buds', 'Lemon Thai, Snow Lotus', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2229, 'Shangri-La', 'happy, relaxed, uplifted', 'Boasts a garden of different aromas from ripe grape and berry to tropical mango and citrus. ', 'Fudo Myo-o, 9 Pound Hammer ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2230, 'Sugar Plum Sunset', 'pain relief , relaxed', 'Has a generous trichome density and hues of purple foliage which give the strain an appetizing appearance', 'Pre-98 Bubba Kush, Katsu Bubba’s', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2231, 'Pez', 'relaxed, pain relief', 'Has sweet, frosty buds.', 'Afghani, Pakistani', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2232, 'Kiwiskunk', 'happy', 'Gives off a very potent skunky smell, sweet and citrus flavor.', 'New Zealand Skunk,t NYC Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2233, 'Rrian Berry Cough', 'relaxed', 'Inherits a loud strawberry and cherry aroma, traces of candied fruit.Knots of lavender and green calyxes burst from the tall plants, crowned, deep purple-tipped fan leaves. ', 'Crosses Strawberry Cough, Space Queen', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2234, 'False Teeth', 'relaxed', 'This indica-dominant hybrid is a prodigious resin producer and emits fruity, earthy sweetness. Although False Teeth yields an average crop, the potent, sticky buds more than make up for its lack of weight.', 'Platinum Girl Scout Cookies, Granddaddy Purple', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2235, 'Hemlock', 'relaxed, pain relief ', 'Features a short, stocky, easy-to-grow structure, good yields and high resin production.', 'Durban Poison, LA Confidential', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2236, 'Alpha OG', 'pain relief', 'Its thick layer of crystal trichomes helps to explain why this pungent, pine-scented strain consistently tests over 20% THC when grown optimally.', 'OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2237, 'Heavy Duty Fruity', 'relaxed', 'Gives off a sweet smell, and has big buds and high yields. Plants usually flower between 8 and 9 weeks.Has high yields, yummy flavor, and potency.', 'Killing Garberville, Seattle Big Bud, Mendocino Hash Plant', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2238, 'Boss Hogg', 'relaxed, uplifted, energetic, creative, happy , euphoric', 'Carries a strong earthy, hashy aroma that mixes, the funky sour diesel notes of its Chemdawg parent', 'Chemdawg 4', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2239, 'BOG Bubble', 'uplifted', 'Features a frosty, sticky buds offer a sweet, bubblegum aroma.Grows are successful indoor or outdoor, flowering between 45 and 50 days.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2240, 'Sumo Grande', 'focused', 'This gorgeous plant grows big and strong and creates buds.', 'Sensi Star, Sour Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2241, 'Freezeland', 'pain relief, sleepy , relaxed', 'Has lavender-tipped buds have a fruity citrus flavor, pine undertones if grown outdoors, gardens will grow impressive harvests after an 8 week flowering period', 'Pluton, Friesland', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2242, 'Purple Arrow', 'pain relief, uplifted, euphoric', 'Fragrant, herbal, and a little sweet, this strain tastes almost as good as it feels. The uniqueness of this strain is complemented by its earthy aroma.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2243, 'Medicine Man', 'pain relief', 'These plants require a little know-how to grow, but when done right they should produce large flowers in 8 to 10 weeks. Medicine Man is a nice strain to look at, a range of greens and sometimes purples and yellow and red hairs throughout its dense buds.', 'Brazilian, Indian, Afghani ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2244, 'Sapphire Star', 'uplifted, creative', 'Has bluish accents and starry coat of white crystal trichomes and berry overtones tinged, a sour skunk aroma build a complex flavor profile for the small dense buds. Sapphire Star, a flowering time of 7 to 8 weeks, grows to a towering 15 feet outdoors and up to 6 feet in indoor gardens', 'Blue Hawaiian, God Bud', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2245, 'White Kush', 'sleepy, relaxed', 'Features a strong and incredibly pungent aroma.Typically flowering between 8-10 weeks, this strain is good for both indoor and outdoor cultivation. ', 'Afghan Kush, White Widow', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2246, 'Alpine OG', 'relaxed, pain relief', 'Has Zesty lemon flavors.', 'Tahoe OG, Sensi Star ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2247, 'Violet Delight', 'focused, giggly, energetic, ', 'Has a loud burst of floral flavor that can only be compared to the aroma of a violet.', 'Green Crack, Blueberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2248, 'Lemon Bubble', 'euphoric, happy', 'Its citrus flavors are highlighted by sweet lemons and finish, an earthy Haze undertone.', 'Super Lemon Haze, Silver Bubble', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2249, 'Dank Schrader', 'relaxed', '', 'Rockstar Kush, Bubba Kush ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2250, 'East Coast Alien', 'uplifted', 'Buds are tangled in pistils and the aroma of gasoline, and the exhale is forest floor and mint', 'Alien OG, ECSD', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2251, 'Cinderella\'s Dream', 'focused, energetic', 'Its flavor is a skunky mix of lemon and citrus flavors, subtle notes of sweet berry. ', 'Cinex, Blue Dream', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2252, 'Flowerbomb Kush', 'uplifted, creative, hungry', 'Long, auburn hairs are braided into its dark leaves, dense buds covered in a sticky blanket of resin. Earthy notes mingled, pine, citrus, and spice build a complex aroma.', 'Green Crack, OG Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2253, 'UW Purple', 'pain relief', 'These dense, sticky buds show their university pride, purple coloring and are at the top of the class when it comes to potency.A mix of tropical fruit and a little spice, the aroma also earns high marks.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2254, 'Hashberry', 'energetic ', 'Has a classic indica flavor, hashish undertones. Its thick stems are necessary to support the heavy buds, providing a classic aroma and flavor of mint or pepper', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2255, 'Green Candy', 'relaxed, uplifted', '', 'Candy Kush, Green Crack', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2256, 'Blues', 'uplifted, focused', 'Plants are strong and resilient, growing large buds that give off a sweet berry aroma', 'Skunk #1', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2257, 'Afghan Cow', 'uplifted, focused', 'Having a high yield both indoors and out, this is an impressive plant, even more impressive effects.This sweet-smelling and resinous sativa breed from Dr. Krippling.', 'Ash, Kaya 47, Kali Mist', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2258, 'Dutchberry', 'happy, giggly, ', 'This hybrid is loaded, citrus and berry flavors that taste as good as it smells.', 'Dutch Treat, DJ Short’s Blueberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2259, 'Triple Diesel', 'focused, uplifted', '', 'Sour Diesel, Strawberry Diesel, NYC Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2260, 'Royal Haze', 'energetic, uplifted', 'Outdoor growers will appreciate her flexibility and resilience even when the temperature drops, although her 10-11 week flowering cycle demands a bit of patience.Inherits a spicy citrus flavor.', 'Amnesia Haze, Skunk, ?', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2261, 'Lions Gate', 'uplifted, focused, creative', 'It is  a mellow indica strain, a skunky aroma.For growers cultivating this indica, indoor gardens flower in about 8 weeks.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2262, 'Sapphire Scout', 'euphoric', 'These sweet, pungent buds create a smooth smoke.', 'Girl Scout Cooki, True OG ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2263, 'Early Girl', 'relaxed, ', 'It\'s compact, resilient, and has a particularly short flowering time of 7 to 8 weeks. Early Girl grows especially well outdoors, but won’t put up a fuss if she’s stuck inside.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2264, 'Banana Diesel', 'energetic, focused', 'These thick, pale green buds reek a sweet, fruity aroma and preface the tangy taste to come. ', 'Banana Kush, Super Sour Diesel', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2265, 'Hercules', 'focused', '', 'Hawaiian Urkle, Gupta Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2266, 'Satellite OG', 'relaxed, happy, euphoric, energetic, creative', 'A pungent skunky aroma bursts from the kief-caked buds, but the smell translates on the exhale to sweet candy and invigorating pine.', 'OG Kush, SFV OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2267, 'Charlie Sheen ', 'relaxed, uplifted, sleepy, pain relief', 'Has lemon-scented buds taste likewise, a distinct undercurrent of kush', 'Green Crack, OG Kush, Blue Dream', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2268, 'Blue Ox', 'relaxed', 'Has  a sweet, well-rounded strain, aromas of blueberry, coffee, chocolate, and earthy spice. The dense, resinous buds express blue and purple foliage that looks nearly as good as it smells.', 'Blueberry, The OX', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2269, 'Special K', 'uplifted', 'The plant is tall, substantial girth, despite its lanky indica influence, elongated buds.Indoor or outdoor grows can expect to flower at around 10 weeks.', 'Western Winds, Slyder', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2270, 'Soul Shine', 'uplifted, euphoric, relaxed, happy', 'Features a fruity and musky aroma', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2271, 'Jawa Pie', 'pain relief', 'This indica achieves its unique bouquet of shortbread, lime, and menthol.', 'Key Lime Pie, Alien Rift', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2272, 'Skunk Dawg', 'hungry, focused', 'Elevates the mood, a sweet and sour aroma.', 'Super Skunk, Chemdawg', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2273, 'Professor Chaos', 'energetic, relaxed', 'Has as a sour, spicy aroma.Its buds form knobby, finger-like calyxes covered in a snow-like layer of crystal trichomes.', 'Mad Scientist, Jack the Ripper', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2274, 'Fat Nelson', 'uplifted, happy, creative', '', 'Sour Willie, Gupta Kush', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2275, 'The Truth', 'pain relief', 'Has  an earthy, spicy aroma.The Truth is a colorful high-yielding strain that flowers in 63 days indoors or in early October for outdoor gardens.', 'Crosses Triangle Kush, a SFV OG, a backcrossed Chemdawg hybrid', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2276, 'Eran Almog', 'sleepy, pain relief', 'Named after a Tikun Olam patient and has a THC content that reaches up to 28 percent.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2277, 'Armageddon', 'uplifted, relaxed', 'This strain’s plants flower quickly at 8 weeks and produce high yields of multi-colored buds that smell strongly of woodsy citrus.The citrus notes carry over into the taste, which is diverse and includes cheese and some fruitiness as well. Armageddon tends to have medium-high to high THC levels.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2278, 'Kalashnikova', 'relaxed, creative, talkative', 'Its aroma is a mixture of lemon, mango, and sweet honey, notes of hash and earthy musk.', 'AK-47, White Widow', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2279, 'Madagascar', 'sleepy ', 'Has  a clean floral smell.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2280, 'Atomic Northern Lights', 'uplifted', 'Has very fast flowering times (approximately 8 weeks), produces short bushy plants, and its scent has been described as pungent, sweet notes.', 'Afghani indica, Thai Haze', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2281, 'Jane Doe', 'euphoric', 'This Jane is anything but plain, a crisp lemon aroma and big, trichome-covered flowers that make her a beauty.', 'Her genetics most likely include some OG', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2282, 'Albert Walker', 'euphoric, relaxed, pain relief', 'Has sour lemon and skunk smells and is challenging for some growers, as the plant tends to require frequent attention and maintenance. However, the high yields following its 8-week flowering cycle will be a satisfactory reward.', '', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2283, 'Durban Berry', 'uplifted, creative', 'A pungent lemon and berry aroma erupts from the fluffly buds while tangy citrus flavors awaken on the exhale.', 'Durban Poison, Rocky Mountain Blueberry', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2284, 'LA Ultra', 'creative', 'This indica is spicy and fruity in fragrance, and its buds grow, chunky, finger-like calyxes that are utterly drenched in resin.', 'LA Confidential, MK Ultra cross', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2285, 'Cindy White', 'uplifted', '', 'Cinderella 88, Princess ', '2021-03-05 13:36:02', '2021-03-05 02:23:46'),
(2286, 'Stuffed French Toast', '<span class=\"whitespace-pre-line\" itemprop=\"description\"> happy euphoric high with a calm and relaxed effect</span>', '<span class=\"whitespace-pre-line\" itemprop=\"description\">This strain carries a pungent cinnamon, orange, pine and herbal aroma and flavor</span>', '<span class=\"whitespace-pre-line\" itemprop=\"description\">Paris OG, Face Off OG</span>', '2021-03-05 16:02:56', '2021-03-05 20:30:04');
INSERT INTO `strains` (`id`, `name`, `effect`, `description`, `parent`, `created_at`, `updated_at`) VALUES
(2287, 'Apricot Gelato', 'euphoric, relaxed', '<p class=\"MsoNormal\">It is extremely fruity with flavors of Apricot and smooth as a cold scoop of Gelato</p>\r\n\r\n<!--[if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:EnableOpenTypeKerning/>\r\n   <w:DontFlipMirrorIndents/>\r\n   <w:OverrideTableStyleHps/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val=\"Cambria Math\"/>\r\n   <m:brkBin m:val=\"before\"/>\r\n   <m:brkBinSub m:val=\"--\"/>\r\n   <m:smallFrac m:val=\"off\"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val=\"0\"/>\r\n   <m:rMargin m:val=\"0\"/>\r\n   <m:defJc m:val=\"centerGroup\"/>\r\n   <m:wrapIndent m:val=\"1440\"/>\r\n   <m:intLim m:val=\"subSup\"/>\r\n   <m:naryLim m:val=\"undOvr\"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"false\"\r\n  DefSemiHidden=\"false\" DefQFormat=\"false\" DefPriority=\"99\"\r\n  LatentStyleCount=\"376\">\r\n  <w:LsdException Locked=\"false\" Priority=\"0\" QFormat=\"true\" Name=\"Normal\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 9\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 9\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 9\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footnote text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"header\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footer\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index heading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"35\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"caption\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"table of figures\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"envelope address\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"envelope return\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footnote reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"line number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"page number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"endnote reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"endnote text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"table of authorities\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"macro\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"toa heading\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"10\" QFormat=\"true\" Name=\"Title\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Closing\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Signature\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"Default Paragraph Font\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Message Header\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"11\" QFormat=\"true\" Name=\"Subtitle\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Salutation\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Date\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text First Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text First Indent 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Note Heading\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Block Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Hyperlink\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"FollowedHyperlink\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"22\" QFormat=\"true\" Name=\"Strong\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"20\" QFormat=\"true\" Name=\"Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Document Map\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Plain Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"E-mail Signature\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Top of Form\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Bottom of Form\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal (Web)\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Acronym\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Address\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Cite\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Code\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Definition\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Keyboard\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Preformatted\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Sample\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Typewriter\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Variable\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal Table\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation subject\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"No List\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Contemporary\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Elegant\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Professional\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Subtle 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Subtle 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Balloon Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"Table Grid\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Theme\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Placeholder Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" QFormat=\"true\" Name=\"No Spacing\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Revision\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"34\" QFormat=\"true\"\r\n   Name=\"List Paragraph\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"29\" QFormat=\"true\" Name=\"Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"30\" QFormat=\"true\"\r\n   Name=\"Intense Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"19\" QFormat=\"true\"\r\n   Name=\"Subtle Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"21\" QFormat=\"true\"\r\n   Name=\"Intense Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"31\" QFormat=\"true\"\r\n   Name=\"Subtle Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"32\" QFormat=\"true\"\r\n   Name=\"Intense Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"33\" QFormat=\"true\" Name=\"Book Title\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"37\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"Bibliography\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"TOC Heading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"41\" Name=\"Plain Table 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"42\" Name=\"Plain Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"43\" Name=\"Plain Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"44\" Name=\"Plain Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"45\" Name=\"Plain Table 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"40\" Name=\"Grid Table Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"Grid Table 1 Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"Grid Table 6 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"Grid Table 7 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"List Table 1 Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"List Table 6 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"List Table 7 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Mention\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Smart Hyperlink\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Hashtag\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Unresolved Mention\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Smart Link\"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:\"Table Normal\";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n	mso-para-margin-top:0in;\r\n	mso-para-margin-right:0in;\r\n	mso-para-margin-bottom:8.0pt;\r\n	mso-para-margin-left:0in;\r\n	line-height:107%;\r\n	mso-pagination:widow-orphan;\r\n	font-size:11.0pt;\r\n	font-family:\"Calibri\",sans-serif;\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:\"Times New Roman\";\r\n	mso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]-->', 'Gelato and Legend Orange Apricot', '2021-03-05 13:36:02', '2021-03-05 20:30:17');
INSERT INTO `strains` (`id`, `name`, `effect`, `description`, `parent`, `created_at`, `updated_at`) VALUES
(2288, 'Apricot Gelato', 'euphoric, relaxed', '<p class=\"MsoNormal\">It is extremely fruity with flavors of Apricot and smooth as a cold scoop of Gelato</p>\r\n\r\n<!--[if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:EnableOpenTypeKerning/>\r\n   <w:DontFlipMirrorIndents/>\r\n   <w:OverrideTableStyleHps/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val=\"Cambria Math\"/>\r\n   <m:brkBin m:val=\"before\"/>\r\n   <m:brkBinSub m:val=\"--\"/>\r\n   <m:smallFrac m:val=\"off\"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val=\"0\"/>\r\n   <m:rMargin m:val=\"0\"/>\r\n   <m:defJc m:val=\"centerGroup\"/>\r\n   <m:wrapIndent m:val=\"1440\"/>\r\n   <m:intLim m:val=\"subSup\"/>\r\n   <m:naryLim m:val=\"undOvr\"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"false\"\r\n  DefSemiHidden=\"false\" DefQFormat=\"false\" DefPriority=\"99\"\r\n  LatentStyleCount=\"376\">\r\n  <w:LsdException Locked=\"false\" Priority=\"0\" QFormat=\"true\" Name=\"Normal\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 9\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 9\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 9\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footnote text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"header\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footer\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index heading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"35\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"caption\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"table of figures\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"envelope address\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"envelope return\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footnote reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"line number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"page number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"endnote reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"endnote text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"table of authorities\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"macro\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"toa heading\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"10\" QFormat=\"true\" Name=\"Title\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Closing\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Signature\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"Default Paragraph Font\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Message Header\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"11\" QFormat=\"true\" Name=\"Subtitle\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Salutation\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Date\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text First Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text First Indent 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Note Heading\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Block Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Hyperlink\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"FollowedHyperlink\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"22\" QFormat=\"true\" Name=\"Strong\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"20\" QFormat=\"true\" Name=\"Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Document Map\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Plain Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"E-mail Signature\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Top of Form\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Bottom of Form\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal (Web)\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Acronym\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Address\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Cite\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Code\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Definition\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Keyboard\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Preformatted\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Sample\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Typewriter\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Variable\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal Table\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation subject\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"No List\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Contemporary\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Elegant\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Professional\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Subtle 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Subtle 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Balloon Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"Table Grid\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Theme\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Placeholder Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" QFormat=\"true\" Name=\"No Spacing\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Revision\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"34\" QFormat=\"true\"\r\n   Name=\"List Paragraph\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"29\" QFormat=\"true\" Name=\"Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"30\" QFormat=\"true\"\r\n   Name=\"Intense Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"19\" QFormat=\"true\"\r\n   Name=\"Subtle Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"21\" QFormat=\"true\"\r\n   Name=\"Intense Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"31\" QFormat=\"true\"\r\n   Name=\"Subtle Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"32\" QFormat=\"true\"\r\n   Name=\"Intense Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"33\" QFormat=\"true\" Name=\"Book Title\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"37\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"Bibliography\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"TOC Heading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"41\" Name=\"Plain Table 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"42\" Name=\"Plain Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"43\" Name=\"Plain Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"44\" Name=\"Plain Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"45\" Name=\"Plain Table 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"40\" Name=\"Grid Table Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"Grid Table 1 Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"Grid Table 6 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"Grid Table 7 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"List Table 1 Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"List Table 6 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"List Table 7 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Mention\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Smart Hyperlink\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Hashtag\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Unresolved Mention\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Smart Link\"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:\"Table Normal\";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n	mso-para-margin-top:0in;\r\n	mso-para-margin-right:0in;\r\n	mso-para-margin-bottom:8.0pt;\r\n	mso-para-margin-left:0in;\r\n	line-height:107%;\r\n	mso-pagination:widow-orphan;\r\n	font-size:11.0pt;\r\n	font-family:\"Calibri\",sans-serif;\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:\"Times New Roman\";\r\n	mso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]-->', 'Gelato and Legend Orange Apricot', '2021-03-05 13:36:02', '2021-03-05 20:31:30'),
(2289, 'King Louis XIII', 'relaxed, pain relief, happy', 'A smell that’s meant to be enjoyed.\r\nDense nugs have an overwhelmingly piney smell with an earthy musk\r\naroma', 'OG Kush, LA Confidential', '2021-03-05 16:06:39', '2021-03-05 20:32:45');
INSERT INTO `strains` (`id`, `name`, `effect`, `description`, `parent`, `created_at`, `updated_at`) VALUES
(2290, 'Apricot Gelato', 'euphoric, relaxed', '<p class=\"MsoNormal\">It is extremely fruity with flavors of Apricot and smooth as a cold scoop of Gelato</p>\r\n\r\n<!--[if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:EnableOpenTypeKerning/>\r\n   <w:DontFlipMirrorIndents/>\r\n   <w:OverrideTableStyleHps/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val=\"Cambria Math\"/>\r\n   <m:brkBin m:val=\"before\"/>\r\n   <m:brkBinSub m:val=\"--\"/>\r\n   <m:smallFrac m:val=\"off\"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val=\"0\"/>\r\n   <m:rMargin m:val=\"0\"/>\r\n   <m:defJc m:val=\"centerGroup\"/>\r\n   <m:wrapIndent m:val=\"1440\"/>\r\n   <m:intLim m:val=\"subSup\"/>\r\n   <m:naryLim m:val=\"undOvr\"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"false\"\r\n  DefSemiHidden=\"false\" DefQFormat=\"false\" DefPriority=\"99\"\r\n  LatentStyleCount=\"376\">\r\n  <w:LsdException Locked=\"false\" Priority=\"0\" QFormat=\"true\" Name=\"Normal\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 9\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 9\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 9\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footnote text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"header\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footer\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index heading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"35\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"caption\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"table of figures\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"envelope address\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"envelope return\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footnote reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"line number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"page number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"endnote reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"endnote text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"table of authorities\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"macro\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"toa heading\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"10\" QFormat=\"true\" Name=\"Title\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Closing\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Signature\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"Default Paragraph Font\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Message Header\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"11\" QFormat=\"true\" Name=\"Subtitle\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Salutation\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Date\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text First Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text First Indent 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Note Heading\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Block Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Hyperlink\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"FollowedHyperlink\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"22\" QFormat=\"true\" Name=\"Strong\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"20\" QFormat=\"true\" Name=\"Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Document Map\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Plain Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"E-mail Signature\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Top of Form\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Bottom of Form\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal (Web)\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Acronym\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Address\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Cite\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Code\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Definition\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Keyboard\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Preformatted\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Sample\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Typewriter\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Variable\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal Table\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation subject\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"No List\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Contemporary\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Elegant\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Professional\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Subtle 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Subtle 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Balloon Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"Table Grid\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Theme\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Placeholder Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" QFormat=\"true\" Name=\"No Spacing\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Revision\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"34\" QFormat=\"true\"\r\n   Name=\"List Paragraph\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"29\" QFormat=\"true\" Name=\"Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"30\" QFormat=\"true\"\r\n   Name=\"Intense Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"19\" QFormat=\"true\"\r\n   Name=\"Subtle Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"21\" QFormat=\"true\"\r\n   Name=\"Intense Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"31\" QFormat=\"true\"\r\n   Name=\"Subtle Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"32\" QFormat=\"true\"\r\n   Name=\"Intense Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"33\" QFormat=\"true\" Name=\"Book Title\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"37\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"Bibliography\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"TOC Heading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"41\" Name=\"Plain Table 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"42\" Name=\"Plain Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"43\" Name=\"Plain Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"44\" Name=\"Plain Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"45\" Name=\"Plain Table 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"40\" Name=\"Grid Table Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"Grid Table 1 Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"Grid Table 6 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"Grid Table 7 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"List Table 1 Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"List Table 6 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"List Table 7 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Mention\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Smart Hyperlink\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Hashtag\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Unresolved Mention\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Smart Link\"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:\"Table Normal\";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n	mso-para-margin-top:0in;\r\n	mso-para-margin-right:0in;\r\n	mso-para-margin-bottom:8.0pt;\r\n	mso-para-margin-left:0in;\r\n	line-height:107%;\r\n	mso-pagination:widow-orphan;\r\n	font-size:11.0pt;\r\n	font-family:\"Calibri\",sans-serif;\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:\"Times New Roman\";\r\n	mso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]-->', 'Gelato and Legend Orange Apricot', '2021-03-05 20:33:05', '2021-03-05 20:33:05'),
(2291, 'Lava Flow', 'relaxed<br>', 'This fire strain features an earthen sweet flavoring that will fill a room with pungent smoke in no time.', 'Melonade and Lava Cakes', '2021-03-05 20:34:03', '2021-03-05 20:34:03');
INSERT INTO `strains` (`id`, `name`, `effect`, `description`, `parent`, `created_at`, `updated_at`) VALUES
(2292, 'Apricot Gelato', 'euphoric, relaxed', '<p class=\"MsoNormal\">It is extremely fruity with flavors of Apricot and smooth as a cold scoop of Gelato</p>\r\n\r\n<!--[if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:EnableOpenTypeKerning/>\r\n   <w:DontFlipMirrorIndents/>\r\n   <w:OverrideTableStyleHps/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val=\"Cambria Math\"/>\r\n   <m:brkBin m:val=\"before\"/>\r\n   <m:brkBinSub m:val=\"--\"/>\r\n   <m:smallFrac m:val=\"off\"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val=\"0\"/>\r\n   <m:rMargin m:val=\"0\"/>\r\n   <m:defJc m:val=\"centerGroup\"/>\r\n   <m:wrapIndent m:val=\"1440\"/>\r\n   <m:intLim m:val=\"subSup\"/>\r\n   <m:naryLim m:val=\"undOvr\"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"false\"\r\n  DefSemiHidden=\"false\" DefQFormat=\"false\" DefPriority=\"99\"\r\n  LatentStyleCount=\"376\">\r\n  <w:LsdException Locked=\"false\" Priority=\"0\" QFormat=\"true\" Name=\"Normal\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 9\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 9\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 9\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footnote text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"header\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footer\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index heading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"35\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"caption\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"table of figures\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"envelope address\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"envelope return\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footnote reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"line number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"page number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"endnote reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"endnote text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"table of authorities\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"macro\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"toa heading\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"10\" QFormat=\"true\" Name=\"Title\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Closing\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Signature\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"Default Paragraph Font\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Message Header\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"11\" QFormat=\"true\" Name=\"Subtitle\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Salutation\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Date\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text First Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text First Indent 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Note Heading\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Block Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Hyperlink\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"FollowedHyperlink\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"22\" QFormat=\"true\" Name=\"Strong\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"20\" QFormat=\"true\" Name=\"Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Document Map\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Plain Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"E-mail Signature\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Top of Form\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Bottom of Form\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal (Web)\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Acronym\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Address\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Cite\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Code\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Definition\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Keyboard\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Preformatted\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Sample\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Typewriter\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Variable\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal Table\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation subject\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"No List\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Contemporary\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Elegant\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Professional\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Subtle 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Subtle 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Balloon Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"Table Grid\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Theme\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Placeholder Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" QFormat=\"true\" Name=\"No Spacing\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Revision\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"34\" QFormat=\"true\"\r\n   Name=\"List Paragraph\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"29\" QFormat=\"true\" Name=\"Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"30\" QFormat=\"true\"\r\n   Name=\"Intense Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"19\" QFormat=\"true\"\r\n   Name=\"Subtle Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"21\" QFormat=\"true\"\r\n   Name=\"Intense Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"31\" QFormat=\"true\"\r\n   Name=\"Subtle Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"32\" QFormat=\"true\"\r\n   Name=\"Intense Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"33\" QFormat=\"true\" Name=\"Book Title\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"37\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"Bibliography\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"TOC Heading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"41\" Name=\"Plain Table 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"42\" Name=\"Plain Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"43\" Name=\"Plain Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"44\" Name=\"Plain Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"45\" Name=\"Plain Table 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"40\" Name=\"Grid Table Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"Grid Table 1 Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"Grid Table 6 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"Grid Table 7 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"List Table 1 Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"List Table 6 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"List Table 7 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Mention\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Smart Hyperlink\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Hashtag\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Unresolved Mention\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Smart Link\"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:\"Table Normal\";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n	mso-para-margin-top:0in;\r\n	mso-para-margin-right:0in;\r\n	mso-para-margin-bottom:8.0pt;\r\n	mso-para-margin-left:0in;\r\n	line-height:107%;\r\n	mso-pagination:widow-orphan;\r\n	font-size:11.0pt;\r\n	font-family:\"Calibri\",sans-serif;\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:\"Times New Roman\";\r\n	mso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]-->', 'Gelato and Legend Orange Apricot', '2021-03-05 15:28:18', '2021-03-05 21:06:33');
INSERT INTO `strains` (`id`, `name`, `effect`, `description`, `parent`, `created_at`, `updated_at`) VALUES
(2293, 'Apricot Gelato', 'euphoric, relaxed', '<p class=\"MsoNormal\">It is extremely fruity with flavors of Apricot and smooth as a cold scoop of Gelato</p>\r\n\r\n<!--[if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:EnableOpenTypeKerning/>\r\n   <w:DontFlipMirrorIndents/>\r\n   <w:OverrideTableStyleHps/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val=\"Cambria Math\"/>\r\n   <m:brkBin m:val=\"before\"/>\r\n   <m:brkBinSub m:val=\"--\"/>\r\n   <m:smallFrac m:val=\"off\"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val=\"0\"/>\r\n   <m:rMargin m:val=\"0\"/>\r\n   <m:defJc m:val=\"centerGroup\"/>\r\n   <m:wrapIndent m:val=\"1440\"/>\r\n   <m:intLim m:val=\"subSup\"/>\r\n   <m:naryLim m:val=\"undOvr\"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"false\"\r\n  DefSemiHidden=\"false\" DefQFormat=\"false\" DefPriority=\"99\"\r\n  LatentStyleCount=\"376\">\r\n  <w:LsdException Locked=\"false\" Priority=\"0\" QFormat=\"true\" Name=\"Normal\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"heading 9\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index 9\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"toc 9\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footnote text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"header\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footer\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"index heading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"35\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"caption\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"table of figures\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"envelope address\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"envelope return\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"footnote reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"line number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"page number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"endnote reference\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"endnote text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"table of authorities\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"macro\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"toa heading\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Bullet 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Number 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"10\" QFormat=\"true\" Name=\"Title\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Closing\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Signature\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"Default Paragraph Font\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"List Continue 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Message Header\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"11\" QFormat=\"true\" Name=\"Subtitle\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Salutation\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Date\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text First Indent\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text First Indent 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Note Heading\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Body Text Indent 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Block Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Hyperlink\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"FollowedHyperlink\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"22\" QFormat=\"true\" Name=\"Strong\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"20\" QFormat=\"true\" Name=\"Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Document Map\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Plain Text\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"E-mail Signature\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Top of Form\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Bottom of Form\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal (Web)\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Acronym\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Address\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Cite\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Code\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Definition\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Keyboard\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Preformatted\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Sample\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Typewriter\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"HTML Variable\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Normal Table\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"annotation subject\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"No List\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Outline List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Simple 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Classic 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Colorful 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Columns 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Grid 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 4\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 5\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 7\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table List 8\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table 3D effects 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Contemporary\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Elegant\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Professional\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Subtle 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Subtle 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 2\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Web 3\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Balloon Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"Table Grid\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Table Theme\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Placeholder Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" QFormat=\"true\" Name=\"No Spacing\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" Name=\"Revision\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"34\" QFormat=\"true\"\r\n   Name=\"List Paragraph\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"29\" QFormat=\"true\" Name=\"Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"30\" QFormat=\"true\"\r\n   Name=\"Intense Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" Name=\"Light Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" Name=\"Light List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" Name=\"Light Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" Name=\"Medium Shading 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" Name=\"Medium Shading 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" Name=\"Medium List 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" Name=\"Medium List 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" Name=\"Medium Grid 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" Name=\"Medium Grid 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" Name=\"Medium Grid 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" Name=\"Dark List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" Name=\"Colorful Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" Name=\"Colorful List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" Name=\"Colorful Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"19\" QFormat=\"true\"\r\n   Name=\"Subtle Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"21\" QFormat=\"true\"\r\n   Name=\"Intense Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"31\" QFormat=\"true\"\r\n   Name=\"Subtle Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"32\" QFormat=\"true\"\r\n   Name=\"Intense Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"33\" QFormat=\"true\" Name=\"Book Title\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"37\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" Name=\"Bibliography\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" SemiHidden=\"true\"\r\n   UnhideWhenUsed=\"true\" QFormat=\"true\" Name=\"TOC Heading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"41\" Name=\"Plain Table 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"42\" Name=\"Plain Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"43\" Name=\"Plain Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"44\" Name=\"Plain Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"45\" Name=\"Plain Table 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"40\" Name=\"Grid Table Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"Grid Table 1 Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"Grid Table 6 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"Grid Table 7 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"Grid Table 1 Light Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"Grid Table 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"Grid Table 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"Grid Table 4 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"Grid Table 5 Dark Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"Grid Table 6 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"Grid Table 7 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\" Name=\"List Table 1 Light\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\" Name=\"List Table 6 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\" Name=\"List Table 7 Colorful\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"46\"\r\n   Name=\"List Table 1 Light Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"47\" Name=\"List Table 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"48\" Name=\"List Table 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"49\" Name=\"List Table 4 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"50\" Name=\"List Table 5 Dark Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"51\"\r\n   Name=\"List Table 6 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"52\"\r\n   Name=\"List Table 7 Colorful Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Mention\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Smart Hyperlink\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Hashtag\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Unresolved Mention\"/>\r\n  <w:LsdException Locked=\"false\" SemiHidden=\"true\" UnhideWhenUsed=\"true\"\r\n   Name=\"Smart Link\"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:\"Table Normal\";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n	mso-para-margin-top:0in;\r\n	mso-para-margin-right:0in;\r\n	mso-para-margin-bottom:8.0pt;\r\n	mso-para-margin-left:0in;\r\n	line-height:107%;\r\n	mso-pagination:widow-orphan;\r\n	font-size:11.0pt;\r\n	font-family:\"Calibri\",sans-serif;\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:\"Times New Roman\";\r\n	mso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]-->', 'Gelato and Legend Orange Apricot', '2021-03-05 15:28:18', '2021-03-05 21:06:50'),
(2294, 'Cake Mintz', 'relaxed, uplifted', 'Nice cool gas aroma', '?<br>', '2021-03-05 17:06:53', '2021-03-05 21:19:15'),
(2295, 'BTY OG', 'relaxed, euphoric', 'The flavor and aroma of this strain is unique with earth, pine, and wood with elements of sour lemon come through on the exhale.', 'OG Kush genetics with two Unknowns', '2021-03-05 16:02:56', '2021-03-05 21:24:16'),
(2296, 'Platinum Bubba', 'relaxed, pain-relief, sleepy, hungry', 'The buds have a beautiful silver color that jump out immediately. The layer of trichomes is bright white with the silver covering over vivid green leaves which give it a metallic appearance, like platinum. Wisps of orange pistils accentuate the platinum-covered green. It blends well with pungent, sweet, and floral notes. Spicy flavors meld with earthiness and sweetness to make a smooth and enjoyable smoking experience.', 'Bubba Kush, OG Kush', '2021-03-08 22:16:31', '2021-03-08 22:16:31'),
(2297, 'Apricot Gelato', 'euphoric, relaxed', 'It is extremely fruity with flavors of Apricot and smooth as a cold scoop of Gelato.', 'Gelato and Orange Apricot', '2021-03-08 22:16:53', '2021-03-08 22:16:53'),
(2298, 'Apricot Gelato', 'euphoric, relaxed', 'It is extremely fruity with flavors of Apricot and smooth as a cold scoop of Gelato.', 'Gelato, Orange Apricot', '2021-03-08 22:17:42', '2021-03-08 22:17:42'),
(2299, 'Motorbreath', 'relaxed, focused', 'Has a pungent diesel-like scent that it emits once its ready for harvest', 'Chem D, SFV OG Kush', '2021-03-08 22:18:31', '2021-03-08 22:18:31'),
(2300, 'Apricot Gelato', 'euphoric, relaxed', 'It is extremely fruity with flavors of Apricot and smooth as a cold scoop of Gelato', 'Gelato and Orange Apricot', '2021-03-08 22:19:06', '2021-03-08 22:19:06'),
(2301, 'Skywalker OG', 'pain relief, relaxed', 'Brings smells of spicy diesel and leaves, an mild herbal aftertaste. The bud are dense, medium sized, with olive colored with fuzzy burnt orange pistils. When harvested the buds are very sticky and covered in trichomes.', 'Skywalker, OG Kush', '2021-03-08 22:19:23', '2021-03-08 22:19:23'),
(2302, 'King Kush', 'euphoric, relaxed', 'The buds are densely covered by dark green leaves with hues of purple \r\nand abnormal looking calyxes. It has a tangy and intense aroma with an \r\nunforgettable taste of grapefruit but with woody undertones', 'OG Kush and Grape Ape', '2021-03-08 22:19:36', '2021-03-08 22:19:36'),
(2303, 'Earth OG', 'creative, energetic, uplifted, euphoric, relaxed', 'Delivering a spicy, earthy scent and flavor it produces with undertones of citrus/lemon. Its harvest-ready buds are small and fluffy, popcorn- corn shaped, minty green, and speckled with long fiery orange pistils.', 'Sour Diesel, Ghost OG', '2021-03-08 22:19:49', '2021-03-08 22:19:49'),
(2304, 'Apricot Gelato', 'euphoric, relaxed', 'It is extremely fruity with flavors of Apricot and smooth as a cold scoop of Gelato', 'Gelato and Orange Apricot', '2021-03-08 23:17:01', '2021-03-08 23:17:01'),
(2305, 'Apricot Gelato', 'euphoric, relaxed', 'It is extremely fruity with flavors of Apricot and smooth as a cold scoop of Gelato.', 'Gelato, Orange Apricot', '2021-03-09 01:28:50', '2021-03-09 01:28:50'),
(2306, 'White Gorilla', 'sleepy, pain relief, relaxed, happy, hungry, uplifted', '<font size=\"3\" face=\"arial\"><span style=\"text-align: justify; line-height: 19.26px; color: rgb(72, 72, 72);\">It’s mostly lime-green and orange with an impressive array of pistils. Its trichome production is very high, making it look covered in an orange-green moss, with white patches in areas of trichome concentrations. The light-green leaves are coiled and tightly packed.&nbsp;</span><span style=\"text-align: justify;\">It emits heavy odors of gasoline, skunk, and pine with undertones of chocolate.</span></font><br>', '<p class=\"MsoNormal\"><font size=\"3\" face=\"arial\">GG#4, White Fire Alien OG</font><o:p></o:p></p>', '2021-03-09 01:29:26', '2021-03-09 01:29:26'),
(2307, 'Cracker Jack', 'energetic, focused, euphoric', '<br>', '<p class=\"MsoNormal\"><span style=\"font-family: \" segoe=\"\" ui\",=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" background-image:=\"\" initial;=\"\" background-position:=\"\" background-size:=\"\" background-repeat:=\"\" background-attachment:=\"\" background-origin:=\"\" background-clip:=\"\" initial;\"=\"\">Jack Herer, Green Crack&nbsp;</span><o:p></o:p></p>', '2021-03-09 01:29:44', '2021-03-09 01:29:44'),
(2308, 'OG kush Skunk', 'happy, euphoric, relaxed', 'Has&nbsp;<span style=\"color: rgb(51, 51, 51); font-family: \" public=\"\" sans\",=\"\" -apple-system,=\"\" blinkmacsystemfont,=\"\" roboto,=\"\" \"segoe=\"\" ui\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">a complex aroma with notes of fuel, skunk,&nbsp;and spice.&nbsp;</span>', 'Hindu Kush&nbsp;', '2021-03-09 01:35:02', '2021-03-09 01:35:02'),
(2309, 'madman OG', 'relaxed<br>', 'Taking the great OG to a whole new level.<br>', 'OG Kush, ?<br>', '2021-03-09 01:36:40', '2021-03-09 01:36:40'),
(2310, 'XXX Headband OG', 'calm, relaxed, hungry', 'It has a very complex taste with notes that are fruity, spicy, earthy, sour, and piney.', 'Headband, SFV OG', '2021-03-08 18:41:55', '2021-03-09 01:41:55'),
(2311, 'Thai Fire', 'pain relief, euphoric, relaxed, happy<br>', '<span style=\"color: rgb(87, 87, 87); font-family: Lato, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">It has good looking buds with colors ranging from blue to green and even a bit of silver in the mix. Very durable in any grow environment, which is perfect for new growers.</span>', 'Thai Stick, FIre OG<br>', '2021-03-09 01:45:16', '2021-03-09 01:45:16'),
(2312, 'Chem dawg #91', 'uplifted, energetic, pain-relief, euphoric, ', 'It packs a powerfully pungent aroma, something between a wild skunk and the diesel scent familiar in the Chemdawg line. Its smoke leaves a piney, citrus-like aftertaste.', 'Hashplant, Skunk, Kush, Northern Lights, Diesel, Thai landrace.', '2021-03-09 04:01:13', '2021-03-09 04:01:13'),
(2313, 'Sour Kosher', 'relaxed', 'Buds produce a gassy, piney, and sour aroma and flavor that\r\nmay perk you up even before you pack a bowl.', 'Sour Diesel, Kosher Kush', '2021-03-09 04:01:53', '2021-03-09 04:01:53'),
(2314, 'Fire OG', 'relaxed, sleepy, euphoric', 'Smells and tastes similar to OG Kush, with undertones of diesel in the mix. When harvest-ready, its buds have a frosty appeal and bare red hairs, with the impression that it’s on fire.', 'SFV OG, OG Kush', '2021-03-08 22:05:53', '2021-03-09 05:05:53'),
(2315, 'Big Bud', 'relaxed, energized', 'Produces massive yields with few leaves and large buds.', 'Afghani, Northern Lights, Skunk #1', '2021-03-09 05:06:43', '2021-03-09 05:06:43'),
(2316, 'Herojuana', 'sleepy, relaxed, pain-relief', 'Produces small, lime-colored buds with wispy pistils. Its scent and flavor are similar to lemon-lime and spices mixed pleasantly together.', 'Herojuana, OG Kush', '2021-03-09 05:07:13', '2021-03-09 05:07:13'),
(2317, 'OG #18', 'sleepy, happy, relaxed', 'Provides a pungent odor as it grows that becomes more pronounced as the flowering time approaches. It also has some earthiness with hints of citrus. It also bursts of diesel flavor and one may experience sourness. Buds are often dense, thick, and resinous. The stickiness is due to the smattering of white trichomes. There are also plenty of orange pistils.', 'OG Kush', '2021-03-10 02:22:33', '2021-03-10 02:22:33'),
(2318, 'Tropicana  GSC', 'uplifted, energetic, giggly', 'Has a scent and taste that justifies its name. It has a terpene profile that gives it a remarkably citrusy smell resembling oranges and a taste that’s both sweet and slightly floral while having those citrusy undertones as well.', 'GSC, Tangie', '2021-03-10 02:22:46', '2021-03-10 02:22:46'),
(2319, 'Monkey Breath', 'happy, relaxed', 'The bud has a rich chocolaty diesel flavor with a touch of vanilla and earth to it. The aroma takes a pungent turn, with a woody overtone and a pretty hard hit of spicy fuel', 'Grease Monkey, Motor Breath', '2021-03-10 02:23:39', '2021-03-10 02:23:39'),
(2320, 'ICC', 'relaxed, pain-relief, sleepy', 'Has a creamy vanilla-like aroma from these buds with a slightly nutty and sometimes cheesy undertone. The cured nuggets are a colorful assortment of light and dark greens intertwined with deep shades of purple and copper pistils.', 'Wedding Cake, Gelato #33', '2021-03-10 02:23:51', '2021-03-10 02:23:51'),
(2321, 'Gelato 44', 'relaxed', 'Great taste and big effects, a true Gelato.', 'Thin Mint Girl Scout Cookies, Sunset Sherbet', '2021-03-10 05:37:52', '2021-03-10 05:37:52'),
(2322, 'Wifi OG', 'energetic, focused, uplifted, euphoric', 'Produces frosty buds that often smells spicy, earthy, and floral with undertones of diesel OG Kush, Durban Poison, South American, and Neville Haze.', 'Fire OG, The White', '2021-03-10 05:38:49', '2021-03-10 05:38:49'),
(2323, 'Sunday Driver', 'euphoric, hungry, sleepy, relaxed, happy', 'Buds are light green in color with purple accents and come drenched in trichomes.', 'FPOG, Grape Pie', '2021-03-10 05:39:00', '2021-03-10 05:39:00');
INSERT INTO `strains` (`id`, `name`, `effect`, `description`, `parent`, `created_at`, `updated_at`) VALUES
(2324, 'Pink Runtz', 'euphoric', 'Has a sweet, candy like scent and taste boasting a colorful appearance. Its scent might remind you of sugary candies since it has a delicious terpene profile that\'s sweet, zesty, and flavorful. However, the scent does tend to be faint, emitting a mild aroma. It has a rainbow of deep colors spanning from greens to purples to blues and even dark pinks. Its cured buds are very dense and often shaped like bumpy pinecones.', 'Runtz, Pink Panties', '2021-03-10 18:33:23', '2021-03-11 01:33:23');

-- --------------------------------------------------------

--
-- Table structure for table `strain_gallery`
--

CREATE TABLE `strain_gallery` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `strain_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `extension` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `index` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `strain_gallery`
--

INSERT INTO `strain_gallery` (`id`, `strain_id`, `path`, `extension`, `name`, `index`, `created_at`, `updated_at`) VALUES
(1, 451, 'assets/images/strains/Wedding Cake/wedding-cake.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(2, 451, 'assets/images/strains/Wedding Cake/wedding-cake__primary_25f9.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(3, 451, 'assets/images/strains/Wedding Cake/wedding-cake__primary_324d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(4, 451, 'assets/images/strains/Wedding Cake/wedding-cake__primary_551d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(5, 451, 'assets/images/strains/Wedding Cake/wedding-cake__primary_985f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(6, 451, 'assets/images/strains/Wedding Cake/wedding-cake__primary_9e97.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(7, 452, 'assets/images/strains/Gelato/gelato.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(8, 452, 'assets/images/strains/Gelato/gelato__primary_0dc7.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(9, 452, 'assets/images/strains/Gelato/gelato__primary_97f7.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(10, 452, 'assets/images/strains/Gelato/gelato__primary_ba01.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(11, 456, 'assets/images/strains/Gsc/gsc.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(12, 456, 'assets/images/strains/Gsc/gsc.png', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(13, 457, 'assets/images/strains/Sour Diesel/sour-diesel.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(14, 457, 'assets/images/strains/Sour Diesel/sour-diesel__primary_4869.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(15, 457, 'assets/images/strains/Sour Diesel/sour-diesel__primary_4ba5.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(16, 457, 'assets/images/strains/Sour Diesel/sour-diesel__primary_614b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(17, 457, 'assets/images/strains/Sour Diesel/sour-diesel__primary_a5be.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(18, 457, 'assets/images/strains/Sour Diesel/sour-diesel__primary_d448.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(19, 460, 'assets/images/strains/Jack herer/jack-herer.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(20, 460, 'assets/images/strains/Jack herer/jack-herer__primary_3218.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(21, 460, 'assets/images/strains/Jack herer/jack-herer__primary_3cae.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(22, 460, 'assets/images/strains/Jack herer/jack-herer__primary_602f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(23, 460, 'assets/images/strains/Jack herer/jack-herer__primary_743f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(24, 460, 'assets/images/strains/Jack herer/jack-herer__primary_a602.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(25, 464, 'assets/images/strains/zkittlez/zkittlez__primary_2af0.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(26, 464, 'assets/images/strains/zkittlez/zkittlez__primary_36ff.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(27, 464, 'assets/images/strains/zkittlez/zkittlez__primary_5c74.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(28, 464, 'assets/images/strains/zkittlez/zkittlez__primary_7157.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(29, 464, 'assets/images/strains/zkittlez/zkittlez__primary_85f3.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(30, 464, 'assets/images/strains/zkittlez/zkittlez__primary_d097.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(31, 464, 'assets/images/strains/zkittlez/zkittlez__primary_d8e5.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:12', '0000-00-00 00:00:00'),
(32, 475, 'assets/images/strains/Chemdawg/chemdawg-4_825x550_d728.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:13', '0000-00-00 00:00:00'),
(33, 475, 'assets/images/strains/Chemdawg/chemdawg-4__primary_38c2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:13', '0000-00-00 00:00:00'),
(34, 475, 'assets/images/strains/Chemdawg/chemdawg-4__primary_533d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:13', '0000-00-00 00:00:00'),
(35, 475, 'assets/images/strains/Chemdawg/chemdawg-4__primary_81b4.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:13', '0000-00-00 00:00:00'),
(36, 475, 'assets/images/strains/Chemdawg/chemdawg-4__primary_8256.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:13', '0000-00-00 00:00:00'),
(37, 475, 'assets/images/strains/Chemdawg/chemdawg-4__primary_b6fe.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:13', '0000-00-00 00:00:00'),
(38, 475, 'assets/images/strains/Chemdawg/chemdawg-4__primary_b85a.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:13', '0000-00-00 00:00:00'),
(39, 552, 'assets/images/strains/Animal Cookies/xpdL6Nq9SGu0zjD2aNQf_ANIMAL_20COOKIES-337-edited.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:13', '0000-00-00 00:00:00'),
(40, 553, 'assets/images/strains/Candyland/candyland.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:13', '0000-00-00 00:00:00'),
(41, 562, 'assets/images/strains/Grape Ape/grape-ape.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:14', '0000-00-00 00:00:00'),
(42, 564, 'assets/images/strains/platinum cookies/platinum-gsc.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:14', '0000-00-00 00:00:00'),
(43, 566, 'assets/images/strains/Black Diamond/black-diamond__primary_7543.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:14', '0000-00-00 00:00:00'),
(44, 567, 'assets/images/strains/Venom OG/venom-og__primary_1f4b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:14', '0000-00-00 00:00:00'),
(45, 569, 'assets/images/strains/Platinum OG/platinum-og__primary_1935.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:14', '0000-00-00 00:00:00'),
(46, 575, 'assets/images/strains/Maui Wowie/maui-wowie__primary_7c71.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:14', '0000-00-00 00:00:00'),
(47, 577, 'assets/images/strains/Thin Mint GSC/i7NqIuuQRd2ZQQ89VFbg_THIN_20MINT-207-edited.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:14', '0000-00-00 00:00:00'),
(48, 578, 'assets/images/strains/White Rhino/white-rhino__primary_a9fc.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:14', '0000-00-00 00:00:00'),
(49, 580, 'assets/images/strains/Banana Kush/banana-kush__primary_4c32.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:14', '0000-00-00 00:00:00'),
(50, 581, 'assets/images/strains/Purple Haze/purple-haze__primary_d476.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:14', '0000-00-00 00:00:00'),
(51, 584, 'assets/images/strains/Berry White/berry-white__primary_8804.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:14', '0000-00-00 00:00:00'),
(52, 585, 'assets/images/strains/G13/g13__primary_ff9b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:14', '0000-00-00 00:00:00'),
(53, 586, 'assets/images/strains/mango kush/mango-kush.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:14', '0000-00-00 00:00:00'),
(54, 588, 'assets/images/strains/Khalifa Kush/khalifa-kush__primary_01d1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:14', '0000-00-00 00:00:00'),
(55, 590, 'assets/images/strains/Superglue/superglue__primary_7288.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:14', '0000-00-00 00:00:00'),
(56, 593, 'assets/images/strains/Purple Kush/purple-kush.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:14', '0000-00-00 00:00:00'),
(57, 596, 'assets/images/strains/Cheese/cheese.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:14', '0000-00-00 00:00:00'),
(58, 598, 'assets/images/strains/9 lb Hammer/9-pound-hammer.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(59, 600, 'assets/images/strains/Lemon Og/LEMON-OG-051-2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(60, 601, 'assets/images/strains/Lemon Kush/lemon-kush.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(61, 603, 'assets/images/strains/Black Jack/black-jack.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(62, 604, 'assets/images/strains/Sour Tangie/sour-tangie.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(63, 605, 'assets/images/strains/Acapulco Gold/acapulco.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(64, 606, 'assets/images/strains/Chocolope/o4MhnTW2QK2LicV68uiY_CHOCOLOPE-212-edited.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(65, 608, 'assets/images/strains/Amnesia/AMNESIA-026.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(66, 609, 'assets/images/strains/Orange Creamsicle/orange-creamsicle.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(67, 610, 'assets/images/strains/True OG/true-og.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(68, 611, 'assets/images/strains/Haze/haze.png', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(69, 612, 'assets/images/strains/NYC Diesel/nyc-diesel.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(70, 613, 'assets/images/strains/White Tahoe Cookies/white-tahoe-cookies.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(71, 614, 'assets/images/strains/Super Skunk/brHMDx6QQiAUzWW1QMxC_SUPER_20SKUNK-011-edited.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(72, 615, 'assets/images/strains/Dutch Treat/dutch-treat.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(73, 617, 'assets/images/strains/Lemon Meringue/lemon-meringue.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(74, 619, 'assets/images/strains/MK ultra/MK-ULTRA-082.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(75, 620, 'assets/images/strains/The White/DlI3zy6KSYyvONnipUnS_THE_20WHITE-330-edited.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(76, 622, 'assets/images/strains/Jager/jr.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(77, 623, 'assets/images/strains/Blueberry Cookies/S1XM8RVTS1Ghpaeqc3jf_BLUEBERRY_20COOKIES-270-edited.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(78, 624, 'assets/images/strains/Kimbo Kush/KIMBO-KUSH-030.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(79, 625, 'assets/images/strains/Mango Haze/zT6M2MASsyZK8U9tZ9JA_MANGO_20HAZE-251-edited.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(80, 626, 'assets/images/strains/Cannatonic/cannatonic.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(81, 627, 'assets/images/strains/Strawberry Diesel/strawberry-diesel__primary_8b0f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(82, 628, 'assets/images/strains/Goji OG/GOJI-OG-112-2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(83, 629, 'assets/images/strains/Pineapple chunk/Rk5G4CoTvy8oqv7zudgy_PINEAPPLE_20CHUNK-219-edited.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(84, 630, 'assets/images/strains/Liberty haze/liberty-haze__primary_0797.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(85, 630, 'assets/images/strains/Liberty haze/liberty-haze__primary_16ea.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(86, 630, 'assets/images/strains/Liberty haze/liberty-haze__primary_1ae6.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(87, 630, 'assets/images/strains/Liberty haze/liberty-haze__primary_94f3.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(88, 630, 'assets/images/strains/Liberty haze/liberty-haze__primary_c502.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(89, 631, 'assets/images/strains/Pink-champagne/pink-champagne__primary_0319.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(90, 631, 'assets/images/strains/Pink-champagne/pink-champagne__primary_13dc.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(91, 631, 'assets/images/strains/Pink-champagne/pink-champagne__primary_f06a.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(92, 632, 'assets/images/strains/Lavender/lavender__primary_2367.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(93, 632, 'assets/images/strains/Lavender/lavender__primary_3635.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(94, 632, 'assets/images/strains/Lavender/lavender__primary_9dc1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(95, 632, 'assets/images/strains/Lavender/lavender__primary_b76b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(96, 632, 'assets/images/strains/Lavender/lavender__primary_c225.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(97, 632, 'assets/images/strains/Lavender/lavender__primary_ec03.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(98, 632, 'assets/images/strains/Lavender/lavender__primary_f2bd.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(99, 633, 'assets/images/strains/Sour-tsunami/sour-tsunami__primary_0b26.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(100, 633, 'assets/images/strains/Sour-tsunami/sour-tsunami__primary_3b94.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(101, 633, 'assets/images/strains/Sour-tsunami/sour-tsunami__primary_8600.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(102, 633, 'assets/images/strains/Sour-tsunami/sour-tsunami__primary_88fe.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(103, 633, 'assets/images/strains/Sour-tsunami/sour-tsunami__primary_8f9d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(104, 633, 'assets/images/strains/Sour-tsunami/sour-tsunami__primary_f9fa.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(105, 635, 'assets/images/strains/Cinex/CINEX-077.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(106, 635, 'assets/images/strains/Cinex/cinex__primary_0776.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(107, 635, 'assets/images/strains/Cinex/cinex__primary_397c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(108, 635, 'assets/images/strains/Cinex/cinex__primary_82ac.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(109, 635, 'assets/images/strains/Cinex/cinex__primary_9b27.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(110, 635, 'assets/images/strains/Cinex/cinex__primary_dbe6.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(111, 635, 'assets/images/strains/Cinex/cinex__primary_f417.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(112, 638, 'assets/images/strains/Blueberry diesel/BLUEBERRY-DIESEL-009.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:15', '0000-00-00 00:00:00'),
(113, 640, 'assets/images/strains/Cheese Quake/6kKy0U4GSUSbCp5HyQpz_CHEESE_20QUAKE-318-edited.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(114, 654, 'assets/images/strains/Larry OG/larry-og__primary_ef41.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(115, 656, 'assets/images/strains/Gorilla Cookies/gorilla-cookies__primary_0b75.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(116, 657, 'assets/images/strains/Cinderella 99/cinderella-99__primary_88d2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(117, 658, 'assets/images/strains/Critical Kush/critical-kush__primary_ddcd.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(118, 659, 'assets/images/strains/Pink Kush/pink-kush__primary_f45a.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(119, 660, 'assets/images/strains/Ghost OG/ghost-og__primary_33e3.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(120, 661, 'assets/images/strains/Kosher Kush/kosher-kush__primary_0552.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(121, 662, 'assets/images/strains/Harlequin/harlequin__primary_e3d5.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(122, 663, 'assets/images/strains/XXX OG/xxx-og__primary_ee74.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(123, 664, 'assets/images/strains/Lemon Skunk/lemon-skunk__primary_065f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(124, 665, 'assets/images/strains/Blackberry Kush/blackberry-kush__primary_da3c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(125, 666, 'assets/images/strains/Platinum Bubba Kush/platinum-bubba-kush__primary_e3cb.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(126, 667, 'assets/images/strains/Banana OG/banana-og__primary_de22.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(127, 668, 'assets/images/strains/LSD/lsd__primary_0a62.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(128, 669, 'assets/images/strains/Obama Kush/obama-kush__primary_f41c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(129, 670, 'assets/images/strains/Hindu Kush/hindu-kush__primary_2892.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(130, 671, 'assets/images/strains/Death Star/death-star__primary_058c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(131, 672, 'assets/images/strains/Clementine/clementine__primary_40b1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(132, 673, 'assets/images/strains/Kandy Kush/kandy-kush__primary_0574.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(133, 674, 'assets/images/strains/Sour OG/sour-og__primary_583c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(134, 675, 'assets/images/strains/Black Mamba/black-mamba__primary_ab16.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(135, 676, 'assets/images/strains/Purple Urkle/purple-urkle__primary_d264.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(136, 677, 'assets/images/strains/Afghan Kush/afghan-kush__primary_ab23.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(137, 678, 'assets/images/strains/Watermelon/watermelon__primary_3a89.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(138, 679, 'assets/images/strains/Tangerine Dream/tangerine-dream__primary_fcb7.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(139, 680, 'assets/images/strains/Key Lime Pie/key-lime-pie__primary_4cf5.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(140, 682, 'assets/images/strains/Island Sweet Skunk/island-sweet-skunk__primary_c460.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:16', '0000-00-00 00:00:00'),
(141, 683, 'assets/images/strains/Silver Haze/silver-haze__primary_da4b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(142, 684, 'assets/images/strains/Skunk 1/skunk-no--1__primary_f2b5.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(143, 685, 'assets/images/strains/Fruit Punch/fruit-punch__primary_00c0.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(144, 686, 'assets/images/strains/Afghani/afghani__primary_883e.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(145, 688, 'assets/images/strains/Diamond OG/diamond-og__primary_4ec6.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(146, 690, 'assets/images/strains/ACDC/acdc__primary_2209.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(147, 691, 'assets/images/strains/Holy Grail Kush/holy-grail-kush__primary_6fd0.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(148, 692, 'assets/images/strains/Critical Mass/critical-mass__primary_2140.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(149, 693, 'assets/images/strains/Blueberry Kush/blueberry-kush__primary_9d68.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(150, 694, 'assets/images/strains/Monster Cookies/monster-cookies__primary_5bbc.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(151, 695, 'assets/images/strains/Super Sour Diesel/super-sour-diesel__primary_7576.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(152, 696, 'assets/images/strains/Agent Orange/agent-orange__primary_5ea2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(153, 698, 'assets/images/strains/White Russian/white-russian__primary_5971.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(154, 699, 'assets/images/strains/Cotton Candy/cotton-candy-kush__primary_a151.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(155, 700, 'assets/images/strains/Jillybean/jillybean__primary_64bd.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(156, 701, 'assets/images/strains/Death Bubba/death-bubba__primary_e319.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(157, 703, 'assets/images/strains/OG #18/og--18__primary_d98a.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(158, 704, 'assets/images/strains/24k Gold/24k-gold__primary_9b94.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(159, 705, 'assets/images/strains/Godfather OG/godfather-og__primary_80ca.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(160, 706, 'assets/images/strains/Moby Dick/moby-dick__primary_cd67.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(161, 707, 'assets/images/strains/Orange Kush/orange-kush__primary_1b21.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(162, 708, 'assets/images/strains/White Buffalo/white-buffalo__primary_1857.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(163, 709, 'assets/images/strains/Juicy Fruit/juicy-fruit__primary_575f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(164, 710, 'assets/images/strains/Rainbow/rainbow__primary_bd4e.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(165, 711, 'assets/images/strains/Blueberry Headband/blueberry-headband__primary_f4ee.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(166, 712, 'assets/images/strains/White 99/white-99__primary_c11f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(167, 713, 'assets/images/strains/El Jefe/el-jefe__primary_53bd.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(168, 714, 'assets/images/strains/Apple Jack/apple-jack__primary_179f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(169, 716, 'assets/images/strains/Peyote Cookies/peyote-cookies__primary_24c0.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(170, 717, 'assets/images/strains/Pink Cookies/pink-cookies__primary_d241.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(171, 718, 'assets/images/strains/Cali Kush/cali-kush__primary_4150.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(172, 720, 'assets/images/strains/Mango/mango__primary_d0ea.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(173, 721, 'assets/images/strains/Sensi Star/sensi-star__primary_cd36.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(174, 722, 'assets/images/strains/Grapefruit/grapefruit__primary_de99.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(175, 723, 'assets/images/strains/Deadhead OG/deadhead-og__primary_075d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(176, 724, 'assets/images/strains/Blackberry/blackberry__primary_eaf3.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(177, 726, 'assets/images/strains/Strawberry Kush/strawberry-kush__primary_e4ba.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:17', '0000-00-00 00:00:00'),
(178, 727, 'assets/images/strains/Legend OG/legend-og__primary_c091.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(179, 728, 'assets/images/strains/Rockstar/rockstar__primary_f1b0.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(180, 730, 'assets/images/strains/Big Bud/big-bud__primary_c9fa.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(181, 731, 'assets/images/strains/Blackwater/blackwater__primary_cc59.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(182, 732, 'assets/images/strains/SFV OG Kush/sfv-og-kush__primary_6c22.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(183, 733, 'assets/images/strains/Skywalker Alien/skywalker-alien__primary_efce.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(184, 734, 'assets/images/strains/Romulan/romulan__primary_1ae8.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(185, 735, 'assets/images/strains/Pineapple/pineapple__primary_607b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(186, 736, 'assets/images/strains/Jack Frost/jack-frost__primary_5c9d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(187, 737, 'assets/images/strains/Sour Apple/sour-apple__primary_9489.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(188, 738, 'assets/images/strains/Mazar x Blueberry OG/mazar.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(189, 739, 'assets/images/strains/Laughing Buddha/laughing-buddha__primary_0a04.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(190, 740, 'assets/images/strains/Black Domina/black-domina__primary_0df1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(191, 741, 'assets/images/strains/Red Dragon/red-dragon__primary_8fc3.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(192, 742, 'assets/images/strains/Lemon Diesel/lemon-diesel__primary_a100.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(193, 743, 'assets/images/strains/Face Off OG/face-off-og__primary_c7a3.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(194, 744, 'assets/images/strains/Dogwalker OG/dogwalker-og__primary_6559.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(195, 745, 'assets/images/strains/Lucky Charms/lucky-charms__primary_eca1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(196, 746, 'assets/images/strains/Ice/ice__primary_d092.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(197, 747, 'assets/images/strains/Sweet Tooth/sweet-tooth__primary_5c53.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(198, 748, 'assets/images/strains/Recon/recon__primary_956a.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(199, 749, 'assets/images/strains/Cookie Dough/cookie-dough__primary_3f53.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(200, 750, 'assets/images/strains/Pineapple Kush/pineapple-kush__primary_5b60.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(201, 751, 'assets/images/strains/Hawaiian/hawaiian__primary_3847.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(202, 752, 'assets/images/strains/Power Plant/power-plant__primary_f69f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(203, 753, 'assets/images/strains/Cherry Diesel/cherry-diesel__primary_677b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(204, 1521, 'assets/images/strains/Purple-og-kush/purple-og-kush__primary_2414.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(205, 1521, 'assets/images/strains/Purple-og-kush/purple-og-kush__primary_4ed3.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(206, 1521, 'assets/images/strains/Purple-og-kush/purple-og-kush__primary_57f7.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(207, 1521, 'assets/images/strains/Purple-og-kush/purple-og-kush__primary_6751.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(208, 1521, 'assets/images/strains/Purple-og-kush/purple-og-kush__primary_803f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(209, 1521, 'assets/images/strains/Purple-og-kush/purple-og-kush__primary_91bb.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(210, 1521, 'assets/images/strains/Purple-og-kush/purple-og-kush__primary_dfe6.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(211, 1521, 'assets/images/strains/Purple-og-kush/purple-og-kush__primary_e137.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(212, 1521, 'assets/images/strains/Purple-og-kush/purple-og-kush__primary_f89b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(213, 1524, 'assets/images/strains/Gummy Bears/gummy-bears__primary_3564.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(214, 1524, 'assets/images/strains/Gummy Bears/gummy-bears__primary_4bd7.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(215, 1528, 'assets/images/strains/Purple-gorilla/purple-gorilla__primary_073e.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(216, 1528, 'assets/images/strains/Purple-gorilla/purple-gorilla__primary_66db.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(217, 1528, 'assets/images/strains/Purple-gorilla/purple-gorilla__primary_7283.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(218, 1528, 'assets/images/strains/Purple-gorilla/purple-gorilla__primary_880e.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(219, 1528, 'assets/images/strains/Purple-gorilla/purple-gorilla__primary_f90f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(220, 1528, 'assets/images/strains/Purple-gorilla/purple-gorilla__primary_fa85.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(221, 1531, 'assets/images/strains/Hawaiian Punch/hawaiian-punch__primary_236d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:18', '0000-00-00 00:00:00'),
(222, 1533, 'assets/images/strains/Alien Dawg/alien-dawg__primary_9737.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(223, 1534, 'assets/images/strains/Cat Piss/cat-piss__primary_c4fd.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(224, 1535, 'assets/images/strains/Purple-chemdawg/purple-chemdawg-thc-petal-avg.png', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(225, 1535, 'assets/images/strains/Purple-chemdawg/purple-chemdawg__primary_3431.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(226, 1535, 'assets/images/strains/Purple-chemdawg/purple-chemdawg__primary_38f6.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(227, 1535, 'assets/images/strains/Purple-chemdawg/purple-chemdawg__primary_3fbe.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(228, 1535, 'assets/images/strains/Purple-chemdawg/purple-chemdawg__primary_5c59.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(229, 1535, 'assets/images/strains/Purple-chemdawg/purple-chemdawg__primary_5eaa.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(230, 1535, 'assets/images/strains/Purple-chemdawg/purple-chemdawg__primary_7edf.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(231, 1535, 'assets/images/strains/Purple-chemdawg/purple-chemdawg__primary_b7e2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(232, 1535, 'assets/images/strains/Purple-chemdawg/purple-chemdawg__primary_c8db.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(233, 1536, 'assets/images/strains/Snowcap/snowcap__primary_683a.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(234, 1536, 'assets/images/strains/Snowcap/snowcap__primary_7cda.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(235, 1536, 'assets/images/strains/Snowcap/snowcap__primary_9094.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(236, 1536, 'assets/images/strains/Snowcap/snowcap__primary_9ab9.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(237, 1536, 'assets/images/strains/Snowcap/snowcap__primary_9c85.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(238, 1536, 'assets/images/strains/Snowcap/snowcap__primary_ce0e.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(239, 1536, 'assets/images/strains/Snowcap/snowcap__primary_f8bc.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(240, 1537, 'assets/images/strains/Black Tuna/black-tuna__primary_1cfa.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(241, 1537, 'assets/images/strains/Black Tuna/black-tuna__primary_4ca1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(242, 1537, 'assets/images/strains/Black Tuna/black-tuna__primary_5d00.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(243, 1537, 'assets/images/strains/Black Tuna/black-tuna__primary_6136.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(244, 1537, 'assets/images/strains/Black Tuna/black-tuna__primary_7cba.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(245, 1537, 'assets/images/strains/Black Tuna/black-tuna__primary_7cdb.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(246, 1537, 'assets/images/strains/Black Tuna/black-tuna__primary_f558.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(247, 1540, 'assets/images/strains/OG Chem/og-chem__primary_1099.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(248, 1544, 'assets/images/strains/Mint-chocolate-chip/mint-chocolate-chip__primary_78fb.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(249, 1544, 'assets/images/strains/Mint-chocolate-chip/mint-chocolate-chip__primary_9854.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(250, 1545, 'assets/images/strains/Hippie Crippler/hippie-crippler__primary_186d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(251, 1545, 'assets/images/strains/Hippie Crippler/hippie-crippler__primary_2006.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(252, 1545, 'assets/images/strains/Hippie Crippler/hippie-crippler__primary_3a70.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(253, 1545, 'assets/images/strains/Hippie Crippler/hippie-crippler__primary_8377.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(254, 1545, 'assets/images/strains/Hippie Crippler/hippie-crippler__primary_8da1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(255, 1545, 'assets/images/strains/Hippie Crippler/hippie-crippler__primary_e437.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(256, 1545, 'assets/images/strains/Hippie Crippler/hippie-crippler__primary_ef0b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(257, 1546, 'assets/images/strains/Sour Banana Sherbet/sour-banana-sherbet__primary_0db4.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(258, 1548, 'assets/images/strains/Sugar Cookie/sugar-cookie__primary_8b9d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(259, 1549, 'assets/images/strains/Lavender-jones/lavender-jones_825x550_0b81.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(260, 1549, 'assets/images/strains/Lavender-jones/lavender-jones__primary_1114.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(261, 1549, 'assets/images/strains/Lavender-jones/lavender-jones__primary_211d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(262, 1549, 'assets/images/strains/Lavender-jones/lavender-jones__primary_7480.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(263, 1549, 'assets/images/strains/Lavender-jones/lavender-jones__primary_9ae0.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(264, 1549, 'assets/images/strains/Lavender-jones/lavender-jones__primary_ae89.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(265, 1552, 'assets/images/strains/Sour Kush/sour-kush__primary_cfb8.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(266, 1554, 'assets/images/strains/Garlic/garlic-bud__primary_b56b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(267, 1555, 'assets/images/strains/Larry Bird/larry-bird-kush__primary_45d2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(268, 1557, 'assets/images/strains/OG #18/og--18__primary_d98a.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(269, 1559, 'assets/images/strains/Cherry Bomb/cherry-bomb__primary_1287.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(270, 1559, 'assets/images/strains/Cherry Bomb/cherry-bomb__primary_1574.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(271, 1559, 'assets/images/strains/Cherry Bomb/cherry-bomb__primary_a587.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(272, 1559, 'assets/images/strains/Cherry Bomb/cherry-bomb__primary_bcaa.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(273, 1559, 'assets/images/strains/Cherry Bomb/cherry-bomb__primary_c780.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(274, 1559, 'assets/images/strains/Cherry Bomb/cherry-bomb__primary_f831.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(275, 1560, 'assets/images/strains/Sour-cookies/sour-cookies__primary_1b6f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(276, 1560, 'assets/images/strains/Sour-cookies/sour-cookies__primary_c04f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(277, 1560, 'assets/images/strains/Sour-cookies/sour-cookies__primary_d825.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(278, 1560, 'assets/images/strains/Sour-cookies/sour-cookies__primary_db8d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(279, 1560, 'assets/images/strains/Sour-cookies/sour-cookies__primary_f637.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(280, 1560, 'assets/images/strains/Sour-cookies/sour-cookies__primary_fd65.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(281, 1563, 'assets/images/strains/Wookie/wookie__primary_4297.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(282, 1565, 'assets/images/strains/Black Cherry Soda/black-cherry-soda__primary_37de.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(283, 1565, 'assets/images/strains/Black Cherry Soda/black-cherry-soda__primary_4704.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(284, 1565, 'assets/images/strains/Black Cherry Soda/black-cherry-soda__primary_9c62.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(285, 1565, 'assets/images/strains/Black Cherry Soda/black-cherry-soda__primary_b6f7.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(286, 1565, 'assets/images/strains/Black Cherry Soda/black-cherry-soda__primary_b8da.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(287, 1565, 'assets/images/strains/Black Cherry Soda/black-cherry-soda__primary_cfca.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(288, 1565, 'assets/images/strains/Black Cherry Soda/black-cherry-soda__primary_f03b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(289, 1567, 'assets/images/strains/King Tut/tutankhamon__primary_9206.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(290, 1568, 'assets/images/strains/Wappa/wappa__primary_159f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(291, 1568, 'assets/images/strains/Wappa/wappa__primary_1bc0.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(292, 1568, 'assets/images/strains/Wappa/wappa__primary_28f7.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(293, 1568, 'assets/images/strains/Wappa/wappa__primary_5a64.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(294, 1568, 'assets/images/strains/Wappa/wappa__primary_b187.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(295, 1569, 'assets/images/strains/Golden pineapple/golden-pineapple__primary_0ab6.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(296, 1569, 'assets/images/strains/Golden pineapple/golden-pineapple__primary_3de2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(297, 1569, 'assets/images/strains/Golden pineapple/golden-pineapple__primary_409f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(298, 1569, 'assets/images/strains/Golden pineapple/golden-pineapple__primary_6cc2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(299, 1569, 'assets/images/strains/Golden pineapple/golden-pineapple__primary_af69.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(300, 1569, 'assets/images/strains/Golden pineapple/golden-pineapple__primary_cba7.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(301, 1569, 'assets/images/strains/Golden pineapple/golden-pineapple__primary_cd44.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(302, 1570, 'assets/images/strains/Purple-diesel/purple-diesel__primary_1374.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(303, 1570, 'assets/images/strains/Purple-diesel/purple-diesel__primary_6264.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(304, 1570, 'assets/images/strains/Purple-diesel/purple-diesel__primary_739f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(305, 1570, 'assets/images/strains/Purple-diesel/purple-diesel__primary_7661.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(306, 1570, 'assets/images/strains/Purple-diesel/purple-diesel__primary_b57f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(307, 1570, 'assets/images/strains/Purple-diesel/purple-diesel__primary_c224.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(308, 1571, 'assets/images/strains/Bubblegum Kush/bubblegum-kush__primary_72f9.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(309, 1571, 'assets/images/strains/Bubblegum Kush/bubblegum-kush__primary_a2de.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(310, 1571, 'assets/images/strains/Bubblegum Kush/bubblegum-kush__primary_a54d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(311, 1571, 'assets/images/strains/Bubblegum Kush/bubblegum-kush__primary_bc42.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(312, 1571, 'assets/images/strains/Bubblegum Kush/bubblegum-kush__primary_c793.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(313, 1571, 'assets/images/strains/Bubblegum Kush/bubblegum-kush__primary_f00b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(314, 1571, 'assets/images/strains/Bubblegum Kush/bubblegum-kush__primary_f106.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(315, 1572, 'assets/images/strains/Hawaiian Haze/hawaiian-haze_825x550_84d1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(316, 1572, 'assets/images/strains/Hawaiian Haze/hawaiian-haze_825x550_8e6d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(317, 1572, 'assets/images/strains/Hawaiian Haze/hawaiian-haze_825x550_9956.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(318, 1572, 'assets/images/strains/Hawaiian Haze/hawaiian-haze__primary_0f08.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(319, 1572, 'assets/images/strains/Hawaiian Haze/hawaiian-haze__primary_4fbd.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(320, 1572, 'assets/images/strains/Hawaiian Haze/hawaiian-haze__primary_e179.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(321, 1574, 'assets/images/strains/Og Shark/og-shark__primary_3ebd.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(322, 1574, 'assets/images/strains/Og Shark/og-shark__primary_5465.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(323, 1574, 'assets/images/strains/Og Shark/og-shark__primary_6285.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(324, 1574, 'assets/images/strains/Og Shark/og-shark__primary_a792.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(325, 1574, 'assets/images/strains/Og Shark/og-shark__primary_d1dd.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(326, 1574, 'assets/images/strains/Og Shark/og-shark__primary_e21a.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(327, 1574, 'assets/images/strains/Og Shark/og-shark__primary_f3e9.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(328, 1574, 'assets/images/strains/Og Shark/og-shark__primary_fb04.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:19', '0000-00-00 00:00:00'),
(329, 1576, 'assets/images/strains/Alien Rock Candy/alien-rock-candy__primary_1c74.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(330, 1576, 'assets/images/strains/Alien Rock Candy/alien-rock-candy__primary_3286.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(331, 1576, 'assets/images/strains/Alien Rock Candy/alien-rock-candy__primary_4b8f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(332, 1576, 'assets/images/strains/Alien Rock Candy/alien-rock-candy__primary_5919.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(333, 1576, 'assets/images/strains/Alien Rock Candy/alien-rock-candy__primary_8c15.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(334, 1576, 'assets/images/strains/Alien Rock Candy/alien-rock-candy__primary_91b1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(335, 1576, 'assets/images/strains/Alien Rock Candy/alien-rock-candy__primary_b760.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(336, 1576, 'assets/images/strains/Alien Rock Candy/alien-rock-candy__primary_bccd.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(337, 1576, 'assets/images/strains/Alien Rock Candy/alien-rock-candy__primary_ce97.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(338, 1578, 'assets/images/strains/Rudeboi-og/rudeboi-og__primary_0c48.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(339, 1578, 'assets/images/strains/Rudeboi-og/rudeboi-og__primary_ee01.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(340, 1579, 'assets/images/strains/Shishkaberry/shishkaberry__primary_3508.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(341, 1579, 'assets/images/strains/Shishkaberry/shishkaberry__primary_a095.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(342, 1579, 'assets/images/strains/Shishkaberry/shishkaberry__primary_a8c6.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(343, 1579, 'assets/images/strains/Shishkaberry/shishkaberry__primary_aedc.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(344, 1579, 'assets/images/strains/Shishkaberry/shishkaberry__primary_c4f0.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(345, 1580, 'assets/images/strains/Mob-boss/mob-boss__primary_1212.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(346, 1580, 'assets/images/strains/Mob-boss/mob-boss__primary_2932.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(347, 1580, 'assets/images/strains/Mob-boss/mob-boss__primary_48f4.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(348, 1580, 'assets/images/strains/Mob-boss/mob-boss__primary_55dd.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(349, 1580, 'assets/images/strains/Mob-boss/mob-boss__primary_a233.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(350, 1580, 'assets/images/strains/Mob-boss/mob-boss__primary_baab.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(351, 1580, 'assets/images/strains/Mob-boss/mob-boss__primary_d36f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(352, 1581, 'assets/images/strains/Star-killer/star-killer__primary_0138.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00');
INSERT INTO `strain_gallery` (`id`, `strain_id`, `path`, `extension`, `name`, `index`, `created_at`, `updated_at`) VALUES
(353, 1581, 'assets/images/strains/Star-killer/star-killer__primary_16a9.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(354, 1581, 'assets/images/strains/Star-killer/star-killer__primary_86f6.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(355, 1581, 'assets/images/strains/Star-killer/star-killer__primary_9893.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(356, 1581, 'assets/images/strains/Star-killer/star-killer__primary_a286.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(357, 1581, 'assets/images/strains/Star-killer/star-killer__primary_a577.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(358, 1581, 'assets/images/strains/Star-killer/star-killer__primary_aa79.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(359, 1581, 'assets/images/strains/Star-killer/star-killer__primary_e90b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(360, 1583, 'assets/images/strains/Orange-bud/orange-bud__primary_2611.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(361, 1583, 'assets/images/strains/Orange-bud/orange-bud__primary_36a5.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(362, 1583, 'assets/images/strains/Orange-bud/orange-bud__primary_3c67.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(363, 1583, 'assets/images/strains/Orange-bud/orange-bud__primary_48d8.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(364, 1583, 'assets/images/strains/Orange-bud/orange-bud__primary_6d67.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(365, 1583, 'assets/images/strains/Orange-bud/orange-bud__primary_daf8.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(366, 1585, 'assets/images/strains/Paris-og/paris-og__primary_08ca.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(367, 1585, 'assets/images/strains/Paris-og/paris-og__primary_38e2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(368, 1585, 'assets/images/strains/Paris-og/paris-og__primary_43f3.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(369, 1585, 'assets/images/strains/Paris-og/paris-og__primary_6dcb.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(370, 1585, 'assets/images/strains/Paris-og/paris-og__primary_9c84.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(371, 1585, 'assets/images/strains/Paris-og/paris-og__primary_a8f8.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(372, 1586, 'assets/images/strains/Ecto Cooler/ecto-cooler__primary_8b5d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(373, 1586, 'assets/images/strains/Ecto Cooler/ecto-cooler__primary_bb0b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(374, 1588, 'assets/images/strains/Nuken/nuken__primary_3071.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(375, 1588, 'assets/images/strains/Nuken/nuken__primary_3da2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(376, 1588, 'assets/images/strains/Nuken/nuken__primary_4c0c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(377, 1588, 'assets/images/strains/Nuken/nuken__primary_55c5.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(378, 1588, 'assets/images/strains/Nuken/nuken__primary_74b3.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(379, 1588, 'assets/images/strains/Nuken/nuken__primary_ca5e.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(380, 1590, 'assets/images/strains/Jenny Kush/jenny-kush__primary_0fc1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(381, 1590, 'assets/images/strains/Jenny Kush/jenny-kush__primary_5fcd.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(382, 1590, 'assets/images/strains/Jenny Kush/jenny-kush__primary_65c9.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(383, 1590, 'assets/images/strains/Jenny Kush/jenny-kush__primary_c7e2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(384, 1591, 'assets/images/strains/G13 Haze/g13-haze__primary_3d99.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(385, 1591, 'assets/images/strains/G13 Haze/g13-haze__primary_7b48.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(386, 1591, 'assets/images/strains/G13 Haze/g13-haze__primary_9fb4.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(387, 1591, 'assets/images/strains/G13 Haze/g13-haze__primary_cf93.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(388, 1591, 'assets/images/strains/G13 Haze/g13-haze__primary_ff9a.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(389, 1592, 'assets/images/strains/Cannalope Haze/cannalope-haze_825x550_7ebf.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(390, 1592, 'assets/images/strains/Cannalope Haze/cannalope-haze_825x550_937b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(391, 1592, 'assets/images/strains/Cannalope Haze/cannalope-haze__primary_167b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(392, 1592, 'assets/images/strains/Cannalope Haze/cannalope-haze__primary_243c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(393, 1592, 'assets/images/strains/Cannalope Haze/cannalope-haze__primary_2479.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(394, 1592, 'assets/images/strains/Cannalope Haze/cannalope-haze__primary_3585.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(395, 1592, 'assets/images/strains/Cannalope Haze/cannalope-haze__primary_af74.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(396, 1592, 'assets/images/strains/Cannalope Haze/cannalope-haze__primary_edc2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(397, 1593, 'assets/images/strains/Purple-panty-dropper/purple-panty-dropper__primary_139f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(398, 1593, 'assets/images/strains/Purple-panty-dropper/purple-panty-dropper__primary_55ff.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(399, 1593, 'assets/images/strains/Purple-panty-dropper/purple-panty-dropper__primary_5cf7.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(400, 1593, 'assets/images/strains/Purple-panty-dropper/purple-panty-dropper__primary_b832.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(401, 1595, 'assets/images/strains/Jean Guy/jean-guy__primary_b6cf.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(402, 1595, 'assets/images/strains/Jean Guy/jean-guy__primary_cb92.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(403, 1595, 'assets/images/strains/Jean Guy/jean-guy__primary_e5f1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(404, 1595, 'assets/images/strains/Jean Guy/jean-guy__primary_e765.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(405, 1597, 'assets/images/strains/Black Cherry Og/black-cherry-og__primary_4ec8.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(406, 1597, 'assets/images/strains/Black Cherry Og/black-cherry-og__primary_5e75.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(407, 1597, 'assets/images/strains/Black Cherry Og/black-cherry-og__primary_9341.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(408, 1597, 'assets/images/strains/Black Cherry Og/black-cherry-og__primary_a19e.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(409, 1597, 'assets/images/strains/Black Cherry Og/black-cherry-og__primary_b8ec.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(410, 1598, 'assets/images/strains/Rollex-og-kush/rollex-og-kush__primary_2a1e.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(411, 1598, 'assets/images/strains/Rollex-og-kush/rollex-og-kush__primary_395c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(412, 1598, 'assets/images/strains/Rollex-og-kush/rollex-og-kush__primary_4a00.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(413, 1598, 'assets/images/strains/Rollex-og-kush/rollex-og-kush__primary_de8c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(414, 1600, 'assets/images/strains/Colombian Gold/colombian-gold__primary_2309.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(415, 1600, 'assets/images/strains/Colombian Gold/colombian-gold__primary_260d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(416, 1600, 'assets/images/strains/Colombian Gold/colombian-gold__primary_bec8.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(417, 1600, 'assets/images/strains/Colombian Gold/colombian-gold__primary_fd7d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(418, 1601, 'assets/images/strains/Lemon-g/lemon-g_825x550_7205.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(419, 1601, 'assets/images/strains/Lemon-g/lemon-g_825x550_8bde.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(420, 1601, 'assets/images/strains/Lemon-g/lemon-g_825x550_ca5b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(421, 1601, 'assets/images/strains/Lemon-g/lemon-g_825x550_e742.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(422, 1601, 'assets/images/strains/Lemon-g/lemon-g__primary_2d3d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(423, 1601, 'assets/images/strains/Lemon-g/lemon-g__primary_3403.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(424, 1603, 'assets/images/strains/Cherry Kush/cherry-kush__primary_2596.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(425, 1603, 'assets/images/strains/Cherry Kush/cherry-kush__primary_545c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(426, 1603, 'assets/images/strains/Cherry Kush/cherry-kush__primary_5ba6.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(427, 1603, 'assets/images/strains/Cherry Kush/cherry-kush__primary_794b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(428, 1603, 'assets/images/strains/Cherry Kush/cherry-kush__primary_81fb.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(429, 1603, 'assets/images/strains/Cherry Kush/cherry-kush__primary_f9a6.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(430, 1604, 'assets/images/strains/Royal-highness/royal-highness__primary_5370.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(431, 1604, 'assets/images/strains/Royal-highness/royal-highness__primary_e01f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(432, 1604, 'assets/images/strains/Royal-highness/royal-highness__primary_faea.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(433, 1610, 'assets/images/strains/Cold Creek Kush/cold-creek-kush_825x550_36c5.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(434, 1610, 'assets/images/strains/Cold Creek Kush/cold-creek-kush_825x550_d0da.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(435, 1610, 'assets/images/strains/Cold Creek Kush/cold-creek-kush_825x550_edc1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(436, 1610, 'assets/images/strains/Cold Creek Kush/cold-creek-kush__primary_51c8.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(437, 1611, 'assets/images/strains/Purple-hindu-kush/purple-hindu-kush__primary_34a4.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(438, 1611, 'assets/images/strains/Purple-hindu-kush/purple-hindu-kush__primary_511d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(439, 1611, 'assets/images/strains/Purple-hindu-kush/purple-hindu-kush__primary_60d4.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(440, 1611, 'assets/images/strains/Purple-hindu-kush/purple-hindu-kush__primary_98b3.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(441, 1611, 'assets/images/strains/Purple-hindu-kush/purple-hindu-kush__primary_b7b2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(442, 1611, 'assets/images/strains/Purple-hindu-kush/purple-hindu-kush__primary_d02d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(443, 1611, 'assets/images/strains/Purple-hindu-kush/purple-hindu-kush__primary_fc9e.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(444, 1612, 'assets/images/strains/Chocolate Kush/chocolate-kush__primary_1515.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(445, 1612, 'assets/images/strains/Chocolate Kush/chocolate-kush__primary_b3df.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(446, 1612, 'assets/images/strains/Chocolate Kush/chocolate-kush__primary_d306.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(447, 1612, 'assets/images/strains/Chocolate Kush/chocolate-kush__primary_ff62.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(448, 1613, 'assets/images/strains/Yoda-og/yoda-og__primary_0c5c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(449, 1613, 'assets/images/strains/Yoda-og/yoda-og__primary_a143.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(450, 1613, 'assets/images/strains/Yoda-og/yoda-og__primary_d530.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(451, 1613, 'assets/images/strains/Yoda-og/yoda-og__primary_d7a5.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(452, 1613, 'assets/images/strains/Yoda-og/yoda-og__primary_fc3f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:20', '0000-00-00 00:00:00'),
(453, 1618, 'assets/images/strains/Lemonhead-og/lemonhead-og__primary_16da.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(454, 1618, 'assets/images/strains/Lemonhead-og/lemonhead-og__primary_21cd.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(455, 1618, 'assets/images/strains/Lemonhead-og/lemonhead-og__primary_52ec.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(456, 1619, 'assets/images/strains/Red-headed-stranger/red-headed-stranger__primary_0d34.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(457, 1619, 'assets/images/strains/Red-headed-stranger/red-headed-stranger__primary_3598.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(458, 1619, 'assets/images/strains/Red-headed-stranger/red-headed-stranger__primary_c981.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(459, 1622, 'assets/images/strains/Panama-red/Panama-Red_800x600_2glgt54p.rvi.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(460, 1622, 'assets/images/strains/Panama-red/panama-red_825x550_ee50.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(461, 1622, 'assets/images/strains/Panama-red/panama-red__primary_0d77.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(462, 1622, 'assets/images/strains/Panama-red/panama-red__primary_451d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(463, 1622, 'assets/images/strains/Panama-red/panama-red__primary_7f05.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(464, 1622, 'assets/images/strains/Panama-red/panama-red__primary_a56a.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(465, 1622, 'assets/images/strains/Panama-red/panama-red__primary_c8eb.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(466, 1622, 'assets/images/strains/Panama-red/panama-red__primary_cac1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(467, 1622, 'assets/images/strains/Panama-red/panama-red__primary_e6cd.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(468, 1623, 'assets/images/strains/Flo/flo__primary_2e69.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(469, 1623, 'assets/images/strains/Flo/flo__primary_62a2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(470, 1623, 'assets/images/strains/Flo/flo__primary_a7b2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(471, 1624, 'assets/images/strains/Cherry Og/cherry-og__primary_29fb.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(472, 1624, 'assets/images/strains/Cherry Og/cherry-og__primary_38ef.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(473, 1624, 'assets/images/strains/Cherry Og/cherry-og__primary_5995.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(474, 1624, 'assets/images/strains/Cherry Og/cherry-og__primary_5e7c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(475, 1624, 'assets/images/strains/Cherry Og/cherry-og__primary_b7c0.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(476, 1624, 'assets/images/strains/Cherry Og/cherry-og__primary_c0c1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(477, 1624, 'assets/images/strains/Cherry Og/cherry-og__primary_e6a5.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(478, 1625, 'assets/images/strains/Hellfire Og/hellfire-og__primary_3a30.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(479, 1625, 'assets/images/strains/Hellfire Og/hellfire-og__primary_4edd.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(480, 1625, 'assets/images/strains/Hellfire Og/hellfire-og__primary_9332.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(481, 1625, 'assets/images/strains/Hellfire Og/hellfire-og__primary_9ccf.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(482, 1626, 'assets/images/strains/Green Goblin/Green-Goblin_825x550_bi3qqeke.ix4.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(483, 1626, 'assets/images/strains/Green Goblin/green-goblin_825x550_b732.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(484, 1626, 'assets/images/strains/Green Goblin/green-goblin__primary_17b7.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(485, 1626, 'assets/images/strains/Green Goblin/green-goblin__primary_2edb.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(486, 1626, 'assets/images/strains/Green Goblin/green-goblin__primary_5eec.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(487, 1626, 'assets/images/strains/Green Goblin/green-goblin__primary_8863.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(488, 1627, 'assets/images/strains/Kali-mist/kali-mist__primary_204a.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(489, 1627, 'assets/images/strains/Kali-mist/kali-mist__primary_5eda.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(490, 1627, 'assets/images/strains/Kali-mist/kali-mist__primary_892d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(491, 1627, 'assets/images/strains/Kali-mist/kali-mist__primary_992b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(492, 1627, 'assets/images/strains/Kali-mist/kali-mist__primary_d0cc.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(493, 1627, 'assets/images/strains/Kali-mist/kali-mist__primary_d474.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(494, 1627, 'assets/images/strains/Kali-mist/kali-mist__primary_e619.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(495, 1629, 'assets/images/strains/Sour-grape/sour-grape__primary_095e.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(496, 1629, 'assets/images/strains/Sour-grape/sour-grape__primary_22e2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(497, 1629, 'assets/images/strains/Sour-grape/sour-grape__primary_35da.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(498, 1629, 'assets/images/strains/Sour-grape/sour-grape__primary_3d29.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(499, 1629, 'assets/images/strains/Sour-grape/sour-grape__primary_5caf.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(500, 1629, 'assets/images/strains/Sour-grape/sour-grape__primary_b94c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(501, 1629, 'assets/images/strains/Sour-grape/sour-grape__primary_f017.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(502, 1630, 'assets/images/strains/Pineapple-og/pineapple-og__primary_0851.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(503, 1630, 'assets/images/strains/Pineapple-og/pineapple-og__primary_0d16.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(504, 1630, 'assets/images/strains/Pineapple-og/pineapple-og__primary_7e96.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(505, 1630, 'assets/images/strains/Pineapple-og/pineapple-og__primary_99f2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(506, 1630, 'assets/images/strains/Pineapple-og/pineapple-og__primary_d16f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(507, 1631, 'assets/images/strains/Alien Kush/alien-kush_825x550_7169.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(508, 1631, 'assets/images/strains/Alien Kush/alien-kush_825x550_9c41.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(509, 1631, 'assets/images/strains/Alien Kush/alien-kush__primary_0882.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(510, 1631, 'assets/images/strains/Alien Kush/alien-kush__primary_5b3d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(511, 1631, 'assets/images/strains/Alien Kush/alien-kush__primary_80f0.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(512, 1631, 'assets/images/strains/Alien Kush/alien-kush__primary_baa1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(513, 1631, 'assets/images/strains/Alien Kush/alien-kush__primary_c8b7.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(514, 1632, 'assets/images/strains/Big Smooth/big-smooth__primary_74b3.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(515, 1632, 'assets/images/strains/Big Smooth/big-smooth__primary_828c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(516, 1633, 'assets/images/strains/Pennywise/pennywise__primary_2d87.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(517, 1633, 'assets/images/strains/Pennywise/pennywise__primary_658f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(518, 1633, 'assets/images/strains/Pennywise/pennywise__primary_8379.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(519, 1633, 'assets/images/strains/Pennywise/pennywise__primary_8be7.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(520, 1633, 'assets/images/strains/Pennywise/pennywise__primary_96a9.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(521, 1633, 'assets/images/strains/Pennywise/pennywise__primary_f6b5.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(522, 1638, 'assets/images/strains/Fruit Loops/fruit-loops__primary_2500.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(523, 1638, 'assets/images/strains/Fruit Loops/fruit-loops__primary_2d86.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(524, 1638, 'assets/images/strains/Fruit Loops/fruit-loops__primary_ad10.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(525, 1638, 'assets/images/strains/Fruit Loops/fruit-loops__primary_bbed.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(526, 1638, 'assets/images/strains/Fruit Loops/fruit-loops__primary_ee6e.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(527, 1639, 'assets/images/strains/El-chapo Og/el-chapo-og__primary_0ecc.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(528, 1639, 'assets/images/strains/El-chapo Og/el-chapo-og__primary_3e27.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(529, 1639, 'assets/images/strains/El-chapo Og/el-chapo-og__primary_ceb2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(530, 1639, 'assets/images/strains/El-chapo Og/el-chapo-og__primary_d20b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(531, 1640, 'assets/images/strains/Afgoo/afgoo__primary_0a37.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(532, 1640, 'assets/images/strains/Afgoo/afgoo__primary_32b2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(533, 1640, 'assets/images/strains/Afgoo/afgoo__primary_6615.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(534, 1640, 'assets/images/strains/Afgoo/afgoo__primary_6b4c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(535, 1640, 'assets/images/strains/Afgoo/afgoo__primary_8a5c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(536, 1640, 'assets/images/strains/Afgoo/afgoo__primary_92f8.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(537, 1640, 'assets/images/strains/Afgoo/afgoo__primary_98cd.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(538, 1646, 'assets/images/strains/Dutch Hawaiian/dutch-hawaiian__primary_17bb.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(539, 1646, 'assets/images/strains/Dutch Hawaiian/dutch-hawaiian__primary_677e.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(540, 1646, 'assets/images/strains/Dutch Hawaiian/dutch-hawaiian__primary_a753.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(541, 1646, 'assets/images/strains/Dutch Hawaiian/dutch-hawaiian__primary_e87f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(542, 1646, 'assets/images/strains/Dutch Hawaiian/dutch-hawaiian__primary_f2b0.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(543, 1646, 'assets/images/strains/Dutch Hawaiian/dutch-hawaiian__primary_f42e.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(544, 1647, 'assets/images/strains/Extreme Cream/extreme-cream__primary_4eb4.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(545, 1647, 'assets/images/strains/Extreme Cream/extreme-cream__primary_7ffc.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(546, 1647, 'assets/images/strains/Extreme Cream/extreme-cream__primary_b440.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(547, 1647, 'assets/images/strains/Extreme Cream/extreme-cream__primary_f055.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(548, 1649, 'assets/images/strains/Champagne Kush/champagne-kush_825x550_5c0a.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(549, 1649, 'assets/images/strains/Champagne Kush/champagne-kush_825x550_78d4.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(550, 1649, 'assets/images/strains/Champagne Kush/champagne-kush_825x550_b773.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(551, 1649, 'assets/images/strains/Champagne Kush/champagne-kush_825x550_e686.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(552, 1649, 'assets/images/strains/Champagne Kush/champagne-kush__primary_6403.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(553, 1649, 'assets/images/strains/Champagne Kush/champagne-kush__primary_6972.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(554, 1649, 'assets/images/strains/Champagne Kush/champagne-kush__primary_6cd0.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(555, 1649, 'assets/images/strains/Champagne Kush/champagne-kush__primary_ea07.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(556, 1650, 'assets/images/strains/Phantom-cookies/phantom-cookies__primary_0f03.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(557, 1650, 'assets/images/strains/Phantom-cookies/phantom-cookies__primary_1ee7.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(558, 1650, 'assets/images/strains/Phantom-cookies/phantom-cookies__primary_963d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(559, 1650, 'assets/images/strains/Phantom-cookies/phantom-cookies__primary_96c3.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(560, 1650, 'assets/images/strains/Phantom-cookies/phantom-cookies__primary_a9a6.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(561, 1650, 'assets/images/strains/Phantom-cookies/phantom-cookies__primary_c1bf.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(562, 1650, 'assets/images/strains/Phantom-cookies/phantom-cookies__primary_c8b6.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(563, 1650, 'assets/images/strains/Phantom-cookies/phantom-cookies__primary_e6c1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(564, 1650, 'assets/images/strains/Phantom-cookies/phantom-cookies__primary_e86a.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(565, 1652, 'assets/images/strains/Hardcore OG/hardcore-og__primary_0edb.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(566, 1652, 'assets/images/strains/Hardcore OG/hardcore-og__primary_8ebf.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(567, 1652, 'assets/images/strains/Hardcore OG/hardcore-og__primary_93e6.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(568, 1652, 'assets/images/strains/Hardcore OG/hardcore-og__primary_e9ff.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(569, 1655, 'assets/images/strains/Cream Caramel/cream-caramel__primary_0d4f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(570, 1655, 'assets/images/strains/Cream Caramel/cream-caramel__primary_6465.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(571, 1655, 'assets/images/strains/Cream Caramel/cream-caramel__primary_78be.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(572, 1655, 'assets/images/strains/Cream Caramel/cream-caramel__primary_8607.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(573, 1655, 'assets/images/strains/Cream Caramel/cream-caramel__primary_d06c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(574, 1655, 'assets/images/strains/Cream Caramel/cream-caramel__primary_db02.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(575, 1655, 'assets/images/strains/Cream Caramel/cream-caramel__primary_e403.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(576, 1655, 'assets/images/strains/Cream Caramel/cream-caramel__primary_fe88.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(577, 1656, 'assets/images/strains/Blueberry Og/blueberry-og__primary_03b5.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(578, 1656, 'assets/images/strains/Blueberry Og/blueberry-og__primary_0722.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(579, 1656, 'assets/images/strains/Blueberry Og/blueberry-og__primary_08b2.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(580, 1656, 'assets/images/strains/Blueberry Og/blueberry-og__primary_1c9f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:21', '0000-00-00 00:00:00'),
(581, 1660, 'assets/images/strains/Blueberry Haze/blueberry-haze__primary_0aa9.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(582, 1660, 'assets/images/strains/Blueberry Haze/blueberry-haze__primary_0b9f.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(583, 1660, 'assets/images/strains/Blueberry Haze/blueberry-haze__primary_258d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(584, 1660, 'assets/images/strains/Blueberry Haze/blueberry-haze__primary_5103.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(585, 1660, 'assets/images/strains/Blueberry Haze/blueberry-haze__primary_601c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(586, 1660, 'assets/images/strains/Blueberry Haze/blueberry-haze__primary_6a03.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(587, 1660, 'assets/images/strains/Blueberry Haze/blueberry-haze__primary_9a3c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(588, 1660, 'assets/images/strains/Blueberry Haze/blueberry-haze__primary_9c24.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(589, 1660, 'assets/images/strains/Blueberry Haze/blueberry-haze__primary_a704.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(590, 1660, 'assets/images/strains/Blueberry Haze/blueberry-haze__primary_ee4c.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(591, 1666, 'assets/images/strains/Tutti-frutti/tutti-frutti__primary_37b9.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(592, 1666, 'assets/images/strains/Tutti-frutti/tutti-frutti__primary_3d57.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(593, 1666, 'assets/images/strains/Tutti-frutti/tutti-frutti__primary_69fd.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(594, 1666, 'assets/images/strains/Tutti-frutti/tutti-frutti__primary_8804.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(595, 1666, 'assets/images/strains/Tutti-frutti/tutti-frutti__primary_b1df.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(596, 1695, 'assets/images/strains/Royal-kush/royal-kush__primary_424e.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(597, 1695, 'assets/images/strains/Royal-kush/royal-kush__primary_a9f3.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(598, 1695, 'assets/images/strains/Royal-kush/royal-kush__primary_b8c0.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(599, 1695, 'assets/images/strains/Royal-kush/royal-kush__primary_dfbf.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(600, 1695, 'assets/images/strains/Royal-kush/royal-kush__primary_e1f1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(601, 1695, 'assets/images/strains/Royal-kush/royal-kush__primary_f83b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(602, 1700, 'assets/images/strains/Crunch Berry Kush/crunch-berry-kush__primary_4420.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(603, 1700, 'assets/images/strains/Crunch Berry Kush/crunch-berry-kush__primary_f3f1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(604, 1700, 'assets/images/strains/Crunch Berry Kush/crunch-berry-kush__primary_f45b.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(605, 1701, 'assets/images/strains/Lodi-dodi/lodi-dodi__primary_3536.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(606, 1701, 'assets/images/strains/Lodi-dodi/lodi-dodi__primary_9212.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(607, 1701, 'assets/images/strains/Lodi-dodi/lodi-dodi__primary_9a78.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:22', '0000-00-00 00:00:00'),
(608, 1703, 'assets/images/strains/Blue Frost/blue-frost__primary_34cc.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:23', '0000-00-00 00:00:00'),
(609, 1703, 'assets/images/strains/Blue Frost/blue-frost__primary_61ed.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:23', '0000-00-00 00:00:00'),
(610, 1703, 'assets/images/strains/Blue Frost/blue-frost__primary_81d0.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:23', '0000-00-00 00:00:00'),
(611, 1703, 'assets/images/strains/Blue Frost/blue-frost__primary_9c37.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:23', '0000-00-00 00:00:00'),
(612, 1703, 'assets/images/strains/Blue Frost/blue-frost__primary_aaa9.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:23', '0000-00-00 00:00:00'),
(613, 1703, 'assets/images/strains/Blue Frost/blue-frost__primary_e866.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:23', '0000-00-00 00:00:00'),
(614, 1703, 'assets/images/strains/Blue Frost/blue-frost__primary_f0e1.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:23', '0000-00-00 00:00:00'),
(615, 1751, 'assets/images/strains/Lime-skunk/lime-skunk__primary_0b28.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:24', '0000-00-00 00:00:00'),
(616, 1751, 'assets/images/strains/Lime-skunk/lime-skunk__primary_8fc7.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:24', '0000-00-00 00:00:00'),
(617, 1751, 'assets/images/strains/Lime-skunk/lime-skunk__primary_92d6.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:24', '0000-00-00 00:00:00'),
(618, 1754, 'assets/images/strains/Critical jack/critical-jack__primary_06a4.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:24', '0000-00-00 00:00:00'),
(619, 1754, 'assets/images/strains/Critical jack/critical-jack__primary_0e99.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:24', '0000-00-00 00:00:00'),
(620, 1754, 'assets/images/strains/Critical jack/critical-jack__primary_a725.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:24', '0000-00-00 00:00:00'),
(621, 1754, 'assets/images/strains/Critical jack/critical-jack__primary_b430.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:24', '0000-00-00 00:00:00'),
(622, 1754, 'assets/images/strains/Critical jack/critical-jack__primary_cdd4.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:24', '0000-00-00 00:00:00'),
(623, 1754, 'assets/images/strains/Critical jack/critical-jack__primary_e1b4.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:24', '0000-00-00 00:00:00'),
(624, 1764, 'assets/images/strains/Slimer-og/slimer-og__primary_181d.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:24', '0000-00-00 00:00:00'),
(625, 1764, 'assets/images/strains/Slimer-og/slimer-og__primary_37d8.jpg', 'jpg', '1.jpg', 0, '2021-03-04 20:05:24', '0000-00-00 00:00:00'),
(626, 2286, '/assets/images/strains/2286/top/2286_logo.jpg', 'png', '2286_logo.jpg', 1, '2021-03-05 20:30:04', '2021-03-05 20:30:04'),
(627, 2289, '/assets/images/strains/2289/top/2289_logo.jpg', 'png', '2289_logo.jpg', 1, '2021-03-05 20:32:45', '2021-03-05 20:32:45'),
(628, 2291, '/assets/images/strains/2291/top/2291_logo.jpg', 'png', '2291_logo.jpg', 1, '2021-03-05 20:34:03', '2021-03-05 20:34:03'),
(629, 2294, '/assets/images/strains/2294/top/2294_logo.jpg', 'png', '2294_logo.jpg', 1, '2021-03-05 21:19:15', '2021-03-05 21:19:15'),
(630, 2295, '/assets/images/strains/2295/top/2295_logo.jpg', 'png', '2295_logo.jpg', 1, '2021-03-05 21:24:16', '2021-03-05 21:24:16'),
(631, 2296, '/assets/images/strains/2296/top/2296_logo.jpg', 'png', '2296_logo.jpg', 1, '2021-03-08 22:16:31', '2021-03-08 22:16:31'),
(632, 2299, '/assets/images/strains/2299/top/2299_logo.jpg', 'png', '2299_logo.jpg', 1, '2021-03-08 22:18:31', '2021-03-08 22:18:31'),
(633, 2301, '/assets/images/strains/2301/top/2301_logo.jpg', 'png', '2301_logo.jpg', 1, '2021-03-08 22:19:23', '2021-03-08 22:19:23'),
(634, 2302, '/assets/images/strains/2302/top/2302_logo.jpg', 'png', '2302_logo.jpg', 1, '2021-03-08 22:19:36', '2021-03-08 22:19:36'),
(635, 2303, '/assets/images/strains/2303/top/2303_logo.jpg', 'png', '2303_logo.jpg', 1, '2021-03-08 22:19:49', '2021-03-08 22:19:49'),
(636, 2306, '/assets/images/strains/2306/top/2306_logo.jpg', 'png', '2306_logo.jpg', 1, '2021-03-09 01:29:26', '2021-03-09 01:29:26'),
(637, 2307, '/assets/images/strains/2307/top/2307_logo.jpg', 'png', '2307_logo.jpg', 1, '2021-03-09 01:29:44', '2021-03-09 01:29:44'),
(638, 2308, '/assets/images/strains/2308/top/2308_logo.jpg', 'png', '2308_logo.jpg', 1, '2021-03-09 01:35:02', '2021-03-09 01:35:02'),
(639, 2309, '/assets/images/strains/2309/top/2309_logo.jpg', 'png', '2309_logo.jpg', 1, '2021-03-09 01:36:40', '2021-03-09 01:36:40'),
(640, 2310, '/assets/images/strains/2310/top/2310_logo.jpg', 'png', '2310_logo.jpg', 1, '2021-03-09 01:39:19', '2021-03-09 01:39:19'),
(641, 2311, '/assets/images/strains/2311/top/2311_logo.jpg', 'png', '2311_logo.jpg', 1, '2021-03-09 01:45:16', '2021-03-09 01:45:16'),
(642, 2312, '/assets/images/strains/2312/top/2312_logo.jpg', 'png', '2312_logo.jpg', 1, '2021-03-09 04:01:13', '2021-03-09 04:01:13'),
(643, 2313, '/assets/images/strains/2313/top/2313_logo.jpg', 'png', '2313_logo.jpg', 1, '2021-03-09 04:01:53', '2021-03-09 04:01:53'),
(644, 2314, '/assets/images/strains/2314/top/2314_logo.jpg', 'png', '2314_logo.jpg', 1, '2021-03-09 05:03:53', '2021-03-09 05:03:53'),
(645, 2315, '/assets/images/strains/2315/top/2315_logo.jpg', 'png', '2315_logo.jpg', 1, '2021-03-09 05:06:43', '2021-03-09 05:06:43'),
(646, 2316, '/assets/images/strains/2316/top/2316_logo.jpg', 'png', '2316_logo.jpg', 1, '2021-03-09 05:07:13', '2021-03-09 05:07:13'),
(647, 2317, '/assets/images/strains/2317/top/2317_logo.jpg', 'png', '2317_logo.jpg', 1, '2021-03-10 02:22:33', '2021-03-10 02:22:33'),
(648, 2318, '/assets/images/strains/2318/top/2318_logo.jpg', 'png', '2318_logo.jpg', 1, '2021-03-10 02:22:46', '2021-03-10 02:22:46'),
(649, 2319, '/assets/images/strains/2319/top/2319_logo.jpg', 'png', '2319_logo.jpg', 1, '2021-03-10 02:23:39', '2021-03-10 02:23:39'),
(650, 2320, '/assets/images/strains/2320/top/2320_logo.jpg', 'png', '2320_logo.jpg', 1, '2021-03-10 02:23:51', '2021-03-10 02:23:51'),
(651, 2321, '/assets/images/strains/2321/top/2321_logo.jpg', 'png', '2321_logo.jpg', 1, '2021-03-10 05:37:52', '2021-03-10 05:37:52'),
(652, 2321, '/assets/images/strains/2321/top/2321_0.png', 'png', '2321_0.png', 0, '2021-03-10 05:37:52', '2021-03-10 05:37:52'),
(653, 2322, '/assets/images/strains/2322/top/2322_logo.jpg', 'png', '2322_logo.jpg', 1, '2021-03-10 05:38:49', '2021-03-10 05:38:49'),
(654, 2323, '/assets/images/strains/2323/top/2323_logo.jpg', 'png', '2323_logo.jpg', 1, '2021-03-10 05:39:00', '2021-03-10 05:39:00'),
(655, 2324, '/assets/images/strains/2324/top/2324_logo.jpg', 'png', '2324_logo.jpg', 1, '2021-03-10 05:39:10', '2021-03-10 05:39:10'),
(656, 458, 'assets/images/strains/458/top/458_logo.jpg', 'png', '458_logo.jpg', 1, '2021-03-10 05:43:14', '2021-03-10 05:43:14'),
(657, 2324, 'assets/images/strains/2324/top/2324_657.jpg', 'png', '2324_657.jpg', 0, '2021-03-10 22:51:15', '2021-03-10 22:51:15');

-- --------------------------------------------------------

--
-- Table structure for table `strain_gallery_temp`
--

CREATE TABLE `strain_gallery_temp` (
  `id` int(11) NOT NULL,
  `strain_temp_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `strain_temp`
--

CREATE TABLE `strain_temp` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `strain_id` int(11) DEFAULT NULL,
  `effect` longtext NOT NULL,
  `description` longtext NOT NULL,
  `parent` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(191) NOT NULL,
  `category_id` int(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `cod` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `user_id`, `name`, `slug`, `status`, `cod`) VALUES
(2, 20, 0, 'Rooms', 'equipment-rooms', 0, NULL),
(3, 15, 0, 'Pipes and Bongs', 'accessories-pipes-and-bongs', 1, NULL),
(4, 15, 0, 'Vape Cartridges', 'Vape-Cartridges', 1, NULL),
(5, 15, 0, 'Glass', 'accessories-glass', 1, NULL),
(6, 15, 0, 'Jars', 'accessories-jars', 1, NULL),
(8, 16, 0, 'Distillate', 'concentrates-distillate', 1, NULL),
(9, 16, 0, 'Budder', 'concentrates-budder', 1, NULL),
(10, 16, 0, 'Crumble', 'concentrates-crumble', 1, NULL),
(11, 16, 0, 'Shatter', 'concentrates-shatter', 1, NULL),
(12, 16, 0, 'Crystals', 'concentrate-crystals', 1, NULL),
(13, 18, 0, 'Moms', 'genetics-moms', 1, 1),
(14, 18, 0, 'Teens', 'genetics-teens', 1, 1),
(15, 18, 0, 'Clones', 'genetics-clones', 1, 1),
(16, 17, 0, 'Outdoor', 'Outdoor', 1, NULL),
(17, 17, 0, 'Greenhouse', 'Greenhouse', 1, NULL),
(18, 17, 0, 'Light Deps', 'Light-Deps', 1, NULL),
(21, 17, 1, 'Indoor', 'Indoors', 1, NULL),
(22, 16, 1, 'Crude', 'Crude', 1, NULL),
(23, 15, 1, 'Batteries', 'batteries', 1, NULL),
(24, 15, 1, 'Papers', 'papers', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(191) NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `text_campaigns`
--

CREATE TABLE `text_campaigns` (
  `id` int(11) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `approved` tinyint(4) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `text_campaigns`
--

INSERT INTO `text_campaigns` (`id`, `message`, `link`, `approved`, `option_id`, `vendor_id`) VALUES
(1, 'testing, 1234.', 'https://davehansen.com/demo1/item/gg4-6-rooted-clones-aiv0234zun', 1, 6, 68),
(2, 'testing, 12345.', 'https://davehansen.com/demo1/store/gringo%20co', 1, 6, 68);

-- --------------------------------------------------------

--
-- Table structure for table `text_campaign_options`
--

CREATE TABLE `text_campaign_options` (
  `id` int(11) NOT NULL,
  `number_texts` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `text_campaign_options`
--

INSERT INTO `text_campaign_options` (`id`, `number_texts`, `price`) VALUES
(1, 4000, 100),
(2, 10000, 225),
(3, 50000, 1100),
(4, 100000, 2000),
(5, 200000, 4000),
(6, 300000, 8000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_provider` tinyint(10) NOT NULL DEFAULT '0',
  `status` tinyint(10) NOT NULL DEFAULT '0',
  `verification_link` text COLLATE utf8mb4_unicode_ci,
  `email_verified` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `affilate_code` text COLLATE utf8mb4_unicode_ci,
  `affilate_income` double NOT NULL DEFAULT '0',
  `shop_name` text COLLATE utf8mb4_unicode_ci,
  `owner_name` text COLLATE utf8mb4_unicode_ci,
  `shop_number` text COLLATE utf8mb4_unicode_ci,
  `shop_address` text COLLATE utf8mb4_unicode_ci,
  `reg_number` text COLLATE utf8mb4_unicode_ci,
  `shop_message` text COLLATE utf8mb4_unicode_ci,
  `shop_details` text COLLATE utf8mb4_unicode_ci,
  `shop_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_url` text COLLATE utf8mb4_unicode_ci,
  `g_url` text COLLATE utf8mb4_unicode_ci,
  `t_url` text COLLATE utf8mb4_unicode_ci,
  `l_url` text COLLATE utf8mb4_unicode_ci,
  `is_vendor` tinyint(1) NOT NULL DEFAULT '0',
  `f_check` tinyint(1) NOT NULL DEFAULT '0',
  `g_check` tinyint(1) NOT NULL DEFAULT '0',
  `t_check` tinyint(1) NOT NULL DEFAULT '0',
  `l_check` tinyint(1) NOT NULL DEFAULT '0',
  `mail_sent` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_cost` double NOT NULL DEFAULT '0',
  `current_balance` double NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `ban` tinyint(1) NOT NULL DEFAULT '0',
  `is_verified` tinyint(4) NOT NULL DEFAULT '0',
  `terms_condition` tinyint(1) DEFAULT '0',
  `terms_condition_inital` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `photo`, `zip`, `city`, `country`, `position`, `address`, `phone`, `fax`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `is_provider`, `status`, `verification_link`, `email_verified`, `affilate_code`, `affilate_income`, `shop_name`, `owner_name`, `shop_number`, `shop_address`, `reg_number`, `shop_message`, `shop_details`, `shop_image`, `f_url`, `g_url`, `t_url`, `l_url`, `is_vendor`, `f_check`, `g_check`, `t_check`, `l_check`, `mail_sent`, `shipping_cost`, `current_balance`, `date`, `ban`, `is_verified`, `terms_condition`, `terms_condition_inital`) VALUES
(68, 'Dave Hoover', NULL, '92660', 'Newport Beach', 'United States', 'lat:33.6395928,lng:-117.8657581', '1133 Camelback Street', '4124034110', NULL, 'usamtg@hotmail.com', '$2y$10$ewqxWBeyMxFHqI8C63Uwaej2Lf7UwoVL.Relcd5LHmw7Yj5sq9c0a', 'JABk92vmBFu0dGdVjkJSb7ecEqTq7ohJw6H4p3nKGI1ZFcdA63ZKhWANOBGh', '2021-01-30 03:05:31', '2021-03-08 02:34:15', 0, 0, '73e49b942f641f7560c9499839994af0', 'Yes', '9ce1ad0213bafee1db6d4f8288bdbae6', 0, 'gringo co', 'Dave Hoover', '4124034110', '1133 Camelback Street, Newport Beach, CA, USA', NULL, 'hhhhhhhh', NULL, '1612214879Sea-of-green-1920x1013.jpg', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 0, 201.23, '2021-07-31', 0, 1, 0, NULL),
(69, 'Cristina Duran', NULL, '33626', 'Tampa', 'United States', 'lat:28.0831979,lng:-82.60856199999999', '14720 Ed Radice Drive', '+8612345646768', NULL, 'cpduran0622@gmail.com', '$2y$10$ru2WO76N4U5dXOUJjayVmefjrjsMf.oV0YsdssadTtXdkSqSJHEX2', 'QG1x0GNg81lTpGQBVWHSE1bXRNOCrJt6PG2QxjqCJibZmLTxRgMf3eOqFs0M', '2021-01-30 03:36:08', '2021-02-24 04:03:01', 0, 0, '49d17eceff0fdef9c22aca8207ea1dfc', 'Yes', 'f0c5808aec91ee26e86960d482d2d830', 0, 'dd', 'Cristina Duran', '+8612345646768', '14720 Ed Radice Drive, Tampa, FL, USA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 1, 0, NULL),
(76, 'Testy McTester II', NULL, '92028', 'Fallbrook', 'United States', 'lat:33.3825315,lng:-117.2305821', ' Amigos Way', '412-403-4110', NULL, 'daveh@intellectualarchist.com', '$2y$10$MIoEOGY/U4DWQRk8xK6S0uF3RmxKIDCcjpRPZgy.gq5NOimMq7oDW', NULL, '2021-02-08 22:08:29', '2021-02-08 22:08:29', 0, 0, 'b9b3fe22dd481c2a0b5fc9cd165242c8', 'No', 'e17670da70ccd932beab190cf07ec088', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL),
(77, 'Alex User', NULL, NULL, NULL, 'Singapore', 'lat:1.352083,lng:103.819836', ' ', '123456789', NULL, 'majesty1994131@outlook.com', '$2y$10$U7rT3HKHzJs83fFBw3relOlCphn9wPkXJcp4OfLavSxy1ClTGM5Iu', NULL, '2021-03-09 00:02:57', '2021-03-09 00:02:57', 0, 0, '48b1095c2d00c4809fc2558e0fc416f9', 'No', '74a4b60f05a40031e1c9b4c5d39894f4', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL),
(78, 'Alex Vendor', NULL, NULL, NULL, 'Singapore', 'lat:1.352083,lng:103.819836', ' ', '123456789', NULL, 'devloperviktor@gmail.com', '$2y$10$iWunrBgMYBsSMQMtbXO0/ehfvGaNDvekpenaqpsu34jwAl8p2SDtG', NULL, '2021-03-09 00:08:37', '2021-03-09 00:08:37', 0, 0, 'a084b791521b2b870efad7c600ff9eab', 'No', 'b8bc6594a96ac99599906c3097549de6', 0, 'Dev\'s team', 'Alex Vendor', '123456789', 'Singapore', NULL, 'My vendor account', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 1, NULL),
(79, 'Joe Andrei', '16152242631567226936Baby.tux-800x800.png', '10461', NULL, 'United States', 'lat:40.8528373,lng:-73.83706800000002', '1200 Waters Place', '+8612345646768', NULL, 'kosong0926@hotmail.com', '$2y$10$vwv7Q.cdC6tiO6htcXurEeVFJfuBCju9zPv123T4pxPntA62BJlcK', 'ewmEeWnQZ78ERCOXn0Mh2YorDam03TxNYYatcHlGXb1JYQtnFogKeT81Btb5', '2021-03-09 00:20:07', '2021-03-11 02:11:56', 0, 0, '7e96d3af07a82d5c9e281d2b68fb31c6', 'Yes', '75f01203b697169c81c7caac257034a1', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 1, 1, 'I am a buyer'),
(80, 'Chang Man', NULL, '67337', 'Coffeyville', 'United States', 'lat:37.03202599999999,lng:-95.6272425', ' West 12th Street', '+1234567890', NULL, 'kosong0926@gmail.com', '$2y$10$nYOycYwpUhCDgZTpZBmfE.jF5VvCyScBrrqinScwSgicx8mCdp6mS', 'FKxH1WCFdBFsSUgU6dSJo2fyLERnA8bLQDDE0syGwSnz1Z6NOBsOyvWOezK7', '2021-03-09 00:28:09', '2021-03-09 00:29:29', 0, 0, '0942c51a45fd61df2ef958a4066068a7', 'Yes', '368f341deda410887cb4715fb7a06488', 0, 'Chang', 'Chang Man', '+1234567890', 'West 12th Street, Coffeyville, KS, USA', NULL, 'I am a seller', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 1, 'I am a seller');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `user_id`, `order_number`, `is_read`, `created_at`, `updated_at`) VALUES
(2, 68, 'NSrf1612160936', 1, '2021-02-01 13:28:56', '2021-02-02 11:53:35'),
(3, 68, 'XNNw1612539068', 1, '2021-02-05 22:31:08', '2021-02-05 23:24:22'),
(4, 68, 'WYAN1612543974', 1, '2021-02-05 23:52:56', '2021-02-22 22:03:02'),
(5, 68, 'N3Mo1612781036', 1, '2021-02-08 17:43:56', '2021-02-22 22:03:02'),
(6, 68, 'C0EB1615403319', 1, '2021-03-11 02:08:39', '2021-03-12 10:45:37');

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `subscription_id` int(191) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Free',
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `payment_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_subscriptions`
--

INSERT INTO `user_subscriptions` (`id`, `user_id`, `subscription_id`, `title`, `currency`, `currency_code`, `price`, `days`, `allowed_products`, `details`, `method`, `txnid`, `charge_id`, `created_at`, `updated_at`, `status`, `payment_number`) VALUES
(91, 68, 9, 'FREE', '$', 'USD', 0, 180, 0, 'Enjoy 6 months on us!', 'Free', NULL, NULL, '2021-02-01 13:29:50', '2021-02-01 13:29:50', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_orders`
--

CREATE TABLE `vendor_orders` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `order_id` int(191) NOT NULL,
  `qty` int(191) NOT NULL,
  `price` double NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_orders`
--

INSERT INTO `vendor_orders` (`id`, `user_id`, `order_id`, `qty`, `price`, `order_number`, `status`) VALUES
(2, 68, 2, 1, 91.88, 'NSrf1612160936', 'completed'),
(3, 68, 3, 1, 109.35, 'XNNw1612539068', 'completed'),
(4, 68, 4, 1, 93.35, 'WYAN1612543974', 'pending'),
(5, 68, 5, 1, 91.88, 'N3Mo1612781036', 'pending'),
(6, 68, 6, 1, 15, 'C0EB1615403319', 'processing');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_return_policy`
--

CREATE TABLE `vendor_return_policy` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `policy_text` longtext NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vendor_return_policy`
--

INSERT INTO `vendor_return_policy` (`id`, `user_id`, `location_id`, `policy_text`, `active`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 'Free exchanges within 48 hours of delivery.<br>', 1, '2021-01-26 21:47:34', '2021-01-26 21:47:34'),
(4, 69, 4, 'dd', 1, '2021-01-30 05:10:49', '2021-01-30 05:10:49'),
(5, 68, 5, 'Free exchanges within 48 hours of delivery.', 1, '2021-01-30 05:43:40', '2021-01-30 05:43:40'),
(6, 68, 6, 'Free Exchange within 24 hours of purchase.<br>', 1, '2021-03-03 22:40:17', '2021-03-03 22:40:17'),
(7, 80, 7, 'This is test policy text', 1, '2021-03-09 00:31:02', '2021-03-09 00:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE `verifications` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('Pending','Verified','Declined') DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `admin_warning` tinyint(1) NOT NULL DEFAULT '0',
  `warning_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `verification_plans`
--

CREATE TABLE `verification_plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL,
  `title` text NOT NULL,
  `price` double NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `verification_plans`
--

INSERT INTO `verification_plans` (`id`, `type`, `title`, `price`, `details`) VALUES
(2, 1, 'License Verification', 29, 'License verification enables cannabis growers and manufacturers to buy and list products that are not available for retail sale.<br>');

-- --------------------------------------------------------

--
-- Table structure for table `verified_license`
--

CREATE TABLE `verified_license` (
  `id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `license1` varchar(255) NOT NULL,
  `license2` varchar(255) DEFAULT NULL,
  `license3` varchar(255) DEFAULT NULL,
  `driver_license` varchar(255) NOT NULL,
  `bill_license` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expires` date DEFAULT NULL,
  `verified_default` tinyint(4) DEFAULT '0',
  `location_id` tinyint(4) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `verified_license`
--

INSERT INTO `verified_license` (`id`, `user_id`, `license1`, `license2`, `license3`, `driver_license`, `bill_license`, `created_at`, `updated_at`, `expires`, `verified_default`, `location_id`) VALUES
(7, 68, '1615144358Cannabis License.png', NULL, NULL, '1615144358Cannabis License.png', '1615144358Cannabis License.png', '2021-03-08 02:12:38', '2021-03-08 02:12:38', '2022-03-07', 0, 0),
(8, 79, '16152242081567226936Baby.tux-800x800.png', NULL, NULL, '16152242081567226936Baby.tux-800x800.png', '16152242081567226936Baby.tux-800x800.png', '2021-03-09 00:23:28', '2021-03-11 02:11:56', '2021-03-31', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(191) UNSIGNED NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(191) NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `swift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `amount` float DEFAULT NULL,
  `fee` float DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('pending','completed','rejected') NOT NULL DEFAULT 'pending',
  `type` enum('user','vendor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_languages`
--
ALTER TABLE `admin_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertising_plans`
--
ALTER TABLE `advertising_plans`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `advertising_products`
--
ALTER TABLE `advertising_products`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `childcategories`
--
ALTER TABLE `childcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colorsetting`
--
ALTER TABLE `colorsetting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite_sellers`
--
ALTER TABLE `favorite_sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generalsettings`
--
ALTER TABLE `generalsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_tracks`
--
ALTER TABLE `order_tracks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagesettings`
--
ALTER TABLE `pagesettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickups`
--
ALTER TABLE `pickups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `products` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `products` ADD FULLTEXT KEY `attributes` (`attributes`);

--
-- Indexes for table `product_clicks`
--
ALTER TABLE `product_clicks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seotools`
--
ALTER TABLE `seotools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialsettings`
--
ALTER TABLE `socialsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_providers`
--
ALTER TABLE `social_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_locations`
--
ALTER TABLE `store_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strains`
--
ALTER TABLE `strains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strain_gallery`
--
ALTER TABLE `strain_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strain_gallery_temp`
--
ALTER TABLE `strain_gallery_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strain_temp`
--
ALTER TABLE `strain_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `text_campaigns`
--
ALTER TABLE `text_campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `text_campaign_options`
--
ALTER TABLE `text_campaign_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_return_policy`
--
ALTER TABLE `vendor_return_policy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verification_plans`
--
ALTER TABLE `verification_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verified_license`
--
ALTER TABLE `verified_license`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_languages`
--
ALTER TABLE `admin_languages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `advertising_plans`
--
ALTER TABLE `advertising_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `advertising_products`
--
ALTER TABLE `advertising_products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `attribute_options`
--
ALTER TABLE `attribute_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `childcategories`
--
ALTER TABLE `childcategories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `colorsetting`
--
ALTER TABLE `colorsetting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `favorite_sellers`
--
ALTER TABLE `favorite_sellers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT for table `generalsettings`
--
ALTER TABLE `generalsettings`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_tracks`
--
ALTER TABLE `order_tracks`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pagesettings`
--
ALTER TABLE `pagesettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `pickups`
--
ALTER TABLE `pickups`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=325;

--
-- AUTO_INCREMENT for table `product_clicks`
--
ALTER TABLE `product_clicks`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=493;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `seotools`
--
ALTER TABLE `seotools`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `socialsettings`
--
ALTER TABLE `socialsettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_providers`
--
ALTER TABLE `social_providers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_locations`
--
ALTER TABLE `store_locations`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `strains`
--
ALTER TABLE `strains`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2325;

--
-- AUTO_INCREMENT for table `strain_gallery`
--
ALTER TABLE `strain_gallery`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=658;

--
-- AUTO_INCREMENT for table `strain_gallery_temp`
--
ALTER TABLE `strain_gallery_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strain_temp`
--
ALTER TABLE `strain_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `text_campaigns`
--
ALTER TABLE `text_campaigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `text_campaign_options`
--
ALTER TABLE `text_campaign_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vendor_return_policy`
--
ALTER TABLE `vendor_return_policy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE `verifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verification_plans`
--
ALTER TABLE `verification_plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `verified_license`
--
ALTER TABLE `verified_license`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
