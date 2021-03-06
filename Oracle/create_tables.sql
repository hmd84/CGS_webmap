CREATE TABLE EDM
  (SIMD_QUANTILE NUMBER CHECK
  (SIMD_QUANTILE BETWEEN 1 AND 5),
  COMM_QUINT NUMBER,
  LIBRARIES_QUINT NUMBER,
  GREENSPACE_QUINT_DIST NUMBER,
  GREENSPACE_QUINT_QUAL NUMBER,
  CHI_QUINT NUMBER,
  OVERALL_EDM NUMBER,
  PRIMARY KEY(SIMD_QUANTILE)) ;

CREATE TABLE SIMD
  (DATAZONE VARCHAR2(15),
  DZNAME VARCHAR(40),
  LANAME VARCHAR(50),
  XCOORD NUMBER,
  YCOORD NUMBER,
  SIMD_RANK NUMBER(4),
  SIMD_QUANTILE NUMBER(1),
  PRIMARY KEY (DATAZONE),
  FOREIGN KEY (SIMD_QUANTILE) REFERENCES EDM(SIMD_QUANTILE)) ;

CREATE TABLE COMMUNITY_PROVISION
  (COMMUNITY_ID NUMBER(3),
  COMMUNITY_CENTRE NUMBER,
  LIBRARIES NUMBER,
  GREENSPACE_DIST NUMBER,
  GREENSPACE_QUAL NUMBER,
  CHI NUMBER,
  DATAZONE VARCHAR2(15),
  PRIMARY KEY (COMMUNITY_ID),
  FOREIGN KEY(DATAZONE) REFERENCES SIMD(DATAZONE)) ;
  
 CREATE TABLE PARKS
	 (NAME VARCHAR(40),
	 CLASSIFICATION VARCHAR(15), 
	 POST NUMBER(2),
	 XCOORD NUMBER,
	 YCOORD NUMBER, 
	 DATAZONE VARCHAR(15), 
	 PRIMARY KEY (NAME),
	 FOREIGN KEY(DATAZONE) REFERENCES SIMD(DATAZONE)) ;
 	
