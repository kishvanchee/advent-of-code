#include "./utils.h"

int main(int argc, char *argv[]) {
    START_TIMER();

    char* line = NULL;

    int part1_score = 0;
    int part2_score = 0;

    while (get_line(&line, stdin) != -1) {
        printf("%s\n", line);
    }


    END_TIMER();
    return 0;
}
