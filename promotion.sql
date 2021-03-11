-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Время создания: Мар 11 2021 г., 13:49
-- Версия сервера: 10.5.9-MariaDB-1:10.5.9+maria~focal
-- Версия PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `promotion`
--

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `base_user_sum`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `base_user_sum` (
`id` int(11)
,`name` varchar(255)
,`summ` double
);

-- --------------------------------------------------------

--
-- Структура таблицы `turnover`
--

CREATE TABLE `turnover` (
  `id` int(11) NOT NULL,
  `user_id` tinyint(3) NOT NULL DEFAULT 0,
  `product` mediumtext NOT NULL DEFAULT '',
  `color` varchar(52) NOT NULL DEFAULT '',
  `summ` varchar(255) NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `turnover`
--

INSERT INTO `turnover` (`id`, `user_id`, `product`, `color`, `summ`, `timestamp`) VALUES
(40, 42, 'iPhone X', 'Silver', '31960', '2021-03-11 16:06:20'),
(41, 42, 'iPhone X', 'Silver', '31960', '2021-03-11 16:06:41'),
(42, 42, 'iPhone X', 'Space Gray', '31960', '2021-03-11 16:07:53'),
(43, 42, 'iPhone X', 'Space Gray', '31960', '2021-03-11 16:07:57'),
(44, 42, 'iPhone X', 'Silver', '', '2021-03-11 16:16:45'),
(45, 42, 'iPhone X', 'Silver', '31960', '2021-03-11 16:17:53'),
(46, 42, 'iPhone X', 'Silver', '31960', '2021-03-11 16:21:23'),
(47, 42, 'iPhone X', 'Silver', '31960', '2021-03-11 16:22:06'),
(48, 42, 'iPhone X', 'Silver', '31960', '2021-03-11 16:22:11'),
(49, 42, 'iPhone X', 'Silver', '31960', '2021-03-11 16:22:12'),
(50, 42, 'iPhone X', 'Silver', '31960', '2021-03-11 16:23:03'),
(51, 42, 'iPhone X', 'Silver', '31960', '2021-03-11 16:23:11'),
(52, 42, 'iPhone X', 'Silver', '31960', '2021-03-11 16:23:32'),
(53, 42, 'iPhone X', 'Silver', '31960', '2021-03-11 16:24:10'),
(54, 43, 'iPhone X', 'Silver', '31960', '2021-03-11 16:25:15'),
(55, 43, 'iPhone X', 'Silver', '31960', '2021-03-11 16:25:18'),
(56, 43, 'iPhone X', 'Silver', '15980', '2021-03-11 16:25:20'),
(57, 43, 'iPhone X', 'Silver', '7990', '2021-03-11 16:25:22'),
(58, 44, 'iPhone X', 'Silver', '55930', '2021-03-11 16:25:40'),
(59, 45, 'iPhone X', 'Silver', '55930', '2021-03-11 16:25:46'),
(60, 46, 'iPhone X', 'Silver', '119850', '2021-03-11 16:25:55'),
(61, 46, 'iPhone X', 'Silver', '39950', '2021-03-11 16:25:57'),
(62, 46, 'iPhone X', 'Silver', '15980', '2021-03-11 16:25:59'),
(63, 45, 'iPhone X', 'Silver', '111860', '2021-03-11 16:27:33'),
(64, 45, 'iPhone X', 'Silver', '111860', '2021-03-11 16:27:34'),
(65, 45, 'iPhone X', 'Silver', '111860', '2021-03-11 16:27:35'),
(66, 45, 'iPhone X', 'Silver', '111860', '2021-03-11 16:31:40'),
(67, 45, 'iPhone X', 'Silver', '111860', '2021-03-11 16:31:53'),
(68, 45, 'iPhone X', 'Silver', '111860', '2021-03-11 16:32:13'),
(69, 45, 'iPhone X', 'Silver', '111860', '2021-03-11 16:39:06'),
(70, 45, 'iPhone X', 'Silver', '15980', '2021-03-11 16:39:26');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `inviter_user_id` int(3) NOT NULL,
  `base_user` int(3) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `inviter_user_id`, `base_user`, `timestamp`) VALUES
(1, 'Иван Иванов', '', 0, 1, '2021-03-11 09:00:20'),
(42, 'Антон', '7(000)000-00-05', 1, 0, '2021-03-11 15:41:47'),
(43, 'Дмитрий', '7(000)000-00-01', 1, 0, '2021-03-11 16:25:15'),
(44, 'Юрий', '7(000)000-00-01', 1, 0, '2021-03-11 16:25:40'),
(45, 'Илья', '7(000)000-00-01', 1, 0, '2021-03-11 16:25:46'),
(46, 'Леха', '7(000)000-00-01', 1, 0, '2021-03-11 16:25:55');

-- --------------------------------------------------------

--
-- Структура для представления `base_user_sum`
--
DROP TABLE IF EXISTS `base_user_sum`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `base_user_sum`  AS SELECT `us`.`id` AS `id`, `us`.`name` AS `name`, (select sum(`tr1`.`summ`) from `turnover` `tr1` where `tr1`.`user_id` = `us`.`id`) AS `summ` FROM `users` AS `us` WHERE 1 = 1 ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `turnover`
--
ALTER TABLE `turnover`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `turnover`
--
ALTER TABLE `turnover`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
