class Felixctl < Formula
  desc "Command-line tool for the Felix streaming and cache broker"
  homepage "https://docs.getfelix.dev/getting-started/felixctl/"
  version "0.6.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.1/felixctl-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "f35c84ece2dca98ef322e9957e8678fd154778a329187d0d7aaf6ee6b7f47305"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.1/felixctl-v0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "4e8938e418c406a143e0e92a11fa43bacefe175a4542e9a1ebfccb3546a1f964"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.1/felixctl-v0.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "47424be0294d296151ee5bdc33f45ccbf5d2d022d872015a93076d25f8b6d4f7"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.1/felixctl-v0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d3020bbd944c1add7beda78e08cd01de255434fa1bc63cfdddeabb584a81b826"
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
