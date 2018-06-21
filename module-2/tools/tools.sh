#!/bin/bash

# Install kubectx/kubens
cd $HOME
mkdir bin
PATH=$PATH:$HOME/bin/
sudo git clone https://github.com/ahmetb/kubectx $HOME/kubectx
sudo ln -s $HOME/kubectx/kubectx $HOME/bin/kubectx
sudo ln -s $HOME/kubectx/kubens $HOME/bin/kubens

# Install Helm
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh

# Install Hey
go get -u github.com/rakyll/hey

# Install kubectl aliases
cd $HOME
wget https://raw.githubusercontent.com/ahmetb/kubectl-alias/master/.kubectl_aliases
echo "[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases" >> $HOME/.bashrc

# Install kube ps1
git clone https://github.com/jonmosco/kube-ps1.git
echo 'source $HOME/kube-ps1/kube-ps1.sh' >> ~/.bashrc
export VAR="PS1='[\W \$(kube_ps1)]\$ '"
echo $VAR >> ~/.bashrc
source $HOME/.bashrc
