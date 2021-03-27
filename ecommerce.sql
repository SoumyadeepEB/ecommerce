-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2021 at 08:03 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=inactive 1=active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `status`) VALUES
(1, 'Men', 1),
(2, 'Women', 1),
(3, 'House Product', 1),
(4, 'Electronics', 1),
(5, 'Daily Goods', 1),
(10, 'Sports', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `products` longtext NOT NULL,
  `quantities` longtext NOT NULL,
  `prices` longtext NOT NULL,
  `address` text NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=cancelled\r\n1=ordered\r\n2=packed\r\n3=shiped\r\n4=delivered',
  `timestamp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `products`, `quantities`, `prices`, `address`, `payment_method`, `invoice`, `status`, `timestamp`) VALUES
(8, 2, '2,4,11', '1,3,1', '10000,750,1700', '271 K.C Bose Road, Subhasgram, Pragatipally', 'cod', 'dummy.pdf', 1, '2021-03-25 10:03:23 am');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `subcat_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `stocks` int(255) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=inactive\r\n1=active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `cat_id`, `subcat_id`, `name`, `price`, `image`, `stocks`, `description`, `status`) VALUES
(1, 1, 1, 'Exclusive blue jeans', '1200', 'product_img_1616181944.jpg', 100, 'Lorem Ipsum is simply dummy text', 1),
(2, 4, 4, 'Xiaomi Mi 8', '10000', 'product_img_1616182059.jpg', 20, 'Lorem Ipsum is simply dummy text', 1),
(3, 2, 10, 'Necklase', '2500', 'product_img_1616183700.jpg', 30, 'Lorem Ipsum is simply dummy text', 1),
(4, 3, 7, 'Family dinner set', '750', 'product_img_1616308254.jpg', 10, 'Lorem Ipsum is simply dummy text', 1),
(5, 2, 13, 'Foliage dream Sari', '3500', 'product_img_1616341578.jpg', 15, 'Lorem Ipsum is simply dummy text', 1),
(6, 5, 11, 'Mastered Oil', '130', 'product_img_1616477477.jpg', 40, 'Lorem Ipsum is simply dummy text', 1),
(7, 1, 6, 'Round necked Tshirt', '650', 'product_img_1616477696.jpg', 5, 'Lorem Ipsum is simply dummy text', 1),
(8, 2, 3, 'Pink Cotton Kurti', '950', 'product_img_1616505148.jpg', 12, 'Lorem Ipsum is simply dummy text', 1),
(9, 3, 2, '2 Container Lunchbox', '500', 'product_img_1616508116.jpg', 2, 'Borosil 2 Container CarryFresh SS Insulated Lunch Box', 1),
(10, 4, 14, 'HP Laptop', '35000', 'product_img_1616580379.jpg', 10, 'Best laptop for office purpose', 1),
(11, 10, 15, 'India ODI Jersey', '1700', 'product_img_1616596282.jpg', 10, 'Exclusive India Cricket team jersey ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=inactive 1=active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `cat_id`, `name`, `status`) VALUES
(1, 1, 'Jeans', 1),
(2, 3, 'Lunch Box', 1),
(3, 2, 'Kurti', 1),
(4, 4, 'Mobile', 1),
(5, 4, 'Computer', 1),
(6, 1, 'Tshirt', 1),
(7, 3, 'Dinner Set', 1),
(8, 2, 'Tshirt', 1),
(9, 1, 'Shirt', 1),
(10, 2, 'Jewalary', 1),
(11, 5, 'Grocery', 1),
(12, 2, 'Cosmatics', 1),
(13, 2, 'Saree', 1),
(14, 4, 'Laptop', 1),
(15, 10, 'Jersey', 1),
(16, 10, 'Equipment', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'user=0\r\nadmin=1',
  `created_at` varchar(50) NOT NULL,
  `updated_at` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `sex`, `address`, `username`, `password`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@gmail.com', 'male', 'Kolkata', 'admin', '2138cb5b0302e84382dd9b3677576b24', 1, '2021-03-18 18:16:43 pm', '2021-03-18 18:16:43 pm'),
(2, 'Soumyadeep Ghosh', 'soumyadeepghosh22@gmail.com', 'male', '271 K.C Bose Road, Subhasgram, Pragatipally', 'soumyadeep', 'c358f944322859a9f50e6daf06e0e94b', 0, '2021-03-18 02:03:13 pm', '2021-03-18 02:03:13 pm'),
(11, 'Souvik Karmakar', 'souvik@gmail.com', 'male', 'P.C Chandra Road, Kolkata', 'souvik', 'ec08f971b7cee84ff3fbd0092a204d9c', 0, '2021-03-19 01:03:40 pm', '2021-03-19 01:03:40 pm'),
(12, 'John Doe', 'john@gmail.com', 'male', 'San Fransisco, USA', 'john', 'fc5e038d38a57032085441e7fe7010b0', 0, '2021-03-24 10:03:37 am', '2021-03-24 10:03:37 am');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `subcat_id` (`subcat_id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`subcat_id`) REFERENCES `subcategory` (`id`);

--
-- Constraints for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
