#!/usr/bin/env bash
set -euo pipefail

# ======================
# import helper script
# ======================

# Check if machinectl exists
if ! command -v machinectl >/dev/null 2>&1; then
  echo "Error: 'machinectl' is not installed or not in PATH. Exiting."
  exit 1
fi

# Determine which command to use: importctl if available, fallback to machinectl
if command -v importctl >/dev/null 2>&1; then
  PULL_CMD="importctl pull-tar -mN"
else
  echo "Warning: 'importctl' not found, falling back to 'machinectl pull-tar'"
  PULL_CMD="machinectl pull-tar"
fi

# Available distributions
DISTROS=("centos-10" "debian-sid" "fedora-rawhide" "ubuntu-questing")

# Detect architecture
ARCH_UNAME=$(uname -m)
case "$ARCH_UNAME" in
  x86_64) ARCH="amd64" ;;
  aarch64) ARCH="arm64" ;;
  *)
    echo "Architecture '$ARCH_UNAME' is not supported. Only amd64 or arm64 are supported."
    exit 1
    ;;
esac

# Prompt user to select distribution
echo "Please choose a distribution:"
select DISTRO in "${DISTROS[@]}"; do
  if [[ -n "$DISTRO" ]]; then
    echo "You selected: $DISTRO"
    break
  else
    echo "Invalid selection, please try again."
  fi
done

# Construct tarball URL
TARBALL_URL="https://github.com/albertescanes/nspawn-machines/releases/download/latest/${DISTRO}-${ARCH}-rootfs.tar.xz"

echo ""
echo "Selected distribution: $DISTRO"
echo "Detected architecture: $ARCH"
echo "Downloading and importing tarball from:"
echo "  $TARBALL_URL"
echo ""

# Execute the appropriate pull command with checksum verification
$PULL_CMD "$TARBALL_URL" "$DISTRO" --verify=checksum
