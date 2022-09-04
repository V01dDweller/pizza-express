Vagrant.configure("2") do |config|

# Post-config script
  $post_config = <<-'SCRIPT'
  # Install some tools
  apt update
  apt -y install vim git curl wget tree jq apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
  apt update
  apt-cache policy docker-ce
  apt -y install docker-ce docker-compose
  systemctl status docker
  usermod -aG docker vagrant
  SCRIPT

# Create the VM
  config.vm.define "noname-01" do |subconfig|
    subconfig.vm.box = "bento/ubuntu-22.04"
    subconfig.vm.hostname = "noname-01"
    subconfig.vm.network "forwarded_port", guest: 3000, host: 3000
  end

# Virtual machine specs - VirtualBox
  config.vm.provider "virtualbox" do |spec|
    spec.memory = 6144
    spec.cpus = 2
  end

# Run post_config script
  config.vm.provision "shell", inline: $post_config
end
