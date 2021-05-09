#ifndef CUDASTART_H
#define CUDASTART_H
#define CHECK(call)\
{\
    const cudaError_t error = call;\
    if (error != cudaSuccess)\
    {\
        printf("ERROR: %s:%d,", __FILE__,__LINE__);\
        printf("code:%d, reason:%s \n", error, cudaGetErrorString(error));\
        exit(1);\

    }\


}

#include <time.h>
#ifdef _WIN32