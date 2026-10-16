class Felixctl < Formula
  desc "Command-line tool for the Felix streaming and cache broker"
  homepage "https://docs.getfelix.dev/getting-started/felixctl/"
  version "0.6.0-preview.8"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.8/felixctl-v0.6.0-preview.8-aarch64-apple-darwin.tar.gz"
      sha256 "04896a421967618fb2c08fbdc95f7bd9a68d5e66db5e7268c7e9ca13661f0248"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.8/felixctl-v0.6.0-preview.8-x86_64-apple-darwin.tar.gz"
      sha256 "984ecbe40e55ad9e0bbcacd4057566a37fa16d11184240538374211ad34974ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.8/felixctl-v0.6.0-preview.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da495191280bda0b06651ce9e27468e70b82b3911c0474ba213538e79d2a4aac"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.8/felixctl-v0.6.0-preview.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "52a44f4f25864af787a500a06fc012f71b365c01605f2cd513d226c0e43a5a0d"
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
