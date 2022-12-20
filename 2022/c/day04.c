#include "./utils.h"

struct Range {
  int min;
  int max;
};

typedef struct Range Range;

struct Range parse_range(char *range) {
  struct Range r;
  char *token;
  token = strtok(range, "-");
  r.min = strtol(token, NULL, 10);
  token = strtok(NULL, "-");
  r.max = strtol(token, NULL, 10);

  return r;
}

bool is_contained(Range first, Range second) {
  if ((first.min <= second.min && second.max <= first.max) ||
      (second.min <= first.min && first.max <= second.max)) {
    return true;
  }
  return false;
}
bool is_overlap(Range first, Range second) {
  if ((first.min <= second.max && second.min <= first.max)) {
    return true;
  }
  return false;
}

int main(int argc, char *argv[]) {
  START_TIMER();
  char *line = NULL;
  char *token;
  char *input[2];

  int part1_score = 0;
  int part2_score = 0;

  while (get_line(&line, stdin) != -1) {
    input[0] = strtok(line, ",");
    // Range first = parse_range(input[0]);
    input[1] = strtok(NULL, ",");

    Range first = parse_range(input[0]);
    Range second = parse_range(input[1]);
    if (is_contained(first, second)) {
      part1_score++;
    }
    if (is_overlap(first, second)) {
      part2_score++;
    }
  }

  printf("Part 1 score: %d\n", part1_score);
  printf("Part 2 score: %d\n", part2_score);

  END_TIMER();
  return 0;
}
