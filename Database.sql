CREATE DATABASE database_7;

USE database_7;


/* Αρχικά θα φτιάξουμε τον πίνακα person οπου θα αποθηκεύουμε τα φυσικά πρόσωπα */

CREATE TABLE person (
	name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    adress VARCHAR(255),
    isaTeacher BOOLEAN,
    PRIMARY KEY (name)
);

/* Τώρα θα βάλουμε 35 μαθητές και 15 καθηγητές*/

INSERT INTO person (name, age, adress, isaTeacher)
VALUES
	("Maria Papadopoulou", 12, "Aghia Paraskevi",FALSE),
    ("Nikos Karagiannis", 15, "Zografou",0),
    ("Andreas Katsaros",16, "Marousi",0),
    ("Sophia Kostopoulou",13, "Pireas",0),
    ("Dimitris Theodorou", 14, "Aghia Paraskevi" ,0),
    ("Eleni Georgiou",17, "Zografou",0),
    ("Petros Athanasiou",14, "Marousi",0),
    ("Katerina Papandreou",13, "Pireas",0),
    ("Christos Christopoulos",17,"Aghia Paraskevi",0),
    ("Vasilis Papadakis",16, "Zografou",0),
    ("Despina Konstantinidou",14, "Marousi",0),
    ("Yannis Anastasiou",14, "Pireas",0),
    ("Zoe Economou",13,"Aghia Paraskevi",0),
    ("Thanos Tsoukalas",12, "Zografou",0),
    ("Ioanna Vlachou",14, "Marousi",0),
    ("Antonis Arvanitis",17, "Pireas",0),
    ("Aggeliki Giannakopoulou",13,"Aghia Paraskevi",0),
    ("Spyros Papaspyrou",16, "Zografou",0),
    ("Stella Katsouli",15, "Marousi",0),
    ("Giannis Panagiotou",14, "Pireas",0),
    ("Athena Kourou",15,"Aghia Paraskevi",0),
    ("Ioannis Karras",12, "Zografou",0),
    ("Maria Papanikolaou",15, "Marousi",0),
    ("Nikolas Stavropoulos",16, "Pireas",0),
    ("Elena Georgiadi",15,"Aghia Paraskevi",0),
    ("Konstantinos Kalantzis",17, "Zografou",0),
    ("Georgia Apostolopoulou",17, "Marousi",0),
    ("Ioannis Makris",13, "Pireas",0),
    ("Eleni Papamichael",15,"Aghia Paraskevi",0),
    ("Dimitrios Vasilopoulos",17, "Zografou",0),
    ("Vasiliki Christodoulou",16, "Marousi",0),
    ("Alexandros Vlachopoulos",13, "Pireas",0),
    ("Anthi Triantafyllou",14,"Aghia Paraskevi",0),
    ("Christoforos Michalopoulos",12, "Zografou",0),
    ("Olga Sotiropoulou",16, "Marousi",0),
    ("Marios Paraskevopoulos",30, "Pireas",1),
    ("Iliana Chatzi",25,"Aghia Paraskevi",1),
    ("Andreas Vassilakis",55, "Zografou",1),
    ("Theodora Pappa",67, "Marousi",1),
    ("Ioannis Patsis",34, "Pireas",1),
    ("Maria Kalli",30,"Aghia Paraskevi",1),
    ("Nikitas Nikolaidis",52, "Zografou",1),
    ("Zoe Daskalopoulou",19, "Marousi",1),
    ("Panagiotis Frangos",45, "Pireas",1),
    ("Athanasios Kokkinos",46,"Aghia Paraskevi",1),
    ("Katerina Terzi",26, "Zografou",1),
    ("Christos Tsironis",67, "Marousi",1),
    ("Vasilis Karakostas",22, "Pireas",1),
    ("Konstantina Karali",34,"Aghia Paraskevi",1),
    ("Anastasios Papathanasiou",65, "Zografou",1);
    

####### Τώρα θα φτιάξουμε τον πίνακα school και θα βάλουμε 4 σχολεία ##############

CREATE TABLE school (
    name VARCHAR(255) NOT NULL,
    adress VARCHAR(255),
    city VARCHAR(255),
    phone INT,
    email VARCHAR(255),
    PRIMARY KEY (name)
);

INSERT INTO school(name,adress,phone,email)
VALUES
	("1o Aghias Paraskevis","Aghia Paraskevi", 210111111,"1oAghiasParaskevis@gmail.com"),
    ("1o Zografou","Zografou", 210222222,"1oZografou@gmail.com"),
    ("1o Amarousiou","Marousi", 210333333,"1oAmarousiou@gmail.com"),
    ("1o Pirea","Pireas", 210444444,"1oPirea@gmail.com");

######## Τώρα θα προσθέσουμε στο πίνακα school μια στήλη principal και μια στήλη operator ###################        
######## και οι δυο αυτές στήλες θα τις κάνουμε foreign keys στο person ###################     
  
ALTER TABLE school 
ADD COLUMN principal VARCHAR(255);
ALTER TABLE school 
ADD COLUMN operator VARCHAR(255);
ALTER TABLE school 
ADD FOREIGN KEY (principal) REFERENCES person(name);
ALTER TABLE school 
ADD FOREIGN KEY (operator) REFERENCES person(name);

UPDATE school
SET principal = "Athanasios Kokkinos",operator = "Iliana Chatzi"
WHERE name = "1o Aghias Paraskevis";
UPDATE school
SET principal = "Anastasios Papathanasiou", operator = "Andreas Vassilakis"
WHERE name = "1o Zografou";
UPDATE school
SET principal = "Theodora Pappa", operator = "Zoe Daskalopoulou"
WHERE name = "1o Amarousiou";
UPDATE school
SET principal = "Panagiotis Frangos", operator = "Marios Paraskevopoulos"
WHERE name = "1o Pirea";


