*************************
*                       *
* Empirical Exercises   *
*                       *
*************************


*************************
* Execrise Ch07 - 1     *
*************************
use ../datasets/cps08, clear
regress ahe age, r
regress ahe age female bachelor, r
test female bachelor


*************************
* Execrise Ch07 - 2     *
*************************

use ../datasets/teachingratings, clear
regress course_eval beauty, r


*************************
* Execrise Ch07 - 3     *
*************************

use ../datasets/CollegeDistance, clear
regress ed dist, r
regress ed dist black hispanic

*************************
* Execrise Ch07 - 4     *
*************************

use ../datasets/Growth, clear
reg growth tradeshare yearsschool rev_coups assasinations rgdp60 if country_name != "Malta"
test yearsschool rev_coups assasinations rgdp60
