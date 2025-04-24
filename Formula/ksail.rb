class Ksail < Formula
  desc "SDK for Kubernetes"
  homepage "https://github.com/devantler-tech/ksail"

  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/devantler-tech/ksail/releases/download/v2.25.1/ksail-darwin-amd64"
      sha256 "3af40b508d70813e461a2d8cfddbc11abc576643c775419c289669cd55394fec"

      def install
        bin.install "ksail-darwin-amd64" => "ksail"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/devantler-tech/ksail/releases/download/v2.25.1/ksail-darwin-arm64"
      sha256 "53523e6828d3a028277466fc2c2460b309ba0334b9d150e3d86a69a393525112"

      def install
        bin.install "ksail-darwin-arm64" => "ksail"
      end
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/devantler-tech/ksail/releases/download/v2.25.1/ksail-linux-amd64"
      sha256 "6eff03768f5faaa9357c1184436be8f5c2c8066740c701a5b3d643b3b3cfb60d"

      def install
        bin.install "ksail-linux-amd64" => "ksail"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/devantler-tech/ksail/releases/download/v2.25.1/ksail-linux-arm64"
      sha256 "facf32da03be935b89d86a17dfda973c4810fb080cb884c0601cbe6e40e66382"

      def install
        bin.install "ksail-linux-arm64" => "ksail"
      end
    end
  end

  test do
    system "#{bin}/ksail", "--version"
  end
end
