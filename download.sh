#!/bin/sh
fb_status=$(wget --spider -S https://filebox.ece.vt.edu/ 2>&1 | grep  "HTTP/1.1 200 OK")

mkdir checkpoints

echo "downloading models ..."
wget https://filebox.ece.vt.edu/~jbhuang/project/3DPhoto/model/color-model.pth --quiet
wget https://filebox.ece.vt.edu/~jbhuang/project/3DPhoto/model/depth-model.pth --quiet
wget https://filebox.ece.vt.edu/~jbhuang/project/3DPhoto/model/edge-model.pth --quiet

mv color-model.pth /content/3d-photo-inpainting/checkpoints/.
mv depth-model.pth /content/3d-photo-inpainting/checkpoints/.
mv edge-model.pth /content/3d-photo-inpainting/checkpoints/.

echo "downloading merge models weights ..."
# Downloading merge model weights
wget https://sfu.ca/~yagiz/CVPR21/latest_net_G.pth --quiet
mv latest_net_G.pth /content/3d-photo-inpainting/BoostingMonocularDepth/pix2pix/checkpoints/mergemodel/

echo "downloading Midas weights ..."
# Downloading Midas weights
wget https://github.com/AlexeyAB/MiDaS/releases/download/midas_dpt/midas_v21-f6b98070.pt --quiet
mv midas_v21-f6b98070.pt /content/3d-photo-inpainting/BoostingMonocularDepth/midas/model.pt

echo "downloading LeRes weigths ..."
# Downloading LeRes weights
wget https://cloudstor.aarnet.edu.au/plus/s/lTIJF4vrvHCAI31/download --quiet
mv download /content/3d-photo-inpainting/BoostingMonocularDepth/res101.pth

echo "done"