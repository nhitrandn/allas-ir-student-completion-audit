/***********************************************************
 * Dallas College Student Completion Audit
 * Script 02: Merge & Analysis
 * Author: Nhi Tran | USF Biostatistics
 ***********************************************************/

libname IR "C:\IR_Project";

/* Merge retention + outcome data */
proc sql;
    create table IR.tx_retention as
    select a.UNITID, a.INSTNM, a.CITY, a.SECTOR,
           b.PCTENRAP, b.ENRTOT
    from IR.tx_colleges as a
    left join IR.drvef2024 as b
    on a.UNITID = b.UNITID;
quit;

proc sql;
    create table IR.tx_analysis as
    select a.*,
           b.OMACHRT, b.OMENRUN, b.OMENRTP
    from IR.tx_retention as a
    left join IR.om2024 as b
    on a.UNITID = b.UNITID
    and b.OMCHRT = 10;
quit;

/* Compute completion rate */
data IR.tx_analysis;
    set IR.tx_analysis;
    dallas_flag = (UNITID = 224615);
    if OMACHRT > 0 and OMENRUN > 0 then
        completion_pct = OMACHRT / (OMACHRT + OMENRUN + OMENRTP) * 100;
run;

/* Descriptive statistics */
proc means data=IR.tx_analysis n mean median min max std;
    var completion_pct PCTENRAP ENRTOT OMENRTP;
    title "Descriptive Stats - Texas Community Colleges 2024";
run;

/* Correlation analysis */
proc corr data=IR.tx_analysis;
    var completion_pct PCTENRAP ENRTOT OMENRTP;
    title "Correlations with Completion Rate";
run;

/* Dallas College vs peers */
proc means data=IR.tx_analysis mean;
    var completion_pct;
    class dallas_flag;
    title "Dallas College vs TX Peers - Completion Rate";
run;
