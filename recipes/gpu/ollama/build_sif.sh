VER=0.1
IMAGE_NAME=./apptainer_container_${VER}.sif

# Build
sudo apptainer build ${IMAGE_NAME} ./apptainer_container_${VER}.def

echo image: ${IMAGE_NAME}