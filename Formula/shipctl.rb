class Shipctl < Formula
  desc "Professional Docker deployment automation tool"
  homepage "https://github.com/arramandhanu/shipctl"
  url "https://github.com/arramandhanu/shipctl/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "MIT"
  version "1.0.0"

  depends_on "bash"
  depends_on "git"

  def install
    # Install completions first (before moving files to prefix)
    if File.exist?("completions/shipctl.bash")
      bash_completion.install "completions/shipctl.bash" => "shipctl"
      zsh_completion.install "completions/shipctl.bash" => "_shipctl"
    end
    
    # Install all files to prefix
    prefix.install Dir["*"]
    
    # Create symlink to bin
    bin.install_symlink prefix/"shipctl" => "shipctl"
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
