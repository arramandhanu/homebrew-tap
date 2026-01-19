class Shipctl < Formula
  desc "Professional Docker deployment automation tool"
  homepage "https://github.com/arramandhanu/shipctl"
  url "https://github.com/arramandhanu/shipctl/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "e22fc1a8daf74b908d4689be35cc7ff1b6be935dba0dfb8ae0781058b928be72"
  license "MIT"
  version "1.0.1"

  depends_on "bash"
  depends_on "git"

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"shipctl" => "shipctl"
    bash_completion.install prefix/"completions/shipctl.bash" => "shipctl"
    zsh_completion.install prefix/"completions/shipctl.bash" => "_shipctl"
  end

  def caveats
    <<~EOS
      Shell completions installed for Bash and Zsh.
      Run 'shipctl init' in your project directory to get started.
    EOS
  end

  test do
    system "#{bin}/shipctl", "--version"
  end
end
