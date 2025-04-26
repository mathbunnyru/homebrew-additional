#!/usr/bin/env python3
import argparse
import json
import re
import subprocess
from pathlib import Path

THIS_SCRIPT = Path(__file__).resolve()
REPO_ROOT = THIS_SCRIPT.parent.parent.parent


def load_livecheck_data(livechek_json: Path) -> tuple[str, str]:
    with open(livechek_json) as f:
        data = json.load(f)[0]["version"]

    current_version = data["current"]
    latest_version = data["latest"]

    print(f"Current version: {current_version}")
    print(f"Latest version: {latest_version}")

    return current_version, latest_version


def extract_arch_hashes(version: str) -> dict[str, str]:
    # Based on the URL pattern, reconstruct download URLs
    base_url = "https://downloads.exodus.com/releases/"
    downloads = {
        "arm": f"{base_url}exodus-macos-arm64-{version}.dmg",
        "intel": f"{base_url}exodus-macos-{version}.dmg",
    }
    print(f"Download URLs: {downloads}")

    hashes = {}
    for arch, url in downloads.items():
        subprocess.run(
            [
                "curl",
                "-A",
                "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0",
                "-L",
                "-o",
                f"{arch}.dmg",
                url,
            ],
            check=True,
        )
        sha_result = subprocess.run(
            ["shasum", "-a", "256", f"{arch}.dmg"],
            capture_output=True,
            check=True,
            text=True,
        )
        sha = sha_result.stdout.split()[0]
        hashes[arch] = sha

    return hashes


def update_exodus_rb(exodus_rb: Path, new_version: str, hashes: dict[str, str]) -> None:
    content = exodus_rb.read_text()

    # Update version
    content = re.sub(r'version\s+"[\d.]+"', f'version "{new_version}"', content)

    # Update hashes
    content = re.sub(
        r'sha256 arm:\s+"[a-f0-9]+",\s*intel:\s+"[a-f0-9]+"',
        f'sha256 arm:   "{hashes["arm"]}",\n         intel: "{hashes["intel"]}"',
        content,
    )

    exodus_rb.write_text(content)


def main() -> None:
    arg_parser = argparse.ArgumentParser(
        description="Update exodus.rb with new version and hashes."
    )
    arg_parser.add_argument(
        "--livecheck-json",
        type=Path,
        help="Path to the livecheck.json file.",
    )
    arg_parser.add_argument(
        "--exodus-rb",
        type=Path,
        help="Path to the exodus.rb file.",
    )
    args = arg_parser.parse_args()

    current_version, latest_version = load_livecheck_data(args.livecheck_json)
    if current_version == latest_version:
        print("No update needed.")
        return

    print("Update needed. Fetching new hashes...")
    hashes = extract_arch_hashes(latest_version)
    print(f"Hashes: {hashes}")

    update_exodus_rb(args.exodus_rb, latest_version, hashes)


if __name__ == "__main__":
    main()
