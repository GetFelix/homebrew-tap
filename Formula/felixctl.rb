class Felixctl < Formula
  desc "Command-line tool for the Felix streaming and cache broker"
  homepage "https://docs.getfelix.dev/getting-started/felixctl/"
  version "0.6.0-preview.9"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.9/felixctl-v0.6.0-preview.9-aarch64-apple-darwin.tar.gz"
      sha256 "fd6adb5c2744bdf3f7a4b7acc39b621a97caf20295c0b9ba080b3ab3e0fae61b"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.9/felixctl-v0.6.0-preview.9-x86_64-apple-darwin.tar.gz"
      sha256 "045a8147733912f574a6b8bd6cc2a66b23cc7c8010e52d0038da6490058e6387"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.9/felixctl-v0.6.0-preview.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a75c83acfeb18e3d527ed7293086c3aeba8cc8c985ff31a2ef0b85ae88fa9331"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.9/felixctl-v0.6.0-preview.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eff7e6c0e30edcc0afaafee93063a9a13c41c9e17fcd06f24d95fa500c65e301"
    end
  end

  def install
    bin.install "felixctl"
    man1.install Dir["man/*.1"]
    bash_completion.install "completions/felixctl.bash" => "felixctl"
    zsh_completion.install "completions/_felixctl"
    fish_completion.install "completions/felixctl.fish"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/felixctl --version")
  end
end
