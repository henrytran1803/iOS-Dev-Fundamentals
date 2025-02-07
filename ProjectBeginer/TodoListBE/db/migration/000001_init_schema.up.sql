CREATE TABLE `users` (
                         `id` integer PRIMARY KEY AUTO_INCREMENT,
                         `username` varchar(255) NOT NULL UNIQUE,
                         `email` varchar(255) NOT NULL UNIQUE,
                         `password` varchar(255) NOT NULL,
                         `created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `todos` (
                         `id` integer PRIMARY KEY AUTO_INCREMENT,
                         `user_id` integer NOT NULL,
                         `title` varchar(255) NOT NULL,
                         `description` text,
                         `priority` ENUM('low', 'medium', 'high') DEFAULT 'medium',
                         `deadline` datetime,
                         `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
                         `status` boolean DEFAULT false,
                         FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);