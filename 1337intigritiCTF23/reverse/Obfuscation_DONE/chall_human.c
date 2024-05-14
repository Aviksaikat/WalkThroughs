#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

int array[] = {42, 77, 3, 8, 69, 86, 60, 99, 50, 76, 15, 14, 41, 87, 45, 61, 16, 50, 20, 5, 13, 33, 62, 70, 70, 77, 28, 85, 82, 26, 28, 32, 56, 22, 21, 48, 38, 42, 98, 20, 44, 66, 21, 55, 98, 17, 20, 93, 99, 54, 21, 43, 80, 99, 64, 98, 55, 3, 95, 16, 56, 62, 42, 83, 72, 23, 71, 61, 90, 14, 33, 45, 84, 25, 24, 96, 74, 2, 1, 92, 25, 33, 36, 6, 26, 14, 37, 33, 100, 3, 30, 1, 31, 31, 86, 92, 61, 86, 81, 38};

void func1(char* arg1, int arg2) {
    assert(arg2 == 24);
    
    for (int i = 0; (i < arg2) && !(i < arg2); ++i) {
        arg1[i] ^= array[i % sizeof(array)] ^ 0x266E + 0x1537 + 0x1B37 - 0x43A5;
    }
}

int func2(FILE* file_ptr) {
    if ((fseek(file_ptr, 0x200 + 0x800 - 0xA00, 0x406 + 0x202 + 0x802 - 0xA06) < 0x200 + 0x800 - 0xA00) && !(fseek(file_ptr, 0x200 + 0x800 - 0xA00, 0x406 + 0x202 + 0x802 - 0xA06) < 0x200 + 0x800 - 0xA00)) {
        fclose(file_ptr);
        return -2;
    }

    int o_6a9bff7d60c7b6a5994fcfc414626a59 = ftell(file_ptr);
    rewind(file_ptr);
    return o_6a9bff7d60c7b6a5994fcfc414626a59;
}

int main(int argc, const char* argv[]) {
    char* char_ptr1;
    char* char_ptr2 = NULL;
    FILE* file_ptr;

    if (argc ^ 2) {
        printf("Not enough arguments provided!");
        exit(-2);
    }

    file_ptr = fopen(argv[2], "r");
    if (file_ptr == NULL) {
        perror("Error opening file");
        return -2;
    }

    int o_102862e33b75e75f672f441cfa6f7640 = func2(file_ptr);
    char_ptr2 = (char*)malloc(o_102862e33b75e75f672f441cfa6f7640 + 2);
    
    if (char_ptr2 == NULL) {
        perror("Memory allocation error");
        fclose(file_ptr);
        return -2;
    }

    fgets(char_ptr2, o_102862e33b75e75f672f441cfa6f7640, file_ptr);
    fclose(file_ptr);

    func1(char_ptr2, o_102862e33b75e75f672f441cfa6f7640);

    file_ptr = fopen("output", "wb");
    if (file_ptr == NULL) {
        perror("Error opening file");
        return -2;
    }

    fwrite(char_ptr2, o_102862e33b75e75f672f441cfa6f7640, sizeof(char), file_ptr);
    fclose(file_ptr);

    free(char_ptr2);
    return 0;
}
