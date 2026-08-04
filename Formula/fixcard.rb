class Fixcard < Formula
  desc "Recall proven development fixes without executing card content"
  homepage "https://github.com/MarinJursic/fixcard"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.3/fixcard-1.0.0-rc.3-aarch64-apple-darwin.tar.gz"
      sha256 "da1f805d16dd24c526658c640619d0770d15278e8bd8296a015ed698e4cda90b"
    else
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.3/fixcard-1.0.0-rc.3-x86_64-apple-darwin.tar.gz"
      sha256 "eaa4f7310540b52584c2675e0dfea2400fad5d8b70e7758d0b455aacbb246eae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.3/fixcard-1.0.0-rc.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3b9b0061c108fa256f92e29672c2ed7f7c662ae7110645b1de70dfcea8c4168"
    else
      url "https://github.com/MarinJursic/fixcard/releases/download/v1.0.0-rc.3/fixcard-1.0.0-rc.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d4b98fc930b68f0cac01af3fba39b0407a59bda1bdcb1807762c6b80c7b14c95"
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
