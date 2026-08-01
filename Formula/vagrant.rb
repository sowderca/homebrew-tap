class Vagrant < Formula
  desc "Development environment and workflow utility"
  homepage "https://www.vagrantup.com/"
  url "https://releases.hashicorp.com/vagrant/2.4.9/vagrant_2.4.9-1_amd64.deb",
      using: :nounzip
  version "2.4.9"
  sha256 "42d830d05e6e9e647f8a5c854d9f5295e319dac74edd37d54b97b4f29cbbd70d"
  license "BUSL-1.1"

  depends_on :linux

  def install
    system "ar", "x", cached_download
    system "tar", "-xzf", "data.tar.gz"
    libexec.install Dir["opt/vagrant/*"]
    (bin/"vagrant").write <<~SH
      #!/usr/bin/env bash
      exec "#{libexec}/bin/vagrant" "$@"
    SH
    chmod 0755, bin/"vagrant"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vagrant --version")
  end
end
