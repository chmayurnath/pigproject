bookReviewJson = LOAD 'hdfs://ip-172-31-35-141.ec2.internal:8020/user/chmayurnath3326/pigprac/pig_bookreviews.json' 
                   USING JsonLoader('author:chararray,title:chararray,year:int,reviews:{review:(name:chararray,stars:int)}');
illustrate
