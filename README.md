# nspawn-machines

Minimal rootfs builds for *systemd-nspawn*.

## Usage

1. **Download and unzip** the latest artifact of your choice.

2. **Import the tarball** as a machine:

   ```
   importctl import-tar -m <tarball> <machine_name>
   ```

3. **Enable host networking** (optional):

   ```
   run0 machinectl edit <machine_name>
   ```

   This opens your `$EDITOR`. Add the following:

   ```ini
   [Network]
   VirtualEthernet=no
   ```

4. **Start the machine:**

   ```
   machinectl start <machine_name>
   ```

5. **Enter the machine:**

   ```
   machinectl shell <machine_name>
   ```
