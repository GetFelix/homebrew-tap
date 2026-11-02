class Felixctl < Formula
  desc "Command-line tool for the Felix streaming and cache broker"
  homepage "https://docs.getfelix.dev/getting-started/felixctl/"
  version "0.7.0-preview.2"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.0-preview.2/felixctl-v0.7.0-preview.2-aarch64-apple-darwin.tar.gz"
      sha256 "9dd95fb784e09ca6224494ca7735fad4b37f578614e95e1b3eb6c0aa58351c59"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.0-preview.2/felixctl-v0.7.0-preview.2-x86_64-apple-darwin.tar.gz"
      sha256 "c967b3ccbe0f7c141c80ce22372be4ca0c7d8e19f1b42ee164017e1ba07d61b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.0-preview.2/felixctl-v0.7.0-preview.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3b63a3cb38280991f7cde30ebe86576cb28622ef4cb0289ea3f2711f832b573"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.0-preview.2/felixctl-v0.7.0-preview.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a41aaec77e26e4e64146413f656abbc4bef92cb2d1739d65c8dcb89a6dd6f8d"
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
