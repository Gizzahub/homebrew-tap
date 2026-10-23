cask "gz-pm" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0"
  on_arm do
    sha256 "bd3e739109248f1556e028787f68fa966974ad53796f3eb7246a711cc8ef7c90"
  end
  on_intel do
    sha256 "0fe1947e4f2a7b386bea9bd74e2f11b90f71068bb71f016fe6c0c612a823475d"
  end

  url "https://github.com/Gizzahub/gzh-cli-package-manager/releases/download/v#{version}/gz-pm-darwin-#{arch}.tar.gz"
  name "gz-pm"
  desc "Multi-package-manager update orchestrator"
  homepage "https://github.com/Gizzahub/gzh-cli-package-manager"

  binary "gz-pm-darwin-#{arch}/gz-pm"

  postflight_steps do
    on_macos do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/gz-pm-darwin-#{arch}/gz-pm"]
    end
  end
end
