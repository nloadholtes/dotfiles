# Put all the redundant helper code in to this file so I can have
# access to it when ipython boots.

import datetime

def myconverter(o):
    if isinstance(o, datetime.datetime):                                                         
        return o.__str__()   
