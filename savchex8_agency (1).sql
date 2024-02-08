-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 09 2024 г., 01:19
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `savchex8_agency`
--
--
-- Структура таблицы `branch`
--

CREATE TABLE `branch` (
  `id` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL
);

--
-- Дамп данных таблицы `branch`
--

INSERT INTO `branch` (`id`, `address`, `contact_number`) VALUES
(1, 'ул. Ленина, д. 10, г. Москва', '+7 (495) 123-45-67'),
(2, 'пр. Победы, д. 20, г. Санкт-Петербург', '+7 (812) 987-65-43'),
(3, 'пр. Гагарина, д. 30, г. Екатеринбург', '+7 (343) 555-44-33'),
(4, 'ул. Пролетарская, д. 40, г. Новосибирск', '+7 (383) 111-22-33'),
(5, 'пр. Ленинградский, д. 50, г. Казань', '+7 (843) 777-88-99'),
(6, 'ул. Красноармейская, д. 60, г. Волгоград', '+7 (844) 222-33-44'),
(7, 'ул. Мира, д. 70, г. Ростов-на-Дону', '+7 (863) 333-44-55'),
(8, 'ул. Кирова, д. 90, г. Уфа', '+7 (347) 555-66-77');

-- --------------------------------------------------------

--
-- Структура таблицы `computer`
--

CREATE TABLE `computer` (
  `id` int NOT NULL,
  `operating_system` varchar(255) NOT NULL,
  `processor` varchar(255) NOT NULL,
  `RAM` varchar(255) NOT NULL,
  `video_card` varchar(255) NOT NULL
);

--
-- Дамп данных таблицы `computer`
--

INSERT INTO `computer` (`id`, `operating_system`, `processor`, `RAM`, `video_card`) VALUES
(1, 'Windows 10', 'Intel Core i5', '8GB', 'NVIDIA GeForce GTX 1650'),
(2, 'Windows 11', 'Intel Core i7', '16GB', 'NVIDIA GeForce RTX 3060'),
(3, 'Windows 10', 'Intel Core i3', '4GB', 'Integrated'),
(4, 'Windows 11', 'AMD Ryzen 7', '16GB', 'NVIDIA GeForce GTX 1660 Ti'),
(5, 'Windows 10', 'AMD Ryzen 5', '12GB', 'NVIDIA GeForce RTX 3050'),
(6, 'Windows 11', 'Intel Core i9', '64GB', 'NVIDIA GeForce RTX 3090'),
(7, 'Windows 10', 'Intel Core i5', '8GB', 'Integrated'),
(8, 'Windows 11', 'AMD Ryzen 9', '32GB', 'NVIDIA GeForce RTX 3070'),
(9, 'Windows 10', 'Intel Core i7', '16GB', 'NVIDIA GeForce RTX 3060 Ti'),
(10, 'Windows 11', 'Intel Core i9', '64GB', 'NVIDIA GeForce RTX 3080 Ti'),
(11, 'Windows 10', 'AMD Ryzen 5', '12GB', 'NVIDIA GeForce GTX 1660');

-- --------------------------------------------------------

--
-- Структура таблицы `Contract`
--

