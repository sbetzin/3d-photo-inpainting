#!/bin/sh
fb_status=$(wget --spider -S https://filebox.ece.vt.edu/ 2>&1 | grep  "HTTP/1.1 200 OK")

mkdir checkpoints

echo "downloading from filebox ..."
wget https://filebox.ece.vt.edu/~jbhuang/project/3DPhoto/model/color-model.pth
wget https://filebox.ece.vt.edu/~jbhuang/project/3DPhoto/model/depth-model.pth
wget https://filebox.ece.vt.edu/~jbhuang/project/3DPhoto/model/edge-model.pth

mv color-model.pth checkpoints/.
mv depth-model.pth checkpoints/.
mv edge-model.pth checkpoints/.

echo "cloning from BoostingMonocularDepth ..."
git clone https://github.com/compphoto/BoostingMonocularDepth.git
mkdir -p BoostingMonocularDepth/pix2pix/checkpoints/mergemodel/

echo "downloading mergenet weights ..."
#wget https://filebox.ece.vt.edu/~jbhuang/project/3DPhoto/model/latest_net_G.pth
wget https://sfu.ca/~yagiz/CVPR21/latest_net_G.pth
mv latest_net_G.pth BoostingMonocularDepth/pix2pix/checkpoints/mergemodel/

wget https://github.com/AlexeyAB/MiDaS/releases/download/midas_dpt/midas_v21-f6b98070.pt
mv midas_v21-f6b98070.pt BoostingMonocularDepth/midas/model.pt

# old midas
#wget https://github.com/intel-isl/MiDaS/releases/download/v2/model-f46da743.pt
#mv model-f46da743.pt BoostingMonocularDepth/midas/model.pt
