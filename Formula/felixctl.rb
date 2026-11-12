class Felixctl < Formula
  desc "Command-line tool for the Felix streaming and cache broker"
  homepage "https://docs.getfelix.dev/getting-started/felixctl/"
  version "0.7.2"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.2/felixctl-v0.7.2-aarch64-apple-darwin.tar.gz"
      sha256 "177e34ba9bd4bbaf95f44cfc5d01a474e1ab92954fb75b1f40523f10b20b0c6e"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.2/felixctl-v0.7.2-x86_64-apple-darwin.tar.gz"
      sha256 "ffb9ae62aa34bfbd420d0ef1898afc8a2b4d089cbd21976111b8239b172437a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.2/felixctl-v0.7.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a13950f82d348ec44fef9d2831f6a9810ee07e5987e6dbb04ad21af650388b33"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.7.2/felixctl-v0.7.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5552f7b464d70abfb7845cf63afd50d3073ae317bb3e6794e15ad3b1be4f2bd5"
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
