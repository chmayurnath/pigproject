/*
Use JsonLoader to flatten the json to rows and columns
*/

jsonfile= LOAD '/user/chmayurnath3326/pigprac/pig_bookreviews.json' using JsonLoader('author:chararray,title:chararray,published:int,reviews:{review:(name:chararray,starts:int)}');
STORE jsonfile INTO '/user/chmayurnath3326/pigprac/out/json' using PigStorage('|');

/*

When we run the script we see below error.
That is because it is expecting to have jsonschema matching the input json file in .pig_schema file.
.pig_schema should be placed where input json file is located
OR
Schema for the input file can be placed as the parameter for the JsonLoader Function : JsonLoader(<Schema in Sigle Quotos>)
2019-07-20 06:06:46,446 [main] ERROR org.apache.pig.tools.grunt.Grunt - ERROR 1131: Could not find schema file for /user/chmayurnath3326/pigprac/pig_bookreviews.json

*/
