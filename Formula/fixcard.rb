class Fixcard < Formula
  desc "Recall proven development fixes without executing card content"
  homepage "https://github.com/MarinJursic/fixcard"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.6/fixcard-1.0.0-rc.6-aarch64-apple-darwin.tar.gz"
      sha256 "faec6a30e09b03bed3912085f0279a5162f7c72e2f2fdc3984ee59f402506133"
    else
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.6/fixcard-1.0.0-rc.6-x86_64-apple-darwin.tar.gz"
      sha256 "202f32719d7b39c253605d62a342938beb9ad0bc77bbeefff1c93670c2670bd7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.6/fixcard-1.0.0-rc.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "946f2edb791858a43029460f5b98cb8c414558bb01e47258e296537407a673a7"
    else
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.6/fixcard-1.0.0-rc.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "64f7bf28f470303dd06bb9b1b938a69ce7650fa4c6719cbff466ecde694e8cdb"
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
