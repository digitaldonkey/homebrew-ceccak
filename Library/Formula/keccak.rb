class Keccak < Formula
  homepage "https://github.com/gvanas/KeccakCodePackage/tree/master/KeccakSum"
  url "https://github.com/gvanas/KeccakCodePackage/archive/master.zip"
  sha1 "5e8eba7f1ecbe338722d6d415ec28245b6083218"

  # depends_on "cmake" => :build
  # depends_on :x11 # if your formula requires any X11/XQuartz components

#   depends_on 'gcc'
  depends_on 'xsltproc'
#   depends_on 'libtool'
#   depends_on 'tre'

  def install
    ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    system "make generic64/KeccakSum", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
#     system "make generic64/KeccakSum" # if this fails, try separate make/make install steps
#     etc.install "scalpel.conf" => "scalpel.conf.sample"
  end
end
