CREATE TABLE `users` (
                         `id` int NOT NULL,
                         `username` varchar(50) NOT NULL,
                         `password` varchar(32) NOT NULL,
                         `salt` varchar(50) NOT NULL,
                         `locked` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `salt`, `locked`) VALUES
 (1, 'bob', '5de402c02cbf657370d179808f26d450', '564315833g', 1),
 (2, 'jim', '2309467bac72082e270195f5a43303d0', 'angelae', 1),
 (3, 'grinch', '0273f802f2882bcd5daf8f08a3fee512','pare���㞷