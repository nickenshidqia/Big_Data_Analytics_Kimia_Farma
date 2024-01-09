--Create Table of 3 sheets csv files
--Importing csv files has been done directly by import menu in pgadmin
create table pelanggan(id_customer varchar primary key,
					  level varchar,
					  nama varchar,
					  id_cabang_sales varchar,
					  cabang_sales varchar,
					  id_group varchar,
					  "group" varchar);

create table barang(kode_barang varchar primary key,
				   sektor varchar,
				   nama_barang varchar,
				   tipe varchar,
				   nama_tipe varchar,
				   kode_lini varchar,
				   lini varchar,
				   kemasan varchar);

create table penjualan(id_distributor varchar,
					  id_cabang varchar,
					  id_invoice varchar primary key,
					  tanggal date,
					  id_customer varchar references pelanggan(id_customer) on delete cascade on update cascade,
					  id_barang varchar references barang(kode_barang) on delete cascade on update cascade,
					  jumlah_barang int,
					  unit varchar,
					  harga decimal,
					  mata_uang varchar,
					  brand_id varchar,
					  lini varchar);

--for checking
select * from pelanggan
limit 5;

select * from barang
limit 5;

select * from penjualan
limit 5;