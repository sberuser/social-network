DELETE FROM user_roles;
-- DELETE FROM comments;
-- DELETE FROM articles;
DELETE FROM relations;
DELETE FROM users;
ALTER SEQUENCE global_seq RESTART WITH 100000;

INSERT INTO users (name, last_name, email, password, birthday) VALUES
  ('Иван', 'Петров', 'user@yandex.ru', '{noop}password', '1996-05-30 10:00:00'),
  ('Алексей', 'Смирнов', 'user@gmail.com', '{noop}admin', '1990-09-18 10:00:00'),
  ('Андрей', 'Иванов', 'qwerty@gmail.com', '{noop}qwerty', '1985-10-01 10:00:00'),
  ('Константин', 'Николаев', 'ali@gmail.com', '{noop}asdfgh', '1999-01-17 10:00:00'),
  ('Сергей', 'Лесников', 'serg@gmail.com', '{noop}zxcvbn', '1992-12-12 10:00:00'),
  ('Антон', 'Рыбников', 'anton@gmail.com', '{noop}zxcvbn', '1994-09-09 10:00:00'),
  ('Дмитрий', 'Молотов', 'molot@gmail.com', '{noop}zxcvbn', '1997-07-08 10:00:00'),
  ('Илья', 'Валентинов', 'vala@gmail.com', '{noop}zxcvbn', '1993-11-29 10:00:00'),
  ('Никита', 'Колесников', 'koles@gmail.com', '{noop}zxcvbn', '1992-02-19 10:00:00'),
  ('Пётр', 'Морозов', 'moroz@gmail.com', '{noop}zxcvbn', '1994-08-13 10:00:00'),
  ('Иван', 'Лугин', 'ivanl@gmail.com', '{noop}zxcvbn', '1995-02-18 10:00:00'),
  ('Роман', 'Воронов', 'pomanrog@gmail.com', '{noop}zxcvbn', '1997-08-20 10:00:00'),
  ('Ольга', 'Михайлова', 'mihailova@gmail.com', '{noop}zxcvbn', '1989-03-09 10:00:00'),
  ('Людмила', 'Тушканова', 'tushik@gmail.com', '{noop}zxcvbn', '1996-11-16 10:00:00'),
  ('Екатерина', 'Кислова', 'kislova@gmail.com', '{noop}zxcvbn', '1993-04-12 10:00:00'),
  ('Анна', 'Огородова', 'annaogor@gmail.com', '{noop}zxcvbn', '1992-07-24 10:00:00'),
  ('Мария', 'Быстрова', 'bystrova@gmail.com', '{noop}zxcvbn', '1988-03-05 10:00:00'),
  ('Константин', 'Сорокин', 'sorokin@gmail.com', '{noop}zxcvbn', '1990-07-15 10:00:00'),
  ('Влад', 'Зотов', 'zotov@gmail.com', '{noop}zxcvbn', '1975-04-18 10:00:00'),
  ('Наталья', 'Чернова', 'natalya@gmail.com', '{noop}zxcvbn', '1966-12-14 10:00:00');

INSERT INTO user_roles (role, user_id) VALUES
  ('ROLE_USER', 100000),
  ('ROLE_USER', 100001),
  ('ROLE_USER', 100002),
  ('ROLE_USER', 100003),
  ('ROLE_USER', 100004),
  ('ROLE_USER', 100005),
  ('ROLE_USER', 100006),
  ('ROLE_USER', 100007),
  ('ROLE_USER', 100008),
  ('ROLE_USER', 100009),
  ('ROLE_USER', 100010),
  ('ROLE_USER', 100011),
  ('ROLE_USER', 100012),
  ('ROLE_USER', 100013),
  ('ROLE_USER', 100014),
  ('ROLE_USER', 100015),
  ('ROLE_USER', 100016),
  ('ROLE_USER', 100017),
  ('ROLE_USER', 100018),
  ('ROLE_USER', 100019);

