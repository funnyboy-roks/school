#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

static int test_str[] = { 8, 3, 8, 7, 4, 7, 8, 2, 9, 0, 3, 2, 6, 3, 8, 1, 3, 7, 3, 5, 1, 1, 8, 9, 7, 0, 9, 6, 6, 8, 8, 4, 4, 9, 1, 0, 7, 3, 8, 0, 5, 8, 8, 4, 4, 4, 4, 8, 4, 5, 9, 9, 5, 1, 4, 3, 0, 8, 0, 0, 7, 1, 2, 3, 8, 3, 4, 9, 4, 1, 6, 8, 2, 8, 1, 6, 6, 9, 2, 2, 0, 3, 6, 6, 5, 1, 3, 0, 8, 7, 6, 1, 9, 1, 6, 6, 1, 3, 7, 0 };
// static int test_str[] = {7, 0, 1, 2, 0, 3, 0, 4, 2, 3, 0, 3, 2, 1, 2, 0, 1, 7, 0, 1};
// static int test_str[10] = {0};

#define REF_STR_LEN (sizeof(test_str) / sizeof(test_str[0]))

// check if an array has val
bool contains(val, array, len)
    int val, *array;
    size_t len;
{
    for (int i = len; i-- > 0;) if (array[i] == val) return true;
    return false;
}

// get the index of the min value in the array
int min(arr, len) 
    int *arr;
    size_t len;
{
    int m = 0;
    for (int i = len; i-- > 0; arr[m] >= arr[i] ? m = i : 0);
    return m;
}

// Look ahead in the `future` array for the numbers in frames, then puts next
// index of that frame into the out array at that index
void look_ahead(start, frames, frames_len, future, future_len, out)
    size_t start, frames_len, future_len;
    int *frames, *future, *out;
{
    for (int i = frames_len; i-- > 0; out[i] = future_len + 1);
    
    for (int i = start + 1; i < future_len; ++i) {
        for (int j = frames_len; j-- > 0;) {
            if (frames[j] == future[i] && out[j] == future_len + 1) {
                out[j] = i;
            }
        }
    }
}

int fifo(frame_count, ref_str)
    int frame_count, *ref_str;
{
    int frames[frame_count], faults; 

    for (int i = frame_count; i-- > 0; frames[i] = -1);
    faults = 0;

    for (int i = 0; i < REF_STR_LEN; ++i) {
        // if the value is not in the frames, add it to faults % frame_count
        if (!contains(ref_str[i], frames, frame_count))
            frames[faults++ % frame_count] = ref_str[i];
    }
    return faults;
}

int lru(frame_count, ref_str)
    int frame_count, *ref_str;
{
    int frames[frame_count], last_updated[frame_count], faults, update; 

    for (int i = frame_count; i-- > 0; frames[i] = last_updated[i] = -1);
    faults = 0;

    for (int i = 0; i < REF_STR_LEN; ++i) {
        if (contains(ref_str[i], frames, frame_count)) { // if the frame reappears,
            // update the last_updated array accoringly
            for (int j = frame_count; j-- > 0;) if (frames[j] == ref_str[i]) last_updated[j] = i; 
        } else { // otherwise
            // find the oldest value in the frames
            update = min(last_updated, frame_count);
            faults++; // hey look, a fault
            frames[update] = ref_str[last_updated[update] = i]; // update the frames and last_updated
        }
    }
    return faults;
}

int opt(frame_count, ref_str)
    int frame_count, *ref_str;
{
    int frames[frame_count], ahead[frame_count], faults; 

    for (int i = frame_count; i-- > 0; frames[i] = ahead[i] = -1);

    faults = 0;
    for (int i = 0; i < REF_STR_LEN; ++i) {
        if (!contains(ref_str[i], frames, frame_count)) {
            look_ahead(i, frames, frame_count, ref_str, REF_STR_LEN, ahead); // look for occurances of a frame in the future
            for (int i = frame_count; i-- > 0; ahead[i] *= -1); // just to reuse the min fn
            int update = min(ahead, frame_count); // look for the furthest occurrance of a frame in the future
            faults++; // hey look, another fault
            frames[update] = ref_str[i];
        }
    }
    return faults;
}

int main(argc, argv)
    int argc;
    char **argv;
{
    int frame_count, *ref_str;

    if (argc < 2) {
        fprintf(stderr, "Usage: %s <frames> [seed]", argv[0]);
        return 1;
    }

    frame_count = atoi(argv[1]);
    ref_str = test_str;
    if (argc == 3) {
        srand(atol(argv[2]));
        ref_str = malloc(REF_STR_LEN * sizeof(int));
        printf("Array generated for seed %s: \n\t", argv[2]);
        for (int i = 0; i < REF_STR_LEN; printf("%d ", ref_str[i++] = rand() % 10));
        printf("\n");
    }

    printf("fifo:  %d\n", fifo(frame_count, ref_str));
    printf("lru:   %d\n",  lru(frame_count, ref_str));
    printf("opt:   %d\n",  opt(frame_count, ref_str));
}