######## Τώρα θα προσθέσουμε τη στήλη isat στον πίνακα person που θα είνα foreign key στο πίνακα school ###########

ALTER TABLE person 
ADD COLUMN isat VARCHAR(255);
ALTER TABLE person
ADD FOREIGN KEY (isat) REFERENCES school(name);

SET SQL_SAFE_UPDATES = 0;

UPDATE person 
SET isat = "1o Aghias Paraskevis"
WHERE adress = "Aghia Paraskevi";

UPDATE person 
SET isat = "1o Zografou"
WHERE adress = "Zografou";

UPDATE person 
SET isat = "1o Amarousiou"
WHERE adress = "Marousi";

UPDATE person 
SET isat = "1o Pirea"
WHERE adress = "Pireas";

########## GIA LOGOUS APLOUSTEUSIS THA RIKSOYME Tη στήλη ADRESS APO TO SCHOOL ####################
ALTER TABLE school DROP COLUMN city;

ALTER TABLE school RENAME COLUMN adress TO city;



########### Τώρα θα φτιάξουμε τον πίνακα credentials με τα username, password και administrative rights του καθενός ######
CREATE TABLE credentials (
	username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL DEFAULT "123456",
    isaOperator BOOLEAN DEFAULT FALSE,
    isaUser BOOLEAN DEFAULT TRUE,
    isaAdministrator BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (username)
);


###### ARXIKA THA VALOUME OLA TA NAMES APO TA PERSON WS USERNAME STO credentials #############
INSERT INTO credentials (username)
SELECT name
FROM person;

###### twra THA FTIAKSOUME KAI MIA STHLH NAME KAI THA ANTIGRAPSOUME KAI EKEI TA ONOMATA POU VALAME STH STHLH USERNAME
ALTER TABLE credentials ADD COLUMN name VARCHAR(255);

UPDATE credentials SET name = username;

###### KANOUME TH STHLH NAME FOREIGN KEY STO TABLE person ##################
ALTER TABLE credentials
ADD FOREIGN KEY (name) REFERENCES person (name);


######## twra me STRING MANIPULATION THA KANOUME TH STHLH username NA FAINETAI WS PRAGMATIKA usernames POU VAZEI O KOSMOS #####
UPDATE credentials
SET username = CONCAT(username, '_13');

UPDATE credentials
SET username = REPLACE(username, ' ', '_');

UPDATE credentials
SET username = LOWER(username);


###### EFOSON EXOUME VALEI DEFAULT NA EINA OLOI USERS TWRA THA PAME NA TO ALLAKSOUME AUTO STOUS OPERATORS. MEXRI STIGMIS DEN EXOUME ADMINISTRATOR ########

UPDATE credentials
SET isaOperator = TRUE WHERE name = "Iliana Chatzi" or name = "Andreas Vassilakis" or name = "Zoe Daskalopoulou" or name = "Marios Paraskevopoulos";

UPDATE credentials
SET isaUser = FALSE WHERE name = "Iliana Chatzi" or name = "Andreas Vassilakis" or name = "Zoe Daskalopoulou" or name = "Marios Paraskevopoulos";






/* Πάμε τώρα να φτιάξουμε τον πίνακα book.*/
/*	TIS STILES writer kai keywords tha tis diagrapsoume meta. einai ena eksipno kolpo gia na kanoume tis sxeseis me THEMATIC CATEGORY KAI WRITER*/

CREATE TABLE book (
	isbn INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    writer VARCHAR(255) NOT NULL,
    publisher VARCHAR(255),
    numOfPages INT,
    summary VARCHAR(1000) DEFAULT 'The novel traces the life of David Copperfield from the time of his birth to his mature manhood, when he is married and familiar with the vicissitudes of life. His early years are enjoyable with his mother — who was widowed shortly before his birth — and with her servant, Peggotty. Life is happy for David until his mother decides to marry Mr. Murdstone; afterward, life becomes unbearable for David. He is soon sent to a miserable school where he becomes friendly with James Steerforth, a fellow student.',
    keywords VARCHAR(255),
    picture VARCHAR(255) DEFAULT 'https://www.cup.gr/wp-content/uploads/2016/03/978-960-524-310-4.png',
    PRIMARY KEY (isbn)    
);

ALTER TABLE book AUTO_INCREMENT=1001;

