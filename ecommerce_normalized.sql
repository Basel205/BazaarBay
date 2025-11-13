-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2025 at 02:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_normalized`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `Address_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `Postal_Code` varchar(20) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `Type` enum('shipping','billing','both') DEFAULT 'shipping',
  `Is_Default` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`Address_ID`, `Customer_ID`, `Street`, `City`, `State`, `Postal_Code`, `Country`, `Type`, `Is_Default`, `created_at`) VALUES
(1, 1, '123 MG Road', 'Mumbai', 'Maharashtra', '400001', 'India', 'shipping', 1, '2025-10-12 18:41:52'),
(2, 2, '45 Brigade St', 'Bangalore', 'Karnataka', '560001', 'India', 'shipping', 1, '2025-10-12 18:41:52'),
(3, 3, '67 Park Ave', 'Delhi', 'Delhi', '110001', 'India', 'billing', 1, '2025-10-12 18:41:52'),
(4, 4, '89 Ring Rd', 'Chennai', 'Tamil Nadu', '600001', 'India', 'shipping', 1, '2025-10-12 18:41:52'),
(5, 5, '12 MG Rd', 'Pune', 'Maharashtra', '411001', 'India', 'both', 1, '2025-10-12 18:41:52'),
(6, 6, '34 St Marks', 'Hyderabad', 'Telangana', '500001', 'India', 'shipping', 1, '2025-10-12 18:41:52'),
(7, 7, '56 MG Road', 'Kolkata', 'West Bengal', '700001', 'India', 'billing', 1, '2025-10-12 18:41:52'),
(8, 8, '78 Park Lane', 'Ahmedabad', 'Gujarat', '380001', 'India', 'shipping', 1, '2025-10-12 18:41:52'),
(9, 9, '90 Brigade St', 'Bangalore', 'Karnataka', '560002', 'India', 'shipping', 1, '2025-10-12 18:41:52'),
(10, 10, '11 MG Road', 'Mumbai', 'Maharashtra', '400002', 'India', 'billing', 1, '2025-10-12 18:41:52'),
(11, 11, '22 Ring Rd', 'Chennai', 'Tamil Nadu', '600002', 'India', 'shipping', 1, '2025-10-12 18:41:52'),
(12, 12, '33 Park Ave', 'Delhi', 'Delhi', '110002', 'India', 'shipping', 1, '2025-10-12 18:41:52'),
(13, 13, '44 MG Road', 'Pune', 'Maharashtra', '411002', 'India', 'billing', 1, '2025-10-12 18:41:52'),
(14, 14, '55 Brigade St', 'Bangalore', 'Karnataka', '560003', 'India', 'shipping', 1, '2025-10-12 18:41:52'),
(15, 15, '66 Park Lane', 'Hyderabad', 'Telangana', '500002', 'India', 'shipping', 1, '2025-10-12 18:41:52'),
(16, 16, '77 MG Road', 'Kolkata', 'West Bengal', '700002', 'India', 'billing', 1, '2025-10-12 18:41:52'),
(17, 17, '88 St Marks', 'Ahmedabad', 'Gujarat', '380002', 'India', 'shipping', 1, '2025-10-12 18:41:52'),
(18, 18, '99 Park Ave', 'Delhi', 'Delhi', '110003', 'India', 'shipping', 1, '2025-10-12 18:41:52'),
(19, 19, '100 MG Road', 'Mumbai', 'Maharashtra', '400003', 'India', 'billing', 1, '2025-10-12 18:41:52'),
(20, 20, '101 Ring Rd', 'Chennai', 'Tamil Nadu', '600003', 'India', 'shipping', 1, '2025-10-12 18:41:52'),
(21, 22, 'idk', 'chennai', 'Tamil Nadu', '600127', 'India', '', 1, '2025-11-02 21:58:28'),
(22, 22, 'adfad', 'Aligarh', 'Uttar Pradesh', '200202', 'India', '', 0, '2025-11-02 21:59:24'),
(23, 23, 'adfadsfa', 'Chennai', 'Tamil Nadu', '600127', 'India', '', 0, '2025-11-02 22:01:16'),
(24, 23, 'adfadf', 'Aligarh', 'Uttar Pradesh', '200202', 'India', '', 0, '2025-11-02 22:01:42'),
(25, 23, 'apratim', 'California', 'California', '12345', 'USA', '', 0, '2025-11-02 22:29:11');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_ID` int(11) NOT NULL,
  `Name` varchar(150) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password_Hash` varchar(255) NOT NULL,
  `Role` enum('super_admin','admin','moderator') DEFAULT 'admin',
  `Status` enum('active','inactive') DEFAULT 'active',
  `Created_Date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_ID`, `Name`, `Email`, `Password_Hash`, `Role`, `Status`, `Created_Date`) VALUES
