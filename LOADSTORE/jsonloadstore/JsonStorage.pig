/*
Use JsonStorage Statement to load data in Json Format in specified Location.

We dont have to specify the structure of Json file in JsonStorage.

JsonStorage will create .pig_schema file which will have structure of the file.

so that if anyother job is reading from output json file then we dont have to mention the schema in JsonLoader Statement

*/

json_data= LOAD '/user/chmayurnath3326/pigprac/out/json/part*' using PigStorage('|') as (author:chararray,book:chararray,yr:int,userrate:bag{t:(name:chararray,stars:int)});
json_cleanse= FILTER json_data by author is not null;
STORE json_cleanse INTO '/user/chmayurnath3326/pigprac/out/jsonstore' using JsonStorage();
