class GruvboxPlusIconPack < Formula
  url "https://github.com/SylEleuth/gruvbox-plus-icon-pack/archive/refs/tags/v6.5.0.tar.gz"
  desc "Gruvbox-inspired icon pack for Linux desktops"
  sha256 "953df8b42e12488014db9c539de54188549fe587081c3c495fc47cee4e26d45f"
  license "GPL-3.0-or-later"
  homepage "https://github.com/SylEleuth/gruvbox-plus-icon-pack"

  depends_on :linux

  def install
    (share/"icons").install "Gruvbox-Plus-Dark", "Gruvbox-Plus-Light"
    pkgshare.install "folders"
    bin.install "scripts/folders-color-chooser" => "gruvbox-plus-folders-color-chooser"
  end

  def caveats
    <<~EOS
      Icon packs were installed to:
        #{share}/icons/Gruvbox-Plus-Dark
        #{share}/icons/Gruvbox-Plus-Light

      For per-user installation, copy or symlink these directories into:
        ~/.local/share/icons/
    EOS
  end

  test do
    assert_predicate share/"icons/Gruvbox-Plus-Dark/index.theme", :exist?
    assert_predicate share/"icons/Gruvbox-Plus-Light/index.theme", :exist?
    assert_predicate bin/"gruvbox-plus-folders-color-chooser", :exist?
  end
end