(1, 'Admin One', 'admin1@example.com', '', 'super_admin', 'active', '2025-10-12 18:41:52'),
(2, 'Admin Two', 'admin2@example.com', '', 'admin', 'active', '2025-10-12 18:41:52'),
(3, 'Admin Three', 'admin3@example.com', '', 'moderator', 'active', '2025-10-12 18:41:52'),
(4, 'Admin Four', 'admin4@example.com', '', 'admin', 'active', '2025-10-12 18:41:52'),
(5, 'Admin Five', 'admin5@example.com', '', 'moderator', 'active', '2025-10-12 18:41:52');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `Cart_ID` int(11) NOT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Created_Date` datetime DEFAULT current_timestamp(),
  `Status` enum('active','abandoned','converted') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`Cart_ID`, `Customer_ID`, `Created_Date`, `Status`) VALUES
(1, 1, '2025-10-12 18:45:11', 'active'),
(2, 2, '2025-10-12 18:45:11', 'active'),
(3, 3, '2025-10-12 18:45:11', 'active'),
(4, 4, '2025-10-12 18:45:11', 'active'),
(5, 5, '2025-10-12 18:45:11', 'active'),
(6, 6, '2025-10-12 18:45:11', 'active'),
(7, 7, '2025-10-12 18:45:11', 'active'),
(8, 8, '2025-10-12 18:45:11', 'active'),
(9, 9, '2025-10-12 18:45:11', 'active'),
(10, 10, '2025-10-12 18:45:11', 'active'),
(11, 11, '2025-10-12 18:45:11', 'active'),
(12, 12, '2025-10-12 18:45:11', 'active'),
(13, 13, '2025-10-12 18:45:11', 'active'),
(14, 14, '2025-10-12 18:45:11', 'active'),
(15, 15, '2025-10-12 18:45:11', 'active'),
(16, 16, '2025-10-12 18:45:11', 'active'),
(17, 17, '2025-10-12 18:45:11', 'active'),
(18, 18, '2025-10-12 18:45:11', 'active'),
(19, 19, '2025-10-12 18:45:11', 'active'),
(20, 20, '2025-10-12 18:45:11', 'active'),
(21, 21, '2025-10-12 19:08:08', 'active'),
(22, 22, '2025-11-02 21:27:11', 'active'),
(23, 23, '2025-11-02 22:01:46', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `Cart_Item_ID` int(11) NOT NULL,
  `Cart_ID` int(11) DEFAULT NULL,
  `Product_ID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT 1,
  `Added_Date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`Cart_Item_ID`, `Cart_ID`, `Product_ID`, `Quantity`, `Added_Date`) VALUES
(1, 1, 1, 1, '2025-10-12 18:45:11'),
(2, 1, 3, 1, '2025-10-12 18:45:11'),
(3, 2, 2, 2, '2025-10-12 18:45:11'),
(4, 2, 4, 1, '2025-10-12 18:45:11'),
(5, 3, 5, 1, '2025-10-12 18:45:11'),
(6, 3, 6, 1, '2025-10-12 18:45:11'),
(7, 4, 7, 3, '2025-10-12 18:45:11'),
(8, 5, 8, 2, '2025-10-12 18:45:11'),
(9, 6, 9, 1, '2025-10-12 18:45:11'),
(10, 7, 10, 1, '2025-10-12 18:45:11'),
(11, 8, 11, 1, '2025-10-12 18:45:11'),
(12, 9, 12, 1, '2025-10-12 18:45:11'),
(13, 10, 13, 1, '2025-10-12 18:45:11'),
(14, 11, 14, 1, '2025-10-12 18:45:11'),
(15, 12, 15, 2, '2025-10-12 18:45:11'),
(16, 13, 16, 1, '2025-10-12 18:45:11'),
(17, 14, 17, 1, '2025-10-12 18:45:11'),
(18, 15, 18, 1, '2025-10-12 18:45:11'),
(19, 16, 19, 1, '2025-10-12 18:45:11'),
(20, 17, 20, 1, '2025-10-12 18:45:11');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Category_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `Parent_Category_ID` int(11) DEFAULT NULL,
  `Status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_ID`, `Name`, `Description`, `Parent_Category_ID`, `Status`) VALUES
(1, 'Electronics', 'Devices and gadgets', NULL, 'active'),
(2, 'Mobiles', 'Smartphones and accessories', 1, 'active'),
(3, 'Laptops', 'All laptops', 1, 'active'),
(4, 'Home Appliances', 'Kitchen and home', NULL, 'active'),
(5, 'Refrigerators', 'Cooling appliances', 4, 'active'),
(6, 'Washing Machines', 'Laundry appliances', 4, 'active'),
(7, 'Clothing', 'Men and Women clothing', NULL, 'active'),
(8, 'Men Clothing', 'Shirts, pants, etc.', 7, 'active'),
(9, 'Women Clothing', 'Dresses, tops, etc.', 7, 'active'),
(10, 'Books', 'All books', NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL,
  `Name` varchar(150) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Gender` enum('M','F','Other') DEFAULT NULL,
  `Mob_No` varchar(20) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password_Hash` varchar(255) NOT NULL,
  `Status` enum('active','inactive','banned') DEFAULT 'active',
  `Registration_Date` datetime DEFAULT current_timestamp(),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `Name`, `DOB`, `Gender`, `Mob_No`, `Email`, `Password_Hash`, `Status`, `Registration_Date`, `created_at`, `updated_at`) VALUES
(1, 'Basel Khan', '2001-05-12', 'M', '9876543210', 'basel@example.com', 'hash1', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(2, 'Apratim Jha', '2000-11-23', 'M', '9876543211', 'apratim@example.com', 'hash2', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(3, 'Sana Sharma', '1998-08-15', 'F', '9876543212', 'sana@example.com', 'hash3', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(4, 'Rohit Singh', '1999-01-30', 'M', '9876543213', 'rohit@example.com', 'hash4', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(5, 'Anjali Verma', '2002-03-14', 'F', '9876543214', 'anjali@example.com', 'hash5', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(6, 'Vikram Rao', '2001-07-19', 'M', '9876543215', 'vikram@example.com', 'hash6', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(7, 'Priya Mehta', '1997-12-02', 'F', '9876543216', 'priya@example.com', 'hash7', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(8, 'Aditya Kulkarni', '2000-09-22', 'M', '9876543217', 'aditya@example.com', 'hash8', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(9, 'Neha Gupta', '1999-06-05', 'F', '9876543218', 'neha@example.com', 'hash9', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(10, 'Arjun Desai', '1998-04-11', 'M', '9876543219', 'arjun@example.com', 'hash10', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(11, 'Rhea Kapoor', '2001-02-18', 'F', '9876543220', 'rhea@example.com', 'hash11', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(12, 'Kabir Malhotra', '2002-12-25', 'M', '9876543221', 'kabir@example.com', 'hash12', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(13, 'Tanya Nair', '1998-05-30', 'F', '9876543222', 'tanya@example.com', 'hash13', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(14, 'Siddharth Chawla', '2000-11-10', 'M', '9876543223', 'siddharth@example.com', 'hash14', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(15, 'Meera Iyer', '1999-09-09', 'F', '9876543224', 'meera@example.com', 'hash15', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(16, 'Karan Joshi', '2001-06-06', 'M', '9876543225', 'karan@example.com', 'hash16', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(17, 'Isha Patel', '2002-03-03', 'F', '9876543226', 'isha@example.com', 'hash17', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(18, 'Arnav Bhatia', '1997-10-10', 'M', '9876543227', 'arnav@example.com', 'hash18', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(19, 'Diya Saxena', '2000-01-01', 'F', '9876543228', 'diya@example.com', 'hash19', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(20, 'Neil Reddy', '1998-08-08', 'M', '9876543229', 'neil@example.com', 'hash20', 'active', '2025-10-12 18:41:52', '2025-10-12 18:41:52', '2025-10-12 18:41:52'),
(21, 'basel', NULL, NULL, '7078747042', 'kbasel2005@gmail.com', '$2b$12$fFHgBb8kli3Gawihna92vu5Ludv3fdnfcGMZexC1DhV2YPT1cZTMK', 'active', '2025-10-12 19:08:00', '2025-10-12 19:08:00', '2025-10-12 19:08:00'),
(22, 'Apratim Jha', NULL, NULL, '909090909', 'apratim@gmail.com', '$2b$12$LTm7yzdgux71VNirXGMvU.JRxYDIbgyX6ysISOP4FB9AZWm7vfwre', 'active', '2025-11-02 21:26:30', '2025-11-02 21:26:30', '2025-11-02 21:26:30'),
(23, 'Basel Ali', NULL, NULL, '123456789', 'basel@gmail.com', '$2b$12$9uxdLKLAUFxBCmWTo0jTLO5fyobvUYNhRdUpQ/iYFO7Ivbc7Fw/Oy', 'active', '2025-11-02 22:00:43', '2025-11-02 22:00:43', '2025-11-02 22:00:43');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `Delivery_ID` int(11) NOT NULL,
  `Order_ID` int(11) DEFAULT NULL,
  `Tracking_Number` varchar(100) DEFAULT NULL,
  `Carrier` varchar(100) DEFAULT NULL,
  `Estimated_Delivery_Date` datetime DEFAULT NULL,
  `Actual_Delivery_Date` datetime DEFAULT NULL,
  `Delivery_Status` enum('in-transit','delivered','failed') DEFAULT 'in-transit'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`Delivery_ID`, `Order_ID`, `Tracking_Number`, `Carrier`, `Estimated_Delivery_Date`, `Actual_Delivery_Date`, `Delivery_Status`) VALUES
(1, 1, 'TRK1001', 'FedEx', '2025-10-20 00:00:00', '2025-10-18 00:00:00', 'delivered'),
(2, 2, 'TRK1002', 'DHL', '2025-10-22 00:00:00', '2025-10-21 00:00:00', 'delivered'),
(3, 3, 'TRK1003', 'BlueDart', '2025-10-23 00:00:00', '2025-10-22 00:00:00', 'delivered'),
(4, 4, 'TRK1004', 'FedEx', '2025-10-21 00:00:00', '2025-10-20 00:00:00', 'delivered'),
(5, 5, 'TRK1005', 'DHL', '2025-10-21 00:00:00', '2025-10-19 00:00:00', 'delivered'),
(6, 6, 'TRK1006', 'FedEx', '2025-10-24 00:00:00', '2025-10-23 00:00:00', 'delivered'),
(7, 7, 'TRK1007', 'BlueDart', '2025-10-25 00:00:00', NULL, 'in-transit'),
(8, 8, 'TRK1008', 'DHL', '2025-10-26 00:00:00', NULL, 'in-transit'),
(9, 9, 'TRK1009', 'FedEx', '2025-10-20 00:00:00', '2025-10-19 00:00:00', 'delivered'),
(10, 10, 'TRK1010', 'BlueDart', '2025-10-28 00:00:00', NULL, 'in-transit'),
(11, 11, 'TRK1011', 'DHL', '2025-10-29 00:00:00', NULL, 'in-transit'),
(12, 12, 'TRK1012', 'FedEx', '2025-10-22 00:00:00', '2025-10-21 00:00:00', 'delivered'),
(13, 13, 'TRK1013', 'BlueDart', '2025-10-24 00:00:00', '2025-10-23 00:00:00', 'delivered'),
(14, 14, 'TRK1014', 'DHL', '2025-10-23 00:00:00', '2025-10-22 00:00:00', 'delivered'),
(15, 15, 'TRK1015', 'FedEx', '2025-10-25 00:00:00', NULL, 'in-transit'),
(16, 16, 'TRK1016', 'BlueDart', '2025-10-26 00:00:00', NULL, 'in-transit'),
(17, 17, 'TRK1017', 'DHL', '2025-10-27 00:00:00', NULL, 'in-transit'),
(18, 18, 'TRK1018', 'FedEx', '2025-10-28 00:00:00', NULL, 'in-transit'),
(19, 19, 'TRK1019', 'BlueDart', '2025-10-29 00:00:00', NULL, 'in-transit'),
(20, 20, 'TRK1020', 'DHL', '2025-10-30 00:00:00', NULL, 'in-transit');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_log`
--

