--Tarea1
--Alejandra Arredondo Hernandez 189744
--NOTA: como se recomendo en clase, Alejandra, Elisa y Yuliana compartimos nuestros conocimientos 
--después de haber elaborado de manera individual nuestra tarea, cada una sabe como hacer cada pregunta, 
--sin embargo, intercambiamos opiniones y formas de hacerlo para enriquecer nuestro conocimiento en la materia.

--Pregunta 1, ¿qué contactos de proveedores tienen la posición sales representative?
select contact_name, contact_title from suppliers s where contact_title ='Sales Representative';

--Pregunta 2, ¿Qué contactos de proveedores no son marketing managers?
select contact_name, contact_title from suppliers s where not contact_title='Marketing Manager';

--Pregunta 3, ¿Cuáles órdenes no vienen de clientes en Estados Unidos?
select order_id, o.customer_id, ship_country from orders o where not ship_country='USA';

--Pregunta 4, ¿Qué productos de los que transportamos son quesos?
select product_id, product_name, units_in_stock from products p where category_id=4;

--Pregunta 5, ¿Qué ordenes van a Bélgica o Francia?
select order_id, customer_id, ship_country from orders o where ship_country='France' or ship_country='Belgium' 
order by ship_country;

--Pregunta 6, ¿Qué ordenes van a LATAM?
select order_id, ship_city, ship_country from orders o where ship_country='Mexico' or ship_country='Argentina' 
or ship_country='Brazil' or ship_country='Venezuela' order by ship_country;

--Pregunta 7, ¿Qué órdenes no van a LATAM?
select order_id, ship_city, ship_country from orders o where ship_country!='Mexico' and ship_country!='Argentina' 
and ship_country!='Brazil'and ship_country!='Venezuela'
order by ship_country; 

--Pregunta 8, Necesitamos los nombres completos de los empleados, nombres y apellidos unidos en un mismo registro
select concat (first_name,' ', last_name) as nombre from employees e;

--Pregunta 9, ¿Cuánta lana tenemos en inventario?
select sum(units_in_stock*unit_price) as "Lana en inventario" from products p;

--Pregunta 10, ¿Cuantos clientes tenemos de cada país?
select country, count(*) from customers c group by country order by 2 desc;

--Continuación tarea 1
--Pregunta 11, Obtener un reporte de edades de los empleados para checar su elegibilidad para 
--seguro de gastos médicos menores.
select first_name, last_name, age(now(), birth_date) as edad from employees e order by birth_date;

--Pregunta 12, ¿Cuál es la orden más reciente por cliente?
select customer_id, order_id, max(order_date) as mas_reciente from orders 
group by (customer_id, order_id) order by 2 desc;

--Pregunta 13, ¿De nuestros clientes, qué función desempeñan y cuántos son?
select contact_title, count(*) from customers c group by contact_title order by 2 desc;

--Preguntas 14, ¿Cuántos productos tenemos de cada categoría?
select p.category_id, c.category_name, count(p.product_id) as nom_categoria from products p join categories c 
on c.category_id = p.category_id group by (p.category_id, c.category_id) order by nom_categoria;

--Pregunta 15, ¿Como podemos hacer el reporte de reorder?
select product_id, product_name, units_in_stock from products p where units_in_stock < reorder_level 
order by product_name, units_in_stock;

--Pregunta 16, ¿A donde va nuestro envío más voluminoso?
select max(od.quantity), o.ship_country from order_details od join orders o 
on od.order_id=o.order_id group by o.ship_country order by max(od.quantity) desc limit 1;

--Pregunta 17, ¿Cómo creamos una columna en customers que nos diga si un cliente es bueno, regular, o malo?

--Pregunta 18, ¿Qué colaboradores chambearon durante las fiestas de navidad?
select distinct o.employee_id, e.first_name, e.last_name from orders o join employees e on o.employee_id = e.employee_id 
where (date_part('month', o.shipped_date) = 12 and date_part('day',o.shipped_date)= 25);

--Pregunta 19, ¿Qué productos mandamos en navidad?
select od.product_id, p.product_name from orders o join order_details od on o.order_id = od.order_id
join products p on p.product_id  = od.product_id where (date_part('month', o.shipped_date) = 12
and date_part('day',o.shipped_date)= 25);

--Pregunta 20, ¿Qué país recibe el mayor volumen de producto?
select ship_country, max(freight) as mayor_volumen from orders o group by ship_country, freight
order by freight desc limit 1;




















