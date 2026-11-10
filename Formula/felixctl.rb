class Felixctl < Formula
  desc "Command-line tool for the Felix streaming and cache broker"
  homepage "https://docs.getfelix.dev/getting-started/felixctl/"
  version "0.7.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.1/felixctl-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "0b95a164caca51dd9c53f6b38cff3c6bc51fd0d255d10e394d8007da00dd4285"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.1/felixctl-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "1e104e1c33326815cb5c3a896fb39ec7b941ec435270b82590c24f01ae1e8c5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.1/felixctl-v0.7.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e9a53a00d908c32905882a9a428ac08b81c41d2e730d8134e46fdc1ffa3c1e22"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.1/felixctl-v0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76e10e44936409e134a8bee6102ffba7e5550c49222a6c6a955aa00e5b2316a3"
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
