cask "t3-isle" do
  version "0.1.4"
  sha256 "39e2eff714b5953a7c56bc02814526289753130cd5c018809fc4ae6738af4236"

  url "https://github.com/salimmohamed/t3isle/releases/download/v#{version}/T3-Isle.dmg"
  name "T3 Isle"
  desc "Notch app that shows T3 Code agent activity"
  homepage "https://github.com/salimmohamed/t3isle"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "T3 Isle.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/T3 Isle.app"]
  end

  uninstall quit: "dev.t3isle.app"

  zap trash: [
    "~/Library/Application Support/T3 Isle",
    "~/Library/Preferences/dev.t3isle.app.plist",
  ]
end
