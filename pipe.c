#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<sys/types.h>
#include<unistd.h>
#include<ctype.h>

int main(){
	int fd[2];
	char string1[20]="saha100";
	char readbuff[20];
	
	pipe(fd);
	pid_t pid=fork();
	
	if(pid==0){
		printf("From child process\n");
		close(fd[0]);
		write(fd[1],string1,strlen(string1)+1);
		exit(0);
	}
	else{
		printf("From parent process\n");
		close(fd[1]);
		read(fd[0],readbuff,sizeof(readbuff));
		printf("Receiving String\n");
		puts(readbuff);
		int i=0;
		int isDigit=0;
		int isChar=0;
		while(readbuff[i] != '\0'){
			if(isdigit(readbuff[i]))
				isDigit++;
			if(isalpha(readbuff[i]))
				isChar++;	
			i++;
		}
		printf("Inside the string digit no %d,char no %d",isDigit,isChar);
		exit(1);
	}
	return 0;
}

