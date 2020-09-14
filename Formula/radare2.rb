class Radare2 < Formula
  desc "Reverse engineering framework"
  homepage "https://radare.org"
  url "https://github.com/radareorg/radare2/archive/4.5.1.tar.gz"
  sha256 "4e85b35987bd2ca5881ad9585970b970fe7374814bd383bd1cd62e961a0c228b"
  license "LGPL-3.0"
  head "https://github.com/radareorg/radare2.git"

  bottle do
    sha256 "56488690c8f5b54b39fc2a2327007c39343813c9f7e22ed0103e6c934cd2d9d6" => :catalina
    sha256 "2df58012c21b130f30c2c8978835dcd8951758c537c618605d9c16b0b170f636" => :mojave
    sha256 "cc528cf5870a0d293f4ea5d7135cbe8eedca7f064f8560e9d090032c1eb113c3" => :high_sierra
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    assert_match "radare2 #{version}", shell_output("#{bin}/r2 -version")
  end
end
