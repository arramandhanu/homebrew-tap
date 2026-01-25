class Shipctl < Formula
  desc "Professional Docker deployment automation tool"
  homepage "https://github.com/arramandhanu/shipctl"
  url "https://github.com/arramandhanu/shipctl/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0f7597a5bca67c31c4da2630eaa9e827d4006476de92e269d9ad26276b5c1ae5"
  license "MIT"
  version "1.0.0"

  depends_on "bash"
  depends_on "git"

  def install
    # Install all files to prefix first
    prefix.install Dir["*"]
    
    # Create symlink to bin
    bin.install_symlink prefix/"shipctl" => "shipctl"
    
    # Install completions from prefix location
    bash_completion.install prefix/"completions/shipctl.bash" => "shipctl" if (prefix/"completions/shipctl.bash").exist?
    zsh_completion.install prefix/"completions/shipctl.bash" => "_shipctl" if (prefix/"completions/shipctl.bash").exist?
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