INSERT INTO book (title, writer, publisher, numOfPages, keywords) VALUES
('To Kill a Mockingbird', 'Harper Lee', 'Penguin Random House', 281, 'Fiction, Classic'),
('1984', 'George Orwell', 'Penguin Random House', 328, 'Dystopian, Fiction'),
('The Alchemist', 'Paulo Coelho', 'HarperCollins', 208, 'Fiction, Inspirational'),
('The Subtle Art of Not Giving a F*ck', 'Mark Manson', 'HarperCollins', 224, 'Self-help, Non-fiction'),
('The Da Vinci Code', 'Dan Brown', 'Penguin Random House', 481, 'Mystery, Thriller'),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Simon & Schuster', 180, 'Fiction, Classic'),
('The Power of Now', 'Eckhart Tolle', 'New World Library', 236, 'Spirituality, Self-help'),
('The Notebook', 'Nicholas Sparks', 'Hachette Book Group', 224, 'Romance, Fiction'),
('The Road', 'Cormac McCarthy', 'Knopf Doubleday Publishing Group', 256, 'Fiction, Post-apocalyptic'),
('The 7 Habits of Highly Effective People', 'Stephen R. Covey', 'Hachette Book Group', 384, 'Self-help, Non-fiction'),
('The Bell Jar', 'Sylvia Plath', 'Random House', 288, 'Fiction, Autobiographical'),
('Start with Why', 'Simon Sinek', 'Penguin Random House', 256, 'Business, Leadership'),
('Angels & Demons', 'Dan Brown', 'Simon & Schuster', 620, 'Mystery, Thriller'),
('The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', 240, 'Fiction, Classic'),
('Man''s Search for Meaning', 'Viktor E. Frankl', 'Perseus Books Group', 184, 'Psychology, Non-fiction'),
('The Immortal Life of Henrietta Lacks', 'Rebecca Skloot', 'Crown Publishing Group', 384, 'Biography, Science'),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Simon & Schuster', 180, 'Fiction, Classic'),
('Wild: From Lost to Found on the Pacific Crest Trail', 'Cheryl Strayed', 'Knopf Doubleday Publishing Group', 336, 'Memoir, Non-fiction'),
('The Help', 'Kathryn Stockett', 'Penguin Random House', 544, 'Fiction, Historical'),
('Eat, Pray, Love', 'Elizabeth Gilbert', 'Penguin Random House', 400, 'Memoir, Self-help'),
('The Hitchhiker''s Guide to the Galaxy', 'Douglas Adams', 'Random House', 224, 'Science Fiction, Comedy'),
('The Devil Wears Prada', 'Lauren Weisberger', 'HarperCollins', 400, 'Fiction, Chick Lit'),
('The Time Traveler''s Wife', 'Audrey Niffenegger', 'Simon & Schuster', 560, 'Fiction, Romance'),
('Jane Eyre', 'Charlotte Bronte', 'Penguin Random House', 532, 'Fiction, Classic'),
('The Color Purple', 'Alice Walker', 'Harcourt Brace Jovanovich', 288, 'Fiction, Historical'),
('The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Penguin Random House', 480, 'Mystery, Thriller'),
('The Nightingale', 'Kristin Hannah', 'Penguin Random House', 448, 'Fiction, Historical'),
('Nineteen Eighty-Four', 'George Orwell', 'Penguin Random House', 328, 'Dystopian, Fiction'),
('One Hundred Years of Solitude', 'Gabriel Garcia Marquez', 'HarperCollins', 448, 'Fiction, Magic Realism'),
('Gone Girl', 'Gillian Flynn', 'Crown Publishing Group', 432, 'Mystery, Thriller'),
('Eat Pray Love', 'Elizabeth Gilbert', 'Penguin Random House', 368, 'Memoir, Self-help'),
('The God of Small Things', 'Arundhati Roy', 'Penguin Random House', 368, 'Fiction, Historical'),
('The Shack', 'William P. Young', 'Hachette Book Group', 272, 'Fiction, Christian'),
('The Kite Runner', 'Khaled Hosseini', 'Penguin Random House', 371, 'Fiction, Historical'),
('The Road', 'Cormac McCarthy', 'Knopf Doubleday Publishing Group', 256, 'Fiction, Post-apocalyptic'),
('Start with Why', 'Simon Sinek', 'Penguin Random House', 256, 'Business, Leadership'),
('The Girl on the Train', 'Paula Hawkins', 'Penguin Random House', 336, 'Mystery, Thriller'),
('The Lean Startup', 'Eric Ries', 'Penguin Random House', 336, 'Business, Entrepreneurship'),
('The Power of Now', 'Eckhart Tolle', 'New World Library', 236, 'Spirituality, Self-help'),
('The Hunger Games', 'Suzanne Collins', 'Scholastic', 384, 'Dystopian, Fiction'),
('The Lovely Bones', 'Alice Sebold', 'Little, Brown and Company', 368, 'Fiction, Thriller'),
('The Da Vinci Code', 'Dan Brown', 'Penguin Random House', 489, 'Mystery, Thriller'),
('Ender''s Game', 'Orson Scott Card', 'Penguin Random House', 357, 'Science Fiction'),
('The Giver', 'Lois Lowry', 'Houghton Mifflin Harcourt', 240, 'Dystopian, Fiction'),
('Don Quixote', 'Miguel de Cervantes', 'Penguin Random House', 1056, 'Fiction, Classic'),
('Freakonomics', 'Steven D. Levitt and Stephen J. Dubner', 'William Morrow and Company', 336, 'Non-fiction, Economics'),
('Angels and Demons', 'Dan Brown', 'Penguin Random House', 736, 'Mystery, Thriller'),
('The Stand', 'Stephen King', 'Penguin Random House', 1168, 'Fiction, Post-apocalyptic'),
('Fast Food Nation', 'Eric Schlosser', 'Houghton Mifflin Harcourt', 400, 'Non-fiction, Food Industry'),
('The Alchemist', 'Paulo Coelho', 'HarperCollins', 208, 'Fiction, Inspirational'),
('Built to Last', 'Jim Collins and Jerry Porras', 'HarperCollins', 368, 'Business, Leadership'),
('The Secret Life of Bees', 'Sue Monk Kidd', 'Penguin Random House', 336, 'Fiction, Historical'),
('The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', 224, 'Fiction, Classic'),
('To Kill a Mockingbird', 'Harper Lee', 'HarperCollins', 384, 'Fiction, Historical'),
('Jurassic Park', 'Michael Crichton', 'Penguin Random House', 416, 'Science Fiction'),
('The Bourne Identity', 'Robert Ludlum', 'Penguin Random House', 592, 'Mystery, Thriller'),
('To Kill a Mockingbird', 'Harper Lee', 'Hachette Book Group', 281, 'Fiction, Historical'),
('The Shining', 'Stephen King', 'Penguin Random House', 688, 'Fiction, Horror'),
('1984', 'George Orwell', 'Penguin Random House', 328, 'Dystopian, Fiction'),
('One Flew Over the Cuckoo''s Nest', 'Ken Kesey', 'Penguin Random House', 320, 'Fiction, Classic'),
('The Three Musketeers', 'Alexandre Dumas', 'Penguin Random House', 704, 'Fiction, Classic'),
('The Road', 'Cormac McCarthy', 'Farrar, Straus and Giroux', 304, 'Fiction, Post-apocalyptic'),
('The Lovely Bones', 'Alice Sebold', 'Little, Brown and Company', 368, 'Fiction, Mystery'),
('The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Penguin Random House', 672, 'Mystery, Thriller'),
('Into Thin Air', 'Jon Krakauer', 'Random House', 333, 'Non-fiction, Memoir'),
('The Hunt for Red October', 'Tom Clancy', 'Penguin Random House', 656, 'Thriller, Suspense'),
('The Lean Startup', 'Eric Ries', 'Penguin Random House', 336, 'Business, Entrepreneurship'),
('Gone Girl', 'Gillian Flynn', 'Penguin Random House', 432, 'Mystery, Thriller'),
('The Pelican Brief', 'John Grisham', 'Penguin Random House', 432, 'Mystery, Thriller'),
('Stranger in a Strange Land', 'Robert A. Heinlein', 'Penguin Random House', 528, 'Science Fiction'),
('The Kite Runner', 'Khaled Hosseini', 'Penguin Random House', 371, 'Fiction, Historical'),
('Wild', 'Cheryl Strayed', 'Alfred A. Knopf', 315, 'Non-fiction, Memoir'),
('Eat, Pray, Love', 'Elizabeth Gilbert', 'Penguin Random House', 352, 'Non-fiction, Memoir'),
('The Immortal Life of Henrietta Lacks', 'Rebecca Skloot', 'Penguin Random House', 400, 'Non-fiction, Science'),
('Middlesex', 'Jeffrey Eugenides', 'Picador', 544, 'Fiction, Historical'),
('The God of Small Things', 'Arundhati Roy', 'Penguin Random House', 336, 'Fiction, Historical'),
('The Road to Serfdom', 'F.A. Hayek', 'University of Chicago Press', 256, 'Non-fiction, Politics'),
('The Power of Habit', 'Charles Duhigg', 'Penguin Random House', 416, 'Non-fiction, Psychology'),
('The Secret Life of Bees', 'Sue Monk Kidd', 'Penguin Random House', 336, 'Fiction, Historical'),
('The Da Vinci Code', 'Dan Brown', 'Penguin Random House', 624, 'Mystery, Thriller'),
('Interpreter of Maladies', 'Jhumpa Lahiri', 'Houghton Mifflin Harcourt', 208, 'Fiction, Short Stories'),
('Ready Player One', 'Ernest Cline', 'Broadway Books', 384, 'Fiction, Science Fiction'),
('The Memory Keeper’s Daughter', 'Kim Edwards', 'Penguin Random House', 432, 'Fiction, Historical'),
('The Appeal', 'John Grisham', 'Grand Central Publishing', 480, 'Mystery, Legal thriller'),
('A Painted House', 'John Grisham', 'Dell Publishing', 480, 'Fiction, Historical'),
('The Road', 'Cormac McCarthy', 'Vintage', 304, 'Fiction, Post-apocalyptic'),
('The Catcher in the Rye', 'J.D. Salinger', 'Penguin Random House', 240, 'Fiction, Coming of age'),
('The Book Thief', 'Markus Zusak', 'Penguin Random House', 592, 'Fiction, Historical'),
('The Last Juror', 'John Grisham', 'Dell Publishing', 448, 'Mystery, Legal thriller'),
('The Help', 'Kathryn Stockett', 'Penguin Random House', 544, 'Fiction, Historical'),
('The Devil in the White City', 'Erik Larson', 'Crown Publishing', 464, 'Non-fiction, True crime'),
('A Time to Kill', 'John Grisham', 'Dell Publishing', 672, 'Mystery, Legal thriller'),
('The Goldfinch', 'Donna Tartt', 'Penguin Random House', 784, 'Fiction, Coming of age'),
('The Hunger Games', 'Suzanne Collins', 'Scholastic Press', 384, 'Fiction, Science Fiction'),
('The Wind-Up Bird Chronicle', 'Haruki Murakami', 'Penguin Random House', 624, 'Fiction, Magical Realism'),
('A Time to Embrace', 'Karen Kingsbury', 'Penguin Random House', 304, 'Fiction, Romance'),
('Water for Elephants', 'Sara Gruen', 'Algonquin Books', 350, 'Fiction, Historical'),
('The Girl Who Played with Fire', 'Stieg Larsson', 'Penguin Random House', 752, 'Mystery, Thriller'),
('The Casual Vacancy', 'J.K. Rowling', 'Little, Brown and Company', 512, 'Fiction, Drama'),
('Girl with a Pearl Earring', 'Tracy Chevalier', 'Penguin Random House', 240, 'Fiction, Historical'),
('1984', 'George Orwell', 'Penguin Random House', 336, 'Fiction, Dystopian');

