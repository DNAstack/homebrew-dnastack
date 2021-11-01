# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Dnastack < Formula
  desc "Command Line Tool for the DNAstack suite of products"
  homepage "https://docs.beta.dnastack.com/analysis/cli/"
  url "https://github.com/DNAstack/public-dnastack-cli/releases/download/v0.3/dnastack-mac.zip"
  sha256 "109de2b36fcf2c83a0c578d0e5133dd31a4d420290be483a5d0b1d823235c68c"
  license "Apache-2.0"

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    inreplace "dnastack", '$(dirname "$0")', prefix
    bin.install "dnastack"
    prefix.install Dir["cli"]
    system "mkdir -p ~/.dnastack"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test public-dnastack-cli`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
