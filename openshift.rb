class Openshift < Formula
  homepage "https://github.com/openshift/origin"
  url "https://github.com/openshift/origin.git", :tag => "v0.3.1"
  head "https://github.com/openshift/origin.git", :branch => "master"

  depends_on "go" => :build

  def install
    arch = MacOS.prefer_64_bit? ? "amd64" : "x86"
    output_dir = "_output/local/go/bin"

    system "make", "all", "WHAT=cmd/openshift", "GOFLAGS=-v"

    bin.install "#{output_dir}/openshift"
    bin.install "#{output_dir}/osc"
  end
end
