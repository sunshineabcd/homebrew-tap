class Purecanvas < Formula
  desc "Capture, frame, localize and verify App Store / Play Store screenshots"
  homepage "https://github.com/sunshineabcd/purecanvas-cli"
  url "https://github.com/sunshineabcd/purecanvas-cli/raw/v1.2.0/purecanvas-cli-1.2.0.zip"
  sha256 "6838ce7bc15ab5fe3ccab636afca80c5910d0a90d1e7938f410bb289712271a0"
  license :cannot_represent

  # 发布包为 Apple Silicon 二进制，且流程采集依赖完整 Xcode（不作依赖声明）
  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"purecanvas"
  end

  def caveats
    <<~EOS
      流程驱动采集与全工程代码快拍需要完整 Xcode（xcodebuild / xcrun）。首次使用建议运行：
        purecanvas capture doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/purecanvas --version")
  end
end
