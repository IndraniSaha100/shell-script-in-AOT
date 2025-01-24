#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<sys/types.h>
#include<unistd.h>
#include<ctype.h>

int main(){
	int fd[2];
	int roll=100;
	int readbuff[20];
	
	pipe(fd);
	pid_t childpid;
	
	if((childpid=fork())==-1)
	{
	    printf("Error in fork");
	}
	
	if(pid==0){
		printf("From child process\n");
		close(fd[0]);
		write(fd[1],&roll,strlen(int));
		exit(0);
	}
	else{
		printf("From parent process\n");
		close(fd[1]);
		read(fd[0],readbuff,sizeof(readbuff));
		printf("Receiving String\n");
		puts(readbuff);
		
		exit(1);
	}
	return 0;
}

