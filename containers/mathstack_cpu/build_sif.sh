VER=0.2
IMAGE_NAME=./singularity_container_${VER}.sif

# Build
sudo singularity build ${IMAGE_NAME} ./singularity_container_${VER}.def

# Test pytorch
singularity exec ${IMAGE_NAME} python -c "import torch;print('pytorch version: ' + torch.__version__)"

echo image: ${IMAGE_NAME}