Vagrant.configure("2") do |config|

# Post-config script
  $post_config = <<-'SCRIPT'
  # Install some tools
  apt update
  apt -y install ansible ansible-lint apt-transport-https ca-certificates curl curl flake8 git jq nmap pylint shellcheck software-properties-common telnet tree vim wget
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  #Install Docker CE
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
  apt update
  apt-cache policy docker-ce
  apt -y install docker-ce docker-compose
  systemctl status docker
  usermod -aG docker vagrant
  # Install NodeJS 14.20.0
  curl -sL https://deb.nodesource.com/setup_14.x -o /tmp/nodesource_setup.sh
  bash /tmp/nodesource_setup.sh
  apt -y install nodejs
  rm /tmp/nodesource_setup.sh
  sudo -u vagrant git clone https://github.com/V01dDweller/dotfiles.git /home/vagrant/dotfiles
  sudo -u vagrant /home/vagrant/dotfiles/install.py
  sudo -u vagrant curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | sudo -u vagrant bash
  SCRIPT

# Create the VM
  config.vm.define "noname-01" do |subconfig|
    subconfig.vm.box = "bento/ubuntu-22.04"
    subconfig.vm.hostname = "noname-01"
    subconfig.vm.network "forwarded_port", guest: 3000, host: 3000
    subconfig.vm.network "forwarded_port", guest: 8081, host: 8081
  end

# Virtual machine specs - VirtualBox
  config.vm.provider "virtualbox" do |spec|
    spec.memory = 6144
    spec.cpus = 2
  end

# Run post_config script
  config.vm.provision "shell", inline: $post_config
end
