#!/bin/sh
fb_status=$(wget --spider -S https://filebox.ece.vt.edu/ 2>&1 | grep  "HTTP/1.1 200 OK")

mkdir checkpoints

echo "downloading from filebox ..."
wget https://filebox.ece.vt.edu/~jbhuang/project/3DPhoto/model/color-model.pth
wget https://filebox.ece.vt.edu/~jbhuang/project/3DPhoto/model/depth-model.pth
wget https://filebox.ece.vt.edu/~jbhuang/project/3DPhoto/model/edge-model.pth

mv color-model.pth /content/3d-photo-inpainting/checkpoints/.
mv depth-model.pth /content/3d-photo-inpainting/checkpoints/.
mv edge-model.pth /content/3d-photo-inpainting/checkpoints/.

echo "cloning from BoostingMonocularDepth ..."
git clone https://github.com/compphoto/BoostingMonocularDepth.git
mkdir -p /content/3d-photo-inpainting/BoostingMonocularDepth/pix2pix/checkpoints/mergemodel/

# Downloading merge model weights
wget https://sfu.ca/~yagiz/CVPR21/latest_net_G.pth
mv latest_net_G.pth /content/3d-photo-inpainting/BoostingMonocularDepth/pix2pix/checkpoints/mergemodel/

# Downloading Midas weights
wget https://github.com/AlexeyAB/MiDaS/releases/download/midas_dpt/midas_v21-f6b98070.pt
mv midas_v21-f6b98070.pt /content/3d-photo-inpainting/BoostingMonocularDepth/midas/model.pt

# Downloading LeRes weights
wget https://cloudstor.aarnet.edu.au/plus/s/lTIJF4vrvHCAI31/download
mv download /content/3d-photo-inpainting/BoostingMonocularDepth/res101.pth