/* η παραπάνω INSERT εντολή έχει κάποια duplictes. Θέλουμε να τα βρούμε και να τα διαγράψουμε*/

CREATE TEMPORARY TABLE tmp_table AS (
    SELECT MIN(isbn) AS min_isbn, title
    FROM book
    GROUP BY title
);

SET SQL_SAFE_UPDATES = 0;

DELETE b
FROM book b
JOIN tmp_table t ON b.title = t.title
WHERE b.isbn <> t.min_isbn;

DROP TABLE tmp_table;

SELECT title, COUNT(*) as count
FROM book
GROUP BY title
HAVING count > 1;

/* το τελευταίο query επέστρεψε άδειο πίνακα άρα δεν έχουμε πια duplicates*/


/* η άσκηση μας ζητάει τουλάχιστον 100 βιβλία άρα τώρα θα βάλουμε περισσότερα*/


INSERT INTO book (title, writer, publisher, numOfPages, keywords)
VALUES
('The Witcher: Baptism of Fire', 'Andrzej Sapkowski', 'Orbit', 380, 'Fantasy, Adventure'),
('The Graveyard Book', 'Neil Gaiman', 'HarperCollins', 312, 'Fantasy, Horror'),
('Twilight', 'Stephenie Meyer', 'Little, Brown and Company', 498, 'Romance, Vampire'),
('Harry Potter and the Philosophers Stone', 'J.K. Rowling', 'Bloomsbury Publishing', 223, 'Fantasy, Adventure'),
('The Lord of the Rings', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt', 1178, 'Fantasy, Adventure'),
('Dune', 'Frank Herbert', 'Ace Books', 896, 'Science Fiction, Adventure'),
('To Kill a Mockingbird', 'Harper Lee', 'J. B. Lippincott & Co.', 281, 'Classic, Fiction'),
('The Silent Patient', 'Alex Michaelides', 'Celadon Books', 352, 'Mystery, Thriller'),
('The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Knopf Doubleday Publishing Group', 644, 'Mystery, Thriller'),
('1984', 'George Orwell', 'Signet Classics', 328, 'Dystopian, Political Fiction');

INSERT INTO book (title, writer, publisher, numOfPages, keywords)
VALUES
('American Gods', 'Neil Gaiman', 'William Morrow Paperbacks', 736, 'Fantasy, Mythology'),
('The Nightingale', 'Kristin Hannah', 'St. Martin\'s Press', 448, 'Historical Fiction, War'),
('Gone Girl', 'Gillian Flynn', 'Broadway Books', 432, 'Mystery, Thriller'),
('The Hunger Games', 'Suzanne Collins', 'Scholastic Press', 374, 'Dystopian, Adventure'),
('The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', 277, 'Coming of Age, Fiction'),
('One Hundred Years of Solitude', 'Gabriel García Márquez', 'Penguin Books', 417, 'Magical Realism, Fiction'),
('The Kite Runner', 'Khaled Hosseini', 'Riverhead Books', 371, 'Historical Fiction, Drama'),
('The Poisonwood Bible', 'Barbara Kingsolver', 'HarperPerennial', 576, 'Historical Fiction, Drama'),
('The Road', 'Cormac McCarthy', 'Vintage Books', 287, 'Post-Apocalyptic, Fiction'),
('The Handmaids Tale', 'Margaret Atwood', 'Anchor Books', 311, 'Dystopian, Feminist Fiction');


/*edw exoume vivlia me 3 thematic categories*/
INSERT INTO book (title, writer, publisher, numOfPages, keywords)
VALUES
('Hidden Figures', 'Margot Lee Shetterly', 'William Morrow Paperbacks', 368, 'Biography, History, Science'),
('Little Fires Everywhere', 'Celeste Ng', 'Penguin Press', 352, 'Domestic Fiction, Drama'),
('The Da Vinci Code', 'Dan Brown', 'Anchor Books', 489, 'Mystery, Thriller'),
('The Hand on the Wall', 'Maureen Johnson', 'Katherine Tegen Books', 384, 'Mystery, Thriller, Young Adult Fiction'),
('The Name of the Wind', 'Patrick Rothfuss', 'DAW Books', 662, 'Fantasy, Fiction'),
('Life of Pi', 'Yann Martel', 'Mariner Books', 460, 'Philosophical Fiction, Adventure'),
('The Silent Patient', 'Alex Michaelides', 'Celadon Books', 352, 'Mystery, Thriller'),
('The Four Winds', 'Kristin Hannah', 'St. Martin\'s Press', 464, 'Historical Fiction, Drama'),
('The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Vintage Crime/Black Lizard', 672, 'Mystery, Thriller'),
('Harry Potter and the Philosophers Stone', 'J.K. Rowling', 'Bloomsbury Publishing', 223, 'Fantasy, Fiction');


INSERT INTO book (title, writer, publisher, numOfPages, keywords)
VALUES
('Becoming', 'Michelle Obama', 'Crown Publishing Group', 448, 'Biography, Memoir'),
('Inferno', 'Dan Brown', 'Anchor Books', 480, 'Mystery, Thriller'),
('Project Hail Mary', 'Andy Weir', 'Ballantine Books', 496, 'Science Fiction, Thriller'),
('The Testaments', 'Margaret Atwood', 'Nan A. Talese', 432, 'Dystopian Fiction, Historical Fiction'),
('The Hunger Games', 'Suzanne Collins', 'Scholastic Press', 374, 'Young Adult Fiction, Science Fiction'),
('The Racketeer', 'John Grisham', 'Dell Publishing Company', 368, 'Legal Thriller'),
('The Martian', 'Andy Weir', 'Broadway Books', 384, 'Science Fiction'),
('The Vanishing Half', 'Brit Bennett', 'Riverhead Books', 352, 'Historical Fiction, Family Saga'),
('The Nightingale', 'Kristin Hannah', 'St. Martin\'s Griffin', 440, 'Historical Fiction, War Fiction'),
('The Firm', 'John Grisham', 'Dell Publishing Company', 496, 'Legal Thriller');

INSERT INTO book (title, writer, publisher, numOfPages, keywords)
VALUES
('Before the Fall', 'Noah Hawley', 'Grand Central Publishing', 400, 'Mystery, Thriller');

/*ξανά μανά να διαγράψουμε duplicates*/

CREATE TEMPORARY TABLE tmp_table AS (
    SELECT MIN(isbn) AS min_isbn, title
    FROM book
    GROUP BY title
);

SET SQL_SAFE_UPDATES = 0;

DELETE b
FROM book b
JOIN tmp_table t ON b.title = t.title
WHERE b.isbn <> t.min_isbn;

SELECT title, COUNT(*) as count
FROM book
GROUP BY title
HAVING count > 1;

DROP TABLE tmp_table;

/* τώρα έχουμε ακριβώς 100 βιβλία*/

/*	Τώρα θέλουμε να φτιάξουμε τον πίνακα thematic_category*/
/*	TA THEMATIC CATEGORIES THA TA PAROUME APO TI STILI KEYWORDS TOU BOOK. KATHWS AUTH H STHLH PERIEXEI OLH TH PLHROFORIA POU XREIAZOMASTE*/

CREATE TABLE thematic_category AS
SELECT DISTINCT SUBSTRING_INDEX(keywords, ',', 1) AS keyword1, isbn
FROM book
UNION
SELECT DISTINCT SUBSTRING_INDEX(keywords, ',', -1) AS keyword1, isbn
FROM book;

UPDATE thematic_category
SET keyword1 = REPLACE(keyword1, ' ', '');

CREATE TEMPORARY TABLE tmp_table AS (
    SELECT MIN(isbn) AS min_isbn, keyword1
    FROM thematic_category
    GROUP BY keyword1
);

SET SQL_SAFE_UPDATES = 0;

DELETE b
FROM thematic_category b
JOIN tmp_table t ON b.keyword1 = t.keyword1
WHERE b.isbn <> t.min_isbn;

SELECT keyword1, COUNT(*) as count
FROM thematic_category
GROUP BY keyword1
HAVING count > 1;

DROP TABLE tmp_table;


ALTER TABLE thematic_category
ADD PRIMARY KEY (keyword1);

ALTER TABLE thematic_category
DROP COLUMN isbn;

ALTER TABLE thematic_category
RENAME COLUMN keyword1 TO thematic_category;

/*	META APO TOSO KOPO O PINAKAS thematic_category EINA ETOIMOS*/

/* Τώρα θέλουμε να φτιάξουμε τον πίνακα που θα συνδέει thematic_category με το book και θα τον λέμε thematic_category_book*/

CREATE TABLE thematic_category_book AS
SELECT isbn, SUBSTRING_INDEX(keywords, ',', 1) AS keyword1
FROM book
UNION 
SELECT isbn, SUBSTRING_INDEX(keywords, ',', -1) AS keyword1
FROM book;

ALTER TABLE thematic_category_book
ADD PRIMARY KEY (isbn,keyword1);

UPDATE thematic_category_book
SET keyword1 = REPLACE(keyword1, ' ', '');

ALTER TABLE thematic_category_book
ADD FOREIGN KEY (isbn) REFERENCES book(isbn);

ALTER TABLE thematic_category_book
RENAME COLUMN keyword1 TO thematic_category;

ALTER TABLE thematic_category_book
ADD FOREIGN KEY (thematic_category) REFERENCES thematic_category(thematic_category);

/*Tα καταφέραμε!!1 φτιάξαμε την thematic_category_book*/ 

/* Τώρα θέλουμε να φτιάξουμε τον πίνακα με τους συγγραφείς (writers) και τον πίνακα που σθνδέει τους συγγραφείς με τα βιβλία τους */
/* Δυστυχώς καθώς εισάγαμε τα δεδομένα δεν βάλαμε κάποιο βιβλίο που να έχει δύο συγγραφείς. Παρόλλα αυτά με τισ σχέσεις που θα δημιουργήσουμε η καταχώρηση ενός βιβλίου που έχει δύο συγγραφείς είναι απολύτως εφικτή και λειτουργική όπως λέει η άσκηση*/
CREATE TABLE writer AS 
SELECT DISTINCT writer FROM book;

CREATE TABLE writer_book AS 
SELECT isbn, writer FROM book;


ALTER TABLE writer
ADD PRIMARY KEY (writer);
SHOW KEYS FROM writer WHERE Key_name = 'PRIMARY';

ALTER TABLE writer_book
ADD PRIMARY KEY (writer,isbn);
SHOW KEYS FROM writer_book WHERE Key_name = 'PRIMARY';

ALTER TABLE writer_book
ADD FOREIGN KEY (isbn) REFERENCES book(isbn);

ALTER TABLE writer_book
ADD FOREIGN KEY (writer) REFERENCES writer(writer);

ALTER TABLE book
DROP COLUMN writer;

ALTER TABLE book
DROP COLUMN keywords;
/* Τελειώσαμε και με τα writer και writer_book*/

/* Tώρα θέλουμε να φτιάξουμε τον πίνακα num of copies*/
/* Για λόγους απλότητας θα θεωρήσουμε ότι το κάθε σχολείο έχει δύο αντίγραφα απο κάθε βιβλίο*/

CREATE TABLE tmp (
	num_of_copies INT NOT NULL
);

INSERT INTO tmp(num_of_copies)
VALUES (2);



CREATE TABLE num_of_copies AS
SELECT book.isbn, school.name, tmp.num_of_copies
FROM book,school,tmp;

ALTER TABLE num_of_copies
ADD PRIMARY KEY (isbn,name);
SHOW KEYS FROM num_of_copies WHERE Key_name = 'PRIMARY';

ALTER TABLE num_of_copies
ADD FOREIGN KEY (isbn) REFERENCES book(isbn);

ALTER TABLE num_of_copies
ADD FOREIGN KEY (name) REFERENCES school(name);

DROP TABLE tmp;

/* Tώρα που έχουμε όλα αυτά πάμε να κάνουμε τον πίνακα lendings που θα καταχωρούνται οι δανεισμοί */



CREATE TABLE lendings(
	person_who_received VARCHAR(255),
    person_who_gave VARCHAR(255),
    school VARCHAR(255),
    isbn INT,
    date_of_rental DATE,
    date_to_be_returned DATE DEFAULT (date_of_rental + 7),
    date_of_return DATE,
    isReturned BOOL,
    PRIMARY KEY (person_who_received,isbn,date_of_rental),
    FOREIGN KEY (person_who_received) REFERENCES person(name),
    FOREIGN KEY (person_who_gave) REFERENCES person(name),
    FOREIGN KEY (school) REFERENCES school(name),
    FOREIGN KEY (isbn) REFERENCES book(isbn)
);

INSERT INTO lendings (person_who_received, person_who_gave, school, isbn, date_of_rental, date_of_return,isReturned)
VALUES ('Aggeliki Giannakopoulou','Iliana Chatzi','1o Aghias Paraskevis',1001,'2022-04-21', '2022-04-28', true);
INSERT INTO lendings (person_who_received, person_who_gave, school, isbn, date_of_rental, date_of_return,isReturned)
VALUES ('Maria Papadopoulou','Iliana Chatzi','1o Aghias Paraskevis',1002,'2022-04-21', '2022-04-28', true);
INSERT INTO lendings (person_who_received, person_who_gave, school, isbn, date_of_rental, date_of_return,isReturned)
VALUES ('Konstantina Karali','Iliana Chatzi','1o Aghias Paraskevis',1001,'2022-04-13', '2022-04-20', true);
INSERT INTO lendings (person_who_received, person_who_gave, school, isbn, date_of_rental, date_of_return,isReturned)
VALUES ('Konstantina Karali','Iliana Chatzi','1o Aghias Paraskevis',1002,'2022-04-03', '2022-04-10', true);  
INSERT INTO lendings (person_who_received, person_who_gave, school, isbn, date_of_rental, date_of_return,isReturned)
VALUES ('Konstantina Karali','Iliana Chatzi','1o Aghias Paraskevis',1003,'2022-04-21', '2022-04-28', true);  
INSERT INTO lendings (person_who_received, person_who_gave, school, isbn, date_of_rental, date_of_return,isReturned)
VALUES ('Konstantina Karali','Iliana Chatzi','1o Aghias Paraskevis',1004,'2022-03-20', '2022-04-27', true);  
INSERT INTO lendings (person_who_received, person_who_gave, school, isbn, date_of_rental, date_of_return,isReturned)
VALUES ('Konstantina Karali','Iliana Chatzi','1o Aghias Paraskevis',1005,'2022-03-12', '2022-03-19', true);  
INSERT INTO lendings (person_who_received, person_who_gave, school, isbn, date_of_rental, date_of_return,isReturned)
VALUES ('Ioannis Patsis','Marios Paraskevopoulos','1o Pirea',1014,'2022-03-03', '2022-03-10', true);
INSERT INTO lendings (person_who_received, person_who_gave, school, isbn, date_of_rental, date_of_return,isReturned)
VALUES ('Nikitas Nikolaidis','Andreas Vassilakis','1o Zografou',1001,'2022-03-03', '2022-03-03', true);



/**/
SELECT * FROM thematic_category_book;
SELECT * FROM lendings;
SELECT * FROM person;

/*###############################	3.1.1	###########################################*/
/*query για χωρίς χρονολογικούς περιορισμούς*/
SELECT school,COUNT(*) AS number_of_lendings FROM lendings
GROUP BY school;

/*query για κάποιο μήνα απο κάθε έτος. Εδώ έχουμε μάρτιο (03)*/
SELECT school,COUNT(*) FROM lendings
WHERE MONTH(date_of_rental) = 3
GROUP BY school;

/*query για κάποιο μήνα απο κάποιο έτος. Εδώ έχουμε 03 του 2022*/
SELECT school,COUNT(*) FROM lendings
WHERE MONTH(date_of_rental) = 3 AND YEAR(date_of_rental) = 2022
GROUP BY school;

/*query για όλους τους μήνες απο κάποιο έτος. Εδώ έχουμε του έτους 2022*/
SELECT school,COUNT(*) FROM lendings
WHERE YEAR(date_of_rental) = 2022
GROUP BY school;

/*###############################	3.1.2	###########################################*/
/*query που επιστρέφει τα βιβλία που ανήκουν σε μια θεματική κατηγορία. Εδώ ψάχνουμε για classic*/
SELECT book.isbn FROM book INNER JOIN thematic_category_book ON book.isbn = thematic_category_book.isbn WHERE thematic_category_book.thematic_category = 'Classic';

/*χρησιμοποιούμε το προηγούμενο query*/
/*Tώρα φτιάξαμε query που επιστρέφει τους συγγραφείς που έχουν βιβλίο σε μία θεματική κατηγορία. Εδώ ψάχνουμε τους συγγραφείς που έχουν γράψει classic*/
SELECT DISTINCT writer_book.writer from writer_book
INNER JOIN (SELECT book.isbn FROM book INNER JOIN thematic_category_book ON book.isbn = thematic_category_book.isbn WHERE thematic_category_book.thematic_category = 'Classic') AS T1
ON T1.isbn = writer_book.isbn;

/*query που επιστρέφει τα ατομα που δανείστικαν βιβλίο κάποιας κατηγορίας για κάποιο έτος. Εδώ η κατηγορία είναι classic και το έτος είναι 2022*/
SELECT lendings.person_who_received, lendings.isbn FROM lendings
INNER JOIN (SELECT book.isbn FROM book INNER JOIN thematic_category_book ON book.isbn = thematic_category_book.isbn WHERE thematic_category_book.thematic_category = 'Classic') AS T1
ON lendings.isbn = T1.isbn
WHERE YEAR(lendings.date_of_rental) = 2022;


/*query που επιστρέφει τους καθηγητές που δανείστικαν βιβλίο κάποιας κατηγορίας για κάποιο έτος. Εδώ η κατηγορία είναι classic και το έτος είναι 2022*/
SELECT DISTINCT person.name FROM person 
INNER JOIN (
	SELECT lendings.person_who_received, lendings.isbn FROM lendings
	INNER JOIN (SELECT book.isbn FROM book INNER JOIN thematic_category_book ON book.isbn = thematic_category_book.isbn WHERE thematic_category_book.thematic_category = 'Classic') AS T1
	ON lendings.isbn = T1.isbn
	WHERE YEAR(lendings.date_of_rental) = 2022
) AS T2
ON person.name = T2.person_who_received
WHERE person.isaTeacher = 1;

/*###############################	3.1.3	###########################################*/
/*query τους καθηγητές κάτω των 40 και των αριθμό των βιβλίων που εχουν δανειστεί σε φθήνουσα σειρά*/
SELECT  lendings.person_who_received AS name, COUNT(*) AS number_of_rentals FROM lendings
INNER JOIN (
	SELECT * FROM person WHERE isaTeacher = 1 AND age < 40
) AS T1
ON lendings.person_who_received = T1.name
GROUP BY lendings.person_who_received
ORDER BY number_of_rentals DESC;

/*###############################	3.1.4	###########################################*/

/*query που επιστρέφει τους συγγραφείς που έχουν τύχει δανεισμού*/
SELECT DISTINCT writer_book.writer FROM writer_book
INNER JOIN (
SELECT DISTINCT isbn FROM lendings
) AS T1
ON T1.isbn = writer_book.isbn;

/*query που μας επιστρέφει ποιοι συγγραφείς δεν έχουν τύχει δανεισμού*/
SELECT DISTINCT writer FROM WRITER_BOOK
EXCEPT
(SELECT DISTINCT writer_book.writer FROM writer_book
INNER JOIN (
SELECT DISTINCT isbn FROM lendings
) AS T1
ON T1.isbn = writer_book.isbn);

/*###############################	3.1.6	###########################################*/

/*query που επιστρέφει τα ζεύγη θεματικών κατηγοριών που δημιουργεί ένα βιβλίο */
SELECT T1.isbn, T1.thematic_category AS first_thematic_category, T2.thematic_category AS second_thematic_category FROM thematic_category_book AS T1 
INNER JOIN thematic_category_book AS T2
ON T1.isbn = T2.isbn
WHERE T1.thematic_category != T2.thematic_category;

/*query που επιστρέφει πόσα βιβλία έχουν τύχει δανεισμού απο κάθε ζεύγος. Ta ζευγη τα εμφανίζει δύο φορες με διαφορετική σειρα στα first thematic_category και second_thematic_category. Η πληροφορία ειναι σωστή απλά αυτά είναι duplicates*/
SELECT t3.first_thematic_category, t3.second_thematic_category, count(*) AS sum FROM lendings
INNER JOIN (
	SELECT T1.isbn, T1.thematic_category AS first_thematic_category, T2.thematic_category AS second_thematic_category FROM thematic_category_book AS T1 
	INNER JOIN thematic_category_book AS T2
	ON T1.isbn = T2.isbn
	WHERE T1.thematic_category != T2.thematic_category
) AS T3 
ON lendings.isbn = T3.isbn
group BY t3.first_thematic_category, t3.second_thematic_category;


/* Tώρα απλά διαγράφουμε απο τον πάνω πίνακα τα duplicates*/
SELECT DISTINCT LEAST(first_thematic_category, second_thematic_category) AS first_thematic_category,
                GREATEST(first_thematic_category, second_thematic_category) AS second_thematic_category,
                sum
FROM (
	SELECT t3.first_thematic_category, t3.second_thematic_category, count(*) as sum FROM lendings
	INNER JOIN (
		SELECT T1.isbn, T1.thematic_category AS first_thematic_category, T2.thematic_category AS second_thematic_category FROM thematic_category_book AS T1 
		INNER JOIN thematic_category_book AS T2
		ON T1.isbn = T2.isbn
		WHERE T1.thematic_category != T2.thematic_category
	) AS T3 
	ON lendings.isbn = T3.isbn
	group BY t3.first_thematic_category, t3.second_thematic_category) AS T8;


/* to 1001 einai classic fiction kai exoume 3
	to 1002 einai distopian fiction kai exoume 2
	to 1003 einai fiction inspirational kai exoume 1
	to 1004 einai non-fiction self-help kai exoume 1
    to 1005 einai mystery thriller kai exoume 1
    to 1006 einai classic fiction kai exoume 1
    to 1014 einai classic fiction kai exoume 1
    */
    
    
/*###############################	3.1.7	###########################################*/

/* query που μας δείνει τo αθροισμα των βιβλίων που έχει γράψει κάποιος συγγραφέας*/
SELECT writer,COUNT(*) AS sum FROM writer_book GROUP BY writer ORDER BY sum desc;


/* query που μας επιστρέφει τους συγγραφείς με αριθμό βιβλίων >= τον μεγιστο αριθμό βιβλίων που έχει γράψει κάποιος συγγραφέας - 5*/
SELECT T1.writer FROM (SELECT writer,COUNT(*) AS sum FROM writer_book GROUP BY writer) AS T1
WHERE T1.sum >= (SELECT COUNT(*) AS sum FROM writer_book GROUP BY writer ORDER BY sum desc limit 1) -5;
  
 INSERT INTO credentials (username,password,isaOperator,isaUser,isaAdministrator,name)
 VALUES
 ('dimitris_tzanetos','123456',False,False,True,NULL);
 
 SELECT * from THEMATIC_CATEGORY;