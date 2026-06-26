class Terminal < Formula
  desc "Menu-bar dashboard for your Terminal windows"
  homepage "https://github.com/msakbar/helm-terminal"
  url "https://github.com/msakbar/helm-terminal/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1be2ba47e5d64dbab8b7364ae82af604e4c99593c780756fb6d9ac8c4bdc1e5f"
  license "MIT"

  # Builds from source (no Gatekeeper quarantine, no notarization). Swift package targets
  # macOS 13+, which is enforced at build time.
  depends_on :macos

  def install
    # SwiftPM needs --disable-sandbox inside Homebrew's build sandbox; bundle.sh reads this.
    ENV["SWIFT_BUILD_FLAGS"] = "--disable-sandbox"
    system "bash", "scripts/bundle.sh", "#{prefix}/Helm.app"
  end

  def caveats
    <<~EOS
      One more step — link Helm into /Applications and open it:
        ln -sf #{opt_prefix}/Helm.app /Applications/Helm.app && open /Applications/Helm.app

      (Homebrew can't write to /Applications from a formula, so this one line finishes it.
      If you asked an AI agent to install Helm, it'll run this for you.)

      On first run, approve the prompt to let Helm control Terminal
      (or enable it under System Settings ▸ Privacy & Security ▸ Automation ▸ Helm ▸ Terminal).

      Update later with:  brew upgrade terminal
    EOS
  end

  test do
    assert_predicate prefix/"Helm.app/Contents/MacOS/Helm", :exist?
  end
end
