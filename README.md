# Apptainer Recipes for Data and AI
Readily available definition and image files for quick experimentation and deployment of data, deep learning, machine learning, and LLM workloads through [Apptainer (formerly Singularity)](https://apptainer.org/docs/admin/main/admin_quickstart.html).

## Available Containers & Definition Files
- GPU containers: `./containers/gpu`
  - Ollama workloads: `cd ./containers/gpu/ollama`
    - To run ollama with mistral
      - Run 1nd session `apptainer shell --nv --nvccli apptainer_container_0.1.sif`
        - `ollama serve`
      - Run 2nd session (another window) `apptainer shell --nv --nvccli apptainer.1.sif``
        - `ollama run mistral`
        - You can now communicate with mistral model in your bash, or any other model you can pull on [ollama website](https://ollama.com/)
  - Llamaindex workloads: `cd ./containers/gpu/llamaindex`
      - Run 1nd session (first window)`apptainer shell --nv --nvccli apptainer_container_0.1.sif`
        - `ollama serve`
      - Run 2nd session (second window) `apptainer shell --nv --nvccli apptainer_container_0.1.sif`
        - `ollama run mistral`
      - Run 3rd session (third window) `apptainer shell --nv --nvccli apptainer_container_0.1.sif`
        - `python`
        - `from llama_index.llms import Ollama`
        - `llm = Ollama(model="mistral")`
        - `response = llm.complete("What is Singapore")`
        - `print(response)`
- CPU containers: `./containers/cpu`
  - Math workloads: `cd ./containers/cpu/math`
    - Run `apptainer shell apptainer_container_0.2.sif`

## Instructions for Installing Apptainer

### Install Apptainer
All you need is to install [Apptainer](https://apptainer.org/docs/admin/latest/installation.html) to be able to leverage on this repository to work in containers with multiple environments (CPU/GPU) with any packages and OS independent of your host (local) machine.

### Install NVIDIA libraries
I advise you to use the [Lambda Stack](https://lambdalabs.com/lambda-stack-deep-learning-software) to manage your drivers effectively without errors. It's a single bash script that allows you to install and upgrade your NVIDIA drivers.

Check CUDA toolkit installation via `nvcc -V`

### Set NVIDIA Container CLI Apptainer Paths (Deprecated)

Not necessary in Apptainer, only in Singularity.

To get nvidia-container-cli path
```
which nvidia-container-cli
```

To set
```
sudo singularity config global --set "nvidia-container-cli path" "/usr/bin/nvidia-container-cli"
```

To check
```
sudo singularity config global --get "nvidia-container-cli path"
```

## Instructions to Use Apptainer in CPU/GPU Mode

### Option A: Transparent Image Container Workflow

This is recommended to build apptainer containers as it's transparent with the greatest reproducibility.

#### 1. Build container (`.sif`)
To build and test apptainer image container, simply run the following command in any of the folders:
```
bash build_sif.sh
```

#### 2. Run container
For CPU
```
apptainer shell apptainer_container_$VER_sandbox.sif
```

For GPU using NVIDIA Container CLI
```
apptainer shell --nv --nvccli apptainer_container_$VER_sandbox.sif
```

A quick way to test if you're able have everything good to run is to run `nvidia-smi` when you shell into the container. 

### Notes
If you do not have a GPU on your host or local machine, the image will still be built and can be shared and used by machines with GPUs! The test for CUDA will fail on your local machine without GPU which will just spit out an error that you do not have a driver. There's nothing to worry about that.

### Option B: Blackbox
This is not recommended to build production apptainer containers but it is good for experimentation to determine the right configuration to put into your definition file for `Option A`.

Note, replace `$VER` with whatever version is in the specific folder.

#### 1. Build container (`.sif`)
To build and test apptainer image container, simply run the following command in any of the folders:
```
bash build_simf.sh
```

#### 2. Convert container to mutable sandbox
```
apptainer build --sandbox apptainer_container_$VER_sandbox apptainer_container_$VER.sif
``` 

#### 3. Shell into writable sandbox
You can install new packages and make persisting changes to the container in this step for experimentation.
```
apptainer shell --writable apptainer_container_$VER_sandbox
```

#### 4. Convert container to immutable image (`.sif`)
```
apptainer build --sandbox apptainer_container_$VER_sandbox.sif apptainer_container_$VER_img
``` 

## Basic Apptainer Commands

This provides a list of useful commands.

```
# test apptainer
apptainer version

# pull cowsay container from docker
apptainer pull docker://sylabsio/lolcow

# build (generic that can also build from local definition files, it is like a swiss army knife, more flexible than pull)
apptainer build lolcow.sif docker://sylabsio/lolcow

# run option 1 requiring to shell into the container
apptainer shell lolcow.sif
cowsay moo

# run option 2 without requiring to shell into the container
apptainer exec lolcow.sif cowsay moo

# clean cache during builds
apptainer cache clean
```

## Questions
For questions, please raise an issue. This is maintained by [Ritchie Ng](https://github.com/ritchieng).