#!/usr/bin/env python3

import sys
from utils import timing
import heapq

filename = sys.argv[1]
with open(filename, 'r') as fin:
    lines = fin.read()
nums = [line.rstrip('\n').split('\n') for line in lines.split('\n\n')]
nums = [list(map(int, num)) for num in nums]

@timing
def main():
    sums = [sum(num) for num in nums]
    print('part 1', max(sums))

    print('part 2', sum(heapq.nlargest(3, sums)))


if __name__ == '__main__':
    main()
