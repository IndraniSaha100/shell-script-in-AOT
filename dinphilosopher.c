
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

sem_t* chopstick;
int p;

void* dinphil ( void* a)
{
    int i=*(int*)a;
    while(1)
    {
      /*  int sem_wait(sem_t *sem);
Behavior:
If the semaphore value is greater than 0, it decrements the value and proceeds.
If the value is 0, the calling thread blocks (waits) until another thread increases the semaphore value using sem_post
     */


        if(i == p-1)
        {
            sem_wait(&chopstick[(i+1)%p]);
            sem_wait(&chopstick[i]);
            
        }else{
            sem_wait(&chopstick[i]);
            sem_wait(&chopstick[(i+1)%p]);
        }
        printf("Philosopher %d is holding chopstick %d and %d\n",i,i,(i+1)%p);
        printf("Philosopher %d is eating\n",i);        
        sleep(1);
        
        sem_post(&chopstick[i]);
        sem_post(&chopstick[(i+1)%p]);
    
        /*
        int sem_post(sem_t *sem);
Behavior:
Increments the semaphore value.
If any threads are waiting (blocked in sem_wait), one of them is unblocked.*/



        printf("Philosopher %d is leaving chopstoick",i);
    
        sleep(1);
    }
    free(a);
    return NULL;
}

int main(){
    
    printf("Enter philosopher no:");
    scanf("%d",&p);
    chopstick= malloc(p*sizeof(sem_t));
    
    /**
     * int sem_init(sem_t *sem, int pshared, unsigned int value);
Parameters:

sem_t *sem: A pointer to the semaphore to initialize.
int pshared:
0: The semaphore is shared between threads of the same process.
1 (or non-zero): The semaphore is shared between processes (requires shared memory).
unsigned int value: The initial value of the semaphore, representing the available resources.
     */




    for(int j=0;j<p;j++){
        sem_init(&chopstick[j],0,1);
    }
    
    pthread_t th1[p];
    for(int j=0;j<p;j++){
        int* arg=malloc(sizeof(int));* arg=j;
        pthread_create(&th1[j],NULL,dinphil,arg);
        /**
         * pthread_create function expects a pointer (pthread_t *) as the first argument.
         *  &th1[i] is a pointer to the pthread_t object where the thread ID will be stored.
         * 
         * in second argument=Pass NULL to use the default attributes.
         * 
         * in third argument
         * Passing &dinphil explicitly highlights that you are passing a function pointer, which is valid but redundant. Simply passing dinphil achieves the same result.
         * 
         * A pointer to the function that the thread will execute. This function must take a single void * argument and return a void *.
         * 
         * in 4th argument
         * A pointer to the argument passed to the start_routine function.
         * in int* arg;
         * pass arg only  
         *in int[] arg;
         * pass &arg[i]
         * 
         * void* is a generic pointer type.
         You can store an int* (or any other pointer) in a void*.
         You must cast back to the appropriate type before dereferencing.
         * 
         */
    }
    
    for(int j=0;j<p;j++){
        pthread_join(th1[j],NULL);

        /**
         * int pthread_join(pthread_t thread, void **retval);
Parameters

pthread_t thread: The identifier of the thread to wait for.
void **retval: 
A valid pointer to retrieve the value returned by the thread's function.
NULL if the return value is not needed
         */
    }
    
    for(int j=0;j<p;j++){
        sem_destroy(&chopstick[j]);//destroy chopstick semaphores
    }
    /**
     * int sem_destroy(sem_t *sem);
Parameters:
sem_t *sem: A pointer to the semaphore to destroy.
Behavior:
Frees resources allocated to the semaphore.
Must only be called when no threads are using the semaphore.
     */
    free(chopstick);
    return 0;
}

