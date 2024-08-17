-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 07, 2022 at 03:47 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loyaltycustomer`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `CustomerID` varchar(50) NOT NULL,
  `Name` varchar(150) NOT NULL,
  `NIC` varchar(12) NOT NULL,
  `tp` int(10) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `isLoyalty` varchar(50) NOT NULL,
  `Date` varchar(150) NOT NULL,
  `LoyaltyPoints` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CustomerID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `Name`, `NIC`, `tp`, `Email`, `isLoyalty`, `Date`, `LoyaltyPoints`) VALUES
('0001', 'John', '951426278V', 715241526, 'John@gmail.com', 'false', '2022/05/27 20:30:28', 500),
('00002', 'Test', '2323232332V', 751652726, 'test@gmail.com', 'false', '2022/06/05 12:50:03', 50);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `Itemid` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `brandname` varchar(50) NOT NULL,
  `size` varchar(50) NOT NULL,
  `itemprice` double NOT NULL,
  `type` varchar(50) NOT NULL,
  `Date` varchar(100) NOT NULL,
  PRIMARY KEY (`Itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`Itemid`, `quantity`, `brandname`, `size`, `itemprice`, `type`, `Date`) VALUES
('0001', 1, 'Blitz', 'S', 1000, 'Cassual Shirts', ''),
('00002', 8, 'Lex', 'L', 1000, 'Office Shirts', '');

-- --------------------------------------------------------

--
-- Table structure for table `loyaltycustomer`
--

DROP TABLE IF EXISTS `loyaltycustomer`;
CREATE TABLE IF NOT EXISTS `loyaltycustomer` (
  `Sno` int(100) NOT NULL AUTO_INCREMENT,
  `CustomerID` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `tp` int(10) NOT NULL,
  `NIC` varchar(100) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `LoyaltyPoints` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Sno`,`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loyaltycustomer`
--

INSERT INTO `loyaltycustomer` (`Sno`, `CustomerID`, `Name`, `tp`, `NIC`, `Date`, `LoyaltyPoints`) VALUES
(1, 'sd', 'sds', 5000, 'sdsd', '21-Apr-2022', 0),
(2, 'sdsd', 'wwwerere', 500, '4520100v', '22-Apr-2022', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `SaleID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` varchar(150) NOT NULL,
  `Cash` double NOT NULL,
  `LoyaltyPoints` double NOT NULL,
  `Discount` double NOT NULL,
  `subtotal` double NOT NULL,
  `TotalPrice` double NOT NULL,
  `Balance` double NOT NULL,
  `Date` varchar(150) NOT NULL,
  PRIMARY KEY (`SaleID`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`SaleID`, `CustomerID`, `Cash`, `LoyaltyPoints`, `Discount`, `subtotal`, `TotalPrice`, `Balance`, `Date`) VALUES
(1, '0001', 10000, 0, 0, 1600, 1600, 8400, '2022-05-28'),
(2, '0001', 5000, 0, 0, 3200, 3200, 1800, '2022-05-28'),
(3, '0001', 10000, 0, 320, 6400, 6080, 3920, '2022-05-28'),
(4, '0001', 20000, 0, 1440, 14400, 12960, 7040, '2022-05-28'),
(5, '0001', 10000, 0, 400, 8000, 7600, 2400, '2022-05-28'),
(6, '0001', 10000, 0, 400, 8000, 7600, 2400, '2022-05-28'),
(7, '0001', 5000, 0, 0, 3200, 3200, 1800, '2022-05-28'),
(8, '0001', 5000, 0, 0, 1600, 1600, 3400, '2022-05-28'),
(9, '0001', 6000, 52, 280, 5600, 5268, 732, '2022-05-28'),
(10, '0001', 3000, 100, 0, 2400, 2300, 600, '2022-05-28'),
(11, '0001', 5000, 0, 0, 1600, 1600, 3400, '2022-05-29'),
(12, '0001', 5000, 0, 0, 2000, 2000, 3000, '2022-05-29'),
(13, '0001', 5000, 0, 0, 2000, 2000, 3000, '2022-05-29'),
(14, '0001', 6000, 200, 0, 5000, 4800, 1000, '2022-06-05'),
(15, '00002', 3000, 0, 0, 2000, 2000, 1000, '2022-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `salesdetails`
--

DROP TABLE IF EXISTS `salesdetails`;
CREATE TABLE IF NOT EXISTS `salesdetails` (
  `ID` int(11) NOT NULL,
  `CustomerID` varchar(50) NOT NULL,
  `Item` varchar(150) NOT NULL,
  `UnitPrice` double NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Amount` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salesdetails`
--

INSERT INTO `salesdetails` (`ID`, `CustomerID`, `Item`, `UnitPrice`, `Quantity`, `Amount`) VALUES
(4, '0001', 'Blitz Cassual Shirts', 800, 9, 7200),
(5, '0001', 'Blitz Cassual Shirts', 800, 5, 4000),
(6, '0001', 'Blitz Cassual Shirts', 800, 5, 4000),
(6, '0001', 'Blitz Cassual Shirts', 800, 5, 4000),
(7, '0001', 'Blitz Cassual Shirts', 800, 2, 1600),
(7, '0001', 'Blitz Cassual Shirts', 800, 2, 1600),
(8, '0001', 'Blitz Cassual Shirts', 800, 2, 1600),
(9, '0001', 'Blitz Cassual Shirts', 800, 7, 5600),
(10, '0001', 'Blitz Cassual Shirts', 800, 3, 2400),
(11, '0001', 'Blitz Cassual Shirts', 800, 2, 1600),
(12, '0001', 'Blitz Cassual Shirts', 1000, 2, 2000),
(13, '0001', 'Blitz Cassual Shirts', 1000, 2, 2000),
(14, '0001', 'Blitz Cassual Shirts', 1000, 5, 5000),
(15, '00002', 'Lex Office Shirts', 1000, 2, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(150) NOT NULL,
  `item` varchar(150) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`ID`, `SupplierName`, `item`, `quantity`, `price`) VALUES
(1, 'sdf', 'Test', 15, 100),
(2, 'ddfgdf', 'dfgfg', 20, 1000),
(3, 'Test', 'Test', 10, 100);

-- --------------------------------------------------------

--
-- Table structure for table `supplierorders`
--

DROP TABLE IF EXISTS `supplierorders`;
CREATE TABLE IF NOT EXISTS `supplierorders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Supplier` varchar(150) NOT NULL,
  `Message` varchar(60000) NOT NULL,
  `Date` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplierorders`
--

INSERT INTO `supplierorders` (`ID`, `Supplier`, `Message`, `Date`) VALUES
(1, 'fdgfdg', 'dgfdgdg', '2022-05-25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(100) NOT NULL,
  `Category` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Category`, `Password`) VALUES
(3, 'Admin', 'Admin', '1234'),
(4, 'User', 'User', '1234'),
(5, 'Cashier', 'Cashier', '1234');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
