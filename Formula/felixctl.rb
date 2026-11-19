class Felixctl < Formula
  desc "Command-line tool for the Felix streaming and cache broker"
  homepage "https://docs.getfelix.dev/getting-started/felixctl/"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.8.0-preview.1/felixctl-v0.8.0-preview.1-aarch64-apple-darwin.tar.gz"
      sha256 "e7363bbf3172fa3767d8856ef21c68bcc3afb9503374b3b33c0712627aeae5ae"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.8.0-preview.1/felixctl-v0.8.0-preview.1-x86_64-apple-darwin.tar.gz"
      sha256 "6be58429f7c66329e40f402d24ce70b4a2af0f2ba117d107c3df0cc4d27947c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.8.0-preview.1/felixctl-v0.8.0-preview.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d6edbc8dc3181677db08a1f4da2422a6a75c84de825232ab1582dd6baf1a8de"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.8.0-preview.1/felixctl-v0.8.0-preview.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb5760bc7bb0ddb2d6c950741d94a3c75d9cff13d9a4caea4af6f1c069af09a1"
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
