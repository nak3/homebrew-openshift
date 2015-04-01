HOMEBREW_OPENSHIFT_VERSION="v0.4.2"

class Openshift < Formula
  homepage "https://github.com/openshift/origin"
  url "https://github.com/openshift/origin.git", :tag => "#{HOMEBREW_OPENSHIFT_VERSION}"
  head "https://github.com/openshift/origin.git", :branch => "master"
  depends_on "go" => :build

  def install
    output_dir = "_output/local/go/bin"

    system "make", "all", "WHAT=cmd/openshift", "GOFLAGS=-v"

    bin.install "#{output_dir}/openshift"
    bin.install_symlink "openshift" => "osc"
  end

  test do
    assert_match /^OpenShift for Admins/, shell_output("#{bin}/openshift 2>&1", 0)
    assert_match /^OpenShift Client/, shell_output("#{bin}/osc 2>&1", 0)
  end
end
