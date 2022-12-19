#include "./utils.h"

/***** Files *****/

size_t get_line(char** line, FILE* stream) {
    size_t size = 0;
    size_t line_len = getline(line, &size, stream);
    if ((*line)[line_len - 1] == '\n') {
        (*line)[line_len - 1] = '\0';
        line_len--;
    }
    return line_len;
}
