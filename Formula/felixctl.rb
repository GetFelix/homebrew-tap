class Felixctl < Formula
  desc "Command-line tool for the Felix streaming and cache broker"
  homepage "https://docs.getfelix.dev/getting-started/felixctl/"
  version "0.7.3"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.3/felixctl-v0.7.3-aarch64-apple-darwin.tar.gz"
      sha256 "a26a4fff5cf24852e0ca12869e4115b6c5762234806f8dda594007ab984454ed"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.3/felixctl-v0.7.3-x86_64-apple-darwin.tar.gz"
      sha256 "ab690e10875ddbc21bcbe3f90c46213d2e273582384a6296634f69afde425908"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.3/felixctl-v0.7.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b75dc1d2f4014179bb662988d737c7ac0941a3201afa1741691895eb40dfac08"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.3/felixctl-v0.7.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "848311ac13c3aa2fae2877d9a66ffb471e25b3be702338175b8978b2ddb307e0"
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
