class Ksail < Formula
  desc "SDK for Kubernetes"
  homepage "https://github.com/devantler-tech/ksail"
  license "MIT"
  sha256 "12a19ca431019f99596fbbb3b6e53197b9374efa9f886c09ca5493581cec8913"

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
