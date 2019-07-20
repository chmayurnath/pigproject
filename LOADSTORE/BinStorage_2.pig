/*
Remember in BinStorage_1.pig stored data using BinStorage.
So we are reading data here using BinStorage()
When you read data using BinStorage by default pig considers datatype as bytearray for all the columns.
and you cannot cast the datatypes loaded using BinStorage. It will throw below error

--ERROR 1118: Cannot cast bytes loaded from BinStorage. Please provide a custom converter.

Inorder to make this work use Utf8StorageConverter in BinStorage function
*/
--read_bin_data= Load '/user/chmayurnath3326/pigprac/out/binstr2/part*' using BinStorage() as (id,add,age);
--Above is commented and used below Load because it throws error saying ERROR 1118: Cannot cast bytes loaded from BinStorage. Please provide a custom converter.

read_bin_data= Load '/user/chmayurnath3326/pigprac/out/binstr2/part*' using BinStorage('Utf8StorageConverter') as (id,add,age);
read_fil_no_null= filter read_bin_data by age != 'NULL';
read_cast_for_each= foreach read_fil_no_null GENERATE (chararray)id,(chararray)add,(int)age;
store read_cast_for_each into '/user/chmayurnath3326/pigprac/out/binstr3' using PigStorage('|');

