# Singularity Containers for Data and AI
Readily available definition and image files for quick experimentation and deployment of data and machine learning workloads.

## Instructions


### Option A: Transparent Image Container Workflow

This is recommended to build singularity containers as it's transparent with the greatest reproducibility.

#### 1. Build container (`.simg` or `.sif`)
To build and test singularity image container, simply run the following command in any of the folders:
```
bash build_simg.sh
```

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
