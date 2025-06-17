class Ksail < Formula
  desc "SDK for Kubernetes"
  homepage "https://github.com/devantler-tech/ksail"
  url "https://github.com/devantler-tech/ksail/releases/download/v2.31.135/ksail.tar.gz"
  sha256 "42c42aa6ee2e6bc9012fd0fb58a970260a9df02a6f5b45d28c0e7a39cdd9bf63"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "age"
  depends_on "argocd" => :optional
  depends_on "cilium-cli" => :optional
  depends_on "fluxcd/tap/flux" => :optional
  depends_on "helm"
  depends_on "k3d" => :optional
  depends_on "k9s"
  depends_on "kind"
  depends_on "kubeconform"
  depends_on "kubectl"
  depends_on "kustomize"
  depends_on "sops"
  depends_on "talosctl" => :optional

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
    system "#{bin}/ksail", "--version"
  end
end
