cask "easyplots" do
  version "0.1.0"
  sha256 "a0984790b0c6e0a2e58dee1fd1b65ff8835696dc46b5a9c71a2bb7e2908339ec"

  url "https://github.com/praddy-31/EasyPlots/releases/download/v#{version}/EasyPlots-#{version}-arm64.dmg"
  name "EasyPlots"
  desc "Menu-bar launcher that turns CSV, Excel and JSON columns into publication-quality plots"
  homepage "https://github.com/praddy-31/EasyPlots"

  depends_on macos: :monterey
  depends_on arch: :arm64

  app "EasyPlots.app"
  # The app's own program acts as the terminal command when called `easyplots`.
  binary "#{appdir}/EasyPlots.app/Contents/MacOS/easyplots-app", target: "easyplots"

  # Only runs with `brew uninstall --zap`. ~/.config/easyplots holds your settings,
  # command history, presets and saved styles, so --zap removes those too. Your plots
  # stay where they were saved.
  zap trash: [
    "~/.config/easyplots",
    "~/Library/Caches/EasyPlots",
    "~/Library/Caches/com.praddy.easyplots",
    "~/Library/Preferences/com.praddy.easyplots.plist",
    "~/Library/WebKit/com.praddy.easyplots",
  ]

  caveats <<~EOS
    EasyPlots is ad-hoc signed, not notarised by Apple (it has no paid developer
    account). The first time you open it, macOS may refuse; allow it in
      System Settings > Privacy & Security > Open Anyway
    Or remove the download quarantine yourself:
      xattr -dr com.apple.quarantine /Applications/EasyPlots.app

    It lives in the menu bar; the default hotkey is Ctrl+Option+P.
  EOS
end
