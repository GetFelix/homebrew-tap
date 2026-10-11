class Felixctl < Formula
  desc "Command-line tool for the Felix streaming and cache broker"
  homepage "https://docs.getfelix.dev/getting-started/felixctl/"
  version "0.6.0-preview.6"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.6/felixctl-v0.6.0-preview.6-aarch64-apple-darwin.tar.gz"
      sha256 "e82f9320ad45840dbab748989403bb515e3abb434a37fe63167f3c073f19b7c8"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.6/felixctl-v0.6.0-preview.6-x86_64-apple-darwin.tar.gz"
      sha256 "ed3c58f6f92bc52e92fb8466047fad97c66b8e8e8bf4bad61b69c4c1ab3742f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.6/felixctl-v0.6.0-preview.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2fadbb7f178d17fee2edc515ae4d9a1ffc7f5535a6153e2bdf0d3ab831995216"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.6/felixctl-v0.6.0-preview.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f33a8c62a86f148cf7fe4eaf09fa307e8c8aacfebc574325fe57fcdd247126f"
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
