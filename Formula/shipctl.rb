class Shipctl < Formula
  desc "Professional Docker deployment automation tool"
  homepage "https://github.com/arramandhanu/shipctl"
  url "https://github.com/arramandhanu/shipctl/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
  license "MIT"
  version "1.0.0"

  depends_on "bash"
  depends_on "git"

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"shipctl" => "shipctl"
    
    # Install completions for both Bash and Zsh
    bash_completion.install prefix/"completions/shipctl.bash" => "shipctl"
    zsh_completion.install prefix/"completions/shipctl.bash" => "_shipctl"
  end

  def caveats
    <<~EOS
      Shell completions installed for Bash and Zsh.
      
      You may need to restart your shell or run:
        source ~/.bashrc   # for Bash
        source ~/.zshrc    # for Zsh
      
      Run 'shipctl init' in your project directory to get started.
    EOS
  end

  test do
    system "#{bin}/shipctl", "--version"
  end
end
