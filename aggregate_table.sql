--Create aggregate table
--Calculate total sales per date				   
create table sales_per_date as(select 
						   tanggal, 
						   sum(round((jumlah_barang*harga),3)) as total_pendapatan, 
						   sum(jumlah_barang) as total_barang
						   from base_table
						   group by tanggal);

--Calculate total sales per customer
create table sales_per_customer as(select 
								   id_customer, 
								   nama as nama_pelanggan, 
								   sum(round((jumlah_barang*harga),3)) as total_pendapatan 
								   from base_table
								   group by id_customer, nama);

--Calculate total sales per product
create table sales_per_product as(select 
								   id_barang, 
								   nama_barang, 
								   sum(jumlah_barang) as total_barang,
								   sum(round((jumlah_barang*harga),3)) as total_pendapatan 
								   from base_table
								   group by id_barang, nama_barang);

--Calculate total sales per branch
create table sales_per_branch as(select 
								   id_cabang, 
								   cabang_sales, 
								   sum(round((jumlah_barang*harga),3)) as total_pendapatan 
								   from base_table
								   group by id_cabang, cabang_sales);

--display table
select *
from base_table
limit 2;

select *
from sales_per_date
order by tanggal;

select *
from sales_per_date
order by total_pendapatan desc;

select *
from sales_per_customer
order by total_pendapatan desc;

select *
from sales_per_product
order by total_pendapatan desc;

select *
from sales_per_branch
order by cabang_sales;

select *
from sales_per_branch
order by total_pendapatan desc;


