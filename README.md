# nspawn-machines

Minimal rootfs builds for *systemd-nspawn*.

## Usage

### Import your desired distribution

Use the interactive helper script:

> [!WARNING]  
> Always be careful when running scripts from the Internet.

```shell
bash <(curl -fsSL https://raw.githubusercontent.com/albertescanes/nspawn-machines/main/import-helper.sh)
```

### Start and enter the machine

```
machinectl start <machine_name>
machinectl shell <machine_name>
```
