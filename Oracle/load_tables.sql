set linesize 200
set pagesize 66
set trimspool on
set heading on
set feedback off
set null N/A



select * from EDM ;

select * from SIMD
  FETCH FIRST 5 ROWS ONLY ;

select * from COMMUNITY_PROVISION
  WHERE COMMUNITY_ID < 6 ; 
  
select * from PARKS ; 
