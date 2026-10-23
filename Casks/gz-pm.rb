cask "gz-pm" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0"
  on_arm do
    sha256 "f101733c6b88f8fb845bd1be07dd3233828bfe273a9c3f72d02c0875cac7aba4"
  end
  on_intel do
    sha256 "2fd5381fc9bdbc5a955cacb6f6b0f69ef6d8ce62dc3a0fb05c5954654f7f782a"
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
