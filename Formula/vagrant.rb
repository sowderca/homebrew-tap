class Vagrant < Formula
  desc "Development environment and workflow utility"
  homepage "https://www.vagrantup.com/"
  url "https://releases.hashicorp.com/vagrant/2.4.9/vagrant_2.4.9_linux_amd64.zip"
  version "2.4.9"
  sha256 "77d4d533c82c420b6b594992a902ec43fcd9f50380dc002a599e93fc744f8cfa"
  license "BUSL-1.1"

  depends_on :linux

  def install
    bin.install "vagrant"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vagrant --version")
  end
end
