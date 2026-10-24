class Felixctl < Formula
  desc "Command-line tool for the Felix streaming and cache broker"
  homepage "https://docs.getfelix.dev/getting-started/felixctl/"
  version "0.6.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0/felixctl-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "c8cbd3abbda10eac4d1ea965a3bb8cb62785e61109d28820dec520d79108dc6a"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0/felixctl-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "145f1b95f40c8eb7ebc1b0d7fa6ed5db33d93f82715684fec809f375a22ab7b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0/felixctl-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "42595d003090d4bcefc7cacfc1db8f63e56ff955fd8985f0b7f3c3a3d9d4ac9f"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0/felixctl-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b908c261f1594897bd287ecd73007466738e79bb42beddc065b3639e8bbc5b06"
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
