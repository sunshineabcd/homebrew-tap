class Purecanvas < Formula
  desc "Capture, frame, localize and verify App Store / Play Store screenshots"
  homepage "https://github.com/sunshineabcd/purecanvas-cli"
  url "https://github.com/sunshineabcd/purecanvas-cli/releases/download/v1.1.0/purecanvas-cli-1.1.0.zip"
  sha256 "5bbda1e96e48b35d699f5870d4493de8c2700d0dd1e7d1770b06e7c50bdebcc7"
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
      流程驱动采集需要完整 Xcode（xcodebuild）。首次使用建议运行：
        purecanvas capture doctor
    EOS
  end

  test do
    assert_match "1.1.0", shell_output("#{bin}/purecanvas --version")
  end
end
