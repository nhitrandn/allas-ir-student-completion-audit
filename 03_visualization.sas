/***********************************************************
 * Dallas College Student Completion Audit
 * Script 03: Peer Benchmarking Visualization
 * Author: Nhi Tran | USF Biostatistics
 ***********************************************************/

libname IR "C:\IR_Project";

proc sort data=IR.tx_analysis;
    by completion_pct;
run;

ods graphics / height=800px width=700px;

proc sgplot data=IR.tx_analysis(where=(UNITID ne 382911));
    hbar INSTNM / response=completion_pct
                  colorresponse=dallas_flag
                  colormodel=(steelblue red);
    refline 70.3244 / axis=x
                      lineattrs=(pattern=dash color=darkred thickness=2)
                      label="TX Peer Avg (70.3%)";
    xaxis label="Completion Rate (%)" min=0 max=100;
    yaxis label="" discreteorder=data fitpolicy=none
                  valueattrs=(size=7);
    title "Completion Rate: Texas Community Colleges 2024";
    title2 "Dallas College (red) vs. 34 Peers";
run;
