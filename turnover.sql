-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Время создания: Мар 11 2021 г., 13:14
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
(43, 42, 'iPhone X', 'Space Gray', '31960', '2021-03-11 16:07:57');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `turnover`
--
ALTER TABLE `turnover`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `turnover`
--
ALTER TABLE `turnover`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
