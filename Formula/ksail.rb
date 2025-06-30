class Ksail < Formula
  desc "SDK for Kubernetes"
  homepage "https://github.com/devantler-tech/ksail"
  url "https://github.com/devantler-tech/ksail/releases/download/v3.1.3/ksail.tar.gz"
  sha256 "6ced0162deef99bafd7ca62f8efdf744f0e9ef5b03ffd3f42407937d104f8be8"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "age"
  depends_on "argocd"
  depends_on "cilium-cli"
  depends_on "fluxcd/tap/flux"
  depends_on "helm"
  depends_on "k3d"
  depends_on "k9s"
  depends_on "kind"
  depends_on "kubeconform"
  depends_on "kubernetes-cli"
  depends_on "kustomize"
  depends_on "sops"
  depends_on "talosctl"

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "ksail-darwin-arm64" => "ksail"
      elsif Hardware::CPU.intel?
        bin.install "ksail-darwin-amd64" => "ksail"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "ksail-linux-arm64" => "ksail"
      elsif Hardware::CPU.intel?
        bin.install "ksail-linux-amd64" => "ksail"
      end
    end
  end

  test do
    system bin/"ksail", "--version"
  end
end
