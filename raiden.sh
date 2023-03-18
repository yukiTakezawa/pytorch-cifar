#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -jc gpu-container_g8.72h
#$ -ac d=nvcr-torch-1712

export MY_PROXY_URL="http://10.1.10.1:8080/"
export HTTP_PROXY=$MY_PROXY_URL
export HTTPS_PROXY=$MY_PROXY_URL
export FTP_PROXY=$MY_PROXY_URL
export http_proxy=$MY_PROXY_URL
export https_proxy=$MY_PROXY_URL
export ftp_proxy=$MY_PROXY_URL


export PATH="/home/takezawa/anaconda3/bin:$PATH"
. /home/takezawa/anaconda3/etc/profile.d/conda.sh

conda activate MT_env


for lr in {0.0001,0.00001,0.000001} ; do
    python main_vit.py --lr=${lr}
done
