class Fixcard < Formula
  desc "Recall proven development fixes without executing card content"
  homepage "https://github.com/MarinJursic/fixcard"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.4/fixcard-1.0.0-rc.4-aarch64-apple-darwin.tar.gz"
      sha256 "9b9d28e7bc637ac6beb7f5c86175888ecc826b64aac1cd4de9116ef98306f0a0"
    else
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.4/fixcard-1.0.0-rc.4-x86_64-apple-darwin.tar.gz"
      sha256 "ec17d3d9cb856b9b6d2acd7ce866ffbaf4fbcfd4ee9ef9702d403b427cfc2780"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.4/fixcard-1.0.0-rc.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd1102510c4ec90753a3ae45bbc2bbda07ee666b11bfb5d78abd25403c082c90"
    else
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.4/fixcard-1.0.0-rc.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "513b4e0d4ca03def2749c555c8d85e8bf3f3e7d00847f17f3a3c503583b3237f"
    end
  end

  def install
    bin.install "fixcard", "fix"
  end

  test do
    ENV["FIXCARD_DATA_DIR"] = (testpath/"data").to_s
    assert_match "fixcard #{version}", shell_output("#{bin}/fixcard --version")
    assert_match "fix #{version}", shell_output("#{bin}/fix --version")
    assert_match "fixcard #{version}", shell_output("#{bin}/fix #{bin}/fixcard --version")
    assert_match "Repository: not detected", shell_output("#{bin}/fixcard status")
  end
end
