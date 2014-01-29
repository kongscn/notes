#!/usr/bin/env ipython3
# -*- coding: utf-8 -*-
'''A file used for converting kind of weird text data format
companied with the book Introductory Econometrics 4th to a 
more general csv format. Field names are added by reading the
corresponding DES file. Non numbers are quoted, missing values
are replaced with NA.

By the way anyone could tell me what the format standard is 
and where is it widely use please?
'''

from __future__ import print_function

import os
import re
import sys
from os.path import splitext, join

try:
    import rpy2.robjects as robjects
    r = robjects.r
except:
    print('ERROR: rpy2 is required!')
    sys.exit(1)

try:
    __IPYTHON__
    import IPython.core.ipapi
    ipym = IPython.core.ipapi.get().magic
    ipym('%load_ext rmagic')
    USEMAGIC = True
except:
    USEMAGIC = False
    



def getcolnames(f):
    ft=open(f, 'r')
    colnames=[]
    _=ft.readline()
    for line in ft:
        if line.strip().lower().startswith('obs: '):
            return colnames
        elif len(line.strip())>0:
            colnames += line.split()

if USEMAGIC:
    print('Using Ipython R magic.')
    def raw2csv(rawfilex, colnames, csvfile):
        ipym('%Rpush rawfile colnames csvfile')
        ipym(("%R --noreturn data = read.table"
              "(rawfile, na.strings='.', col.names=colnames)"))
        ipym("%R write.csv(data, csvfile, row.names=FALSE, na='NA')")
else:
    print('Using rpy2.')
    raw2csv='''raw2csv <- function(rawfile, colnames, csvfile) {
    df = read.table(rawfile, na.strings='.', col.names=colnames)
    write.csv(df, csvfile, row.names=FALSE, na='NA')
    return(TRUE)
}
'''
    r(raw2csv)
    raw2csv = r['raw2csv'] 
    

datasetsdir = '../datasets/raw/'

rawfiles = {splitext(f)[0].lower(): join(datasetsdir, f) for f in os.listdir(datasetsdir)
                if re.search(r'\.raw', f, re.IGNORECASE)}

desfiles = {splitext(f)[0].lower(): join(datasetsdir, f) for f in os.listdir(datasetsdir)
                if re.search(r'\.des', f, re.IGNORECASE)}
                
print('Processing...')          
for fname in rawfiles:
    rawfile = rawfiles[fname]
    desfile = desfiles[fname]
    csvfile = splitext(rawfile)[0]+'.csv'
    colnames = getcolnames(desfile)
    
    raw2csv(rawfile, colnames, csvfile)
    
print('Finished!')



