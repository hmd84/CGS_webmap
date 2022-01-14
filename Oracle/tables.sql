SQL> start load_tables.sql ;

SIMD_QUANTILE COMM_QUINT LIBRARIES_QUINT GREENSPACE_QUINT_DIST GREENSPACE_QUINT_QUAL CHI_QUINT OVERALL_EDM
------------- ---------- --------------- --------------------- --------------------- --------- -----------
            1        .71             .62                   .54                   .27       .46        2.61
            2        .64             .55                    .6                    .4       .55        2.73
            3        .63             .53                   .53                   .45       .63        2.76
            4        .47             .46                   .48                   .43       .58        2.42
            5        .37             .46                   .46                   .55        .7        2.53

DATAZONE                                      DZNAME
--------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------
LANAME                                                                                                                                                 XCOORD YCOORD SIMD_RANK SIMD_QUANTILE
------------------------------------------------------------------------------------------------------------------------------------------------------ ------ ------ --------- -------------
S01008839                                     Broughton North and Powderhall - 04
City of Edinburgh                                                                                                                                       -3.19  55.96      5778             5

S01008840                                     Broughton South - 01
City of Edinburgh                                                                                                                                       -3.19  55.96      6599             5

S01008841                                     Broughton South - 02
City of Edinburgh                                                                                                                                       -3.19  55.96      6384             5

S01008842                                     Broughton South - 03
City of Edinburgh                                                                                                                                       -3.18  55.97      6638             5

S01008843                                     Broughton South - 04
City of Edinburgh                                                                                                                                       -3.18  55.96      5516             4


COMMUNITY_ID COMMUNITY_CENTRE LIBRARIES GREENSPACE_DIST GREENSPACE_QUAL   CHI DATAZONE
------------ ---------------- --------- --------------- --------------- ----- ---------------------------------------------
           1             4.49      4.38            5.05               0    66 S01008417
           2             4.35       4.9            5.01               0    66 S01008418
           3              .99      1.34            1.43               0    66 S01008419
           4              .58      1.12             .57               0    66 S01008420
           5              .31       .57             .36               0    66 S01008421

NAME                                                                                                                     CLASSIFICATION                                 POST XCOORD YCOORD
------------------------------------------------------------------------------------------------------------------------ --------------------------------------------- ----- ------ ------
DATAZONE
---------------------------------------------
Colinton Mains Park                                                                                                      City Park                                         7  -3.23  55.91
S01008525

Harrison Park                                                                                                            Community Park                                    6  -3.23  55.93
S01008506

Saughton Park                                                                                                            Premier Park                                      1  -3.25  55.93
S01008478

Jewel Park                                                                                                               Community Park                                    8  -3.12  55.94
S01008712

Gyle Park                                                                                                                                                                  5   -3.3  55.94
S01008988

The Meadows and Bruntsfield Links                                                                                        Premier Park                                      4  -3.19  55.94
S01008667

Inverleith Park                                                                                                          Premier Park                                      2  -3.22  55.96
S01008832

Leith Links                                                                                                              Premier Park                                      3  -3.16  55.97
S01008792

SQL> spool off ;
