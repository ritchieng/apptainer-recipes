# Singularity Containers for Data and AI
Readily available definition and image files for quick experimentation and deployment of data and machine learning workload through [Singularity](https://sylabs.io/guides/3.0/user-guide/index.html).

## Instructions
All you need is to install [Singularity](https://sylabs.io/guides/3.0/user-guide/index.html) to be able to leverage on this repository to work in containers with multiple environments (CPU/GPU with any packages and OS) independent of your host (local) machine.

### Option A: Transparent Image Container Workflow

This is recommended to build singularity containers as it's transparent with the greatest reproducibility.

#### 1. Build container (`.simg` or `.sif`)
To build and test singularity image container, simply run the following command in any of the folders:
```
bash build_simg.sh
```

#### 2. Run container
For CPU
```
singularity shell singularity_container_$VER_sandbox.simg
```

For GPU
```
singularity shell --nv singularity_container_$VER_sandbox.simg
```

### Notes
If you do not have a GPU on your host or local machine, the image will still be built and can be shared and used by machines with GPUs! The test for CUDA will fail on your local machine without GPU which will just spit out an error that you do not have a driver. There's nothing to worry about that.

### Option B: Blackbox
This is not recommended to build production singularity containers but it is good for experimentation to determine the right configuration to put into your definition file for `Option A`.

Note, replace `$VER` with whatever version is in the specific folder.

#### 1. Build container (`.simg` or `.sif`)
To build and test singularity image container, simply run the following command in any of the folders:
```
bash build_simg.sh
```

#### 2. Convert container to mutable sandbox
```
singularity build --sandbox singularity_container_$VER_sandbox singularity_container_$VER.simg
``` 

#### 3. Shell into writable sandbox
You can install new packages and make persisting changes to the container in this step for experimentation.
```
singularity shell --writable singularity_container_$VER_sandbox
```

#### 4. Convert container to immutable image (`.simg` or `.sif`)
```
singularity build --sandbox singularity_container_$VER_sandbox.sif singularity_container_$VER_img
``` 

### Questions
For questions, please raise an issue. This is actively maintained by [Ritchie Ng](https://github.com/ritchieng).
