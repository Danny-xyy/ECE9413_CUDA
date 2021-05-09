#include <cuda_runtime.h>
#include <stdio.h>
#include "cudastart.h"

//CPU对照组，用于对比加速比
void sumMatrix2DonCPU(float * MatA, float * MatB, float * MatC, int nx, int ny)
{
    float* a = MatA;
    float* b = MatB;
    float* c = MatC;
    for (int j = 0; j < ny; j++)
    {
        for(int i = 0; i < nx; i++)
        {
            c[i] = a[i] + b[i];
        }
        c += nx;
        b += nx;
        a += nx;
    }
}

__global__ void sumMatrix(float * MatA, float * MatB, float * MatC, int nx, int ny){
    int ix = threadIdx.x + blockDim.x*blockIdx.x;
    int iy = threadIdx.y + blockDim.y*blockIdx.y;
    int idx = ix + iy * ny;
    if (ix < nx && iy < ny){
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}