CREATE TABLE `inventory_log` (
  `Log_ID` int(11) NOT NULL,
  `Product_ID` int(11) DEFAULT NULL,
  `Change_Type` enum('addition','removal','update') DEFAULT NULL,
  `Quantity_Changed` int(11) DEFAULT NULL,
  `Changed_By` int(11) DEFAULT NULL,
  `Change_Date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory_log`
--

INSERT INTO `inventory_log` (`Log_ID`, `Product_ID`, `Change_Type`, `Quantity_Changed`, `Changed_By`, `Change_Date`) VALUES
(1, 1, 'addition', 50, 1, '2025-10-12 18:45:11'),
(2, 2, 'addition', 60, 2, '2025-10-12 18:45:11'),
(3, 3, 'addition', 30, 1, '2025-10-12 18:45:11'),
(4, 4, 'addition', 25, 1, '2025-10-12 18:45:11'),
(5, 5, 'addition', 15, 2, '2025-10-12 18:45:11'),
(6, 6, 'addition', 20, 3, '2025-10-12 18:45:11'),
(7, 7, 'addition', 100, 2, '2025-10-12 18:45:11'),
(8, 8, 'addition', 50, 3, '2025-10-12 18:45:11'),
(9, 9, 'addition', 200, 1, '2025-10-12 18:45:11'),
(10, 10, 'addition', 40, 2, '2025-10-12 18:45:11');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Order_ID` int(11) NOT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Shipping_Address_ID` int(11) DEFAULT NULL,
  `Order_Date` datetime DEFAULT current_timestamp(),
  `Total_Amount` decimal(12,2) DEFAULT NULL,
  `Status` enum('pending','shipped','delivered','cancelled') DEFAULT 'pending',
  `Created_At` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Order_ID`, `Customer_ID`, `Shipping_Address_ID`, `Order_Date`, `Total_Amount`, `Status`, `Created_At`) VALUES
(1, 1, 1, '2025-10-12 18:45:11', 128000.00, 'pending', '2025-10-12 20:55:44'),
(2, 2, 2, '2025-10-12 18:45:11', 140000.00, 'pending', '2025-10-12 20:55:44'),
(3, 3, 3, '2025-10-12 18:45:11', 90000.00, 'pending', '2025-10-12 20:55:44'),
(4, 4, 4, '2025-10-12 18:45:11', 15000.00, 'pending', '2025-10-12 20:55:44'),
(5, 5, 5, '2025-10-12 18:45:11', 4700.00, 'pending', '2025-10-12 20:55:44'),
(6, 6, 6, '2025-10-12 18:45:11', 80500.00, 'pending', '2025-10-12 20:55:44'),
(7, 7, 7, '2025-10-12 18:45:11', 80000.00, 'pending', '2025-10-12 20:55:44'),
(8, 8, 8, '2025-10-12 18:45:11', 60000.00, 'pending', '2025-10-12 20:55:44'),
(9, 9, 9, '2025-10-12 18:45:11', 500.00, 'pending', '2025-10-12 20:55:44'),
(10, 10, 10, '2025-10-12 18:45:11', 100000.00, 'pending', '2025-10-12 20:55:44'),
(11, 11, 11, '2025-10-12 18:45:11', 80000.00, 'pending', '2025-10-12 20:55:44'),
(12, 12, 12, '2025-10-12 18:45:11', 10000.00, 'pending', '2025-10-12 20:55:44'),
(13, 13, 13, '2025-10-12 18:45:11', 3000.00, 'pending', '2025-10-12 20:55:44'),
(14, 14, 14, '2025-10-12 18:45:11', 2800.00, 'pending', '2025-10-12 20:55:44'),
(15, 15, 15, '2025-10-12 18:45:11', 2500.00, 'pending', '2025-10-12 20:55:44'),
(16, 16, 16, '2025-10-12 18:45:11', 55000.00, 'pending', '2025-10-12 20:55:44'),
(17, 17, 17, '2025-10-12 18:45:11', 38000.00, 'pending', '2025-10-12 20:55:44'),
(18, 18, 18, '2025-10-12 18:45:11', 12000.00, 'pending', '2025-10-12 20:55:44'),
(19, 19, 19, '2025-10-12 18:45:11', 128000.00, 'pending', '2025-10-12 20:55:44'),
(20, 20, 20, '2025-10-12 18:45:11', 140000.00, 'pending', '2025-10-12 20:55:44'),
(25, 21, NULL, '2025-10-12 19:44:00', 80000.00, 'pending', '2025-10-12 20:55:44'),
(26, 21, NULL, '2025-10-12 19:44:08', 80000.00, 'pending', '2025-10-12 20:55:44'),
(27, 21, NULL, '2025-10-12 20:57:56', 70000.00, 'pending', '2025-10-12 20:57:56'),
(28, 21, NULL, '2025-10-12 21:11:50', 240000.00, 'pending', '2025-10-12 21:11:50'),
(29, 21, NULL, '2025-10-12 22:02:14', 638000.00, 'pending', '2025-10-12 22:02:14'),
(30, 21, NULL, '2025-10-12 22:11:38', 38000.00, 'pending', '2025-10-12 22:11:38'),
(31, 21, NULL, '2025-10-12 23:55:40', 240000.00, 'pending', '2025-10-12 23:55:40'),
(32, 21, NULL, '2025-10-12 23:56:38', 3760000.00, 'shipped', '2025-10-12 23:56:38'),
(33, 22, NULL, '2025-11-02 21:27:14', 600000.00, 'pending', '2025-11-02 21:27:14'),
(34, 22, 21, '2025-11-02 21:58:38', 140000.00, 'delivered', '2025-11-02 21:58:38'),
(35, 22, 21, '2025-11-02 21:59:33', 70000.00, 'pending', '2025-11-02 21:59:33'),
(37, 23, 24, '2025-11-02 22:27:22', 140000.00, 'pending', '2025-11-02 22:27:22'),
(38, 23, 25, '2025-11-02 22:31:07', 200000.00, 'delivered', '2025-11-02 22:31:07'),
(39, 23, 24, '2025-11-02 22:57:36', 80000.00, 'shipped', '2025-11-02 22:57:36'),
(40, 23, 25, '2025-11-03 08:49:49', 1200.00, 'delivered', '2025-11-03 08:49:49'),
(41, 23, 25, '2025-11-03 09:12:07', 70000.00, 'delivered', '2025-11-03 09:12:07'),
(42, 23, 25, '2025-11-03 09:12:27', 120000.00, 'delivered', '2025-11-03 09:12:27'),
(43, 23, 24, '2025-11-08 18:51:25', 112400.00, 'pending', '2025-11-08 18:51:25');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `Order_Detail_ID` int(11) NOT NULL,
  `Order_ID` int(11) DEFAULT NULL,
  `Product_ID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT 1,
  `Unit_Price` decimal(10,2) DEFAULT NULL,
  `Subtotal` decimal(12,2) DEFAULT NULL,
  `Created_At` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`Order_Detail_ID`, `Order_ID`, `Product_ID`, `Quantity`, `Unit_Price`, `Subtotal`, `Created_At`) VALUES
