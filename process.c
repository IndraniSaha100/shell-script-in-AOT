// Online C compiler to run C program online#include<stdio.h>
#include<unistd.h>
#include<sys/type.h>

int main(){
    pid_t pid=fork();
    if(pid==0){
        prinf("Child process\n");
        printf("child process id=%d\n",getpid());
        printf("child process parent id=%d\n",getppid());
    }
    else{
        prinf("parent process\n");
        printf("parent process id=%d\n",getpid());
        printf("parent process parent id=%d\n",getppid());
    }
}