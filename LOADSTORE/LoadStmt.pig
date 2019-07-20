books= LOAD 'hdfs://ip-172-31-35-141.ec2.internal:8020/user/chmayurnath3326/pigprac/BX-Users.csv'
        USING PigStorage(';') as (id:chararray,add:chararray,age:chararray);
illustrate books;