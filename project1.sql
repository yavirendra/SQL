#Q1 Create new schema as ecommerce
CREATE SCHEMA ecommerce;

#Q2Import .csv file users_data into MySQL (right click on ecommerce schema -> Table Data import Wizard -> Give path of the file -> Next -> choose options : Create a new table , select delete if exist -> next -> next)
use ecommerce;
select count(*) from users_data;

#Q3
SELECT * FROM
  INFORMATION_SCHEMA.COLUMNS
WHERE
  TABLE_NAME = 'users_data';
  
#Q4
USE ecommerce;
SELECT * FROM users_data LIMIT 100;

#Q5
SELECT COUNT(DISTINCT country) country, COUNT(DISTINCT language) language
FROM users_data;

#Q6
USE ecommerce;
 SELECT SUM(socialNbFollowers),gender FROM users_data GROUP BY gender;
 
#Q7(a)
use ecommerce;
SELECT COUNT(*) hasProfilePicture FROM users_data WHERE hasProfilePicture='True';

#Q7(b)
use ecommerce;
SELECT COUNT(*) hasAnyApp FROM users_data WHERE hasAnyApp='True';

#Q7(c)
use ecommerce;
SELECT COUNT(*) hasAndroidApp FROM users_data WHERE hasAndroidApp='True';

#Q7(d)
use ecommerce;
SELECT COUNT(*) hasIosApp FROM users_data WHERE hasIosApp='True';

#Q8
use ecommerce;
SELECT country,SUM(productsBought) FROM users_data GROUP BY country ORDER BY SUM(productsBought) DESC;

#Q9
use ecommerce;
SELECT country,AVG(productsSold) FROM users_data GROUP BY country ORDER BY AVG(productsSold) ASC;

#Q10
use ecommerce;
SELECT country,SUM(productsPassRate) FROM users_data GROUP BY country ORDER BY SUM(productsPassRate) DESC LIMIT 10;

#Q11
use ecommerce;
SELECT language, COUNT(*) FROM users_data GROUP BY language;

#Q12
use ecommerce;
SELECT SUM(productsWished),SUM(socialProductsLiked) FROM users_data WHERE gender='F';

#Q13
use ecommerce;
SELECT SUM(productsSold),SUM(productsBought) FROM users_data WHERE gender='M';

#Q14
use ecommerce;
SELECT country,SUM(productsBought) FROM users_data GROUP BY country ORDER BY SUM(productsBought) DESC;

#Q15
use ecommerce;
SELECT productsSold,country FROM users_data WHERE productsSold=0 LIMIT 10;

#Q16
use ecommerce;
SELECT * FROM users_data ORDER BY daysSinceLastLogin LIMIT 110;

#Q17
use ecommerce;
SELECT gender,COUNT(daysSinceLastLogin) FROM users_data WHERE gender='F' AND daysSinceLastLogin >100;

#Q18
use ecommerce;
SELECT country, COUNT(*) FROM users_data WHERE gender='F' GROUP BY country;

#Q19
use ecommerce;
SELECT country, COUNT(*) FROM users_data WHERE gender='M' GROUP BY country;

#Q20
use ecommerce;
SELECT AVG(productsSold),AVG(productsBought),country FROM users_data WHERE gender='M' GROUP BY country;

