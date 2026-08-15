class Fixcard < Formula
  desc "Recall proven development fixes without executing card content"
  homepage "https://github.com/MarinJursic/fixcard"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.7/fixcard-1.0.0-rc.7-aarch64-apple-darwin.tar.gz"
      sha256 "c56714ac4ef563d56d1b5e12c78b2df5567a4f3006907f9ff1ff8c37f8478756"
    else
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.7/fixcard-1.0.0-rc.7-x86_64-apple-darwin.tar.gz"
      sha256 "163973c67d0cac9ecff84f60b6f35432da97e894cbda8d23fb0f50a465979582"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.7/fixcard-1.0.0-rc.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c23ecde073df3f62f27da7cefd1e67ba560a4bf777f6aee850d6e983e8fa960"
    else
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.7/fixcard-1.0.0-rc.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac0eb5e6f3567af86085fb35a773f8cc7494ba691c43db5426da14e91f2cb238"
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
