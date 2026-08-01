class GtkEngineMurrine < Formula
  desc "GTK2 engine to make your desktop look like a 'murrina'"
  homepage "http://cimitan.com/murrine/project/murrine"
  url "https://download.gnome.org/sources/murrine/0.98/murrine-0.98.2.tar.xz"
  sha256 "e9c68ae001b9130d0f9d1b311e8121a94e5c134b82553ba03971088e57d12c89"
  license "LGPL-3.0-or-later"

  depends_on :linux
  depends_on "gtk+"
  depends_on "gettext" => :build
  depends_on "intltool" => :build
  depends_on "perl" => :build
  depends_on "perl-xml-parser" => :build
  depends_on "pkg-config" => :build

  def install
    ENV["PERL"] = Formula["perl"].bin/"perl"
    system "./configure",
           "--prefix=#{prefix}",
           "--enable-animation",
           "--enable-animationrtl"
    system "make", "install"
  end

  test do
    assert_predicate lib/"gtk-2.0/2.10.0/engines/libmurrine.so", :exist?
  end
end
