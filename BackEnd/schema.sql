-- Create database if not exists
CREATE DATABASE IF NOT EXISTS next;

-- Switch to 'next' database
USE next;

-- Create User table
CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phonenumber VARCHAR(20),
    role ENUM('user', 'shopOwner', 'admin') NOT NULL,
    photo VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO `User` (`fullname`,`email`,`password`,`phonenumber`,`role`,`photo`) VALUES
('Admin','admin@next.com','admin','1234567890','admin','/images/admin')
-- Create Shop table
CREATE TABLE Shop (
    id INT AUTO_INCREMENT PRIMARY KEY,
    shopOwner_id INT,
    name VARCHAR(100) NOT NULL,
    category ENUM('coffee', 'restaurant', 'bar') NOT NULL,
    description TEXT,
    address VARCHAR(255),
    video VARCHAR(255),
    menu JSON, -- Assuming menu is an array of images or URLs
    logo VARCHAR(500),
    `like` INT DEFAULT 0,
    `dislike` INT DEFAULT 0,
    FOREIGN KEY (shopOwner_id) REFERENCES `User`(`id`)
);

-- Create Comments table
CREATE TABLE Comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comment TEXT,
    id_shop INT,
    id_user INT,
    FOREIGN KEY (id_shop) REFERENCES `Shop`(`id`),
    FOREIGN KEY (id_user) REFERENCES `User`(`id`)
);

//* you eed to create a user table first*//

