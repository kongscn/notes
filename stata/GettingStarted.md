Learn Stata: Getting Started
============================

#commands reference
	. sysuse auto.dta
	. browse
	. describe
	. notes
	. codebook
	. list make if missing(rep78)

	. tabulate foreign
	. tabulate foreign rep78
	. tabulate foreign summarize(mpg)
	. by foreign, sort: summarize mpg

#A simple hypthesis test
	. ttest mpg, by(foreign)
	. by foreign,  sort: correlate mpg weight

	.twoway scatter mpg weight, by(foreign, total)

##Model fitting: Linear regression



##Labeling data
	. label data "some notes of dataset"
	. label  variable varname "notes of variable"

###Label values
	. label define labelname value1 "label1" value2 "...
	. label values foreign labelname

##List data
	. list make mpg if (mpg>22) & !missing(mpg)
	. list if foreign=="domestic":origin
	. list in 1
	. list in 2/4
	. list, sepby(foreign)
	. list, divider
	. list, separator(3)

##Creating new variables

###generate and replace
	. generate var = exp
	. generate byte var = varx >= xxx if !missing(vary)

###replace
	. replace var = exp

###generate with string variables
	. gen where = "D" if ...
	. replace where = "F" if foreign =="foreign":origin

	.gen model = substr(make, strpos(make, " ")+1, .)


##Deleting variables and observations
###clear and drop_ll
	. clear
	. clear all
	. drop _all

###drop
	. drop varlist
	. drop in 1/3
	. drop if mpg > 21

###keep
	. keep in 4/7
	. keep if mpg <= 21
	. keep m*


##Using the Do-file Editor


##Graphing data
	. graph box displacement, over(rep78) over(foreign)
		title(Displacement across Repairs within Origin)


##Editing graphs


##Saving and printing results by using logs
	log using filename [, append replace [text|smcl] name(logname)]
	log close [logname | _all]
	log {off|on} [logname]
	
	cmdlog using filename [, append replace]
	cmdlog {close|off|on}

##Setting font and window preferences


##Updating and extending Stata -- Internet functionality


##A Troubleshooting Stata


##B Advanced Stata usage
###B.3 Executing commands every time Stata is started
	use profile.do, see [P] sysdir
	e.g.
	sysdir set SITE "\\dir\sdir"

	stata /e do somefile.do
