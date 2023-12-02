#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int calibration_get_value(char*, size_t);
int calibration_get_value_part_2(char*, size_t);

int main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("Usage: %s input_file\n", argv[0]);
        exit(1);
    }

    FILE *file_ptr = fopen(argv[1], "r");
    if(file_ptr == NULL) {
        printf("Unable to open file %s\n", argv[1]);
        exit(1);
    }

    int     calibration_values_sum = 0;
    char   *line = NULL;
    size_t  line_len = 0;
    // Read lines using POSIX function getline, throws error on windows
    while(getline(&line, &line_len, file_ptr) != -1)
        calibration_values_sum += calibration_get_value_part_2(line, strlen(line));
    
    fclose(file_ptr);
    free(line);

    printf("%d\n", calibration_values_sum);

    return 0;
}

int calibration_get_value(char* line, size_t line_len) {
    char digit_first = '\0', digit_last;
    char calibration_value[2];
    for(size_t i = 0; i < line_len; i++) {
        if(isdigit(line[i])) {
            if(digit_first == '\0') {
                digit_first = line[i];
                digit_last  = line[i];
            } else
                digit_last  = line[i];
        }
        calibration_value[0] = digit_first;
        calibration_value[1] = digit_last;
    }
    return atoi(calibration_value);
}

int calibration_get_value_part_2(char* line, size_t line_len) {
    char digit_first = '\0', digit_last;
    char calibration_value[2];
    int state = 0;
    for(size_t i = 0; i < (line_len - 1); i++) { // there is a \n at the end
        switch(state) {
            case 0:
                if(isdigit(line[i])) {
                    if(digit_first == '\0') {
                        digit_first = line[i];
                        digit_last  = line[i];
                    } else
                        digit_last  = line[i];
                    state = 0; // reset the state
                }
                else if(line[i] == 'o') // one
                    state = 1;
                else if(line[i] == 't') // two three
                    state = 3;
                else if(line[i] == 'f') // four five
                    state = 8;
                else if(line[i] == 's') // six seven
                    state = 13;
                else if(line[i] == 'e') // eight
                    state = 18;
                else if(line[i] == 'n') // nine
                    state = 22;
                break;
            case 1:
                if(line[i] == 'n')
                    state = 2;
                else
                    state = 0;
                break;
            case 2:
                if(line[i] == 'e') {
                    if(digit_first == '\0') {
                        digit_first = '1';
                        digit_last  = '1';
                    } else
                        digit_last  = '1';
                    state = 0;
                }
                else
                    state = 0;
                break;
            case 3:
                if(line[i] == 'w')
                    state = 4;
                else if(line[i] == 'h')
                    state = 5;
                else
                    state = 0;
                break;
            case 4:
                if(line[i] == 'o') {
                    if(digit_first == '\0') {
                        digit_first = '2';
                        digit_last  = '2';
                    } else
                        digit_last  = '2';
                    state = 0;
                }
                else
                    state = 0;
                break;
            case 5:
                if(line[i] == 'r')
                    state = 6;
                else
                    state = 0;
                break;
            case 6:
                if(line[i] == 'e')
                    state = 7;
                else
                    state = 0;
                break;
            case 7:
                if(line[i] == 'e') {
                    if(digit_first == '\0') {
                        digit_first = '3';
                        digit_last  = '3';
                    } else
                        digit_last  = '3';
                    state = 0;
                }
                else
                    state = 0;
                break;
            case 8:
                if(line[i] == 'o')
                    state = 9;
                if(line[i] == 'i')
                    state = 11;
                else
                    state = 0;
                break;
            case 9:
                if(line[i] == 'u')
                    state = 10;
                else
                    state = 0;
                break;
            case 10:
                if(line[i] == 'r') {
                    if(digit_first == '\0') {
                        digit_first = '4';
                        digit_last  = '4';
                    } else
                        digit_last  = '4';
                    state = 0;
                }
                else
                    state = 0;
                break;
            case 11:
                if(line[i] == 'v')
                    state = 12;
                else
                    state = 0;
                break;
            case 12:
                if(line[i] == 'e') {
                    if(digit_first == '\0') {
                        digit_first = '5';
                        digit_last  = '5';
                    } else
                        digit_last  = '5';
                    state = 0;
                }
                else
                    state = 0;
                break;
            case 13:
                if(line[i] == 'i')
                    state = 14;
                if(line[i] == 'e')
                    state = 15;
                else
                    state = 0;
                break;
            case 14:
                if(line[i] == 'x') {
                    if(digit_first == '\0') {
                        digit_first = '6';
                        digit_last  = '6';
                    } else
                        digit_last  = '6';
                    state = 0;
                }
                else
                    state = 0;
                break;
            case 15:
                if(line[i] == 'v')
                    state = 16;
                else
                    state = 0;
                break;
            case 16:
                if(line[i] == 'e')
                    state = 17;
                else
                    state = 0;
                break;
            case 17:
                if(line[i] == 'n') {
                    if(digit_first == '\0') {
                        digit_first = '7';
                        digit_last  = '7';
                    } else
                        digit_last  = '7';
                    state = 0;
                }
                else
                    state = 0;
                break;
            case 18:
                if(line[i] == 'i')
                    state = 19;
                else
                    state = 0;
                break;
            case 19:
                if(line[i] == 'g')
                    state = 20;
                else
                    state = 0;
                break;
            case 20:
                if(line[i] == 'h')
                    state = 21;
                else
                    state = 0;
                break;
            case 21:
                if(line[i] == 't') {
                    if(digit_first == '\0') {
                        digit_first = '8';
                        digit_last  = '8';
                    } else
                        digit_last  = '8';
                    state = 0;
                }
                else
                    state = 0;
                break;
            case 22:
                if(line[i] == 'i')
                    state = 23;
                else
                    state = 0;
                break;
            case 23:
                if(line[i] == 'n')
                    state = 24;
                else
                    state = 0;
                break;
            case 24:
                if(line[i] == 'e') {
                    if(digit_first == '\0') {
                        digit_first = '9';
                        digit_last  = '9';
                    } else
                        digit_last  = '9';
                    state = 0;
                }
                else
                    state = 0;
                break;
            default:
                state = 0;
                break;
        }
    }
    calibration_value[0] = digit_first;
    calibration_value[1] = digit_last;
    printf("%s: %s", calibration_value, line);
    return atoi(calibration_value);
}
