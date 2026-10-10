class Felixctl < Formula
  desc "Command-line tool for the Felix streaming and cache broker"
  homepage "https://docs.getfelix.dev/getting-started/felixctl/"
  version "0.6.0-preview.5"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.5/felixctl-v0.6.0-preview.5-aarch64-apple-darwin.tar.gz"
      sha256 "7f775c364e0b5fd14ab444524638f9c5648cb0ef903d9546daa37ab5e43eeb20"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.5/felixctl-v0.6.0-preview.5-x86_64-apple-darwin.tar.gz"
      sha256 "f8311b969f6e7c0e6576b819ea10a9340c821bd1faac248c99acd89247ff7c08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.5/felixctl-v0.6.0-preview.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "992cd44c3a6710d339434c97e1fdacac0f654476a7b9942d102f6720989fc556"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.5/felixctl-v0.6.0-preview.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3ddbab35ab0fd252ca9e146bfeae411193594f578b4bbd84c930c5c29b9b9d54"
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
