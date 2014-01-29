*************************
*                       *
* Empirical Exercises   *
*                       *
*************************


*************************
* Execrise Ch06 - 1     *
*************************

use ../datasets/teachingratings, clear
regress course_eval beauty, r
regress course_eval beauty intro onecredit female minority nnenglish, r

qui regress beauty intro onecredit female minority nnenglish, r
qui predict xrsid, residuals
qui regress course_eval intro onecredit female minority nnenglish, r
qui predict yrsid, residuals
regress yrsid xrsid, r

display _b[_cons] + _b[minority]*1 + _b[nnenglish ]*1


*************************
* Execrise Ch06 - 2     *
*************************

use ../datasets/collegedistance, clear
regress ed dist, r
regress ed dist bytest female black hispanic incomehi ownhome dadcoll cue80 stwmfg80

*************************
* Execrise Ch06 - 3     *
*************************

use ../datasets/growth, clear
summarize if country_name != "Malta"
regress growth tradeshare yearsschool oil rev_coups assasinations rgdp60, r
exit, clear
