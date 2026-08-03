class Fixcard < Formula
  desc "Recall proven development fixes without executing card content"
  homepage "https://github.com/MarinJursic/fixcard"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.2/fixcard-1.0.0-rc.2-aarch64-apple-darwin.tar.gz"
      sha256 "5866a547697e3fd81325ff96c69bf26e541a8c353800ecf379a1eb3cb18b124c"
    else
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.2/fixcard-1.0.0-rc.2-x86_64-apple-darwin.tar.gz"
      sha256 "ecc0304199e35f567b9b034f4cc8cbab6975b203f43cabdc8a44b6b742201dd4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.2/fixcard-1.0.0-rc.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0836c5baf002fa13bb6acb9ffe5317e0a1a407acfc51bb2f60cd8697109574e4"
    else
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.2/fixcard-1.0.0-rc.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "01c6a8eb2359628dd7d8d773547bf86012cf3f2c3e7b61d80ea1394d3bd623d9"
    end
  end

  def install
    bin.install "fixcard"
  end

  test do
    ENV["FIXCARD_DATA_DIR"] = (testpath/"data").to_s
    assert_match "fixcard #{version}", shell_output("#{bin}/fixcard --version")
    assert_match "Repository: not detected", shell_output("#{bin}/fixcard status")
  end
end
