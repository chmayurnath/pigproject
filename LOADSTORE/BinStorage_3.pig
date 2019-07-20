read_bin_data= Load '/user/chmayurnath3326/pigprac/out/binstr2/part*' using BinStorage('Utf8StorageConverter') as (id:int,add:chararray,age:int);
read_foreach= foreach read_bin_data generate id,add,age;
store read_foreach into '/user/chmayurnath3326/pigprac/out/binstr4' using PigStorage();
