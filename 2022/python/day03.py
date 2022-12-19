#!/usr/bin/env python3

import sys
from utils import timing

filename = sys.argv[1]
with open(filename, 'r') as fin:
    lines = fin.readlines()


@timing
def main():
    part1_score = 0

    first = [None]*52
    second = [None]*52

    for line in lines:
        pass
