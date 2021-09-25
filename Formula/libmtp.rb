class Libmtp < Formula
  desc "Implementation of Microsoft's Media Transfer Protocol (MTP)"
  homepage "https://libmtp.sourceforge.io/"
  url "https://downloads.sourceforge.net/project/libmtp/libmtp/1.1.19/libmtp-1.1.19.tar.gz"
  sha256 "deb4af6f63f5e71215cfa7fb961795262920b4ec6cb4b627f55b30b18aa33228"
  license "LGPL-2.1-or-later"

  bottle do
    sha256 cellar: :any,                 arm64_big_sur: "4af12c090f3214200d4a37b9511c1fc1ba0269b40f26c0e9c45c4dbfe2c64474"
    sha256 cellar: :any,                 big_sur:       "5ebeb1696d5c7af72cb4a14f905dbde2cd871334ea392e7e8ff0305159c09aa1"
    sha256 cellar: :any,                 catalina:      "9b305e731b8d8608b688bb5c8bb98192d4879eb944fd4b08c09daadf367b68fc"
    sha256 cellar: :any,                 mojave:        "e4c497e80277170743a4ff8ddde06687a01f3afb053088b921b8399796f630ae"
    sha256 cellar: :any,                 high_sierra:   "704cd1e718e42dc9284ca020a11c1788d8a222cb8a4ca939d6b289cd17cf86ad"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "80b10da726a70f661e1d6a3d58e1fcbaab5afe23c7165a5588e8558710fd6887"
  end

  depends_on "pkg-config" => :build
  depends_on "libusb-compat"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-mtpz",
                          "--with-udev=#{lib}/udev"
    system "make", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mtp-getfile")
  end
end
