class VisualStudioCode < Formula
  desc "Open-source code editor"
  homepage "https://code.visualstudio.com/"
  url "https://update.code.visualstudio.com/1.131.0/linux-x64/stable",
      verified: "update.code.visualstudio.com"
  version "1.131.0"
  sha256 "8632e6f9aed7a2c5612475559ff3d18c661d35432c226506db70444a99845731"
  license "MIT"

  depends_on :linux

  def install
    libexec.install Dir["VSCode-linux-x64/*"]
    bin.install_symlink libexec/"bin/code"
  end

  def caveats
    <<~EOS
      Visual Studio Code was installed to:
        #{libexec}

      The `code` command is linked into #{bin}.
    EOS
  end

  test do
    assert_predicate bin/"code", :exist?
    assert_predicate libexec/"code", :exist?
  end
end
