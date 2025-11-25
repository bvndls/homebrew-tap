cask "oneko" do
  version "1.1"
  sha256 "ed3a93bb988754bc7a5f6af49e5af0b935d6f80190fa2ab1148d7abb9a5f1fd6"

  url "https://github.com/mdonoughe/neko-mac/releases/download/v1.1/Neko-1.1.dmg"
  name "oneko"
  desc "oneko for macos 10.9 and higher"
  homepage "https://github.com/mdonoughe/neko-mac"

  depends_on macos: ">= :catalina"

  app "Neko.app"

  login_item "Neko", hide: true
end