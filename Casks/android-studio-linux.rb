cask "android-studio-linux" do
  sha256 "36832122557ab73ca68dfd9bd989ddac40103ac003ca10e04c949a1f61578a67"
  version "2026.1.3.7,quail3,AI-261.26222.65.2613.15948027"

  url "https://dl.google.com/dl/android/studio/ide-zips/#{version.csv.first}/android-studio-#{version.csv.second}-linux.tar.gz", verified: "dl.google.com/dl/android/studio/"
  name "Android Studio"
  desc "Tools for building Android applications"
  homepage "https://developer.android.com/studio/"

  livecheck do
    url "https://jb.gg/android-studio-releases-list.json"
    strategy :json do |json|
      json.dig("content", "item")&.filter_map do |release|
        next unless %w[Patch Release].include?(release["channel"])

        build = release["build"]
        version = release["version"]
        download = release["download"]&.find { |item| item["link"]&.end_with?("-linux.tar.gz") }

        match = download&.dig("link")&.match(%r{/android-studio-([^/]+)-linux\.tar\.gz\z}i)

        next if version.blank? || build.blank? || match.blank?

        "#{version},#{match[1]},#{build}"
      end
    end
  end

  depends_on :linux
  depends_on formula: "openjdk"

  binary "android-studio/bin/studio"

  zap trash: [
    "~/.android",
    "~/.config/Google/AndroidStudio#{version.major_minor}",
    "~/.cache/Google/AndroidStudio#{version.major_minor}",
    "~/.local/share/Google/AndroidStudio#{version.major_minor}",
  ],
  rmdir: "~/AndroidStudioProjects"
end
