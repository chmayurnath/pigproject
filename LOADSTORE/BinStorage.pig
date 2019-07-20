/*
BinStorage : Can be used along with both Store and Load Statements.
             Used to Load and Store data in machine readable format.
             When result has to be achieved through two map reduce jobs. Where job2 is dependent on Job1
             
             Job1 Stages data in Machine Readable Format.
             Job2 Reads the data in Machine Readable format for Further pocessing.
             
*/

stock= LOAD '/user/chmayurnath3326/pigprac/nyse.txt' using PigStorage('\t') as  (exchange:chararray,sym:chararray,dt:chararray,price:float);
stock_fil= FILTER stock by sym=='CPO';
STORE stock_fil into '/user/chmayurnath3326/pigprac/out/binstr1' using BinStorage();

stock_cpo= LOAD '/user/chmayurnath3326/pigprac/out/binstr/part-m-00000' using BinStorage() as (exchange,sym,dt,price);
stock_cpo_inc= FOREACH stock_cpo generate exchange,sym,dt,price*100;
STORE stock_cpo_inc into '/user/chmayurnath3326/pigprac/out/priceinc' using PigStorage('|');