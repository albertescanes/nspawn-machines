# nspawn-machines

Minimal rootfs builds for *systemd-nspawn*.

## Usage

### Recommended: interactive import helper script

The easiest way to import a machine is by using the interactive helper script.  
It will:

- Detect your system architecture automatically
- Let you choose a distribution interactively
- Download the appropriate rootfs
- Import it using `importctl` (or `machinectl` as a fallback)

Run:

> [!WARNING]  
> Be cautious when executing scripts fetched from the Internet.  
> Always review the script contents before running it, especially when piping directly into `bash`.

```bash
curl -s -o- https://raw.githubusercontent.com/albertescanes/nspawn-machines/main/import-helper.sh | bash
```

---

### Manual import

If you prefer to do everything manually:

1. Download the desired rootfs tarball from the **latest** release:  
   https://github.com/albertescanes/nspawn-machines/releases/latest

2. Import the tarball as a machine:

   ```bash
   importctl -m import-tar <tarball> <machine_name>
   ```

   (On older systems, you can use `machinectl import-tar` instead.)

3. Start the machine:

   ```bash
   machinectl start <machine_name>
   ```

4. Enter the machine:

   ```bash
   machinectl shell <machine_name>
   ```

## Available distributions

- `centos-10`
- `debian-sid`
- `fedora-rawhide`
- `ubuntu-questing`

Supported architectures:

- `amd64`
- `arm64`
