# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Keccak < Formula
  desc "Provide Keccak hash functionality"
  homepage "https://github.com/gvanas/KeccakCodePackage/tree/master/KeccakSum"
#   url "https://github.com/gvanas/KeccakCodePackage/archive/master.zip"
  url "https://github.com/gvanas/KeccakCodePackage/archive/40e998679d8a5da8a4b5cea32c021ee7e073ba16.zip"
  version "40e998679d8a5da8a4b5cea32c021ee7e073ba16"
  # sha256 "a3c2dde7f49e0aaaf12a6c8c06cc1cf58713e69fbccd44b6b1243e6792a149ca"
  sha1 "d9491623235cc2a0163de053978a173af1fdb1e9"

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make generic64/KeccakSum", ".", *std_cmake_args
    # system "cmake", ".", *std_cmake_args
    # system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test KeccakCodePackage`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
