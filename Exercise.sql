-- Soal 1
-- Gunakan database “Sakila”
-- Tampilkan 10 baris data customer id, rental id, amount, dan payment date pada table payment.

show databases;
use sakila;
show tables;

SELECT customer_id, rental_id, amount, payment_date
    FROM payment
    LIMIT 10;

-- Soal 2
-- Gunakan database “Sakila”
-- Dari table “film”, tampilkan 10 judul film, tahun release, dan durasi rental dimana judul film yang ditampilkan yang dimulai dengan huruf “S”

 SELECT title, release_year, rental_duration
    FROM film
    WHERE title LIKE 's%'
    LIMIT 10;
    
-- Soal 3
-- Gunakan database “Sakila”
-- Tampilkan field durasi rental, banyaknya film dalam setiap durasi rental, dan rata-rata durasi film dari table “film”. Kelompokkan semuanya berdasarkan durasi rentalnya
-- Karena rata-rata durasi film menghasilkan angka desimal, bulatkan hingga hanya 2 angka di belakang koma saja.

    SELECT rental_duration as Durasi_Rental,
    COUNT(film_id) as Banyak_Film,
    ROUND(AVG(length), 2) as Rata_rata_Durasi_Film
    FROM film
    GROUP BY rental_duration
    ORDER BY rental_duration;
    
-- Soal 4
-- Gunakan database “Sakila”
-- Dari table film, tampilkan title, durasi film, dan juga rating yang durasi filmnya lebih dari rata-rata durasi film total.
-- Tampilkan 25 data yang diurutkan dari durasi terlama

SELECT title, length, rating
    FROM film
    WHERE length >
    (SELECT AVG(length) FROM film)
    ORDER BY length
    LIMIT 25;

-- Soal 5
-- Gunakan database “Sakila”
-- Tampilkan rating, Replacement Cost tertinggi dari setiap kelompok rating, Rental Rate Terendah dari setiap kelompok rating, 
-- dan Rata-Rata Durasi dari setiap kelompok rating dari table film.

SELECT rating as Rating,
    MAX(replacement_cost) as Replacement_Cost_Tertinggi,
    MAX(rental_rate) as Rental_Rate_Terendah,
    AVG(length) as Rata_rata_Durasi
    FROM film
    GROUP BY rating;
    
-- Soal 6
-- Gunakan database “Sakila”
-- Tampilkan 15 daftar film yang memiliki huruf “K” pada akhir pada title. Tampilkan title, durasi, serta Bahasa pada film.
-- Sebagai catatan, lakukan join terlebih dahulu dari table “film” dan juga table “language”.

SELECT film.title as Judul,
    film.length as Durasi,
    language.name as Bahasa_Film
    FROM film INNER JOIN language
    ON film.language_id = language.language_id
    WHERE film.title LIKE '%k'
    LIMIT 15;
    
-- Soal 7
-- Gunakan database “Sakila”
-- Tampilkan Judul Film (Dari table “film”), First Name (Dari table “actor”), dan Last Name (Dari table “actor”) dari actor yang memiliki “actor_id” = 14
-- Sebagai catatan, lakukan join table terlebih dahulu antara table “film”, “film_actor”, dan table “actor”.

 SELECT film.title,
    actor.first_name,
    actor.last_name
    FROM film_actor 
    JOIN film 
    ON film_actor.film_id = film.film_id
    JOIN actor 
    ON actor.actor_id = film_actor.actor_id
    WHERE film_actor.actor_id = 14;
    
-- Soal 8
-- Gunakan database “Sakila”
-- Tampilkan city dan country id pada tabel "city" yang memili huruf "d" pada nama kotanya, serta diakhiri dengan huruf a
-- Tampilkan 15 data yang diurutkan berdasarkan city-nya

SELECT city, country_id
    FROM city
    WHERE city like '%d%' and city like '%a'
    ORDER BY city
    LIMIT 15;
    
-- Soal 9
-- Gunakan database “sakila”
-- Tampilkan nama genre (name) dari table “category” dan jumlah banyaknya film di setiap genrenya.
-- Lakukan join terlebih dahulu antara table “film”, “film_category”, dan “category”
-- Urutkan berdasarkan jumlah film di setiap kategorinya.

SELECT category.name as Genre,
    COUNT(film.title) as Banyak_Film
    FROM film
    LEFT JOIN film_category 
    ON film.film_id = film_category.film_id
    LEFT JOIN category 
    ON film_category.category_id = category.category_id
    GROUP BY category.name
    ORDER BY Banyak_Film;
    
-- Soal 10
-- Gunakan database “Sakila”
-- Tampilkan title, description, length, serta rating dari table “film”.
-- Tampilkan 10 judul yang memiliki judul dengan akhiran ‘h’ dan memiliki durasi lebih dari durasi rata-rata.
-- Urutkan berdasarkan judul nya.

SELECT title, description, length, rating
    FROM film
    WHERE title like '%h' AND
    length > (SELECT AVG(length) FROM film)
    ORDER BY title
    LIMIT 10;