CREATE TABLE `Contract` (
  `id` int NOT NULL,
  `object_of_contract` varchar(255) NOT NULL,
  `payment_type_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `branch_id` int NOT NULL,
  `status_id` int NOT NULL
);

--
-- Дамп данных таблицы `Contract`
--

INSERT INTO `Contract` (`id`, `object_of_contract`, `payment_type_id`, `category_id`, `branch_id`, `status_id`) VALUES
(1, 'Сок \"Добрый\"', 1, 1, 1, 1),
(2, 'Автомобиль \"Audi\"', 2, 2, 2, 2),
(3, 'Фен \"Dyson\"', 1, 3, 3, 3),
(4, 'Серебряное кольцо', 2, 6, 4, 1),
(5, 'Игровая мышь \"Logitech G G102\"', 1, 3, 5, 2),
(6, 'Телевизор \"Samsung\"', 2, 3, 6, 3),
(7, 'Пятновыводитель \"Vanish\"', 1, 5, 1, 1),
(8, 'Шампунь \"Nivea Men\"', 2, 4, 2, 2),
(9, 'Кроссовки \"Nike\"', 1, 7, 3, 3),
(10, 'Куртка \"The North Face\"', 2, 7, 4, 1),
(11, 'Средство для мытья посуды \"Fairy\"', 1, 5, 5, 2),
(12, 'Печенье \"Bonvida\"', 2, 1, 6, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `contract_status`
--

CREATE TABLE `contract_status` (
  `id` int NOT NULL,
  `status` varchar(255) NOT NULL
);

--
-- Дамп данных таблицы `contract_status`
--

INSERT INTO `contract_status` (`id`, `status`) VALUES
(1, 'Активен'),
(2, 'Ожидание'),
(3, 'Завершен');

-- --------------------------------------------------------

--
-- Структура таблицы `department`
--

CREATE TABLE `department` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `head_of_department_id` int DEFAULT NULL,
  `branch_id` int NOT NULL
);

--
-- Дамп данных таблицы `department`
--

INSERT INTO `department` (`id`, `title`, `head_of_department_id`, `branch_id`) VALUES
(1, 'Отдел маркетинга', 1, 1),
(2, 'Отдел продаж', 5, 1),
(3, 'Отдел финансов', 2, 2),
(4, 'Отдел качества', 3, 2),
(5, 'Отдел обслуживания клиентов', 4, 5),
(6, 'Отдел по логистике', 6, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `employee`
--

CREATE TABLE `employee` (
  `id` int NOT NULL,
  `post_id` int NOT NULL,
  `department_id` int NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `passport` varchar(255) NOT NULL,
  `BirthDate` date NOT NULL,
  `HireDate` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `computer_id` int DEFAULT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_manager` tinyint(1) NOT NULL DEFAULT '0'
);

--
-- Дамп данных таблицы `employee`
--

INSERT INTO `employee` (`id`, `post_id`, `department_id`, `FirstName`, `LastName`, `phone_number`, `passport`, `BirthDate`, `HireDate`, `email`, `computer_id`, `login`, `password`, `is_manager`) VALUES
(1, 1, 1, 'Иван', 'Иванов', '123456789', '1234 567890', '1990-05-15', '2023-01-10', 'ivan.ivanov@example.com', 1, 'ivan1', 'ivanov1', 1),
(2, 2, 2, 'Петр', 'Петров', '987654321', '5678 123456', '1988-09-20', '2022-12-05', 'petr.petrov@example.com', 2, 'petr2', 'petrov2', 1),
(3, 3, 3, 'Мария', 'Сидорова', '456789012', '9012 345678', '1995-03-08', '2023-02-20', 'maria.sidorova@example.com', 3, 'maria3', 'sidorova3', 1),
(4, 4, 4, 'Елена', 'Козлова', '890123456', '3456 789012', '1987-11-25', '2022-11-15', 'elena.kozlova@example.com', 4, 'elena4', 'kozlova4', 1),
(5, 5, 5, 'Алексей', 'Алексеев', '678901234', '6789 012345', '1992-07-12', '2023-03-05', 'aleksey.nikitin@example.com', 5, 'aleksey5', 'alekseev5', 1),
(6, 6, 6, 'Ольга', 'Павлова', '234567890', '8901 234567', '1984-12-30', '2022-10-25', 'olga.pavlova@example.com', 6, 'olga6', 'pavlova6', 1),
(7, 1, 2, 'Дмитрий', 'Дмитриев', '345678901', '1234 567890', '1991-08-18', '2023-04-10', 'dmitriy.kovalev@example.com', 7, 'dmintiy7', 'dmitriev7', 0),
(8, 2, 3, 'Екатерина', 'Морозова', '567890123', '5678 901234', '1993-04-27', '2022-09-30', 'ekaterina.morozova@example.com', 8, 'ekaterina8', 'morozova8', 0),
(9, 3, 4, 'Андрей', 'Андреев', '789012345', '9012 345678', '1989-01-05', '2023-05-15', 'andrey.smirnov@example.com', 9, 'andrey9', 'andreev9', 0),
(10, 4, 5, 'Светлана', 'Волкова', '012345678', '3456 789012', '1986-06-22', '2022-08-20', 'svetlana.volkova@example.com', 10, 'svetlana10', 'volkova10', 0),
(11, 5, 6, 'Михаил', 'Михайлов', '234567890', '6789 012345', '1990-10-10', '2023-06-30', 'mikhail.lebedev@example.com', 11, 'mikhail11', 'mikhaylov11', 0),
(13, 6, 1, 'Никита', 'Голубятников', '89267878660', '1234 567890', '2005-04-04', '2024-02-10', 'nikita@example.ru', NULL, 'nikita', 'golubyatnikov', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE `payment` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL
);

