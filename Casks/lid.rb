cask "lid" do
  version "2026.7.5"
  sha256 "587f89de34385519e45946a188e4e3ad3d82dd63295fa3cf451ccca3f0deb8c9"

  url "https://github.com/qiyuey/lid/releases/download/v#{version}/Lid-#{version}-self-signed.dmg"
  name "Lid"
  desc "Control MacBook lid-close sleep for long-running work"
  homepage "https://github.com/qiyuey/lid"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Lid.app"

  uninstall_preflight do
    lid = "#{appdir}/Lid.app/Contents/MacOS/Lid"
    system_command lid, args: ["--unregister-helper"], must_succeed: false if File.executable?(lid)
  end

  uninstall launchctl: "top.qiyuey.lid.helper",
            quit:      "top.qiyuey.lid",
            delete:    [
              "/Library/LaunchDaemons/top.qiyuey.lid.helper.plist",
              "/Library/PrivilegedHelperTools/top.qiyuey.lid.helper",
            ]

  zap trash: [
    "~/Library/Application Support/top.qiyuey.lid",
    "~/Library/Caches/top.qiyuey.lid",
    "~/Library/HTTPStorages/top.qiyuey.lid",
    "~/Library/Preferences/top.qiyuey.lid.plist",
    "~/Library/Saved Application State/top.qiyuey.lid.savedState",
    "~/Library/WebKit/top.qiyuey.lid",
  ]
end
