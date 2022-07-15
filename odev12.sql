--film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?

SELECT film_id, title, length, (SELECT AVG(length) FROM film) AS average 
FROM film
WHERE (SELECT AVG(length) FROM film) < length 
ORDER BY length ;

--film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?

SELECT film_id, title, rental_rate, (SELECT MAX(rental_rate) FROM film) AS max 
FROM film
WHERE (SELECT MAX(rental_rate) FROM film) = rental_rate
ORDER BY length ;

--film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.

SELECT film_id,title,rental_rate,replacement_cost FROM film
WHERE rental_rate = (SELECT MIN(rental_rate) FROM film) 
AND replacement_cost = (SELECT MIN(replacement_cost) FROM film);

--payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.

SELECT payment.customer_id,payment.amount,customer.customer_id,customer.first_name,customer.last_name
FROM payment
LEFT JOIN customer ON customer.customer_id = payment.customer_id
WHERE payment.amount = (SELECT MAX(amount) FROM payment);
