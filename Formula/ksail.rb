class Ksail < Formula
  desc "SDK for Kubernetes"
  homepage "https://github.com/devantler-tech/ksail"
  sha256 "93fe6c61797468e1c92a240a735a5b442421f9977c959d12e434c79e8174d0fc"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/devantler-tech/ksail/releases/download/v2.5.0/ksail-darwin-arm64"
    elsif Hardware::CPU.intel?
      url "https://github.com/devantler-tech/ksail/releases/download/v2.5.0/ksail-darwin-amd64"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/devantler-tech/ksail/releases/download/v2.5.0/ksail-linux-arm64"
    elsif Hardware::CPU.intel?
      url "https://github.com/devantler-tech/ksail/releases/download/v2.5.0/ksail-linux-amd64"
    end
  end

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  def install
    bin.install "ksail-#{OS.kernel_name.downcase}-#{Hardware::CPU.arch}" => "ksail"
  end

  test do
    system "#{bin}/ksail", "--version"
  end
end
