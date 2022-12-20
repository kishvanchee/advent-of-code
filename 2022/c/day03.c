#include "./utils.h"
#include <string.h>

int get_priority(char letter) {
  if (letter >= 'A' && letter <= 'Z') {
    return letter - 'A' + 27;
  } else {
    return letter - 'a' + 1;
  }
}

void populate_array(char *line, int line_array[]) {
  for (int i = 0; i < ARRAY_LENGTH(&line); i++) {
    line_array[get_priority(line[i])]++;
  }
}

int main(int argc, char *argv[]) {
  START_TIMER();

  char *line = NULL;

  int part1_score = 0;
  int part2_score = 0;
  int first[53];
  int second[53];
  char alphabet_first, alphabet_second;

  // part 2
  int cnt = 0;
  char *line1 = NULL;
  char *line2 = NULL;
  char *line3 = NULL;
  int first_line[53], second_line[53], third_line[53];

  while (get_line(&line, stdin) != -1) {
    for (int i = 0; i < (ARRAY_LENGTH(first)); i++) {
      first[i] = 0;
    }
    for (int i = 0; i < (ARRAY_LENGTH(second)); i++) {
      second[i] = 0;
    }
    int length = strlen(line);
    for (int j = 0; j < length / 2; j++) {
      alphabet_first = line[j];
      alphabet_second = line[j + (length / 2)];
      first[get_priority(alphabet_first)]++;
      second[get_priority(alphabet_second)]++;
    }
    for (int k = 1; k < (ARRAY_LENGTH(first)); k++) {
      if (first[k] > 0 && second[k] > 0) {
        part1_score += (k);
      }
    }

    if (cnt == 0) {
      strcpy(line1, line);
      cnt++;
    } else if (cnt == 1) {
      strcpy(line2, line);
      cnt++;
    } else {
      strcpy(line3, line);
      cnt = 0;
      populate_array(line1, first_line);
      populate_array(line2, second_line);
      populate_array(line3, third_line);
    }

    for (int k = 1; k < (ARRAY_LENGTH(first_line)); k++) {
      if (first_line[k] == 1 && second_line[k] == 1 && third_line[k] == 1) {
        part2_score += (k);
      }
    }
  }

  printf("Part 1 score: %d\n", part1_score);
  printf("Part 2 score: %d\n", part2_score);

  END_TIMER();
  return 0;
}