-- INSERT INTO articles (user_id, name, text, date_time) VALUES
--   (100000, 'Статья', 'Статья — это жанр журналистики, в котором автор ставит задачу проанализировать общественные ситуации, процессы, явления, прежде всего с точки зрения закономерностей, лежащих в их основе.
-- Такому жанру как статья присуща шири практических обобщений, глубокий анализ фактов и явлений, четкая социальная направленность[источник не указан 3111 дней]. В статье автор рассматривает отдельные ситуации как часть более широкого явления. Автор аргументирует и выстраивает свою позицию через систему фактов.
-- В статье выражается развернутая обстоятельная аргументированная концепция автора или редакции по поводу актуальной социологической проблемы. Также в статье журналист обязательно должен интерпретировать факты (это могут быть цифры, дополнительная информация, которая будет правильно расставлять акценты и ярко раскрывать суть вопроса).
-- Отличительным аспектом статьи является её готовность. Если подготавливаемый материал так и не был опубликован (не вышел в тираж, не получил распространения), то такой труд относить к статье некорректно. Скорее всего данную работу можно назвать черновиком или заготовкой. Поэтому целью любой статьи является распространение содержащейся в ней информации.',
--    '2018-04-09 10:10:00'),
--   (100000, 'Самый большой самолет в мире', 'В 1985 году Советский Союз искал решения для создания транспортной системы для своего многоразового космического корабля «Бурана». Возникла срочная необходимость в воздушном средстве, способным переносить многотонные части космического корабля к месту его сбора и запуска. В результате был предложен проект грузового самолета, получившего наименования Ан-225.
-- Создание этого гиганта стало возможным благодаря напряженной работе и кооперации конструкторских бюро всего СССР. В Воронеже, Киеве, Москве, Ташкенте и десятках других городов тысячи ученых и инженеров реализовывали самый смелый проект в истории воздухоплавания. Три года потребовалось огромной стране, чтобы превратить идею об Ан-225 в жизнь: первый полет самолета Ан-225 «Мрия», собранного на Киевском механическом заводе, состоялся 21 декабря 1988 года.',
--    '2018-04-08 10:10:00'),
--   (100000, 'Интересное о звездах: 10 звездных фактов', 'Человечество усиленно изучает все, что находится вокруг нас, особенно это касается космического пространства. Звезды на небе привлекают своей красотой и таинственностью, ведь до них так далеко. Ученые и исследователи уже собрали достаточно много информации о звездах, поэтому в этой статье хотелось бы выделить самые интересные факты о звездах.
-- 1. Какая звезда самая ближайшая к земле? Это солнце. Оно расположено всего лишь в 150 млн. км от Земли, и по космическим меркам является средней звездой. Классифицируется как желтый карлик G2 главной последовательности. Оно преобразовывает водород в гелий вот уже 4,5 миллиарда лет, и, вероятно, продолжит это делать в течение еще 7 миллиарда лет. Когда у солнца закончится топливо, оно станет красной гигантской звездой, размеры звезды увеличатся во много раз. Когда оно расширится, то поглотит Меркурий, Венеру, и возможно даже Землю.
--
-- 2. Все звезды имеют одинаковый состав. Рождение звезды начинается в облаке холодного молекулярного водорода, которое начинает гравитационно сжиматься. Когда облако молекулярного водорода сжимается фрагментировано, то множество из этих частей сформируются в отдельные звезды. Материал собирается в шар, который продолжает сжиматься под действием собственной гравитации, пока в центре не достигнет температура способная зажечь ядерный синтез. Исходный газ был сформирован еще во время Большого Взрыва и состоит из 74% водорода и 25% гелия. Со временем, она преобразуют часть водорода в гелий. Вот почему у нашего Солнца состав 70% водорода и 29% гелия. Но первоначально они состоят из 3/4 водорода и 1/4 гелия, с примесями других микроэлементов.
--
-- 3. Звезды находятся в идеальном балансе. Любая звезда как бы находится в постоянном конфликте сама с собой. С одной стороны, вся масса звезды своей силой тяжести постоянно сжимает ее. Но раскаленный газ, оказывает изнутри огромное давление, нарушая ее гравитационный коллапс. Ядерный синтез в ядре, генерирует огромное количество энергии. Фотоны, прежде чем вырваться наружу, совершают путешествие из центра до поверхности, примерно за 100.000 лет. Когда звезда становится ярче, она расширяется и превращается в красного гиганта. Когда ядерный синтез в центре прекращается, то уже ничего не может сдержать нарастающее давление вышележащих слоев и она разрушается превращаясь в белый карлик, нейтронную звезду или черную дыру. Возможно, что звезды на небе, которые мы видим, уже не существуют, потому как они находятся очень далеко и их свету требуются миллиарды лет, чтобы долететь до земли.',
--    '2018-04-07 10:10:00'),
--   (100000, 'Семь чудес света: Висячие сады Семирамиды', ' Продолжая рубрику рассказов о Семи чудесах Древнего Мира, мы переходим к истории, наполненной чистой любовью, ностальгией и отчаянным героизмом, - легенде о зарождении второго чуда света. Висячие сады Семирамиды оставили огромный отпечаток в душах древних историков и очевидцев сего творения. Множество загадок и тайн скрывает в себе погребенное под толщею песка и пыли некогда величественное произведение искусства.
--
--    Висячие сады Семирамиды (или Вавилона), к сожалению, не смогли выдержать испытание временем, и до наших дней, увы, сохранилось лишь жалкое упоминание о былой их роскоши и великолепия. Сады моложе Великих египетских пирамид, и время их создания приписывают к периоду упадка Вавилонской Империи, непримиримой соперницы Древнего Египта.',
--    '2018-04-08 10:00:00'),
--   (100015, 'Семь чудес света: Висячие сады Семирамиды', ' Продолжая рубрику рассказов о Семи чудесах Древнего Мира, мы переходим к истории, наполненной чистой любовью, ностальгией и отчаянным героизмом, - легенде о зарождении второго чуда света. Висячие сады Семирамиды оставили огромный отпечаток в душах древних историков и очевидцев сего творения. Множество загадок и тайн скрывает в себе погребенное под толщею песка и пыли некогда величественное произведение искусства.
--
--    Висячие сады Семирамиды (или Вавилона), к сожалению, не смогли выдержать испытание временем, и до наших дней, увы, сохранилось лишь жалкое упоминание о былой их роскоши и великолепия. Сады моложе Великих египетских пирамид, и время их создания приписывают к периоду упадка Вавилонской Империи, непримиримой соперницы Древнего Египта.',
--    '2018-04-08 10:00:00'),
--   (100015, 'Самый большой самолет в мире', 'В 1985 году Советский Союз искал решения для создания транспортной системы для своего многоразового космического корабля «Бурана». Возникла срочная необходимость в воздушном средстве, способным переносить многотонные части космического корабля к месту его сбора и запуска. В результате был предложен проект грузового самолета, получившего наименования Ан-225.
-- Создание этого гиганта стало возможным благодаря напряженной работе и кооперации конструкторских бюро всего СССР. В Воронеже, Киеве, Москве, Ташкенте и десятках других городов тысячи ученых и инженеров реализовывали самый смелый проект в истории воздухоплавания. Три года потребовалось огромной стране, чтобы превратить идею об Ан-225 в жизнь: первый полет самолета Ан-225 «Мрия», собранного на Киевском механическом заводе, состоялся 21 декабря 1988 года.',
--    '2018-04-08 10:10:00');

-- INSERT INTO comments (user_id, article_id, text, date_time) VALUES
--   (100019, 100020, 'Хорошая статья', '2018-04-12 15:45:33'),
--   (100011, 100020, 'Мне нравится', '2018-04-13 15:45:33'),
--   (100002, 100020, 'бла бла', '2018-04-14 15:45:33'),
--   (100000, 100020, 'Да', '2018-04-11 15:45:33');


INSERT INTO relations (follower_id, following_id) VALUES
  (100001, 100000),
  (100002, 100000),
  (100003, 100000),
  (100004, 100000),
  (100004, 100001),
  (100004, 100002),
  (100004, 100003),
  (100005, 100003),
  (100006, 100000),
  (100007, 100000),
  (100008, 100000),
  (100009, 100000),
  (100010, 100000),
  (100000, 100011),
  (100000, 100016),
  (100000, 100015),
  (100000, 100007),
  (100000, 100018),
  (100004, 100012),
  (100004, 100016),
  (100009, 100011),
  (100008, 100014),
  (100004, 100010),
  (100009, 100007),
  (100004, 100008),
  (100011, 100005),
  (100006, 100008),
  (100016, 100013),
  (100011, 100017),
  (100018, 100016),
  (100006, 100010),
  (100003, 100006);