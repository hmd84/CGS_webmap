OPTIONS (skip=1)
LOAD DATA
INFILE edm_data.csv
REPLACE
INTO TABLE EDM
FIELDS TERMINATED BY ","
TRAILING NULLCOLS
(SIMD_QUANTILE, COMM_QUINT, LIBRARIES_QUINT, GREENSPACE_QUINT_DIST, GREENSPACE_QUINT_QUAL, CHI_QUINT, OVERALL_EDM TERMINATED BY WHITESPACE)