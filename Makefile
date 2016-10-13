.PHONY: all data tests eda regression report clean

all: eda regression report session-info.txt

data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv -o data/Advertising.csv

tests: code/tests/test-regression.R
	cd code/tests; Rscript -e “library(testthat);test_file(‘test-regression.R’)”

eda: code/eda-script.R data/Advertising.csv
	cd code/scripts; Rscript eda-script.R

regression: code/regression-script.R data/Advertising.csv
	cd code/scripts; Rscript regression-script.R

report: report/report.Rmd data/regression.RData data/correlation-matrix.RData
	cd report; Rscript -e "library(rmarkdown); render('report.Rmd','pdf_document')"

session-info.txt: code/scripts/session-info-script.R
	cd code/scripts; Rscript session-info-script.R

clean:
	rm -f report/report.pdf