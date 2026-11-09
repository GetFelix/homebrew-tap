class Felixctl < Formula
  desc "Command-line tool for the Felix streaming and cache broker"
  homepage "https://docs.getfelix.dev/getting-started/felixctl/"
  version "0.7.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.0/felixctl-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "5a57dd46f91a1df8a24c560e33f2bee43e6623bae54b4cb02e0b36d315cf6125"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.0/felixctl-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "e664198b7ff6bfbf36e8aa0b1715f4191c03320d2856f81bd41a501435273c4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.0/felixctl-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "052c313f0aacc4a107ce785de5d96b52a706c0180dd789885d9de7491e9c496a"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.0/felixctl-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "57073a3e1d64d8fd07c1879b22480aed16b9053f3df41c684d3cbc25ab55c9c9"
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
