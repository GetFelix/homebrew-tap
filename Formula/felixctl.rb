class Felixctl < Formula
  desc "Command-line tool for the Felix streaming and cache broker"
  homepage "https://docs.getfelix.dev/getting-started/felixctl/"
  version "0.6.0-preview.4"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.4/felixctl-v0.6.0-preview.4-aarch64-apple-darwin.tar.gz"
      sha256 "50a6b46d9d165842e41bf7ce500e2077253bf6da70b4b34b60a388ececd58085"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.4/felixctl-v0.6.0-preview.4-x86_64-apple-darwin.tar.gz"
      sha256 "bc3a09b66f81c2694b5cddc5cadaad3ed5f743e909aa4bddd447c4e81d94ff11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.4/felixctl-v0.6.0-preview.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "35cc32765f99677b0f73df4de680ef665a1e41a5ced07d10b917bb09e4fe98a0"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.4/felixctl-v0.6.0-preview.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f51b5de447e1919fa25fc8fbce898b73535ca7e39c66265483e3185f38bd0b4"
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
