#!/usr/bin/env python3

from functools import wraps
from time import time

def timing(f):
    @wraps(f)
    def wrap(*args, **kw):
        ts = time()
        result = f(*args, **kw)
        te = time()
        #print (f'func:{f.__name__} args:[{args}, {kw}] took: {te-ts:2.4} sec')
        print (f'func:{f.__name__} took: {te-ts:2.4} sec')
        return result
    return wrap
