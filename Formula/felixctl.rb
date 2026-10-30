class Felixctl < Formula
  desc "Command-line tool for the Felix streaming and cache broker"
  homepage "https://docs.getfelix.dev/getting-started/felixctl/"
  version "0.7.0-preview.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.0-preview.1/felixctl-v0.7.0-preview.1-aarch64-apple-darwin.tar.gz"
      sha256 "f2e63820a3d30cb0a043ba4454639f162405ca9c0c71952c319c7e9d84161352"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.0-preview.1/felixctl-v0.7.0-preview.1-x86_64-apple-darwin.tar.gz"
      sha256 "2b65b4b75df8aa9290d866bf01358810a73943a89494c3bba877878375dbf239"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.0-preview.1/felixctl-v0.7.0-preview.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a88153aceda30c6ecc5f9942e33987f11c2411169bef83ebd39621044a135f5c"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.0-preview.1/felixctl-v0.7.0-preview.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b834059e328f5b354bd08ccc60efb115466149993a601ac637616d84efb9d713"
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
