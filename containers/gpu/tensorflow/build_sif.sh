VER=0.1
IMAGE_NAME=./singularity_container_${VER}.sif

# Build
sudo singularity build ${IMAGE_NAME} ./singularity_container_${VER}.def

# Test pytorch
singularity exec ${IMAGE_NAME} python -c "import tensorflow;print('tensorflow version: ' + tensorflow.__version__)"

echo image: ${IMAGE_NAME}