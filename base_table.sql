--Create base table
create table base_table as(select 
						pjl.id_invoice,  
						pjl.tanggal, 
						pjl.id_customer,
						plg.nama,
						pjl.id_distributor,
						pjl.id_cabang,
						plg.cabang_sales,
						plg.id_group,
						plg.group,
						pjl.id_barang, 
						brg.nama_barang,
						pjl.brand_id,
						brg.kode_lini,
						pjl.lini,
						brg.kemasan,
						pjl.jumlah_barang,
						pjl.harga,
						pjl.mata_uang
						from penjualan as pjl 
						left join pelanggan as plg on plg.id_customer = pjl.id_customer 
						left join barang as brg on brg.kode_barang = pjl.id_barang) 
						order by pjl.tanggal;

--Adding Primary Key constraint
alter table base_table
add primary key (id_invoice);

--For checking
select *
from base_table;

select *
from penjualan
limit 2;

select *
from barang
limit 2;

select *
from pelanggan
limit 2;