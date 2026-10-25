class Felixctl < Formula
  desc "Command-line tool for the Felix streaming and cache broker"
  homepage "https://docs.getfelix.dev/getting-started/felixctl/"
  version "0.6.2"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.2/felixctl-v0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "a0390a121a6ec771023b45447ce3123318edbc69296c9900da533122b3f572b7"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.2/felixctl-v0.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "c9fd2442cca547568b0b3a2f7c6a1aeaca2a976453566e16c3460011d7260ac9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.2/felixctl-v0.6.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b5e6f8dd680ef0657176e8ff2ae51784cf4adc407602ffb96c33c197ace3b33c"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.2/felixctl-v0.6.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6998069c24c13fcebe183abdea1bc62b2becbbd81b1d77f550a1c100d9dd9f09"
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
