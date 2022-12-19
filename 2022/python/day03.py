#!/usr/bin/env python3

import sys
from utils import timing
import string

filename = sys.argv[1]
with open(filename, 'r') as fin:
    lines = [line.strip() for line in fin.readlines()]

def get_priority(letter):
    return string.ascii_letters.index(letter) + 1


@timing
def main():
    part1_score = 0
    part2_score = 0

    groups = list(zip(*(iter(lines),) * 3))

    for a,b,c in groups:
        part2_score += get_priority(
            list(
                set(a).intersection(set(b)).intersection(set(c))
            )[0]
        )

    print('part2 score', part2_score)


if __name__ == '__main__':
    main()
