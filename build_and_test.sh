VER=0.1
IMAGE_NAME=./singularity_container_${VER}.simg

# Build
sudo singularity build ${IMAGE_NAME} ./singularity_container_${VER}.def

# Test pytorch
singularity exec --nv ${IMAGE_NAME} python -c "import torch;print('pytorch version: ' + torch.__version__)"

# Test simpleitk
singularity exec --nv ${IMAGE_NAME} python -c "import SimpleITK as sitk; print('SimpleITK version: ' +  sitk.Version_VersionString())"

# Test skimage
singularity exec --nv ${IMAGE_NAME} python -c "import skimage; print('skimage version: ' + skimage.__version__)"

# Test pillow
singularity exec --nv ${IMAGE_NAME} python -c "import PIL; print('PIL version: ' + PIL.__version__)"

echo image: ${IMAGE_NAME}