(1, 1, 1, 1, 80000.00, 80000.00, '2025-10-12 20:57:31'),
(2, 1, 3, 1, 48000.00, 48000.00, '2025-10-12 20:57:31'),
(3, 2, 2, 2, 70000.00, 140000.00, '2025-10-12 20:57:31'),
(4, 3, 5, 1, 50000.00, 50000.00, '2025-10-12 20:57:31'),
(5, 3, 6, 1, 40000.00, 40000.00, '2025-10-12 20:57:31'),
(6, 4, 7, 3, 5000.00, 15000.00, '2025-10-12 20:57:31'),
(7, 5, 8, 2, 2350.00, 4700.00, '2025-10-12 20:57:31'),
(8, 6, 10, 1, 80000.00, 80000.00, '2025-10-12 20:57:31'),
(9, 6, 6, 1, 500.00, 500.00, '2025-10-12 20:57:31'),
(10, 7, 1, 1, 80000.00, 80000.00, '2025-10-12 20:57:31'),
(11, 8, 11, 1, 60000.00, 60000.00, '2025-10-12 20:57:31'),
(12, 9, 9, 1, 500.00, 500.00, '2025-10-12 20:57:31'),
(13, 10, 12, 1, 100000.00, 100000.00, '2025-10-12 20:57:31'),
(14, 11, 14, 1, 75000.00, 75000.00, '2025-10-12 20:57:31'),
(15, 12, 15, 2, 3000.00, 6000.00, '2025-10-12 20:57:31'),
(16, 13, 16, 1, 2800.00, 2800.00, '2025-10-12 20:57:31'),
(17, 14, 17, 1, 2500.00, 2500.00, '2025-10-12 20:57:31'),
(18, 15, 18, 1, 55000.00, 55000.00, '2025-10-12 20:57:31'),
(19, 16, 19, 1, 38000.00, 38000.00, '2025-10-12 20:57:31'),
(20, 17, 20, 1, 12000.00, 12000.00, '2025-10-12 20:57:31'),
(21, 18, 4, 1, 200000.00, 200000.00, '2025-10-12 20:57:31'),
(22, 19, 2, 1, 70000.00, 70000.00, '2025-10-12 20:57:31'),
(23, 19, 3, 1, 48000.00, 48000.00, '2025-10-12 20:57:31'),
(24, 20, 1, 1, 80000.00, 80000.00, '2025-10-12 20:57:31'),
(25, 20, 2, 1, 70000.00, 70000.00, '2025-10-12 20:57:31'),
(26, 25, 1, 1, 80000.00, 80000.00, '2025-10-12 20:57:31'),
(27, 26, 1, 1, 80000.00, 80000.00, '2025-10-12 20:57:31'),
(28, 27, 2, 1, 70000.00, 70000.00, '2025-10-12 20:57:56'),
(29, 28, 1, 3, 80000.00, 240000.00, '2025-10-12 21:11:50'),
(30, 29, 4, 3, 200000.00, 600000.00, '2025-10-12 22:02:14'),
(31, 29, 19, 1, 38000.00, 38000.00, '2025-10-12 22:02:14'),
(33, 30, 19, 1, 38000.00, 38000.00, '2025-10-12 22:11:38'),
(34, 31, 1, 3, 80000.00, 240000.00, '2025-10-12 23:55:40'),
(35, 32, 1, 47, 80000.00, 3760000.00, '2025-10-12 23:56:38'),
(36, 33, 4, 3, 200000.00, 600000.00, '2025-11-02 21:27:14'),
(37, 34, 2, 2, 70000.00, 140000.00, '2025-11-02 21:58:38'),
(38, 35, 2, 1, 70000.00, 70000.00, '2025-11-02 21:59:33'),
(39, 37, 2, 2, 70000.00, 140000.00, '2025-11-02 22:27:22'),
(40, 38, 4, 1, 200000.00, 200000.00, '2025-11-02 22:31:07'),
(41, 39, 1, 1, 80000.00, 80000.00, '2025-11-02 22:57:36'),
(42, 40, 7, 1, 1200.00, 1200.00, '2025-11-03 08:49:49'),
(43, 41, 2, 1, 70000.00, 70000.00, '2025-11-03 09:12:07'),
(44, 42, 3, 1, 120000.00, 120000.00, '2025-11-03 09:12:27'),
(45, 43, 2, 1, 70000.00, 70000.00, '2025-11-08 18:51:25'),
(46, 43, 6, 1, 40000.00, 40000.00, '2025-11-08 18:51:25'),
(47, 43, 7, 2, 1200.00, 2400.00, '2025-11-08 18:51:25');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_ID` int(11) NOT NULL,
  `Order_ID` int(11) DEFAULT NULL,
  `Amount` decimal(12,2) DEFAULT NULL,
  `Payment_Method` enum('credit_card','UPI','PayPal') DEFAULT NULL,
  `Transaction_ID` varchar(100) DEFAULT NULL,
  `Payment_Date` datetime DEFAULT current_timestamp(),
  `Status` enum('pending','complete','failed') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment_ID`, `Order_ID`, `Amount`, `Payment_Method`, `Transaction_ID`, `Payment_Date`, `Status`) VALUES