INSERT INTO `Shop` (`shopOwner_id`, `name`, `category`, `description`, `address`, `video`, `menu`, `logo`, `like`, `dislike`) 
VALUES 
('1', 'Caffeine', 'coffee', 'Venez découvrir notre Salon de thé Caffeine, dans un cadre unique de par sa décoration, son ambiance feutrée, et la qualité des produits que vous y dégusterez.Régalez-vous, détendez-vous à tout moments de la journée et savourez...We Give Love,You Share Passion..', 'sfax', 'https://www.facebook.com/caffeinetn/videos/803421799825471/', '["https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/417481034_403013198736104_6952863582627422744_n.jpg?stp=c52.0.206.206a_dst-jpg_p206x206&_nc_cat=101&ccb=1-7&_nc_sid=50ad20&_nc_ohc=zu6WpZF7ZeUQ7kNvgEMKfrA&_nc_ht=scontent.ftun14-1.fna&oh=00_AYDIU3SmM1QRafNitRHNk320PbJ-0Go-Z4gjgz4LQ5wgDA&oe=668B1580","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/417397340_400937528943671_2343047325180086852_n.jpg?stp=c0.17.206.206a_dst-jpg_p206x206&_nc_cat=109&ccb=1-7&_nc_sid=50ad20&_nc_ohc=3muHOURrmXoQ7kNvgFG5xKB&_nc_ht=scontent.ftun14-1.fna&oh=00_AYD7cNvZyUCM2x-PxfJ3yE-q0bkGRF3j5bZJ7ydKhPKAtw&oe=668AF682","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/414456405_392017503169007_6948640263639717281_n.jpg?stp=c0.17.206.206a_dst-jpg_p206x206&_nc_cat=109&ccb=1-7&_nc_sid=50ad20&_nc_ohc=1ow9jMJv4yQQ7kNvgHvFlRX&_nc_ht=scontent.ftun14-1.fna&oh=00_AYAQZXqeFsRC_J8dP-9ipKRED1Uqdjttrbu9JccCMPX7qw&oe=668B0B0F","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/254292268_2046656548835317_5863041213335929483_n.jpg?stp=c0.34.206.206a_dst-jpg_p206x206&_nc_cat=104&ccb=1-7&_nc_sid=714c7a&_nc_ohc=8UI9PMyc5-AQ7kNvgGVTWBF&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCiynoYN59yyRnd_g5PytqNK-Ncz0HStxrOCwrNnhNi4A&oe=668B2797","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/165846664_1868404819993825_5952041591484140986_n.jpg?stp=c0.28.206.206a_dst-jpg_p206x206&_nc_cat=110&ccb=1-7&_nc_sid=a3ef70&_nc_ohc=eebeSfHoijoQ7kNvgGvBtR9&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCiBZNWn8LUD14kVd8ghoqL9HWqxAauIXXDWUPX7Cp0OA&oe=66ACA763","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/124476838_1757382561096052_5201960825351635619_n.jpg?stp=c0.23.206.206a_dst-jpg_p206x206&_nc_cat=111&ccb=1-7&_nc_sid=a934a8&_nc_ohc=-OSH_s8QwNYQ7kNvgHxhcHs&_nc_ht=scontent.ftun14-1.fna&oh=00_AYDQ50IT3ZQapst6nckbxqHOw_FvK4A8Iyo4zjSo7B2E8Q&oe=66AC9A64","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/120723812_1719768934857415_520475093900979160_n.jpg?stp=c0.26.206.206a_dst-jpg_p206x206&_nc_cat=105&ccb=1-7&_nc_sid=5df8b4&_nc_ohc=oeGmUm5XTYkQ7kNvgHdYSff&_nc_ht=scontent.ftun14-1.fna&gid=A3Ch9JZt7Uiscwx2-eacS2o&oh=00_AYBVShjHqU6kP8ZUDySV_vJhpIodvPsj8wo1uQZHGoniDg&oe=66AC9BCB","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/104635669_1616363725197937_6269721873074715503_n.jpg?stp=c0.23.206.206a_dst-jpg_p206x206&_nc_cat=105&ccb=1-7&_nc_sid=a934a8&_nc_ohc=EkDJvpxH_jEQ7kNvgGn63uU&_nc_ht=scontent.ftun14-1.fna&oh=00_AYDb8SBzrpxyFxyNnB0KxfkzI8eGLh4Gp3pnURftHH7vEg&oe=66ACC3CC","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/87387456_1513388842162093_2828024359967260672_n.jpg?stp=c0.17.206.206a_dst-jpg_p206x206&_nc_cat=111&ccb=1-7&_nc_sid=a934a8&_nc_ohc=cFwIhwuvAtoQ7kNvgEAGpJv&_nc_ht=scontent.ftun14-1.fna&gid=ATtTqU1ghN-U1EXoRW_9vAj&oh=00_AYArx59sOX8tuLmrxV8nrgoBiGw6e4A2MyWS98cud5KRIA&oe=66ACADB5"]', 'https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-1/256352528_2051521245015514_7386319217440015163_n.jpg?stp=dst-jpg_p200x200&_nc_cat=108&ccb=1-7&_nc_sid=f4b9fd&_nc_ohc=tpJKtrP5wOkQ7kNvgEfB3k7&_nc_ht=scontent.ftun14-1.fna&oh=00_AYA6Rh_YmoLkRkzNpWhp6ZdaLpkKKF8JlwOOpJPbSV8Jjw&oe=668B2D45', '20', '2'),
( '3', 'Café DIWAN', 'coffee', 'Café turque parfumé trop bon !!! Idéal pour les soirées.', 'sfax', 'https://www.facebook.com/reel/493497353186429', '["https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/419039096_122116328936240503_7857394200947321834_n.jpg?stp=c5.0.206.206a_dst-jpg_p206x206&_nc_cat=104&ccb=1-7&_nc_sid=50ad20&_nc_ohc=MU8FVj4A2F0Q7kNvgGaa_IF&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCAqG9sOb0HASm7KuwhhAN3KNGwT8DFupa3E2_bxcxJSg&oe=668B28F3","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/438861008_122131038614240503_348204086058475905_n.jpg?stp=c0.37.206.206a_dst-jpg_p206x206&_nc_cat=100&ccb=1-7&_nc_sid=50ad20&_nc_ohc=TxpTCux-cuYQ7kNvgHPqYbk&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCzeNs1x5GE3e-J2kTSTUHxNQp6MylDejM-iRiAmU_Evw&oe=668B0643","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/448931630_122146871768240503_3320145546076214474_n.jpg?stp=c0.53.206.206a_dst-jpg_p206x206&_nc_cat=100&ccb=1-7&_nc_sid=50ad20&_nc_ohc=JmRNgfW9K2EQ7kNvgH8IOFT&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCc21cQYvpJm5IBNGD0p5TpDRunpGpNiAp28ADYoAgYBw&oe=668B0401","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/417519419_122102816312240503_5138932031889039919_n.jpg?stp=c0.83.206.206a_dst-jpg_p206x206&_nc_cat=103&ccb=1-7&_nc_sid=50ad20&_nc_ohc=h_0AqNDyWs0Q7kNvgGegH67&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCbkoYP7utb9Oy4SZpM4ucKjTK1L3ZVj13Nf4K7cpTUEA&oe=668B2726"]', 'https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/299356785_511606914102500_3057064993004082362_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=0NaL7b87FJIQ7kNvgGFSujM&_nc_ht=scontent.ftun14-1.fna&oh=00_AYB7ifrJSJ6MsHbvQEkqQNiYxTJ-rbhLNcaJ5l8LLmvksg&oe=668B1B65', '30', '10'),
('2', 'Titos coffee shop', 'coffe', 'A modern coffee space where you can unwind after work', 'sfax', 'https://fb.watch/t50td0fZUn/', '["https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/383994986_702530001911746_7182018692939325420_n.jpg?stp=c0.17.206.206a_cp6_dst-jpg_p206x206&_nc_cat=102&ccb=1-7&_nc_sid=50ad20&_nc_ohc=fd0ijjVn-OMQ7kNvgH4etxb&_nc_ht=scontent.ftun14-1.fna&gid=AnXyyolTC3hRnc1PIuu5zvk&oh=00_AYDFJdrFh99ZAHF6U9riOTBu3W6rIXTg638ExBL35Dje2w&oe=668B29B5","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/298330183_1500806167049675_6064630021568570974_n.jpg?stp=c93.0.206.206a_dst-jpg_p206x206&_nc_cat=102&ccb=1-7&_nc_sid=8b96af&_nc_ohc=3db4AIt-uxQQ7kNvgEaQmdB&_nc_ht=scontent.ftun14-1.fna&oh=00_AYDgkb8k8d7m7mRX9XGyfdv45j-P_ZZLv5M1iX55FoFyZg&oe=668B1AAC","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/297411038_1493788057751486_6425914430655666461_n.jpg?stp=c94.0.206.206a_dst-jpg_p206x206&_nc_cat=101&ccb=1-7&_nc_sid=8b96af&_nc_ohc=BMU3_-ETNvoQ7kNvgFaA_qO&_nc_ht=scontent.ftun14-1.fna&oh=00_AYAku6C9R12fLGPIIXHc52W1fBP2mNev3GfkF30KVQDE_g&oe=668B204F","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/268212571_1338221043308189_3000059964496469966_n.jpg?stp=c0.17.206.206a_dst-jpg_p206x206&_nc_cat=105&ccb=1-7&_nc_sid=8b96af&_nc_ohc=jd_qRnjjoKUQ7kNvgHZVCNx&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCoHSEsM9WQLmym7hGyF8wGobVx20oj4zauAqSkzLQM0Q&oe=668B24BE","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/103961160_954513145012316_8029898010718649911_n.jpg?stp=c0.17.206.206a_dst-jpg_p206x206&_nc_cat=101&ccb=1-7&_nc_sid=054925&_nc_ohc=aWnFlsuIH3sQ7kNvgGfmzVj&_nc_ht=scontent.ftun14-1.fna&gid=AOrj0VDP9woXPhV2XT-YZk2&oh=00_AYB4gEk5LLyUcHp9NT4Zq53XrclROX_DjkQFHJrZh5WVJg&oe=66ACBF90","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/61416279_670921790038121_8766997625254707200_n.jpg?stp=c0.17.206.206a_dst-jpg_p206x206&_nc_cat=107&ccb=1-7&_nc_sid=054925&_nc_ohc=BXMgiIxS77gQ7kNvgEAuZ17&_nc_ht=scontent.ftun14-1.fna&oh=00_AYBwpAQ0nxlBrSqdptlKXPNrm17D3_GIqvHHpIKjY60uPA&oe=66ACBE2A"]', 'https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/326388020_1864810113875748_3313677202413654912_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=6MlBDChHNOQQ7kNvgFzHdnG&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCX61htsnw9IAWL0s_5x0TsRUKxfrWqElvkIyovQwtnAw&oe=668B3554', '8', '4'),
('4', 'VIP Lounge ', 'coffee', 'a coffee lounge and chicha bar', 'sfax', 'https://fb.watch/t55hkdLmHK/', '["https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/448948989_503610988685918_3534165311498501717_n.jpg?stp=dst-jpg_p206x206&_nc_cat=109&ccb=1-7&_nc_sid=714c7a&_nc_ohc=ryJ8GpTUMH8Q7kNvgGZo7Wu&_nc_ht=scontent.ftun14-1.fna&oh=00_AYBXUyvfpzarjpcoRAt-Vxxf1bGsbFWxX9iDJNu5ZiyU6g&oe=668B27C0","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/448661210_501674285546255_7469402518294726126_n.jpg?stp=dst-jpg_p206x206&_nc_cat=104&ccb=1-7&_nc_sid=714c7a&_nc_ohc=ZmKuS5magXUQ7kNvgGam0oI&_nc_ht=scontent.ftun14-1.fna&oh=00_AYBI5RzYaTaP-yBIyRyPCC4SKgTHIHBc-y0O2pizJgY9uw&oe=668B1581","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/447725308_492980989748918_6043900751725177946_n.jpg?stp=c8.0.206.206a_dst-jpg_p206x206&_nc_cat=102&ccb=1-7&_nc_sid=714c7a&_nc_ohc=Dhp_dbNb4kQQ7kNvgFRccu7&_nc_ht=scontent.ftun14-1.fna&oh=00_AYB4oYR7XCPMCYChhXajc9kHEpgx8ZwdDVC9FBR5yHngYg&oe=668B404C","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/440036253_466610079052676_832730185074084342_n.jpg?stp=c0.23.206.206a_dst-jpg_p206x206&_nc_cat=102&ccb=1-7&_nc_sid=714c7a&_nc_ohc=xk5BbMe9sscQ7kNvgESMDM0&_nc_ht=scontent.ftun14-1.fna&oh=00_AYAvALTRP_GyVSWdM6S-ZJW9j78NEWba0H9Gisxh5zd_AA&oe=668B1411","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/414407191_401916248855393_6052885731118293051_n.jpg?stp=dst-jpg_p206x206&_nc_cat=111&ccb=1-7&_nc_sid=714c7a&_nc_ohc=_DQP3cjxO4cQ7kNvgG-SURQ&_nc_ht=scontent.ftun14-1.fna&oh=00_AYDtlKVvQzx0ujN85ONEA41_EzVHdVPZfv2cZcOlvq3jLw&oe=668B127C","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/393688703_362966432750375_1361030092011678440_n.jpg?stp=c0.34.206.206a_dst-jpg_p206x206&_nc_cat=103&ccb=1-7&_nc_sid=714c7a&_nc_ohc=v-DfVRRREg0Q7kNvgGJFtFg&_nc_ht=scontent.ftun14-1.fna&gid=AXz81GiiRIQMPAbA7DxiE-5&oh=00_AYC_6hTGPQC8Tru3l7w5EfsrmkRKPL366pZ5jRDInjevLw&oe=668B4214","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/393683943_362966126083739_6193271205565343580_n.jpg?stp=c0.34.206.206a_dst-jpg_p206x206&_nc_cat=106&ccb=1-7&_nc_sid=714c7a&_nc_ohc=UnXX9pYYt8AQ7kNvgFjXIqy&_nc_ht=scontent.ftun14-1.fna&gid=AXz81GiiRIQMPAbA7DxiE-5&oh=00_AYBVkeBVNrI6VfiVbEpFvAJiZtliz2bi9LcqMOb7kjQ7Xw&oe=668B221D","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/296097359_5301820239907464_7885246899891818295_n.jpg?stp=c52.0.206.206a_dst-jpg_p206x206&_nc_cat=110&ccb=1-7&_nc_sid=714c7a&_nc_ohc=IcPwgGWLRO0Q7kNvgExWFUv&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCNpT954Bg6zT4i5GkMEfKT8W4PFJ7Oh2QsbWBln0DGSA&oe=668B35ED"]', 'https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-1/284079929_5151636651592491_3465719831818192932_n.jpg?stp=dst-jpg_p200x200&_nc_cat=106&ccb=1-7&_nc_sid=f4b9fd&_nc_ohc=aKqvK-YukOMQ7kNvgHIr4Le&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCp245oRxKvxe4veevI2bPXMLFJeDfqm6gCNPGhuK2lRw&oe=668B2EBC', '40', '3'),
('3', 'La voile blanche ', 'restaurant', 'A variaty of seafood delecacies ', 'sfax', 'https://fb.watch/t55YEbqqWg/', '["https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/441497355_882260567279068_8938829537669203586_n.jpg?stp=c0.53.206.206a_cp6_dst-jpg_p206x206&_nc_cat=101&ccb=1-7&_nc_sid=50ad20&_nc_ohc=zNZZP7u47GgQ7kNvgEan-uo&_nc_ht=scontent.ftun14-1.fna&oh=00_AYC0iPs8RqxBR5MBgl8PXald4J9R37HsXmJQIO9hrTZldA&oe=668B2D63","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/442437346_891625209675937_242230725841689426_n.jpg?stp=c0.17.206.206a_dst-jpg_p206x206&_nc_cat=107&ccb=1-7&_nc_sid=50ad20&_nc_ohc=n0sn5wEHvkEQ7kNvgGL3AmY&_nc_ht=scontent.ftun14-1.fna&oh=00_AYALv3gS4jxQYq96Grd5Jvj84WczANyGoVwb_WfODGcFSw&oe=668B3DC4","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/418962458_807726801399112_7947311166613867991_n.jpg?stp=c0.78.206.206a_cp6_dst-jpg_p206x206&_nc_cat=108&ccb=1-7&_nc_sid=50ad20&_nc_ohc=ppcPK9lkljcQ7kNvgGS0KTj&_nc_ht=scontent.ftun14-1.fna&oh=00_AYAU4hQQWUEis186kY0Lw37FYNeWFFpLLEZWWzyfYWgg5w&oe=668B3829","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/316425443_5548366261925761_7083406067909939518_n.jpg?stp=c10.0.206.206a_dst-jpg_p206x206&_nc_cat=107&ccb=1-7&_nc_sid=50ad20&_nc_ohc=20F9ljVWcjUQ7kNvgHs2Brw&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCfRrHDH2T24pHYNH2T6U7i7G6Ek_8BjA0_sNnITB7QYQ&oe=668B1881","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/231665787_4115012618594473_7353941762150634672_n.jpg?stp=c56.0.206.206a_dst-jpg_p206x206&_nc_cat=102&ccb=1-7&_nc_sid=50ad20&_nc_ohc=2tmbmwjMhw0Q7kNvgFjomwq&_nc_ht=scontent.ftun14-1.fna&gid=AD4My6A--wYvZAaOzpG0uFU&oh=00_AYA49KaKsbQR7E7Hi-d88f8chv149e9pvyL9zHc7FOSEGA&oe=668B1C99","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/190638740_3912478922181178_1984532607024388368_n.jpg?stp=c34.0.206.206a_dst-jpg_p206x206&_nc_cat=107&ccb=1-7&_nc_sid=5df8b4&_nc_ohc=XivIgLaDsFQQ7kNvgH8r23f&_nc_ht=scontent.ftun14-1.fna&oh=00_AYBKcPoPDVWOZ_y5-T6y3C2f4d9TxhRicdMJ-683pJiZIw&oe=66ACBCE4","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/176026691_3816872148408523_5472875209218409773_n.jpg?stp=c59.0.206.206a_dst-jpg_p206x206&_nc_cat=111&ccb=1-7&_nc_sid=5df8b4&_nc_ohc=DaQc9XMAQO8Q7kNvgHzYrwe&_nc_ht=scontent.ftun14-1.fna&oh=00_AYA-FER4twPSHNgh54JK2ibybQ-kcVA3UDch2jKKjFOqAQ&oe=66ACDDCE","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/133071752_3506461649449576_137458790148376815_n.jpg?stp=c52.0.206.206a_dst-jpg_p206x206&_nc_cat=108&ccb=1-7&_nc_sid=5df8b4&_nc_ohc=bNJCYv-9k4MQ7kNvgF0ygLO&_nc_ht=scontent.ftun14-1.fna&oh=00_AYDPBcogPsD7L8rjGVZ5vCyeiFfk2N2PzwV8_0hv4y5hJA&oe=66ACCC44","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/104686924_2961313690631044_2683371551323912099_n.jpg?stp=c80.0.206.206a_dst-jpg_p206x206&_nc_cat=102&ccb=1-7&_nc_sid=8f740e&_nc_ohc=qo73Vz5VVlsQ7kNvgGLpsFR&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCSQBsKLD2LS5PBHzkOq1Vz5ecfj0TlBaNXU3q1WnC6wg&oe=66ACC812"]', 'https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/280872757_4996693537093039_4358089085460901891_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=sza_rW-pvQgQ7kNvgH5WrMX&_nc_ht=scontent.ftun14-1.fna&oh=00_AYDVMx9w1mpSrsSiFNpHUmkbxVbkuAisqSBx_-hDK5LNmA&oe=668B398F', '50', '9'),
('5', 'Saffoud Abid', 'restaurant', 'Traditional plates ideal for a rich meal', 'sfax', 'https://www.facebook.com/reel/959175461815355', '["https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/53677070_2355923091119315_7372655746946695168_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=7b2446&_nc_ohc=dqxozNqgOdQQ7kNvgGAR9o2&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCr3eL3RG6CjiqVhfKMgQUsjBcIwTgEVrKC2qv-O_e7rQ&oe=66ACE827","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/54524597_2355923124452645_8955330854557581312_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=7b2446&_nc_ohc=FzGVYNPBIXEQ7kNvgH_b-YW&_nc_ht=scontent.ftun14-1.fna&oh=00_AYDtQDz415r3wSxQct9njenheqwvdpamENtYcE_WX7XSVg&oe=66ACBAEE","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.18169-9/13151846_1025165784197556_4767118314124211587_n.jpg?stp=dst-jpg_p526x296&_nc_cat=101&ccb=1-7&_nc_sid=7b2446&_nc_ohc=nYVJEkO6UT0Q7kNvgGCMmK-&_nc_ht=scontent.ftun14-1.fna&oh=00_AYC6YEWYU04FkohKssrlMjorBAQd1DOW0lDrpqsoSOOJIA&oe=66ACD747","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.18169-9/23561558_1956965611228782_1495478162041787650_n.jpg?stp=dst-jpg_p526x296&_nc_cat=100&ccb=1-7&_nc_sid=7b2446&_nc_ohc=HNYinYTQkFYQ7kNvgFBOre_&_nc_ht=scontent.ftun14-1.fna&oh=00_AYAVg4B7r42ROkeLLSTAjl6U0x593CUplLTnvzfyMCUCSg&oe=66ACB557","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/54524597_2355923124452645_8955330854557581312_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=7b2446&_nc_ohc=FzGVYNPBIXEQ7kNvgH_b-YW&_nc_ht=scontent.ftun14-1.fna&oh=00_AYDtQDz415r3wSxQct9njenheqwvdpamENtYcE_WX7XSVg&oe=66ACBAEE"]', 'https://scontent.ftun14-1.fna.fbcdn.net/v/t1.18169-1/17862618_1397221710340475_6119642009369072306_n.jpg?stp=c81.0.148.148a_dst-jpg_p148x148&_nc_cat=103&ccb=1-7&_nc_sid=45ae13&_nc_ohc=VLS77zudoNoQ7kNvgHKBgsw&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCIaLPU5PhnUCQI0SpmWsiOV5p2Nuy1HEHRQFYRI2OBkA&oe=66ACE339', '60', '12'),
('4', 'Le Grill', 'restaurant', 'Traditional', 'sfax', 'https://fb.watch/t56Xo4EyCw/', '["https://scontent.ftun14-1.fna.fbcdn.net/v/t1.18169-9/12523020_563007383873717_2314792027107001873_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=7b2446&_nc_ohc=ytvAQDV51e4Q7kNvgFMT_uy&_nc_ht=scontent.ftun14-1.fna&oh=00_AYAMS1_jt0MVTPms76vp9idEcl1M-IyMxLSeVS1xbJy3QA&oe=66ACD75B","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.18169-9/15390816_667285123433050_8369429610104587155_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=7b2446&_nc_ohc=SKCBUu3FHYgQ7kNvgGKBauU&_nc_ht=scontent.ftun14-1.fna&oh=00_AYAcdh62FC1TRvjfgYe-Du676gZ2pN3L30o0sdnEuDdN1w&oe=66ACE3EB","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.18169-9/12573840_563007307207058_6619691746123903883_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=7b2446&_nc_ohc=BBkcVFrxdCcQ7kNvgFBOUzI&_nc_ht=scontent.ftun14-1.fna&oh=00_AYBFZ3q8tlMlmA10kEb6-tDQnpqQQvYEDgNaFOO1PXaZXw&oe=66ACE01E","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.18169-9/13177428_1206971485988396_1751596482536659865_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=7b2446&_nc_ohc=uKO_niDV4BIQ7kNvgFTn4bN&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCv11kgA5FZDbNDwq3biyZua-l2nydp7haQQlD7osri_w&oe=66ACDE6B","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.18169-9/13151845_1206971549321723_1634284258795842242_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=7b2446&_nc_ohc=jCZQ6OrnFqUQ7kNvgGsLf5r&_nc_ht=scontent.ftun14-1.fna&oh=00_AYA2DxnxFsY7erkO94B_glutfdKBqlkD0_4YwK_fQz_rjQ&oe=66ACBC4F","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.18169-9/12573840_563007307207058_6619691746123903883_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=7b2446&_nc_ohc=BBkcVFrxdCcQ7kNvgFBOUzI&_nc_ht=scontent.ftun14-1.fna&oh=00_AYBFZ3q8tlMlmA10kEb6-tDQnpqQQvYEDgNaFOO1PXaZXw&oe=66ACE01E"]', 'https://scontent.ftun14-1.fna.fbcdn.net/v/t1.18169-1/12036452_1029608637089466_8127474611140668431_n.jpg?stp=c25.0.148.148a_dst-jpg_p148x148&_nc_cat=107&ccb=1-7&_nc_sid=45ae13&_nc_ohc=cAo63W5AubcQ7kNvgGNWA8L&_nc_ht=scontent.ftun14-1.fna&oh=00_AYA8KzkqSGDCaUYuz_q786CQMsMrY3P3gpE0OXZqmWrxCQ&oe=66ACD98F', '10', '3'),
('6', 'Farm Slice Pizza', 'restaurant', 'Best pizza in town', 'sfax', 'https://fb.watch/t575c2o7gx/', '["https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/368153098_609404384677682_4225511951874623270_n.jpg?stp=dst-jpg_s206x206&_nc_cat=102&ccb=1-7&_nc_sid=714c7a&_nc_ohc=swzyEI1DnXsQ7kNvgEfZW-t&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCVXdkM-cHrdW_qqXx9CNK_e2liuXGrmB3K8y29wGypZA&oe=668B2552","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/271543337_2413134665495675_8425052987987141585_n.jpg?stp=dst-jpg_p206x206&_nc_cat=110&ccb=1-7&_nc_sid=8b96af&_nc_ohc=nxF2vjha5G8Q7kNvgGNUG0E&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCJWIR5YbZteOeG6ivL_UmD6H3RYk0vASLk2p9OtuE7uA&oe=668B3148","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/418286781_18326295988107629_3049600613564563133_n.jpg?stp=c0.10.206.206a_dst-jpg_p206x206&_nc_cat=107&ccb=1-7&_nc_sid=714c7a&_nc_ohc=IMLnyZy3kHUQ7kNvgG89G7g&_nc_ht=scontent.ftun14-1.fna&oh=00_AYAGeDCmTqDGtGpt8StTdtAZk4NjVXvsYaa2QwCHJtCatw&oe=668B4FD2","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/418226496_18326296018107629_2391618818331861300_n.jpg?stp=c0.10.206.206a_dst-jpg_p206x206&_nc_cat=111&ccb=1-7&_nc_sid=714c7a&_nc_ohc=8PYym0qzE2wQ7kNvgF80E99&_nc_ht=scontent.ftun14-1.fna&oh=00_AYD8M6BOcl3NYbrXSeRU5XSFAO0UIM2tBcT8aT1V9xBzUw&oe=668B2D12","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/100471856_1875868165888997_7341211402314448896_n.jpg?stp=dst-jpg_s206x206&_nc_cat=109&ccb=1-7&_nc_sid=054925&_nc_ohc=Gwvlr35QF7gQ7kNvgEufCE6&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCAuIGWXuwrbDHVdJGRrpT8qlzmcndZjzuuEomycM04cQ&oe=66ACE411","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/62245870_1519871554821995_998295213002719232_n.jpg?stp=c0.17.206.206a_dst-jpg_p206x206&_nc_cat=101&ccb=1-7&_nc_sid=5df8b4&_nc_ohc=DrUzoY0_2yEQ7kNvgF1Y3sr&_nc_ht=scontent.ftun14-1.fna&oh=00_AYDbYXMBPU0B_Dz6uIBqIGfnMscao3yx7TXXhtKs1ha2Hg&oe=66ACEE62","https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/42497051_1312738992201920_1617290044345679872_n.jpg?stp=c0.17.206.206a_dst-jpg_p206x206&_nc_cat=102&ccb=1-7&_nc_sid=5df8b4&_nc_ohc=DIWQx1rcsWAQ7kNvgHnJCFp&_nc_ht=scontent.ftun14-1.fna&oh=00_AYA23HL2GaOO4UzTeQYlNTrpNGM2twaXP4f-E-siGATIHg&oe=66ACDEF9","https://scontent.ftun14-1.fna.fbcdn.net/v/t31.18172-8/26910252_1102959039846584_339404844180926505_o.jpg?stp=dst-jpg_p206x206&_nc_cat=106&ccb=1-7&_nc_sid=054925&_nc_ohc=02OWBcpb9v4Q7kNvgHokTpw&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCgZ9D6TVVGdfZSe8--uFmv7_gJpJGen3DVGxNWBbmBHg&oe=66ACCBD7"]', 'https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/263979316_2388023538006788_2725964595273535910_n.png?_nc_cat=109&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=JTfGfgwNyOAQ7kNvgGUxKX_&_nc_ht=scontent.ftun14-1.fna&oh=00_AYB9q0vqwTDjA2cIOjgifWvQjdIggPXcW1zxvGlA36jDqQ&oe=668B302B', '100', '3'),
('3', 'EL Kolla', 'restaurant', 'nice plaze for a cozy meal', 'sfax', 'https://fb.watch/t57nG1Yrg4/', '["https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/448944300_927481282752207_4933369550682501384_n.jpg?stp=c80.0.206.206a_dst-jpg_p206x206&_nc_cat=109&ccb=1-7&_nc_sid=50ad20&_nc_ohc=exEza3TuOD0Q7kNvgEz5kbq&_nc_ht=scontent.ftun14-1.fna&oh=00_AYANe13F9WjtEBOI_dj1BxpusT--fFfCVZevtWlx5490LQ&oe=668B2EB7","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/449212155_927482596085409_6538110814830181345_n.jpg?stp=c0.16.206.206a_dst-jpg_p206x206&_nc_cat=108&ccb=1-7&_nc_sid=50ad20&_nc_ohc=PeqX1HrFDqMQ7kNvgHy08lT&_nc_ht=scontent.ftun14-1.fna&oh=00_AYC4nnDShHKZDg_D2atPC2qN1bfA2skTDuMKRMFaKppttA&oe=668B2DBC","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/449698142_927481832752152_1580602043156536079_n.jpg?stp=c0.27.206.206a_dst-jpg_p206x206&_nc_cat=102&ccb=1-7&_nc_sid=50ad20&_nc_ohc=2TzvjMrUHwUQ7kNvgETXygV&_nc_ht=scontent.ftun14-1.fna&oh=00_AYDGvkDWyclZZY27cEumFF38xxq8YHKprT-DZFcZ_X-cFA&oe=668B4B88","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/449610446_927480426085626_1722002922374814040_n.jpg?stp=c34.0.206.206a_dst-jpg_p206x206&_nc_cat=103&ccb=1-7&_nc_sid=50ad20&_nc_ohc=N3Q2bxuhYzwQ7kNvgE7iOJs&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCP5dWSDqfKthgMsdfNDnjrqLBcYGvyC65eNJVrAqxokw&oe=668B33D2","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/449518877_927481449418857_8976538008584854807_n.jpg?stp=c0.23.206.206a_dst-jpg_p206x206&_nc_cat=109&ccb=1-7&_nc_sid=50ad20&_nc_ohc=cQahIfkI7WMQ7kNvgHa74aE&_nc_ht=scontent.ftun14-1.fna&oh=00_AYAJIrEn5Dfm4kYtcLxJDtUGwlwimUuR_y1UMBal219Ebg&oe=668B3994","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/448211120_912771737556495_8385362871967395259_n.jpg?stp=c0.17.206.206a_dst-jpg_p206x206&_nc_cat=102&ccb=1-7&_nc_sid=50ad20&_nc_ohc=fHv24LJPPfwQ7kNvgGdLyf8&_nc_ht=scontent.ftun14-1.fna&oh=00_AYDZLZOFxCXydQ-r_pXa1CsKV2ev6aXktc5UVAK-KWS4Kw&oe=668B3994","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/447040271_907737108059958_6176475763272031032_n.jpg?stp=c0.56.206.206a_dst-jpg_p206x206&_nc_cat=110&ccb=1-7&_nc_sid=50ad20&_nc_ohc=4DbPEWTYiRUQ7kNvgHvHxp-&_nc_ht=scontent.ftun14-1.fna&oh=00_AYBs5ZZe2y0QXOnthFBk5BMfLId_FVHsrBc4L4azjP2uQw&oe=668B2052"]', 'https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/395433872_763969872436683_7780429087096932277_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=ActcL2pxGMYQ7kNvgFk4vp-&_nc_ht=scontent.ftun14-1.fna&oh=00_AYBBI4trfp2N6JuoCdM95oMFpo_8HTTUXHCka_1ol1th-g&oe=668B48AA', '100', '15'),
('7', 'Cercina Garage', 'bar', 'nice place to have some beers with good seafood plates', 'sfax', 'https://youtu.be/wbRfGTeBxYE', '["https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/262859973_4526932464022345_6006239145925052390_n.jpg?stp=dst-jpg_p180x540&_nc_cat=104&ccb=1-7&_nc_sid=aa7b47&_nc_ohc=QILBRuAM5hAQ7kNvgF6D9z-&_nc_ht=scontent.ftun14-1.fna&oh=00_AYD3g_hgZMAEHHVVpf8I6mq7XbP3_2caRSvDm8Sy3XuufA&oe=668B345E","https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/438086115_7471064663007105_739928665069139353_n.jpg?stp=cp6_dst-jpg_p526x296&_nc_cat=105&ccb=1-7&_nc_sid=833d8c&_nc_ohc=t02DrDrr4YsQ7kNvgG3-tJP&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCrO63bR5VRB89sx393ArdkvlcwZvmuhFs3WGPwdnUSwg&oe=668B2AE7"]', 'https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/62452628_10217128463198132_3916918433450557440_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=13d280&_nc_ohc=X1q3a-aEZZsQ7kNvgEjMK6H&_nc_ht=scontent.ftun14-1.fna&oh=00_AYCI-eZ3kR0k8P06I6_czYfFLwx0AVdoW37AWY-qKLPkyA&oe=66ACE257', '30', '5');
