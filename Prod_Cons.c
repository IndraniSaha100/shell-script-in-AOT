#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <semaphore.h>

sem_t empty; // Counts empty slots
sem_t full;  // Counts filled slots
sem_t mutex; // Ensures mutual exclusion
int buffer[6], in = 0, out = 0, item1 = 0, item2;

void* producer(void* a) {
    int producer_id = *(int*)a;
    while (1) {
        sem_wait(&empty);//wait for an empty slot
        sem_wait(&mutex1);

        item1++;
        printf("Producer %d, produce item = %d\n",  producer_id, item1);
        buffer[in] = item1;
        in = (in + 1) % 6;

        sem_post(&mutex1);
        sem_post(&full);//signal for filled slot
        sleep(1);
    }
}

void* consumer(void* a) {
    int consumer_id = *(int*)a;
    while (1) {
        sem_wait(&full);//wait for signal slot
        sem_wait(&mutex1);//lock the mutex

        item2 = buffer[out];
        printf("Consumer %d, consume item = %d\n", consumer_id, item2);
        out = (out + 1) % 6;

        sem_post(&mutex1);//unlock the mutex
        sem_post(&empty);//signal for filled slot
        sleep(1);
    }
}

int main() {
    int p, c;
    printf("Enter number of producers: ");
    scanf("%d", &p);

    printf("Enter number of consumers: ");
    scanf("%d", &c);

    sem_init(&empty, 0, 6); // Buffer slots available initially
    sem_init(&full, 0, 0);// No items in the buffer initially
    sem_init(&mutex, 0, 1);// Mutual exclusion for the buffer

/**
 * sem_init: Initializes semaphores with specified values to represent resources (e.g., chopsticks in dining philosophers or buffer slots in producer-consumer) before threads begin execution.
 */



    pthread_t th1[10], th2[10];
    int ids[10];

    for (int i = 0; i < p; i++) {
        ids[i] = i + 1;
        pthread_create(&th1[i], NULL, producer, &ids[i]);
    }

    for (int i = 0; i < c; i++) {
        ids[i] = i + 1;
        pthread_create(&th2[i], NULL, consumer, &ids[i]);
    }

    for (int i = 0; i < p; i++) {
        pthread_join(th1[i], NULL);
    }

    for (int i = 0; i < c; i++) {
        pthread_join(th2[i], NULL);
    }

    sem_destroy(&empty); // Destroy semaphore for empty slots
    sem_destroy(&full);  // Destroy semaphore for full slots
    sem_destroy(&mutex); // Destroy mutual exclusion semaphore
    return 0;
}
