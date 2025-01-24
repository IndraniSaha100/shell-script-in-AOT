// Online C compiler to run C program online
#include<stdio.h>
#include<unistd.h>
#include<sys/types.h>

int main(){
    pid_t pid=fork();
    fork();//no of fork=n, no of process=2^n+1
    if(pid==0){
        printf("Child process\n");
        printf("child process id=%d\n",getpid());
        printf("child process parent id=%d\n\n",getppid());
    }
    else{
        wait(NULL);
        printf("parent process\n");
        printf("parent process id=%d\n",getpid());
        printf("parent process parent id=%d\n\n",getppid());
    }
}