(1, 1, 128000.00, 'credit_card', 'TXN1001', '2025-10-12 18:45:11', 'complete'),
(2, 2, 140000.00, 'UPI', 'TXN1002', '2025-10-12 18:45:11', 'complete'),
(3, 3, 90000.00, 'PayPal', 'TXN1003', '2025-10-12 18:45:11', 'complete'),
(4, 4, 15000.00, 'credit_card', 'TXN1004', '2025-10-12 18:45:11', 'complete'),
(5, 5, 4700.00, 'UPI', 'TXN1005', '2025-10-12 18:45:11', 'complete'),
(6, 6, 80500.00, 'credit_card', 'TXN1006', '2025-10-12 18:45:11', 'complete'),
(7, 7, 80000.00, 'PayPal', 'TXN1007', '2025-10-12 18:45:11', 'complete'),
(8, 8, 60000.00, 'credit_card', 'TXN1008', '2025-10-12 18:45:11', 'complete'),
(9, 9, 500.00, 'UPI', 'TXN1009', '2025-10-12 18:45:11', 'complete'),
(10, 10, 100000.00, 'credit_card', 'TXN1010', '2025-10-12 18:45:11', 'complete'),
(11, 11, 75000.00, 'UPI', 'TXN1011', '2025-10-12 18:45:11', 'complete'),
(12, 12, 6000.00, 'PayPal', 'TXN1012', '2025-10-12 18:45:11', 'complete'),
(13, 13, 2800.00, 'credit_card', 'TXN1013', '2025-10-12 18:45:11', 'complete'),
(14, 14, 2500.00, 'UPI', 'TXN1014', '2025-10-12 18:45:11', 'complete'),
(15, 15, 55000.00, 'credit_card', 'TXN1015', '2025-10-12 18:45:11', 'complete'),
(16, 16, 38000.00, 'PayPal', 'TXN1016', '2025-10-12 18:45:11', 'complete'),
(17, 17, 12000.00, 'UPI', 'TXN1017', '2025-10-12 18:45:11', 'complete'),
(18, 18, 200000.00, 'credit_card', 'TXN1018', '2025-10-12 18:45:11', 'complete'),
(19, 19, 118000.00, 'UPI', 'TXN1019', '2025-10-12 18:45:11', 'complete'),
(20, 20, 150000.00, 'PayPal', 'TXN1020', '2025-10-12 18:45:11', 'complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Stock_Quantity` int(11) DEFAULT NULL,
  `Category_ID` int(11) DEFAULT NULL,
  `Brand` varchar(100) DEFAULT NULL,
  `SKU` varchar(100) DEFAULT NULL,
  `Image_URL` varchar(500) DEFAULT NULL,
  `Created_Date` datetime DEFAULT current_timestamp(),
  `Status` enum('active','discontinued') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Name`, `Description`, `Price`, `Stock_Quantity`, `Category_ID`, `Brand`, `SKU`, `Image_URL`, `Created_Date`, `Status`) VALUES
(1, 'iPhone 14', 'Latest Apple smartphone', 80000.00, 0, 2, 'Apple', 'SKU001', 'iPhone 14.jpg', '2025-10-12 18:41:52', 'active'),
(2, 'Samsung Galaxy S23', 'Flagship Samsung phone', 70000.00, 53, 2, 'Samsung', 'SKU002', 'Samsung Galaxy S23.jpg', '2025-10-12 18:41:52', 'active'),
(3, 'Dell XPS 13', 'High-end Dell laptop', 120000.00, 29, 3, 'Dell', 'SKU003', 'Dell XPS 13.jpg', '2025-10-12 18:41:52', 'active'),
(4, 'MacBook Pro 16', 'Apple laptop', 200000.00, 21, 3, 'Apple', 'SKU004', 'MacBook Pro 16.jpg', '2025-10-12 18:41:52', 'active'),
(5, 'LG Refrigerator', 'Double door fridge', 50000.00, 0, 5, 'LG', 'SKU005', 'LG Refrigerator.jpg', '2025-10-12 18:41:52', 'active'),
(6, 'Whirlpool Washing Machine', 'Front load washer', 40000.00, 19, 6, 'Whirlpool', 'SKU006', 'Whirlpool Washing Machine.jpg', '2025-10-12 18:41:52', 'active'),
(7, 'Men T-Shirt', 'Cotton shirt', 1200.00, 97, 8, 'Nike', 'SKU007', 'Men T-Shirt.jpg', '2025-10-12 18:41:52', 'active'),
(8, 'Women Dress', 'Evening gown', 3500.00, 50, 9, 'Zara', 'SKU008', 'Women Dress.jpg', '2025-10-12 18:41:52', 'active'),
(9, 'Harry Potter Book', 'Fantasy novel', 500.00, 200, 10, 'Bloomsbury', 'SKU009', 'Harry Potter Book.jpg', '2025-10-12 18:41:52', 'active'),
(10, 'iPad Pro', 'Apple tablet', 80000.00, 40, 2, 'Apple', 'SKU010', 'iPad Pro.jpg', '2025-10-12 18:41:52', 'active'),
(11, 'Samsung Tablet', 'Samsung tablet', 60000.00, 45, 2, 'Samsung', 'SKU011', 'Samsung Tablet.jpg', '2025-10-12 18:41:52', 'active'),
(12, 'HP Spectre x360', 'HP laptop', 100000.00, 30, 3, 'HP', 'SKU012', 'HP Spectre x360.jpg', '2025-10-12 18:41:52', 'active'),
(13, 'Sony Headphones', 'Noise cancelling', 8000.00, 70, 1, 'Sony', 'SKU013', 'Sony Headphones.jpg', '2025-10-12 18:41:52', 'active'),
(14, 'Canon EOS 90D', 'DSLR Camera', 75000.00, 20, 1, 'Canon', 'SKU014', 'Canon EOS 90D.jpg', '2025-10-12 18:41:52', 'active'),
(15, 'Nike Sneakers', 'Running shoes', 3000.00, 80, 8, 'Nike', 'SKU015', 'Nike Sneakers.jpg', '2025-10-12 18:41:52', 'active'),
(16, 'Adidas Sneakers', 'Sports shoes', 2800.00, 80, 8, 'Adidas', 'SKU016', 'Adidas Sneakers.jpg', '2025-10-12 18:41:52', 'active'),
(17, 'Levi Jeans', 'Denim pants', 2500.00, 70, 8, 'Levi', 'SKU017', 'Levi Jeans.jpg', '2025-10-12 18:41:52', 'active'),
(18, 'Samsung Refrigerator', 'Double door fridge', 55000.00, 10, 5, 'Samsung', 'SKU018', 'Samsung Refrigerator.jpg', '2025-10-12 18:41:52', 'active'),
(19, 'LG Washing Machine', 'Top load washer', 38000.00, 14, 6, 'LG', 'SKU019', 'LG Washing Machine.jpg', '2025-10-12 18:41:52', 'active'),
(20, 'Kindle Paperwhite', 'E-book reader', 12000.00, 50, 10, 'Amazon', 'SKU020', 'Kindle Paperwhite.jpg', '2025-10-12 18:41:52', 'active'),
(21, 'sfafdsg', 'hgjg', 577.00, 10, 1, NULL, '', NULL, '2025-11-03 12:22:43', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `Review_ID` int(11) NOT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Product_ID` int(11) DEFAULT NULL,
  `Order_ID` int(11) DEFAULT NULL,
  `Rating` tinyint(4) DEFAULT NULL,
  `Comment` text DEFAULT NULL,
  `Review_Date` datetime DEFAULT current_timestamp(),
  `Verified_Purchase` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`Review_ID`, `Customer_ID`, `Product_ID`, `Order_ID`, `Rating`, `Comment`, `Review_Date`, `Verified_Purchase`) VALUES
