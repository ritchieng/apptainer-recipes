VER=0.2
IMAGE_NAME=./apptainer_container_${VER}.sif

# Build
sudo apptainer build ${IMAGE_NAME} ./apptainer_container_${VER}.def

# Test pytorch
apptainer exec ${IMAGE_NAME} python -c "import torch;print('pytorch version: ' + torch.__version__)"

echo image: ${IMAGE_NAME}