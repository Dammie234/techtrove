-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 16, 2024 at 08:14 PM
-- Server version: 5.7.33
-- PHP Version: 8.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shofy`
--

-- --------------------------------------------------------

--
-- Table structure for table `billings`
--

CREATE TABLE `billings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) NOT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_fee` int(11) NOT NULL,
  `notes` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment_approval` tinyint(1) NOT NULL DEFAULT '0',
  `delivered` tinyint(1) NOT NULL DEFAULT '0',
  `payment_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billings`
--

INSERT INTO `billings` (`id`, `lastname`, `firstname`, `company_name`, `country`, `street_address`, `city`, `state`, `postal_code`, `phone`, `email`, `total`, `payment_type`, `delivery_fee`, `notes`, `payment_approval`, `delivered`, `payment_image`, `created_at`, `updated_at`) VALUES
(1, 'Odusanya', 'Damilare', NULL, 'Nigeria', 'Owomilowomi Str', 'Kosofe', 'Lagos', '6365253', '09022590998', 'joy.dammie@yahoo.com', 2770, 'Direct Transfer', 25, NULL, 1, 0, 'images/payment_slips/uuruzftOx2.jpeg', '2024-08-16 12:58:46', '2024-08-16 15:35:11'),
(2, 'Odusanya', 'Damilare', NULL, 'Nigeria', 'Owomilowomi Str', 'Kosofe', 'Lagos', '6365253', '09022590998', 'joy.dammie@yahoo.com', 920, 'Direct Transfer', 25, NULL, 0, 0, 'images/payment_slips/ZnkpFM9J9R.jpeg', '2024-08-16 16:10:20', '2024-08-16 16:10:20');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` tinyint(4) NOT NULL,
  `price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `counts` smallint(6) NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `counts`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Headphones', 'headphones', 1, 'images/categories/s0zjSoYQQ3.jpeg', '2024-06-26 23:13:41', '2024-06-30 10:11:14'),
