cask "vagrant-linux" do
  sha256 "42d830d05e6e9e647f8a5c854d9f5295e319dac74edd37d54b97b4f29cbbd70d"
  version "2.4.9"

  url "https://releases.hashicorp.com/vagrant/#{version}/vagrant_#{version}-1_amd64.deb", verified: "hashicorp.com/vagrant/"
  name "Vagrant"
  desc "Development environment and workflow utility"
  homepage "https://www.vagrantup.com/"

  livecheck do
    url "https://releases.hashicorp.com/vagrant/"
    regex(%r{href=.*?/v?(\d+(?:\.\d+)+)/}i)
  end

  depends_on :linux

  preflight do
    system_command "ar", args: ["x", "#{staged_path}/vagrant_#{version}-1_amd64.deb"], chdir: staged_path
    system_command "tar", args: ["-xzf", "#{staged_path}/data.tar.gz", "-C", staged_path]
  end

  binary "#{staged_path}/opt/vagrant/bin/vagrant"
  zsh_completion "#{staged_path}/opt/vagrant/embedded/gems/gems/vagrant-#{version}/contrib/zsh/_vagrant"
  bash_completion "#{staged_path}/opt/vagrant/embedded/gems/gems/vagrant-#{version}/contrib/bash/completion.sh", target: "vagrant"

  zap trash: "~/.vagrant.d"
end
