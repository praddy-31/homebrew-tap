cask "dispatch" do
  version "1.0.0"
  sha256 "54a1eb2f989d0104d4796480f9736809ba6cbb3852278e2c7af226355d963d80"

  url "https://github.com/praddy-31/dispatch/releases/download/v#{version}/Dispatch-#{version}-arm64.dmg"
  name "Dispatch"
  desc "Menu-bar reader for daily arXiv papers and RSS feeds, with citations"
  homepage "https://github.com/praddy-31/dispatch"

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "Dispatch.app"

  # Only runs with `brew uninstall --zap`. The data folder holds your saved papers, notes,
  # tags, topics and backups, so --zap removes those too.
  zap trash: [
    "~/Library/Application Support/Dispatch",
    "~/Library/Caches/dev.dispatch.reader",
    "~/Library/LaunchAgents/dev.dispatch.reader.login.plist",
    "~/Library/Preferences/dev.dispatch.reader.plist",
    "~/Library/WebKit/dev.dispatch.reader",
  ]

  caveats <<~EOS
    Dispatch is ad-hoc signed, not notarised by Apple (it has no paid developer
    account). The first time you open it, macOS may refuse; allow it in
      System Settings > Privacy & Security > Open Anyway
    Or remove the download quarantine yourself:
      xattr -dr com.apple.quarantine /Applications/Dispatch.app

    Dispatch starts in the menu bar. Pick your arXiv topics and add your own
    news feeds in Topics (Cmd-T).
  EOS
end