(2, 'Mobile Phone', 'mobile-phone', 1, 'images/categories/ccDHc7qxGd.jpeg', '2024-06-26 23:15:30', '2024-06-26 23:15:30'),
(3, 'Smart Watch', 'smart-watch', 1, 'images/categories/BMe1PzcAoa.jpeg', '2024-06-26 23:20:05', '2024-06-26 23:20:05'),
(4, 'Laptops', 'laptops', 1, 'images/categories/c3S4gjML4Q.jpeg', '2024-06-26 23:21:17', '2024-06-26 23:21:17'),
(5, 'Tablets', 'tablets', 1, 'images/categories/i1kWiZQpLn.jpeg', '2024-06-26 23:21:58', '2024-06-26 23:21:58'),
(6, 'Desktop Computers', 'desktop-computers', 1, 'images/categories/ulfJfl5iRo.jpeg', '2024-06-26 23:22:35', '2024-06-26 23:22:35'),
(7, 'Bluetooth Earphones', 'bluetooth-earphones', 1, 'images/categories/kG1Ws1uUAT.jpeg', '2024-06-26 23:23:17', '2024-06-26 23:23:17'),
(8, 'Wireless Headphones', 'wireless-headphones', 1, 'images/categories/oF1b8bblsf.jpeg', '2024-06-26 23:24:41', '2024-06-26 23:24:41'),
(9, 'Playstation', 'playstation', 1, 'images/categories/lSOb9e8xMf.jpeg', '2024-06-26 23:26:03', '2024-06-26 23:57:06');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2024_06_26_134812_create_categories_table', 2),
(4, '2024_06_30_014718_create_products_table', 3),
(5, '2024_07_11_112615_create_carts_table', 4),
(6, '2024_07_31_223046_create_billings_table', 5),
(7, '2024_08_16_120515_create_orders_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `billing_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `billing_id`, `product_id`, `quantity`, `price`, `sub_total`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 1, 220, 220, '2024-08-16 12:58:46', '2024-08-16 12:58:46'),
(2, 1, 4, 1, 2430, 2430, '2024-08-16 12:58:46', '2024-08-16 12:58:46'),
(3, 1, 2, 1, 120, 120, '2024-08-16 12:58:46', '2024-08-16 12:58:46'),
(4, 2, 5, 1, 920, 920, '2024-08-16 16:10:20', '2024-08-16 16:10:20');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'token', '342f88bbab1e5aedaeae16388870dc5157a47c55464c8ef9b577370389b6edc6', '[\"*\"]', '2024-06-24 14:57:28', NULL, '2024-06-24 14:33:26', '2024-06-24 14:57:28'),
(2, 'App\\Models\\User', 1, 'token', '7d0701c4de45d82449e5005081fd03d32cf762f687450c3752dc8a6245ee2e23', '[\"*\"]', '2024-06-26 14:18:02', NULL, '2024-06-26 14:12:59', '2024-06-26 14:18:02'),
(3, 'App\\Models\\User', 1, 'token', 'b777791e1666ab7f692c317f0982e4f145797b1ca85671d22376951958af1907', '[\"*\"]', '2024-06-26 23:57:25', NULL, '2024-06-26 21:37:19', '2024-06-26 23:57:25'),
(4, 'App\\Models\\User', 1, 'token', 'eb6323e3bc7281a23be3f51ef26205eb1c1779b4e1b3b2dd6dc4c7a72a61e936', '[\"*\"]', '2024-06-30 01:01:44', NULL, '2024-06-30 00:41:06', '2024-06-30 01:01:44'),
(5, 'App\\Models\\User', 1, 'token', 'e834547620721c9895b6a85054f3c39370c6a79411e9ca44cf85a1bb666e58b7', '[\"*\"]', '2024-06-30 10:17:22', NULL, '2024-06-30 09:55:26', '2024-06-30 10:17:22'),
(6, 'App\\Models\\User', 1, 'token', '3b9c2ac6d673df7c1925a44122087594fef2183120f5a3c4814546933683b689', '[\"*\"]', '2024-06-30 14:23:35', NULL, '2024-06-30 13:34:28', '2024-06-30 14:23:35'),
(7, 'App\\Models\\User', 1, 'token', '0e7ac66847d27572c1a92f8a749a0460a6c6d3aee8859050953eb8f119437a25', '[\"*\"]', '2024-07-03 14:56:14', NULL, '2024-07-03 13:46:48', '2024-07-03 14:56:14'),
(8, 'App\\Models\\User', 1, 'token', '7f07921f7ad95509c2d98ca73c92f1329ceca8a932ff9a1fff8ae7ac97bd70c2', '[\"*\"]', '2024-07-03 17:01:54', NULL, '2024-07-03 16:32:05', '2024-07-03 17:01:54'),
(9, 'App\\Models\\User', 1, 'token', '14b8730e8defb08318207a1cb4a035564ef3b37fbbb6e2f05b083459ec7d39c4', '[\"*\"]', '2024-07-25 01:04:56', NULL, '2024-07-25 00:55:49', '2024-07-25 01:04:56'),
(10, 'App\\Models\\User', 1, 'token', '3ac84fa125646977c68e3ad2c6954f15e83b86b4623c41da732eabe6fce4f16e', '[\"*\"]', '2024-08-16 14:30:26', NULL, '2024-08-16 13:03:56', '2024-08-16 14:30:26'),
(11, 'App\\Models\\User', 1, 'token', '99ee72f4839880886d03276f83c5b3ac4e5b79afb9d1b6ce9430f1d13679fd32', '[\"*\"]', '2024-08-16 16:08:43', NULL, '2024-08-16 15:27:19', '2024-08-16 16:08:43'),
(12, 'App\\Models\\User', 2, 'token', 'de9e344e8b8b7e55d16a166b7bc5486925c68ea87ec8ab87e45396029c1c21c6', '[\"*\"]', '2024-08-16 16:12:00', NULL, '2024-08-16 16:10:36', '2024-08-16 16:12:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) DEFAULT NULL,
  `sales_price` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `counts` int(11) NOT NULL DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `short_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_information` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `price`, `sales_price`, `qty`, `sku`, `counts`, `featured`, `short_description`, `description`, `additional_information`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sony WH-CH510:Wireless Bluetooth Headset With Mic For Phone-Call', 'sony-wh-ch510wireless-bluetooth-headset-with-mic-for-phone-call', 150, 120, 30, 'SO521EA094MWZNAFAMZ', 0, 0, 'Get dynamic sound and all-day listening in a wireless headphone The zero-compromise wh-ch510 wireless headphones feature an extra-long battery life of up to 35 hours', '<span>Get dynamic sound and all-day listening in a wireless headphone The zero-compromise wh-ch510 wireless headphones feature an extra-long battery life of up to 35 hours 30mm drivers bring crisp clear sound No matter what you&#8217;re listening to Make hands-free calls with the built-in microphone and recharge with the updated USB-C connection.</span><br><br><img alt=\"Built-in microphone for hands-free calls and voice assistant commands\" src=\"https://ng.jumia.is/cms/external/pet/SO521EA094MWZNAFAMZ/b1a12eee7b26d91cce3d444a5b0b30c8.jpg\" class=\"\"><h1 class=\"aplus-h3 a-text-bold\">Built-in microphone</h1>Take and make calls without ever touching your phone. With a high-quality built-in microphone, you&#8217;ll be able to have hands-free conversations on your smartphone with ease.<img alt=\"VOICE\" src=\"https://ng.jumia.is/cms/external/pet/SO521EA094MWZNAFAMZ/b28ed856c5b3d1919d2310960d0a2beb.jpg\" class=\"\"><h1 class=\"aplus-h3 a-text-bold\">Voice assistant at your service</h1>Check the weather, get the latest news and more using just your voice. Press the multi-function button twice and you&#8217;ll get instant access to Siri or Google Assistant.<br>&#160;It&#8217;s nice and light. Very compact and something that will not take any more space than what it is.<br>&#8226; The earcups swivel. I appreciate this because it makes it easier to find a place if you need to pack.<br>&#8226; A very simple design. No led glows, big logos, or color designs. A jet black look makes these headphones follow the saying &#8220;less is more.&#8221;<br>&#8226; I found the microphone surprisingly good. Receiving phone calls where very clear and colleague has stated that my responses sounded like I was using any smartphone.<br>&#8226; Not only is the Bluetooth on this is fast, but it&#8217;s a 5.0. This means 1. It maximizes your battery life as much as possible and 2. 5.0 allows you to connect two different headphones to your phone. A great note to have if you want someone else to watch what you&#8217;re watching.<br>&#8226; The battery is phenomenal. Sony states 35 hours, but honestly it can go almost two weeks (3-4 hours a day) without charging. An A+ in this field.<br>&#8226; Even with great battery life, the headset charges extremely fast with the USB-C connector. I did just a 10-minute charge and it gave me 1:30 playtime. Do the math, that&#8217;s 9 minutes of playback for 1 minute of charge. WOW.<br>&#8226; Only three simplicity buttons on the right earpiece. I&#8217;m always a fan of buttons rather than touch sensors, so this is a thumbs up in my book.<br>&#8226; Minimum leakage of music. Around 70% of volume and no knew I was even playing Taylor Swift.<br>&#8226; Good midranges and is helped with a good stereo spread in the earcups. You get good sound color when anything with a guitar, or and solo voice is performing.', '<h4><b>Key Features</b></h4><div><ul class=\"a-unordered-list a-vertical a-spacing-mini\"><li>Cancel out the world with smart noise cancellation</li><li>Listen to your favorite tracks wirelessly with a Bluetooth wireless technology by pairing your smartphone or tablet</li><li>30 millimeter driver unit for dynamic sound</li><li>Swivel design for easy travel</li><li>Easy hands-free calling and voice assistant commands with microphone</li><li>Voice assistant-compatible for easy access to your smartphone</li><li>Next-generation USB type C charging</li></ul></div><div><br></div><h4><b>Specifications</b></h4><div><ul class=\"-pvs -mvxs -phm -lsn\"><li class=\"-pvxs\"><span class=\"-b\">SKU</span>: SO521EA094MWZNAFAMZ</li><li class=\"-pvxs\"><span class=\"-b\">Product Line</span>: Smart Choice Distribution</li><li class=\"-pvxs\"><span class=\"-b\">Model</span>: WH-CH510</li><li class=\"-pvxs\"><span class=\"-b\">Size (L x W x H cm)</span>: 19.69 x 17.15 x 4.14</li><li class=\"-pvxs\"><span class=\"-b\">Weight (kg)</span>: 0.13</li><li class=\"-pvxs\"><span class=\"-b\">Color</span>: Black</li><li class=\"-pvxs\"><span class=\"-b\">Main Material</span>: NA</li></ul></div>', 'images/products/HFK1iivjoC.jpeg', '2024-06-30 14:06:09', '2024-06-30 14:23:34'),
(2, 2, 'XIAOMI Redmi A3 6.71\" 3GB RAM/64GB ROM Android 12 - Blue + FREE GIFT', 'xiaomi-redmi-a3-671-3gb-ram64gb-rom-android-12-blue-free-gift', NULL, 120, 20, 'XI363MP3XQOUNNAFAMZ', 0, 0, 'Redmi A3 is the Smooth & Stylish phone that will always make heads turn with its luxurious Premium Halo Design. You can choose between the leather texture Olive Green or the Lake Blue and Midnight Black colours which come with a glass back design.', '<p><strong>Redmi A3</strong>&#160;is the Smooth &amp; Stylish phone that will always make heads turn with its luxurious Premium Halo Design. You can choose between the leather texture Olive Green or the Lake Blue and Midnight Black colours which come with a glass back design. It features a smooth 90Hz HD+ display that ensures that your entertainment experience is always smooth and clear. This big and beautiful display is protected by Corning&#174; Gorilla&#174; Glass 3 and the body is resistant to accidental splashes of water. With a secure side fingerprint scanner, only you can unlock your phone quickly and easily. It comes with up to 6GB + 6GB Virtual RAM and up to 128GB storage which is expandable up to 1TB with a microSD card slot. Redmi A3 features an 8MP AI Dual Camera with vintage film filters that give your photos a nice vintage look. Powering Redmi A3 is a 5000mAh battery with a Type-C charger in the box.</p><ul><li>Redmi A3</li><li>Smooth &amp; Stylish</li><li>Premium Halo Design&#160;</li><li>90Hz HD+ Display</li><li>Up to 6GB + 6GB* RAM&#160; and 128GB Storage</li><li>8MP AI Dual Camera</li><li>5000mAh Battery with Type-C Charger in<strong>-</strong>box</li></ul>', '<ul><li>Processor : MediaTek Helio G36 - Higher clock speed up to 2.2GHz</li><li>Memory: 3GB RAM 64GB ROM</li><li>SIM Type: Nano-SIM</li><li>SIM Count: Dual-SIM</li><li>Rear Cameras : 8MP AI Dual Camera</li><li>Battery Capacity : 5000 mAh (typ)</li><li>Dimensions : 168.3mm x 76.3mm x 8.32mm</li><li>Size: 17.04cm(6.71-inch)</li></ul>', 'images/products/xfyhVYhbpZ.jpeg', '2024-07-03 14:08:10', '2024-07-03 14:08:10'),
(3, 3, 'Apple Watch SE (2nd Gen, 2023) [GPS 44mm] - Storm Blue Band S/M', 'apple-watch-se-2nd-gen-2023-gps-44mm-storm-blue-band-sm', NULL, 420, 24, 'AP044EA4P2KRBNAFAMZ', 0, 0, 'Take the essentials with you, everywhere you go. Apple Watch SE lets you stay connected, stay healthy and, most importantly, stay safe. Hit the pool and your Watch SE can come along to help you track splits and lengths.', '<p>Take the essentials with you, everywhere you go. Apple Watch SE lets you stay connected, stay healthy and, most importantly, stay safe. Hit the pool and your Watch SE can come along to help you&#160;<strong>track splits&#160;</strong>and<strong>&#160;lengths</strong>. When you\'re on a jog it&#160;<strong>tracks stride lengths&#160;</strong>and<strong>&#160;ground contact time</strong>&#160;so you can keep an eye on your performance. Plus, you\'ll have no problem seeing your all-important stats on the gorgeous&#160;<strong>Retina OLED display</strong>. And it can even help you out in a car accident with&#160;<strong>Crash Detection</strong>. It can alert emergency services and your emergency contacts &#8211; of course, let\'s hope you never need that feature!<br><br><strong>Good to know<br><br></strong>-&#160;<strong>WatchOS 10</strong>&#160;breathes new life into your favourite apps and squeezes more information on the screen<br>- The&#160;<strong>redesigned case</strong>&#160;reduces its carbon footprint by over 80%, so its great news for the planet too<br>- Your Apple Watch SE powers&#160;<strong>Fitness+</strong>&#160;to help you stay active. It\'s got everything from HIIT to yoga, and you\'ll get 4 months free with your Apple Watch SE<br>- The&#160;<strong>Heart Rate app</strong>&#160;can check your hear rate and let you know if anything irregular<br>-&#160;<strong>Activity rings</strong>&#160;and the&#160;<strong>Workout app</strong>&#160;help to keep you motivated<br>- Some days are stressful &#8211; the&#160;<strong>Mindfulness app</strong>&#160;is really helpful when you need to take a moment to reset<br>- Keep an eye on your shut-eye with the&#160;<strong>Sleep app</strong>&#160;&#8211; it tracks how much time you spend in REM, Core or Deep sleep<br>-&#160;<strong>Family Setup</strong><strong>&#160;</strong>mode lets you pair your kids watches to your phone if they don\'t have their own<br>- It\'s got all the Watch features you love, like&#160;<strong>Maps,&#160;Apple Pay&#160;</strong>and&#160;<strong>Siri</strong></p><p>APPLE Watch SE (2023) - 44 mm Silver Aluminium Case with Storm Blue Sport Band, S/M, Tracks sports / steps / distance / calories / sleep, Monitors heart rate, Battery life: Up to 18 hours, Water resistant, GPS, Compatible with iOS</p><p>A great deal to love.</p><p><strong>Apple Fitness+, the ultimate fitness experience powered by Apple Watch. Get 3 months free when you buy Apple Watch. Offer available to new subscribers who purchase an eligible device after September 7, 2022. &#163;9.99/month after free trial. No commitment. Plan automatically renews after trial until cancelled. Only one offer per Apple ID. This offer is not available if you or your family have previously subscribed to Apple Fitness+. Restrictions and other terms apply.</strong></p><span>Essential features to help you stay connected, active, healthy and safe. Perfect for kids and older adults using Family Setup.1</span><br><br><strong>WHY APPLE WATCH SE</strong><br><span>All the essentials to help you be motivated and active, keep connected, track your health and stay safe. The Smart Stack and redesigned apps in watchOS 10 help you see more information at a glance.</span><br><br><strong>CARBON NEUTRAL</strong><br><span>Apple Watch SE (2nd generation) paired with the latest Sport Loop is carbon neutral. Learn more about Apple&#8217;s commitment to the environment at apple.com/uk/2030.3</span><br><br><strong>HEALTH AND SAFETY FEATURES</strong><br><span>Get help when you need it with Fall Detection,4 Crash Detection and Emergency SOS.2 Get deep insights into your health, including notifications if you have an irregular heart rhythm5 or an unusually high or low heart rate.</span><br><br><strong>SIMPLY COMPATIBLE</strong><br><span>It works seamlessly with your Apple devices and services. Unlock your Mac automatically. Find your devices easily.</span><br><br><strong>SWIMPROOF AND STYLISH</strong><br><span>Water resistance rating of 50 metres.7 Three finishes. And a colour-matched back case made with a production process that reduces its carbon emissions.</span><br><br><strong>A POWERFUL FITNESS PARTNER</strong><br><span>The Workout app gives you a range of ways to train plus advanced metrics for more insights about your workout performance. And Apple Watch comes with three months of Apple Fitness+ free.8</span><br><br><strong>STAY CONNECTED</strong><br><span>Send a text, take a call, listen to music and podcasts, use Siri or call for help with Emergency SOS.2 Apple Watch SE (GPS) works with your iPhone or Wi-Fi to keep you connected.</span>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\"><li class=\"a-spacing-mini\">WHY APPLE WATCH SE &#8212; All the essentials to help you be motivated and active, keep connected, track your health and stay safe. The Smart Stack and redesigned apps in watchOS 10 help you see more information at a glance. With features like Crash Detection and enhanced workout metrics, Apple Watch SE is better value than ever.</li><li class=\"a-spacing-mini\">CELLULAR CONNECTIVITY &#8212; Send a text, make a call, and stream music and podcasts without your iPhone nearby. Add a mobile plan to stay connected in more places than ever.</li><li class=\"a-spacing-mini\">HEALTH AND SAFETY FEATURES &#8212; Get help when you need it with Fall Detection, Crash Detection and Emergency SOS. Get deep insights into your health, including notifications if you have an irregular heart rhythm or an unusually high or low heart rate.</li><li class=\"a-spacing-mini\">SIMPLY COMPATIBLE &#8212; It works seamlessly with your Apple devices and services. Unlock your Mac automatically. Find your devices easily. Pay and send money with Apple Pay. Apple Watch requires iPhone XS or later with the latest iOS version.</li><li class=\"a-spacing-mini\">SWIMPROOF AND STYLISH &#8212; 50m water resistance. Three finishes. And a colour-matched back case made with a production process that reduces its carbon emissions.</li><li class=\"a-spacing-mini\">EASILY CUSTOMISABLE &#8212; With watch straps in a range of styles, materials and colours and fully customisable watch faces, you can change your watch to fit your mood or the moment.</li><li class=\"a-spacing-mini\">A POWERFUL FITNESS PARTNER &#8212; The Workout app gives you a range of ways to train plus advanced metrics for more insights about your workout performance. And Apple Watch comes with three months of Apple Fitness+ free.</li><li class=\"a-spacing-mini\">FAMILY SETUP KEEPS EVERYONE CLOSE &#8212; Use Family Setup to manage Apple Watch for family members who don&#8217;t yet have their own iPhone, so everyone can stay connected, active, healthy and safe</li><li class=\"a-spacing-mini\"><ul><li>Carbon-neutral combinations available.</li><li>Retina display, up to 1000 nits.</li><li>S8 SiP Processors</li><li>Cycle Tracking</li><li>50m water resistant.</li><li>Up to 18 hours battery life.</li></ul></li></ul>', 'images/products/ENUFKhnjra.jpeg', '2024-07-03 14:18:40', '2024-07-03 14:18:40'),
(4, 4, 'Apple MacBook Pro 16.2\" - 32GB - 1TB - 10 Cores - M1 Max - Silver', 'apple-macbook-pro-162-32gb-1tb-10-cores-m1-max-silver', 2450, 2430, 24, 'AP044CL3UTUXKNAFAMZ', 0, 0, 'The new MacBook Pro delivers game-changing performance for pro users. Choose the powerful M1 Max to supercharge pro-level workflows while getting amazing battery life.(1) And with an immersive 16-inch Liquid Retina XDR display and an array of pro ports, you can do more than ever with MacBook Pro.(2)', '<p>The MacBook Pro 16&#34; is now powered by the M1 Pro or M1 Max chip, two revolutionary chips that delivers professional performance on a notebook computer, outstripping even the M1 MacBook Pro.</p><p>The M1 Pro offers up to a 10-core CPU and up to a 16-core GPU, with access to up to 32GB of unified onboard memory and up to 200GBps memory bandwidth. The M1 Max ups that up to a 32-core GPU, up to 64GB of unified memory and up to 400GBps memory bandwidth. Add in dedicated encode and decode media engines that support H.264, HEVC, and ProRes codecs, and it\'s clear that MacBook Pro is the ideal notebook for creative users.</p><p>The M1 Pro MacBook Pro can play back up to 20 streams of 4K ProRes on its Liquid Retina XDR display (which also boasts 1000 nits sustained brightness - double that of the previous generation - a million to one contrast ratio and support for a billion colours). ProMotion technology delivers refresh rates of 120Hz for smooth, responsive playback, gaming and more.</p><p>With up to 21 hours\' battery life, the ability to compile up to four times more code in Xcode and up to 8TB of 7.4GBps SSD storage, moving to the M1 Pro or M1 Max MacBook Pro is the key to unlocking a whole new level of productivity. Its 1080p camera, three studio-quality mics and six-speaker array with better bass all ensure your voice and video calls are crisper than ever - and support Dolby Atmos spatial audio for truly immersive playback.</p><p>Apple M1 Max processor: 32 GB</p><p>1 TB hard drive: None ; 16.2 in ; display: IEEE 802.11n,IEEE 802.11ac,IEEE 802.11b,IEEE 802.11a,IEEE 802.11g,Bluetooth 5.0,IEEE 802.11ax (Wi-Fi 6)</p><p>The 16.2-inch MacBook Pro (2021 model) features Apple\'s all new M1 Pro &amp; M1 Max Chips with increased performance compared to the standard M1 Chip; and an all-new design. Sleek bezels around a beautiful Liquid Retina XDR display makes this MacBook nearly all screen, and ProMotion technology furthers the experience. Improved speakers, mics, and a 1080p FaceTime HD camera makes the 2021 MacBook Pro perfect for video calls and meetings from both home and the office.</p><p><strong>Please note:&#160;</strong>When deploying a Mac with a T2 Security Chip or M1 Chip, you can only deploy them via your MDM software (or manually per each individual device) - just like you would when deploying a group of iPads. All other methods of deployment are not compatible with the Apple T2 Security Chip and M1 Chip, including: Imaging, Netboot, Netinstall, DeployStudio, Workgroup manager, Munki, StarDeploy, USB / Thunderbolt, and AutoDMG.</p>', '<ul><li>Apple&#160;M1 Max chip for a massive leap in CPU, GPU and machine learning performance</li><li>Up to 10-core CPU delivers up to 2x faster performance to fly through pro workflows quicker than ever3</li><li>Up to 32-core GPU with up to 4x faster performance for graphics-intensive apps and games3</li><li>16-core Neural Engine for up to 5x faster machine learning performance3</li><li>Longer battery life, up to 21 hours1</li><li>Up to 64GB of unified memory so everything you do is fast and fluid</li><li>Up to 8TB of superfast SSD storage launches apps and opens files in an instant</li><li>Stunning 16-inch Liquid Retina XDR display with extreme dynamic range and contrast ratio2</li><li>1080p FaceTime HD camera with advanced image signal processor for sharper video calls</li><li>Six-speaker sound system with force-cancelling woofers</li><li>Studio-quality three-microphone array captures your voice more clearly</li><li>Three Thunderbolt 4 ports, HDMI port, SDXC card slot, headphone jack, MagSafe 3 port</li><li>Next-generation Wi-Fi 6 for faster connectivity</li><li>Backlit Magic Keyboard with Touch ID for secure unlock and payments</li><li>macOS Monterey lets you connect, share and create like never before, with exciting new FaceTime updates and a redesigned Safari</li><li>Available in space grey and silver</li><li><ul><li><strong>Scary faster</strong><br>M1 Max delivers two times faster graphics processing and double the memory bandwidth of M1 Pro. And it has a dedicated media engine for decode and two for encode - with up to two times faster video encoding - and two ProRes accelerators for even higher multistream performance.</li><li><strong>You can do this all day</strong><br>Ferocious performance with game???changing battery life - that efficiency is the magic of Apple silicon. MacBook Pro delivers the same amazing performance whether it\'s plugged in or not.</li><li><strong>The coolest part</strong><br>Advanced thermal systems move 50 percent more air, even at lower fan speeds. And thanks to the efficiency of Apple silicon, the fans never turn on for many tasks you do every day.</li><li><strong>Liquid Retina XDR</strong><br>It features Extreme Dynamic Range and a million to one contrast ratio. HDR content comes to life in photos, video, and games - with refined specular highlights, incredible detail in shadows, and vibrant, true-to-life colors. Each display is factory calibrated and features pro reference modes for HDR color grading, photography, design, and print production.</li><li><strong>ProMotion</strong><br>ProMotion comes to Mac for the first time, making everything from scrolling through a web page to gaming super fluid and responsive - while also reducing power consumption. With refresh rates of up to 120Hz, the adaptive technology automatically adjusts to match the movement of the content. ProMotion video editors can also choose a fixed refresh rate that precisely aligns with their footage.</li><li><strong>Heads up - the camera\'s 1080p HD</strong><br>Staying connected is more important than ever. That\'s why the MacBook Pro camera has double the resolution - 1080p - and uses a lens with a wider aperture that lets in more light. Together with a larger image sensor that has more efficient pixels, the camera delivers two times better low???light performance.</li><li><strong>Three studio???quality mics</strong><br>Thanks to mics with an up to 60 percent lower noise floor, MacBook Pro can capture even the subtlest sounds. And the three-mic array uses directional beamforming so your voice always comes through loud and clear.</li><li><strong>Six-speaker sound system</strong><br>Four force-canceling woofers reveal notes up to a half-octave deeper and fill the room with up to 80 percent more bass. And the high???performance tweeters project clearer, fuller vocals.</li><li><strong>Spatial audio</strong><br>Thanks to the room???filling six???speaker system and advanced algorithms, MacBook Pro supports spatial audio when playing music or video with Dolby Atmos, creating a sophisticated, three???dimensional soundstage. Combine that with the Liquid Retina XDR display, and it\'s like having a portable theater.</li><li><strong>More plugged in than ever</strong><br>Transfer photos and videos with an SDXC card reader. Connect to TVs or displays with HDMI output. Listen using a 3.5 mm headphone jack that detects and automatically adjusts for high???impedance headphones. Connect to high-speed peripherals or displays with three Thunderbolt 4 ports. And fast???charge using the quick???releasing MagSafe 3 port.</li><li><strong>More pixels than ever</strong><br>Connect up to three Pro Display XDRs and a 4K TV with M1 Max. Or connect up to two Pro Display XDRs with M1 Pro.</li><li><strong>Pro power meets pro keyboard</strong><br>For the first time, Magic Keyboard brings a full???height function key row to MacBook Pro - with the tactile feel of mechanical keys that pros love. It includes keyboard shortcuts for Spotlight, Siri, Dictation, and Do Not Disturb. And Touch ID has a tactile ring that guides your finger for a fast, easy, secure way to unlock your Mac.</li></ul></li></ul>', 'images/products/WSMQ7NmhM8.jpeg', '2024-07-03 14:40:47', '2024-07-03 14:40:47'),
(5, 5, 'Apple IPad Pro 12.9\" M2(2022 Model)Wi-Fi+Cellular-512GB-Space Gray', 'apple-ipad-pro-129-m22022-modelwi-ficellular-512gb-space-gray', 950, 920, 8, 'AP044MP4WJHTZNAFAMZ', 0, 0, 'The M2 chip is the next generation of Apple silicon, with an 8‑core CPU that delivers up to 15 percent faster performance and a 10‑core GPU that provides up to 35 percent faster graphics performance. With a 40 percent faster Neural Engine to accelerate machine learning tasks and 50 percent more memory bandwidth, M2 brings astonishing performance and new capabilities', '<a class=\"accordion-title description_tab\" href=\"https://store.bellestoreinc.com/store/12-9-inch-ipad-pro-m2-chip/?v=bf7410a9ee72#tab-description\"><b>Supercharged by M2.&#160;Astonishing performance</b>. Incredibly advanced displays. Superfast wireless connectivity. Next-level&#160;</a><a href=\"https://store.bellestoreinc.com/product-category/apple-pencil/?v=bf7410a9ee72\">Apple&#160;Pencil</a><span>&#160;capabilities. Powerful new features in iPadOS&#160;16. The ultimate&#160;</span><a href=\"https://store.bellestoreinc.com/ipad/?v=bf7410a9ee72\">iPad</a><span>&#160;experience.</span><a class=\"accordion-title description_tab\" href=\"https://store.bellestoreinc.com/store/12-9-inch-ipad-pro-m2-chip/?v=bf7410a9ee72#tab-description\">The M2 chip is the next generation of Apple silicon, with an 8&#8209;core CPU that delivers up to 15 percent faster performance and a 10&#8209;core GPU that provides up to 35 percent faster graphics performance. With a 40 percent faster Neural&#160;Engine to accelerate machine learning tasks and 50 percent more memory bandwidth, M2 brings astonishing performance and new capabilities to&#160;</a><a href=\"https://store.bellestoreinc.com/product-category/ipad-pro/?v=bf7410a9ee72\">iPad&#160;Pro</a><span>. So you can create photorealistic 3D designs, build intricate AR models, and play games with console&#8209;quality graphics at high frame rates faster than ever. All while enjoying all&#8209;day battery life.</span><a class=\"accordion-title description_tab\" href=\"https://store.bellestoreinc.com/store/12-9-inch-ipad-pro-m2-chip/?v=bf7410a9ee72#tab-description\">The high-performance media engine on M2 accelerates ProRes encode and decode. You can convert video projects to ProRes up to 3x faster than before. And with the image signal processor in M2 and advanced cameras on&#160;</a><a href=\"https://store.bellestoreinc.com/product-category/ipad-pro/?v=bf7410a9ee72\">iPad&#160;Pro</a><span>, you can now capture ProRes&#160;video. Five studio&#8209;quality microphones and four-speaker audio with support for Dolby Atmos let you record and deliver theater&#8209;qualilty sound</span>', '<ul><li><b>Manufacturer - Apple&#160;</b></li><li><b>Operating System - iPadOS 16.1</b></li><li><b>Rear Camera - 12 MP, f/1.8 ( wide ) + 10 MP, f.2.4, 125 ( ultrawide )</b></li><li><b>Front Camera -&#160;12 MP, f/2.4, 122&#730; (ultrawide)</b></li><li><b>Ram - 8GB</b></li><li><b>Internal Memory - 512GB</b></li><li><b>Sim Type - Single Sim&#160; + E Sim</b></li><li><b>Screen Size - 12.9&#34;</b></li><li><b>Proceesor - Apple M2 Chip</b></li><li><b>5G - Yes&#160;</b></li><li><b>Battery Capacity - Li-Po 10758 mAh (40.88 Wh), non-removable</b></li></ul>', 'images/products/vYkeMd28nk.jpeg', '2024-07-03 14:49:15', '2024-07-03 14:49:15'),
(6, 6, 'DELL OptiPlex 7040 SFF – Core I5 6500 3.2 GHz VPro 8GB RAM 512GB SSD, Win 11 & MS Office 2019', 'dell-optiplex-7040-sff-core-i5-6500-32-ghz-vpro-8gb-ram-512gb-ssd-win-11-ms-office-2019', 320, 220, 9, 'DE168CL45ISM1NAFAMZ', 0, 1, 'The Dell OptiPlex 7040 Series is a small form factor (SFF) computer that can pack quite the power punch per square inch. The OptiPlex 7040 comes equipped with the latest sixth generation Intel Core Processor.', '<p>The Dell OptiPlex 7040 Series is a small form factor (SFF) computer that can pack quite the power punch per square inch. The OptiPlex 7040 comes equipped with the latest sixth generation Intel Core Processor. The OptiPlex 7040 is offered in two form factors: the mini tower and the SFF.&#160;Both of these form factors have been scaled down from the previous models. For our review we will be looking at the SFF.</p><p><img class=\"alignnone wp-image-33175 size-full\" src=\"https://ng.jumia.is/cms/external/pet/DE168CL45ISM1NAFAMZ/ddc547f3fd0649d790cdc1bd0b0bc27e.jpg\" alt=\"Dell OptiPlex 7040 Series\" width=\"850\" height=\"401\"></p><p>Like several of Dell&#8217;s products, the OptiPlex 7040 Series is highly customizable. For the SFF, there is up to 16GB in memory, CPUs up to a quad core i7-6700, multiple drive options including PCIe NVMe SSD with up to 512GB of capacity. The NVMe SSDs one can choose from include Samsung&#8217;s NVMe SSDs, which are far and away some of the best performing NVMe&#160;SSDs we have tested.&#160;The desktop is designed for businesses of all sizes and comes with BIOS setting and system configurations that can be manipulated to fit the user&#8217;s specific IT requirements. Dell also enables users to keep their BIOS and system configurations flexible with its Client Command Suite of free tools. Administrators can remotely manage the desktop with optional Intel vPro technology, plus Dell&#8217;s unique capabilities for out-of-band BIOS management.</p><p>While businesses need both performance and flexibility,&#160;there is a big concern for security. To this end, Dell is claiming the best security &#8220;right out of the box.&#8221; With Dell Data Protection, OptiPlex users can expect centralized remote management and encryption, authentication options, secure credential storage, the ability to stop even advanced forms of malware, and single console security.</p><p><br></p><p>Dell OptiPlex 7040 SFF specifications:</p><ul><li>CPU options:<ul><li>Intel Core i5-6500 Processor (Quad Core, 6MB, 4T, 3.2GHz, 65W)</li><li>Intel Core i5-6600 Processor (Quad Core, 6MB, 4T, 3.3GHz, 65W)</li></ul></li><li>Operating system options:<ul><li>Windows 10 Pro, 64bit</li></ul></li><li>Memory options:<ul><li>8GB (2x4G) 2133MHz DDR4 Memory</li><li>16GB (2x8G) 2133MHz DDR4 Memory</li></ul></li><li>Hard Drive options:<ul><li><b>M.2 512GB PCIe NVMe Class 40 SSD</b></li></ul></li><li>GPU options:<ul><li>Intel Integrated Graphics</li></ul></li><li>Optical Drive options:<ul><li>8x DVD+/-RW 9.5mm Optical Disk Drive&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</li><li>8x DVD-ROM 9.5mm Optical Disk Drive</li><li>No Optical Disk Drive</li></ul></li><li>Ports:<ul><li>6 USB 3.0 (2 front/4 rear-1 with PowerShare)</li><li>4 USB 2.0 (2 front/2 rear-1 front with PowerShare)</li><li>1 Internal USB 3.0 with smart power on</li><li>1 RJ-45</li><li>1 P2/Serial</li><li>2 Display Port 1.2</li><li>1 HDMI</li><li>1 UAJ</li><li>1 Line-out</li><li>1 VGA (optional)</li></ul></li><li>Slots:<ul><li>1 half height PCIe x16</li><li>1 half height PCIe x4</li><li>1 M.2 (22x80mm)</li></ul></li><li>Dimensions<ul><li>Height: 11.4&#8243; (29 cm)</li><li>Width: 11.5&#8243; (29.2 cm)</li><li>Depth: 3.6&#8243; (9.26 cm)</li><li>Weight: 2.82lbs (1.28kg)</li></ul></li><li>Warranty: 3-Year Hardware Service with Onsite/In-Home Service After Remote Diagnosis</li></ul><p>Design and Build</p><p>The Dell OptiPlex 7040 Series SFF is a very small desktop computer;&#160;in fact, it could easily be placed on a desktop next to a monitor and not take up too much room. It could also be turned on its side and&#160;placed under a monitor&#8211;more akin to how computers were set up in the early-to-mid 1990s. The front of the computer is predominately taken up by ventilation. In the upper right hand corner, there is the Dell branding, four USB ports (2 x 2.0 and 2 x 3.0), an optical drive, and the power button.</p><p><img class=\"alignnone wp-image-33177 size-full\" src=\"https://ng.jumia.is/cms/external/pet/DE168CL45ISM1NAFAMZ/8b5b8a2217a6d23deca188a404398096.jpg\" alt=\"Dell OptiPlex 7040 Series\" width=\"850\" height=\"467\"></p><p>One side of the computer has rubber feet so users can, as stated above, turn the device on its side.</p><p><img class=\"alignnone wp-image-33178 size-full\" src=\"https://ng.jumia.is/cms/external/pet/DE168CL45ISM1NAFAMZ/62995d38c9c067d5e01278f94b3e292c.jpg\" alt=\"Dell OptiPlex 7040 Series - connectors\" width=\"850\" height=\"407\"></p><p>The rear of the computer is a quasi-reflection of the front, with the same amount of real estate taken up by ventilation. The left-hand corner that isn&#8217;t ventilation is filled with ports including&#160;an HDMI port, two DisplayPorts, a serial port, a keyboard and mouse port, 4 USB 3.0 ports, 2 USB 2.0 ports, and a RJ45 port. Near the bottom of the computer is a DVI-I dual link port next to another DisplayPort, with the power port beneath them.</p>', '<ul><li>CPU options:<ul><li>Intel Core i5-6500 Processor (Quad Core, 6MB, 4T, 3.2GHz, 65W)</li><li>Windows 11 Pro, 64bit</li><li>Memory: 8GB (2x4G) 2133MHz DDR4 Memory</li></ul></li><li>&#160; &#160; STORAGE 512 SSD&#160;</li><li><ul><li>Intel Integrated Graphic</li><li>Optical Drive options:</li></ul></li><li><ul><li>8x DVD+/-RW 9.5mm Optical Disk Drive</li><li>Ports:</li></ul></li><li><ul><li>6 USB 3.0 (2 front/4 rear-1 with PowerShare)</li><li>4 USB 2.0 (2 front/2 rear-1 front with PowerShare)</li><li>1 Internal USB 3.0 with smart power on</li><li>1 RJ-45</li><li>1 P2/Serial</li><li>2 Display Port 1.2</li><li>1 HDMI</li><li>1 Line-out</li><li>1 VGA (optional)</li></ul></li><li>Slots:<ul><li>1 half height PCIe x16</li><li>1 half height PCIe x4</li><li>1 M.2 (22x80mm)</li></ul></li><li>Dimensions<ul><li>Height: 11.4&#8243; (29 cm)</li><li>Width: 11.5&#8243; (29.2 cm)</li><li>Depth: 3.6&#8243; (9.26 cm)</li><li>Weight: 2.82lbs (1.28kg</li><li>24 INCH FHD MONITOR&#160;</li><li>USB KEYBAORD AND MOUSE&#160;</li></ul></li></ul>', 'images/products/opPvNYaPKT.jpeg', '2024-07-03 14:56:10', '2024-07-25 01:04:48'),
(7, 7, 'Baseus Bluetooth Earbuds Wireless Earpods Active Noise Cancellation Earphones Storm 1', 'baseus-bluetooth-earbuds-wireless-earpods-active-noise-cancellation-earphones-storm-1', NULL, 80, 7, 'BA204EA3V0FOSNAFAMZ', 0, 0, 'One button control easily to turn on/off, play/pause/switch music. Hands free calling to driving, working, meeting, running.', '<span>One button control easily to turn on/off, play/pause/switch music&#10;Hands free calling to driving, working, meeting, running.&#10;One to two connections, can be connected to two mobile phones at the same time.&#10;Intelligent compatibility: support all Bluetooth mobile phone, tablet, notebook, QQ music, movies, etc., universal all mobile phone.</span>', '<div><span>1.Bluetooth Version: V5.0&#10;2.Bluetooth Distance: 10m&#10;3.Charging Time: about 1-2 hours&#10;4.Standby Time: about 80 hours&#10;5.Music Time:  about 2.5 hours&#10;6.Talking Time: about 3 hours &#10;7.Earphone Battery: Polymer Lithium Battery 45mAh&#10;8.Battery Box Battery: Polymer Lithium Battery 280mAh&#10;9.Audio transmission format: HFP/A2DP/HSP/AVRCP</span><font color=\"#282828\" face=\"Roboto, -apple-system, BlinkMacSystemFont, Segoe UI, Helvetica Neue, Arial, sans-serif\"><span><br></span></font></div><div><span><br></span></div><div><span><br></span></div><ul><li>True wireless stereo, HIFI sound.</li><li>Both the left and right ears have full Bluetooth headset functionality and can be used individually or in pairs.</li><li>HiFi Headphone</li><li>Bluetooth transmission distance</li><li>Listening to song</li></ul>', 'images/products/RBCvhwnocK.jpeg', '2024-07-03 16:46:59', '2024-07-03 16:46:59'),
(8, 9, 'Sony PlayStation 5 (PS5) Console - Standard Edition', 'sony-playstation-5-ps5-console-standard-edition', 650, 625, 9, 'SO521EC4STR6RNAFAMZ', 0, 1, 'Explore uncharted virtual territories and slay dragons with this sleek Sony PlayStation 5 gaming console. The 825GB SSD allows ultra-fast load times, while 3-D audio output produces crisp acoustics.', '<p>Explore uncharted virtual territories and slay dragons with this sleek Sony PlayStation 5 gaming console. The 825GB SSD allows ultra-fast load times, while 3-D audio output produces crisp acoustics. This Sony PlayStation 5 gaming console supports haptic feedback for effortless communication in multiplayer setups, and adaptive triggers allow immersive gameplay.</p><h3 class=\"heading-5 v-fw-regular feature-heading\">Features</h3><h4 class=\"feature-title body-copy v-fw-medium\">Integrated I/O</h4><p>The custom integration of the PS5 console\'s systems lets creators pull data from the SSD so quickly that they can design games in ways never before possible.</p><h4 class=\"feature-title body-copy v-fw-medium\">Stunning games</h4><p>Marvel at incredible graphics and experience new PS5 features.</p><h4 class=\"feature-title body-copy v-fw-medium\">Ultra-high speed SSD</h4><p>Maximize your play sessions with near-instant load times for installed PS5 games.</p><h4 class=\"feature-title body-copy v-fw-medium\">HDR technology</h4><p>With an HDR TV, supported PS5 games display an unbelievably vibrant and lifelike range of colors.</p><h4 class=\"feature-title body-copy v-fw-medium\">8K output</h4><p>PS5 consoles support an 8K output, so you can play games on your 4320p resolution display.</p><h4 class=\"feature-title body-copy v-fw-medium\">4K TV gaming</h4><p>Play your favorite PS5 games on your stunning 4K TV.</p><h4 class=\"feature-title body-copy v-fw-medium\">Up to 120 fps with 120Hz output</h4><p>Enjoy smooth and fluid high frame rate gameplay at up to 120 fps for compatible games, with support for 120Hz output on 4K displays.</p><h4 class=\"feature-title body-copy v-fw-medium\">Tempest 3D AudioTech</h4><p>Immerse yourself in soundscapes where it feels as if the sound comes from every direction. Through your headphones or TV speakers, your surroundings truly come alive with Tempest 3D AudioTech in supported games.</p><h4 class=\"feature-title body-copy v-fw-medium\">Haptic feedback</h4><p>Experience a haptic feedback via the DualSense wireless controller in select PS5 titles, and feel the effects and impact of your in-game actions through the dynamic sensory feedback.</p><h4 class=\"feature-title body-copy v-fw-medium\">Adaptive triggers</h4><p>Get to grips with immersive adaptive triggers, featuring dynamic resistance levels which simulate the physical impact of in-game activities in select PS5 games.</p>', '<ul><li>Manufacturer - Sony&#160;</li><li>Wireless Controllers - Yes</li><li>USB Cable - Yes</li><li>HDMI Cable - Yes</li><li>AC Power Cord - Yes</li></ul>', 'images/products/TuWP7fyqlw.jpeg', '2024-07-03 16:52:07', '2024-07-25 01:02:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` tinyint(4) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 1, 'admin@shofy.com', '$2y$10$sILGgHYRpAGkt3vgRds6OerpaUhfIwnukOKdrD.pmnr34x8/y3.E6', NULL, '2024-06-24 12:53:25', '2024-06-24 12:53:25'),
(2, 'Damilare Odusanya', 2, 'joy.dammie@yahoo.com', '$2y$10$kSa2BysreEx47ld9ewCutuZUYyhYzTQkrsnn9Vh7r5EbwL0RE62ba', NULL, '2024-08-16 16:10:25', '2024-08-16 16:10:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billings`
--
ALTER TABLE `billings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_billing_id_foreign` (`billing_id`),
  ADD KEY `orders_product_id_foreign` (`product_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billings`
--
ALTER TABLE `billings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_billing_id_foreign` FOREIGN KEY (`billing_id`) REFERENCES `billings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
