#include<stdio.h>
#include<unistd.h>
#include<pthread.h>
pthread_mutex_t mutex1=PTHREAD_MUTEX_INITIALIZER;
int a[2][2],b[2][2];
void* func1(){
	pthread_mutex_lock(&mutex1);
	printf("Enter the first matrix values\n");
	int i,j;
	for(i=0;i<2;i++){
		for(j=0;j<2;j++){
			scanf("%d",&a[i][j]);
			b[i][j]=a[i][j];
		}
	}
	printf("Copy the first matrix result to second matrinx\n");

	pthread_mutex_unlock(&mutex1);
}
void display(int arr[][2]){
	int i,j;
	for(i=0;i<2;i++){
		for(j=0;j<2;j++){
			printf("%d ",arr[i][j]);
		}
		printf("\n");
	}
}
void* add_matrix(){
	pthread_mutex_lock(&mutex1);
	int res[2][2];
	int i,j;
	for(i=0;i<2;i++){
		for(j=0;j<2;j++){			
			res[i][j]=b[i][j]+a[i][j];
		}
	}
	printf("The Values in addition matrix\n");
	display(res);
	pthread_mutex_unlock(&mutex1);
}
void* multi_matrix(){
	pthread_mutex_lock(&mutex1);
	int res[2][2];
	int i,j,k;
	for(i=0;i<2;i++){
		for(j=0;j<2;j++){
			for(k=0;k<2;k++)			
				res[i][j]+=a[i][k]*b[k][j];
		}
	}
	printf("The Values in multiplication matrix\n");
	display(res);
	pthread_mutex_unlock(&mutex1);
}
int main(){
	printf("Hello world\n");
	pthread_t th1,th2,th3;
	pthread_create(&th1,NULL,&func1,NULL);
	
	pthread_create(&th2,NULL,&add_matrix,NULL);
	
	pthread_create(&th3,NULL,&multi_matrix,NULL);
	
	
	pthread_join(th1,NULL);
	pthread_join(th2,NULL);
	pthread_join(th3,NULL);
	return 0;
}
