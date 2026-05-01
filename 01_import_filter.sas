/***********************************************************
 * Dallas College Student Completion Audit
 * Script 01: Data Import & Texas College Filter
 * Author: Nhi Tran | USF Biostatistics
 ***********************************************************/

libname IR "C:\IR_Project";

proc import datafile="C:\IR_Project\hd2024.csv"
    out=IR.hd2024 dbms=csv replace; getnames=yes; run;

proc import datafile="C:\IR_Project\ef2024a.csv"
    out=IR.ef2024a dbms=csv replace; getnames=yes; run;

proc import datafile="C:\IR_Project\drvef2024.csv"
    out=IR.drvef2024 dbms=csv replace; getnames=yes; run;

proc import datafile="C:\IR_Project\om2024.csv"
    out=IR.om2024 dbms=csv replace; getnames=yes; run;

proc sql;
    create table IR.tx_colleges as
    select UNITID, INSTNM, CITY, STABBR, SECTOR
    from IR.hd2024
    where STABBR = 'TX' and (SECTOR = 4 or UNITID = 224615);
quit;
