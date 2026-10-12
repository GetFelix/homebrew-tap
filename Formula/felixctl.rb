class Felixctl < Formula
  desc "Command-line tool for the Felix streaming and cache broker"
  homepage "https://docs.getfelix.dev/getting-started/felixctl/"
  version "0.6.0-preview.7"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.7/felixctl-v0.6.0-preview.7-aarch64-apple-darwin.tar.gz"
      sha256 "fb24d77047807aa2996d4b6dfe23020933f199b442c8ea068eacb8af18e18418"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.7/felixctl-v0.6.0-preview.7-x86_64-apple-darwin.tar.gz"
      sha256 "d81c6b2a5be56f7cc50a6c48ea17aa9a5f816d96eee44f680e76477fac75d73d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.7/felixctl-v0.6.0-preview.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0a87232092b3006200743b3d49368c4e6be92c17bc7dff8660d69281efbd0e24"
    end
    on_intel do
      url "https://github.com/GetFelix/felix/releases/download/v0.6.0-preview.7/felixctl-v0.6.0-preview.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eb3182ec22834921bc907c824495f9f1898643a10cc92db27ce81b98284da0cc"
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
