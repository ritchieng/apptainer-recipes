VER=0.1
IMAGE_NAME=./singularity_container_${VER}.simg

# Build
sudo singularity build ${IMAGE_NAME} ./singularity_container_${VER}.def

echo image: ${IMAGE_NAME}