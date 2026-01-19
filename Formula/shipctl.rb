class Shipctl < Formula
  desc "Professional Docker deployment automation tool"
  homepage "https://github.com/arramandhanu/shipctl"
  url "https://github.com/arramandhanu/shipctl/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "b9473cb2977f43ca8c31c340e838126824f85e77ecd99fe74fd75da97e255332"
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
