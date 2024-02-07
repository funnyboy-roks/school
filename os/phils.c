#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

int num_phils; // number of phils, passed in as argument[1]
int num_of_times_to_eat; // number of times to eat each, passed in as argument[2]
sem_t *chopsticks;
int *state;
int *phils;

#define THINKING_DURATION 2
#define EATING_DURATION 1

// waits to grab chopsticks for philospher (denotes when philospher is hungry)
void eat(n)
    int n;
{
    // wait on the chopsticks we need
    sem_wait(&chopsticks[n]);
    sem_wait(&chopsticks[(n + 1) % num_phils]);
    sleep(EATING_DURATION);
    phils[n] -= 1;
    // let go of the chopsticks
    sem_post(&chopsticks[n]);
    sem_post(&chopsticks[(n + 1) % num_phils]);
}

// determines first action of a philospher when thread is created
void *philosopher (np)
    void *np;
{
    int n = *(int *)np;
    phils[n] = num_of_times_to_eat;
    while (phils[n]) {
        printf("phil %d eating\n", n);
        eat(n);
        printf("phil %d thinking\n", n);
        sleep(THINKING_DURATION);
    }
}

int main(argc, argv)
    int argc;
    char **argv;
{
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <num_phils> <times_to_eat>\n", argv[0]);
        exit(1);
    }

    num_phils = atoi(argv[1]);
    num_of_times_to_eat = atoi(argv[2]);

    pthread_t threads[num_phils];
    chopsticks = malloc(num_phils * sizeof(sem_t));
    state = malloc(num_phils * sizeof(int));
    phils = malloc(num_phils * sizeof(int));

    for (int i = num_phils; i-- > 0; sem_init(&chopsticks[i], 0, 1));

    // create philosphers and their threads
    for (int i = num_phils; i-- > 0;) {
        int *n = malloc(sizeof(int));
        *n = i;
        pthread_create(&threads[i], NULL, philosopher, n);
    }

    for (int i = num_phils; i-- > 0; pthread_join(threads[i], NULL));

    free(chopsticks);
    free(state);
    free(phils);
    return 0;
}
