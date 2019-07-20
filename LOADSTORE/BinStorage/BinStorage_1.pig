/*

What happens when you have two scripts 
 Script 1 gets data from hdfs delimited file and stores in machine readable format.
 Script 2 gets data from output of script 1 and derives the actual result

*/

books= LOAD '/user/chmayurnath3326/pigprac/BX-Users.csv' using PigStorage(';');
books_without_header= filter books by $0 != '"User-ID"';
STORE books_without_header INTO '/user/chmayurnath3326/pigprac/out/binstr2' USING BinStorage();
