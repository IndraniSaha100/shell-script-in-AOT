// Online C compiler to run C program online
#include<stdio.h>
#include<unistd.h>
#include<sys/types.h>

int main(){
    pid_t pid=fork();
    fork();
    if(pid==0){
        printf("Child process\n");
        
    }
    else{
        wait(NULL);
        printf("parent process\n");
     
    }
}