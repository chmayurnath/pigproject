books= LOAD 'hdfs://ip-172-31-35-141.ec2.internal:8020/user/chmayurnath3326/pigprac/BX-Users.csv' using PigStorage(';') as (id:chararray,address:chararray,age:chararray);
booksWithoutHdr= STREAM books THROUGH `tail -n +2`;
STORE booksWithoutHdr into 'hdfs://ip-172-31-35-141.ec2.internal:8020/user/chmayurnath3326/pigprac/out/binstore1' using BinStorage();

----------------------------

binBook= LOAD 'hdfs://ip-172-31-35-141.ec2.internal:8020/user/chmayurnath3326/pigprac/out/binstore1/part-m-00000' 
           using BinStorage() as (id:chararray,add:chararray,age:chararray);
           
illustrate binBook;