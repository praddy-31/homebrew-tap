cask "habit-tracker" do
  version "3.0.0"
  sha256 "3063c95873f3be4b1efac8240077ad51cd1e01dde5f79b0ee52e942b7045fb96"

  url "https://github.com/praddy-31/Habit-Tracker/releases/download/v#{version}/HabitTracker-#{version}-arm64.dmg"
  name "Habit Tracker"
  desc "Private, offline habit tracker that keeps your data in one file"
  homepage "https://github.com/praddy-31/Habit-Tracker"

  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "Habit Tracker.app"

  # Only runs with `brew uninstall --zap`. Your habits in
  # ~/Library/Application Support/local.habit.tracker are deliberately kept.
  zap trash: [
    "~/Library/Caches/local.habit.tracker",
    "~/Library/Preferences/local.habit.tracker.plist",
    "~/Library/Saved Application State/local.habit.tracker.savedState",
    "~/Library/WebKit/local.habit.tracker",
  ]

  caveats <<~EOS
    Habit Tracker is ad-hoc signed, not notarised by Apple (it has no paid developer
    account). The first time you open it, macOS may refuse; allow it in
      System Settings > Privacy & Security > Open Anyway
    Or remove the download quarantine yourself:
      xattr -dr com.apple.quarantine "/Applications/Habit Tracker.app"
  EOS
end