--
-- Дамп данных таблицы `payment`
--

INSERT INTO `payment` (`id`, `title`) VALUES
(1, 'Наличные'),
(2, 'Банковский перевод');

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE `post` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `salary_per_month` int NOT NULL
);

--
-- Дамп данных таблицы `post`
--

INSERT INTO `post` (`id`, `title`, `salary_per_month`) VALUES
(1, 'Менеджер по маркетингу', 70000),
(2, 'Финансовый аналитик', 80000),
(3, 'Менеджер по закупкам', 70000),
(4, 'Оператор колл-центра', 55000),
(5, 'Специалист по безопасности', 80000),
(6, 'Логист', 70000);

-- --------------------------------------------------------

--
-- Структура таблицы `service_category`
--

CREATE TABLE `service_category` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` blob
);

--
-- Дамп данных таблицы `service_category`
--

INSERT INTO `service_category` (`id`, `name`, `icon`) VALUES
(1, 'Реклама пищевых товаров', NULL),
(2, 'Автомобильная реклама', NULL),
(3, 'Реклама техники и электроники', NULL),
(4, 'Реклама товаров для личной гигиены', NULL),
(5, 'Реклама бытовой химии и товаров для уборки', NULL),
(6, 'Реклама ювелирных украшений', NULL),
(7, 'Реклама одежды и обуви', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `working_contract`
--

CREATE TABLE `working_contract` (
  `id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `post_id` int NOT NULL,
  `date_of_appointment` date NOT NULL
);

--
-- Дамп данных таблицы `working_contract`
--

INSERT INTO `working_contract` (`id`, `employee_id`, `post_id`, `date_of_appointment`) VALUES
(12, 1, 1, '2023-01-15'),
(13, 2, 2, '2023-02-20'),
(14, 3, 3, '2023-03-25'),
(15, 4, 4, '2023-04-10'),
(16, 5, 5, '2023-05-05'),
(17, 6, 6, '2023-06-15'),
(18, 7, 1, '2023-07-20'),
(19, 8, 2, '2023-08-25'),
(20, 9, 3, '2023-09-30'),
(24, 10, 4, '2023-10-05'),
(25, 11, 5, '2023-11-10');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `computer`
--
ALTER TABLE `computer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `Contract`
--
ALTER TABLE `Contract`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`branch_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `department_id_2` (`branch_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `payment_type_id` (`payment_type_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `contract_status`
--
ALTER TABLE `contract_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `id` (`id`),
  ADD KEY `head_of_department_id` (`head_of_department_id`);

--
-- Индексы таблицы `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `computer_id` (`computer_id`);

--
-- Индексы таблицы `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `service_category`
--
ALTER TABLE `service_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `working_contract`
--
ALTER TABLE `working_contract`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `computer`
--
ALTER TABLE `computer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `Contract`
--
ALTER TABLE `Contract`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `contract_status`
--
ALTER TABLE `contract_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `department`
--
ALTER TABLE `department`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `post`
--
ALTER TABLE `post`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `service_category`
--
ALTER TABLE `service_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `working_contract`
--
ALTER TABLE `working_contract`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Contract`
--
ALTER TABLE `Contract`
  ADD CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `contract_status` (`id`),
  ADD CONSTRAINT `contract_ibfk_3` FOREIGN KEY (`payment_type_id`) REFERENCES `payment` (`id`),
  ADD CONSTRAINT `contract_ibfk_4` FOREIGN KEY (`category_id`) REFERENCES `service_category` (`id`),
  ADD CONSTRAINT `contract_ibfk_5` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`);

--
-- Ограничения внешнего ключа таблицы `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  ADD CONSTRAINT `department_ibfk_2` FOREIGN KEY (`head_of_department_id`) REFERENCES `employee` (`id`);

--
-- Ограничения внешнего ключа таблицы `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`computer_id`) REFERENCES `computer` (`id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`);

--
-- Ограничения внешнего ключа таблицы `working_contract`
--
ALTER TABLE `working_contract`
  ADD CONSTRAINT `working_contract_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `working_contract_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
