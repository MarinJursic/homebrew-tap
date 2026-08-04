class Fixcard < Formula
  desc "Recall proven development fixes without executing card content"
  homepage "https://github.com/MarinJursic/fixcard"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.5/fixcard-1.0.0-rc.5-aarch64-apple-darwin.tar.gz"
      sha256 "6e8a4147def87a8bad34d7e276dd5926b58366767e73314c2da89d2a38fbdcaa"
    else
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.5/fixcard-1.0.0-rc.5-x86_64-apple-darwin.tar.gz"
      sha256 "9b851fc40475410c11f2c8488cf860d12185dceed0fef6c60fdfe0d4ce2acc4e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.5/fixcard-1.0.0-rc.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1eb7c642522ce4ce360ecda40b36fdb97057769f2438914189d3cf0db98c995b"
    else
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.5/fixcard-1.0.0-rc.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "052e5e5827198093b0d73f3c28a7a573ec6246d33f10968dc74c6303213b0118"
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
