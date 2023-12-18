-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Des 2023 pada 08.19
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kapatuli_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `merchant`
--

CREATE TABLE `merchant` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `merchant`
--

INSERT INTO `merchant` (`id`, `name`, `address`, `phone`) VALUES
(1, 'PT PERNADA', 'Jl.Mahakam', '0819205633021');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `stock` int(5) DEFAULT NULL,
  `image` text NULL,
  `exp_date` date DEFAULT NULL,
  `production_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `stock`, `image`, `exp_date`, `production_date`) VALUES
(1, 'Blackpepper Sausage', 99, 'blackpepper_sausage.png', '2024-01-05', '2023-12-20'),
(2, 'Boule Hokkaido', 99, 'boule_hokkaido.png', '2024-01-05', '2023-12-20'),
(3, 'Brioche Pineapple', 99, 'brioche_pineapple.jpg', '2024-01-05', '2023-12-20'),
(4, 'Brioche Strawberry', 99, 'brioche_strawberry.jpg', '2024-01-05', '2023-12-20'),
(5, 'Choco Pie', 99, 'choco_pie.jpg', '2024-01-05', '2023-12-20'),
(6, 'Chocolate Croissant', 99, 'chocolate_croissant.jpg', '2024-01-05', '2023-12-20'),
(7, 'Chocolate Polo', 99, 'chocolate_polo.jpg', '2024-01-05', '2023-12-20'),
(8, 'Cream Cheese Pie', 99, 'cream_cheese_pie.jpg', '2024-01-05', '2023-12-20'),
(9, 'Double Cheese', 99, 'double_cheese.jpg', '2024-01-05', '2023-12-20'),
(10, 'Smoked Beef Croissant', 99, 'smoked_beef_croissant.png', '2024-01-05', '2023-12-20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `report_delivery`
--

CREATE TABLE `report_delivery` (
  `id` int(11) NOT NULL,
  `stock_out_id` int(11) NOT NULL,
  `invoice_code` varchar(128) NOT NULL, 
  `date_delivery` date DEFAULT NULL,
  `amount_delivery` int(100) DEFAULT NULL,
  `delivery_status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Super Admin'),
(2, 'Admin'),
(3, 'Employee');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_in`
--

CREATE TABLE `stock_in` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `supplier_product_id` int(11) NOT NULL,
  `stock` int(100) NOT NULL,
  `date_received` date DEFAULT NULL,
  `total_received` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_out`
--

CREATE TABLE `stock_out` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_delivery` date DEFAULT NULL,
  `amount_delivered` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `address`, `phone`) VALUES
(1, 'PT JAYA BARU', 'Jl. Mahakam 3', '08569335888'),
(2, 'PT SEMBAKO', 'Jl. Kebangsaaan Timur ', '0215633021');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier_product`
--

CREATE TABLE `supplier_product` (
  `id` int(11) NOT NULL,
  `name_product` varchar(128) DEFAULT NULL,
  `stock_product` int(5) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `expired_date` date NOT NULL,
  `date_received` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `supplier_product`
--

INSERT INTO `supplier_product` (`id`, `name_product`, `stock_product`, `supplier_id`, `expired_date`, `date_received`) VALUES
(1, 'Tepung', 100, 1, '2024-11-23', '2023-11-23'),
(2, 'Margarin', 100, 2, '2024-11-23', '2023-11-30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `roles_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `is_active` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `roles_id`, `name`, `email`, `password`, `address`, `phone`, `is_active`) VALUES
(1, 1, 'Super Admin User', 'super@email.com', '$2y$10$J6.rumLtmJ0RWZrj4HEmsut0340NfxNqpNVyZPeu2cIDatKzd7j9y', 'Jalan - Jalan', '06969696969', 1),
(2, 2, 'Admin User', 'admin@email.com', '$2y$10$4nDm7sFN0D2/qhwHPSPWhOClf8FiRPhgg9skkp25Did2NJMNx94sC', 'Jalan - Jalan', '06969696969', 1),
(3, 3, 'Employee User', 'employee@email.com', '$2y$10$Bx2zMRwFCi7Pconcc6sYg.VrtXfBa.ZQM34RjOuMbscpFShsZbrzS', 'Jalan - Jalan', '06969696969', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `merchant`
--
ALTER TABLE `merchant`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `report_delivery`
--
ALTER TABLE `report_delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_out_id` (`stock_out_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stock_in`
--
ALTER TABLE `stock_in`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_suppliers_id` (`supplier_id`),
  ADD KEY `fk_supplier_product_id` (`supplier_product_id`);

--
-- Indeks untuk tabel `stock_out`
--
ALTER TABLE `stock_out`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_products_id` (`product_id`),
  ADD KEY `fk_merchant_id` (`merchant_id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `supplier_product`
--
ALTER TABLE `supplier_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_supplier_id` (`supplier_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_roles_id` (`roles_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `merchant`
--
ALTER TABLE `merchant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `report_delivery`
--
ALTER TABLE `report_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `stock_in`
--
ALTER TABLE `stock_in`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT untuk tabel `stock_out`
--
ALTER TABLE `stock_out`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `supplier_product`
--
ALTER TABLE `supplier_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `report_delivery`
--
ALTER TABLE `report_delivery`
  ADD CONSTRAINT `report_delivery_ibfk_1` FOREIGN KEY (`stock_out_id`) REFERENCES `stock_out` (`id`);

--
-- Ketidakleluasaan untuk tabel `stock_in`
--
ALTER TABLE `stock_in`
  ADD CONSTRAINT `fk_supplier_product_id` FOREIGN KEY (`supplier_product_id`) REFERENCES `supplier_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_suppliers_id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `stock_out`
--
ALTER TABLE `stock_out`
  ADD CONSTRAINT `fk_merchant_id` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `supplier_product`
--
ALTER TABLE `supplier_product`
  ADD CONSTRAINT `fk_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_roles_id` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
