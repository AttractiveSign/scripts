//Creates a file with a specified name and 0700 access rights
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

int main(void) {
    char filename[31]; //char array for saving filename; 30 characters + string terminator 

    printf("Name of the new file: ");
    fgets(filename, sizeof(filename), stdin);
    filename[strcspn(filename, "\n")] = '\0'; // strcspn returns first occurrence of \n, is then replaced with \0

    int fd = creat(filename, 0700); // create file with rights 0700
    
    if (fd == -1) { //check for errors while creating file
        printf("Error while creating file!\n");
        return 1;
    }
    close(fd); //close file
    printf("File %s has been successfully created!\n", filename);

    return 0;
}