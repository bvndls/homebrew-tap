cask "oneko" do
  version "1.1"
  sha256 :no_check

  url "https://github.com/mdonoughe/neko-mac/releases/download/v1.1/Neko-1.1.dmg"
  name "oneko"
  desc "oneko for macos 10.9 and higher"
  homepage "https://github.com/mdonoughe/neko-mac"

  depends_on macos: ">= :catalina"

  app "Neko.app"
end