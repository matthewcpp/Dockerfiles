#include <sndfile.h>

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define WORKING_BUFFER_LEN 1024
double working_buffer[WORKING_BUFFER_LEN];

int main(int argc, char** argv) {
    if (argc < 2) {
        puts("Usage: ./snd2aiff /path/to/src_path.snd");
        return 1;
    }

    const char* src_path = argv[1];

    SF_INFO source_info;
    memset(&source_info, 0, sizeof (SF_INFO));
    SNDFILE* source_file = sf_open(src_path, SFM_READ, &source_info);

    if (!source_file) {
        printf("Unable to open input: %s", src_path);
        puts(sf_strerror(NULL));
        return 1;
    }

    const char* base_path = strrchr(src_path, '.');
    intptr_t base_path_len = (intptr_t)base_path - (intptr_t)src_path;

    char* dest_path = malloc(base_path_len + 6 /* .aiff\0 */);
    strncpy(dest_path, src_path, base_path_len);
    strcpy(dest_path + base_path_len, ".aiff");

    printf("%s --> %s\n", src_path, dest_path);

    SF_INFO dest_info = source_info;
    dest_info.channels = 1;
    dest_info.format = SF_FORMAT_AIFF | SF_FORMAT_PCM_16;
    SNDFILE* dest_file = sf_open(dest_path, SFM_WRITE, &dest_info);

    if (!dest_file) {
        printf("Unable to write output: %s", dest_path);
        puts(sf_strerror(NULL));
        return 1;
    }

    int read_count;

    while ((read_count = sf_read_double (source_file, working_buffer, WORKING_BUFFER_LEN))) {
        int actual_buffer_count = 0;

        // take only the first channel
        if (source_info.channels > 1) {
            for (int i = 0; i < read_count; i += source_info.channels) {
                working_buffer[actual_buffer_count++] = working_buffer[i];
            }
        }
        else {
            actual_buffer_count = read_count;
        }

        sf_write_double (dest_file, working_buffer, actual_buffer_count) ;
    }

    sf_close(source_file);
    sf_close(dest_file);

    free(dest_path);

    return 0;
}