(1, 1, 1, 1, 5, 'Excellent product', '2025-10-12 18:45:11', 1),
(2, 2, 2, 2, 4, 'Good value', '2025-10-12 18:45:11', 1),
(3, 3, 5, 3, 5, 'Highly recommend', '2025-10-12 18:45:11', 1),
(4, 4, 7, 4, 3, 'Average quality', '2025-10-12 18:45:11', 1),
(5, 5, 8, 5, 4, 'Nice fit', '2025-10-12 18:45:11', 1),
(6, 6, 10, 6, 5, 'Loved it', '2025-10-12 18:45:11', 1),
(7, 7, 12, 10, 4, 'Works well', '2025-10-12 18:45:11', 1),
(8, 8, 14, 11, 5, 'Amazing camera', '2025-10-12 18:45:11', 1),
(9, 9, 16, 13, 4, 'Comfortable shoes', '2025-10-12 18:45:11', 1),
(10, 10, 20, 17, 5, 'Best e-reader', '2025-10-12 18:45:11', 1),
(11, 23, 2, NULL, 5, 'Excellent product', '2025-11-03 09:10:18', 0),
(12, 23, 3, NULL, 5, 'Love this laptop', '2025-11-03 09:12:42', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`Address_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Cart_ID`),
  ADD UNIQUE KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`Cart_Item_ID`),
  ADD KEY `Cart_ID` (`Cart_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_ID`),
  ADD KEY `Parent_Category_ID` (`Parent_Category_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`),
  ADD UNIQUE KEY `Mob_No` (`Mob_No`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `idx_customer_email` (`Email`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`Delivery_ID`),
  ADD UNIQUE KEY `Order_ID` (`Order_ID`),
  ADD UNIQUE KEY `Tracking_Number` (`Tracking_Number`),
  ADD KEY `idx_delivery_order` (`Order_ID`);

--
-- Indexes for table `inventory_log`
--
ALTER TABLE `inventory_log`
  ADD PRIMARY KEY (`Log_ID`),
  ADD KEY `Product_ID` (`Product_ID`),
  ADD KEY `Changed_By` (`Changed_By`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `Shipping_Address_ID` (`Shipping_Address_ID`),
  ADD KEY `idx_orders_customer` (`Customer_ID`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`Order_Detail_ID`),
  ADD KEY `Product_ID` (`Product_ID`),
  ADD KEY `idx_orderdetails_order` (`Order_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD UNIQUE KEY `Order_ID` (`Order_ID`),
  ADD UNIQUE KEY `Transaction_ID` (`Transaction_ID`),
  ADD KEY `idx_payment_order` (`Order_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD UNIQUE KEY `SKU` (`SKU`),
  ADD KEY `Category_ID` (`Category_ID`),
  ADD KEY `idx_product_sku` (`SKU`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Review_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Product_ID` (`Product_ID`),
  ADD KEY `Order_ID` (`Order_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `Address_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `Cart_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `Cart_Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `Category_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `Delivery_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `inventory_log`
--
ALTER TABLE `inventory_log`
  MODIFY `Log_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `Order_Detail_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `Review_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`Cart_ID`) REFERENCES `cart` (`Cart_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`Parent_Category_ID`) REFERENCES `category` (`Category_ID`) ON DELETE SET NULL;

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_log`
--
ALTER TABLE `inventory_log`
  ADD CONSTRAINT `inventory_log_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`),
  ADD CONSTRAINT `inventory_log_ibfk_2` FOREIGN KEY (`Changed_By`) REFERENCES `admin` (`Admin_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Shipping_Address_ID`) REFERENCES `address` (`Address_ID`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`) ON DELETE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`) ON DELETE SET NULL;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`),
  ADD CONSTRAINT `review_ibfk_3` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
