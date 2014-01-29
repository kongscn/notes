*************************
*                       *
* Empirical Exercises   *
*                       *
*************************


*************************
* Execrise Ch04 - 1     *
*************************

use ../datasets/cps08
describe

regress ahe age

display 26*_b[age] +  _b[_cons]
display 30*_b[age] +  _b[_cons]

*************************
* Execrise Ch04 - 2     *
*************************

use ../datasets/teachingratings, clear
describe

scatter course_eval beauty
regress course_eval beauty, robust
summarize beauty

display _b[_cons] + r(mean)*_b[beauty]
display _b[_cons] + r(sd)*_b[beauty]

*************************
* Execrise Ch04 - 3     *
*************************

use ../datasets/collegedistance, clear
describe

regress ed dist, robust
display _b[_cons] + 20 * _b[dist]
display _b[_cons] + 10 * _b[dist]


*************************
* Execrise Ch04 - 4     *
*************************

use ../datasets/growth, clear
describe

regress growth tradeshare, robust
regress growth tradeshare if country_name != "Malta", robust

graph twoway (lfitci growth tradeshare ) (scatter growth tradeshare )
graph twoway (lfitci growth tradeshare ) (scatter growth tradeshare ) if country_name != "Malta"
