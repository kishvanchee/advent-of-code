#ifndef UTILS_H_
    #define UTILS_H_

    #include <stdbool.h>
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <time.h>

    /***** Errors *****/
    #define ABORT(msg, ...) \
        fprintf(stderr, "%s:%d: " msg "\n", __FILE__, __LINE__, ##__VA_ARGS__); \
        exit(1);

    /***** Timer *****/

    #define START_TIMER() \
        clock_t start_time = clock();
    #define END_TIMER() \
        double elapsed_time = (double) (clock() - start_time) / CLOCKS_PER_SEC; \
        printf("Done in %f seconds\n", elapsed_time);

    /***** Numbers *****/

    #define signum(x) (x > 0 ? 1 : x < 0 ? -1 : 0)
    #define min(x, y) (x < y ? x : y)
    #define max(x, y) (x > y ? x : y)


    /***** File *****/
    /**
     * Same as getline(), except throwing away the buf_size argument
     * and removing trailing newline.
     */
    extern size_t get_line(char** buf, FILE* stream);

    /** Extras*/
    #define ARRAY_LENGTH(x)  (sizeof(x) / sizeof((x)[0]))


#endif // UTILS_H_
