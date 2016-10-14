# PHONY targets
.PHONY: all data tests eda regression report clean

# all
all: eda regression report session-info.txt

# Abstract data
data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv -o data/Advertising.csv

# Running tests
tests: code/tests/test-regression.R
	cd code/tests; Rscript -e “library(testthat);test_file(‘test-regression.R’)”

# Running scripts
eda: code/scripts/eda-script.R data/Advertising.csv
	cd code/scripts; Rscript eda-script.R

regression: code/scripts/regression-script.R data/Advertising.csv
	cd code/scripts; Rscript regression-script.R

session-info.txt: code/scripts/session-info-script.R
	cd code/scripts; Rscript session-info-script.R

# Report to pdf
report: report/report.Rmd data/regression.RData data/correlation-matrix.RData
	cd report; Rscript -e "library(rmarkdown); render('report.Rmd','pdf_document')"

# Clean report
clean:
	rm -f report/report.pdf