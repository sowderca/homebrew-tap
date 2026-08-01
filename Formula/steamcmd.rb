class Steamcmd < Formula
  desc "Command-line client for Steam"
  homepage "https://developer.valvesoftware.com/wiki/SteamCMD"
  url "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz"
  version "latest"
  sha256 "cebf0046bfd08cf45da6bc094ae47aa39ebf4155e5ede41373b579b8f1071e7c"
  license :cannot_represent

  depends_on :linux

  def install
    libexec.install "steamcmd.sh", "linux32"
    (bin/"steamcmd").write <<~SH
      #!/bin/bash
      exec "#{libexec}/steamcmd.sh" "$@"
    SH
    chmod 0755, bin/"steamcmd"
  end

  def caveats
    <<~EOS
      SteamCMD was installed to #{libexec}.

      On first run it will download and update itself into the same directory.
      Run `steamcmd` to complete the initial setup.
    EOS
  end

  test do
    assert_predicate bin/"steamcmd", :executable?
    assert_predicate libexec/"steamcmd.sh", :exist?
  end
end
