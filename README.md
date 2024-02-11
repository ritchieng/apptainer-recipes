# Singularity Containers for Data and AI
Readily available definition and image files for quick experimentation and deployment of data, deep learning, machine learning, and LLM workloads through [Singularity](https://docs.sylabs.io/guides/4.0/user-guide/index.html).

## Available Container Definitions
- GPU containers: `./containers/gpu`
  - Ollama workloads: `cd ./containers/gpu/ollama`
    - To run ollama with mistral
      - Run 1nd session `singularity shell singularity_container_0.1.sif`
        - `ollama serve`
      - Run 2nd session (another window) `singularity shell singularity_container_0.1.sif`
        - `ollama run mistral`
        - You can now communicate with mistral model in your bash
- CPU containers: `./containers/cpu`
  - Math workloads: `cd ./containers/cpu/math`
    - Run `singularity shell singularity_container_0.2.sif`

## Instructions for Installing Singularity

### Install Singularity
All you need is to install [Singularity](https://docs.sylabs.io/guides/4.0/user-guide/index.html) to be able to leverage on this repository to work in containers with multiple environments (CPU/GPU with any packages and OS) independent of your host (local) machine.

### Install NVIDIA libraries
I advise you to use the [Lambda Stack](https://lambdalabs.com/lambda-stack-deep-learning-software) to manage your drivers effectively without errors. It's a single bash script that allows you to install and upgrade your NVIDIA drivers.


## Instructions to Use Singularity in CPU/GPU Mode

### Option A: Transparent Image Container Workflow

This is recommended to build singularity containers as it's transparent with the greatest reproducibility.

#### 1. Build container (`.sif`)
To build and test singularity image container, simply run the following command in any of the folders:
```
bash build_sif.sh
```

#### 2. Run container
For CPU
```
singularity shell singularity_container_$VER_sandbox.sif
```

For GPU
```
singularity shell --nv --nvccli singularity_container_$VER_sandbox.sif
```

### Notes
If you do not have a GPU on your host or local machine, the image will still be built and can be shared and used by machines with GPUs! The test for CUDA will fail on your local machine without GPU which will just spit out an error that you do not have a driver. There's nothing to worry about that.

### Option B: Blackbox
This is not recommended to build production singularity containers but it is good for experimentation to determine the right configuration to put into your definition file for `Option A`.

Note, replace `$VER` with whatever version is in the specific folder.

#### 1. Build container (`.sif`)
To build and test singularity image container, simply run the following command in any of the folders:
```
bash build_simf.sh
```

#### 2. Convert container to mutable sandbox
```
singularity build --sandbox singularity_container_$VER_sandbox singularity_container_$VER.sif
``` 

#### 3. Shell into writable sandbox
You can install new packages and make persisting changes to the container in this step for experimentation.
```
singularity shell --writable singularity_container_$VER_sandbox
```

#### 4. Convert container to immutable image (`.sif`)
```
singularity build --sandbox singularity_container_$VER_sandbox.sif singularity_container_$VER_img
``` 

## Basic Singularity Commands

This provides a list of useful commands.

```
# test singularity
singularity version

# pull cowsay container from docker
singularity pull docker://sylabsio/lolcow

# build (generic that can also build from local definition files, it is like a swiss army knife, more flexible than pull)
singularity build lolcow.sif docker://sylabsio/lolcow

# run option 1 requiring to shell into the container
singularity shell lolcow.sif
cowsay moo

# run option 2 without requiring to shell into the containe
singularity exec lolcow.sif cowsay moo
```

## Questions
For questions, please raise an issue. This is maintained by [Ritchie Ng](https://github.com/ritchieng).