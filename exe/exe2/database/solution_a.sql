 1. select * from users order by user_name asc;
 2. select * from users order by user_name asc limit 7;
 3. select * from users WHERE user_name LIKE '%a%' order by user_name ASC ;
 4. select * from users WHERE user_name LIKE 'm%';
 5. select * from users WHERE user_name LIKE '%i';
 6. select * from users WHERE user_email LIKE '%@gmail.com';
 7. select * from users WHERE user_email LIKE '%@gmail.com' AND user_name LIKE 'm%';
 8 select * from users WHERE user_email LIKE '%@gmail.com' AND user_name LIKE '%i%' AND length(user_name) > 5;
 9. select * from users WHERE user_email LIKE '%@gmail.com' 
AND user_name LIKE '%a%' 
AND length(user_name) >= 5 AND length(user_name) <= 9
AND LENGTH(user_email) - LENGTH(REPLACE(user_email, 'i', '')) >=2;
10. select * from users WHERE (user_name LIKE '%a%' AND LENGTH(user_name) >= 5 AND LENGTH(user_name) <=9)
OR (user_name LIKE '%i%' AND LENGTH(user_name) <9)
OR (user_email LIKE '%@gmail.com' AND LENGTH(user_email) - LENGTH(REPLACE(user_email, 'i', '')) >=2)