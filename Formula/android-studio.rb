class AndroidStudio < Formula
  desc "Tools for building Android applications"
  homepage "https://developer.android.com/studio"
  url "https://dl.google.com/dl/android/studio/ide-zips/2026.1.3.7/android-studio-quail3-linux.tar.gz"
  version "2026.1.3.7"
  sha256 "36832122557ab73ca68dfd9bd989ddac40103ac003ca10e04c949a1f61578a67"
  license "Apache-2.0"

  depends_on :linux
  depends_on "openjdk"

  def install
    libexec.install Dir["*"]
    (bin/"studio").write <<~SH
      #!/bin/bash
      exec "#{libexec}/bin/studio" "$@"
    SH
    chmod 0755, bin/"studio"
  end

  def caveats
    <<~EOS
      Android Studio was installed to:
        #{libexec}

      Launch with:
        studio
    EOS
  end

  test do
    assert_predicate libexec/"bin/studio.sh", :exist?
    assert_predicate bin/"studio", :executable?
  end
end
