sudo apt update
sudo apt install htop tmux vim wget

wget https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update

curl -so ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-4.7.10-Linux-x86_64.sh \
 && chmod +x ~/miniconda.sh \
 && ~/miniconda.sh -b -p ~/miniconda \
 && rm ~/miniconda.sh
export PATH=${HOME}/miniconda/bin:$PATH
source ~/.bashrc
conda install -y pytorch=1.1.0 -c pytorch

git clone https://github.com/NVIDIA/apex ~/apex

cd ~/apex && git reset --hard 1603407bf49c7fc3da74fceb6a6c7b47fece2ef8 && \
    python setup.py install --user --cuda_ext --cpp_ext

cd ~ && rm -rf ~/apex

pip install tensorboardX six numpy tqdm path.py pandas scikit-learn py-rouge scipy
