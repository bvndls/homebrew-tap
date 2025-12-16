class BitwardenCliOss < Formula
    desc "Bitwarden CLI OSS from latest GitHub release"
    homepage "https://github.com/bitwarden/clients"
    # placeholder
    url "https://raw.githubusercontent.com/bitwarden/clients/refs/heads/main/package.json"
    version "latest"
  
    def install
      jq_filter = '.[] | select(.tag_name | startswith("cli-v")) | select(.draft == false and .prerelease == false) | .assets[] | select(.name | contains("bw-oss-macos-arm64")) | .browser_download_url'
  
      cmd = %(curl -s https://api.github.com/repos/bitwarden/clients/releases | jq -r '#{jq_filter}' | head -n 1)
      download_url = Utils.safe_popen_read("sh", "-c", cmd).strip
      odie "Failed to determine Bitwarden CLI OSS download URL" if download_url.empty?
  
      extract_dir = buildpath / "extracted"
      extract_dir.mkpath
  
      system "curl", "-L", download_url, "-o", extract_dir / "bw.zip"
      system "unzip", "-q", extract_dir / "bw.zip", "-d", extract_dir
  
      executable = Dir.glob(File.join(extract_dir, "*")).find { |f| File.file?(f) && File.executable?(f) && !f.end_with?(".zip") }
      odie "No executable found at the root of the Bitwarden zip" unless executable
  
      bin.install executable
    end
  end