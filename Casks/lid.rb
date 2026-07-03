cask "lid" do
  version "2026.7.8"
  sha256 "045998bea989444de2800135ab6152551a556a1f7a1bfbddbbf45a15f55eb02b"

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

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/Lid.app"],
                   must_succeed: false
  end

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
