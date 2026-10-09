class Felixctl < Formula
  desc "Command-line tool for the Felix streaming and cache broker"
  homepage "https://docs.getfelix.dev/getting-started/felixctl/"
  version "0.6.0-preview.3"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.3/felixctl-v0.6.0-preview.3-aarch64-apple-darwin.tar.gz"
      sha256 "9d1b15461cb46ce831ce67a83a554fe18f7bf3f157badd5a7d43e96f7805e794"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.3/felixctl-v0.6.0-preview.3-x86_64-apple-darwin.tar.gz"
      sha256 "4f9fff1eb233d7dd40b5b02ee857647ce8cbd5f92559905c00a9ba037542079f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.3/felixctl-v0.6.0-preview.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ac2d686e2a6ead694125ea52b337b806f39b785b644d5feaca2b5af21a33cb95"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.3/felixctl-v0.6.0-preview.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bcf231d524f6b1c49044044ba9cab3df7440786173741fc4f44a17110e60743c"
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
