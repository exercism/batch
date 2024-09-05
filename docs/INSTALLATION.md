# Installation

## Windows (Recommended)

Are you using a Windows operating system?

Press `Windows Key`, type `cmd`, and press `enter`.

> Batch is already installed on your system if your operating system is Windows.

If you are using a different operating system, you can install Batch by following the instructions below.

## Mac OS

1. Gatekeeper must not be set to block unsigned packages.
2. Open the Terminal application.
3. Run the following command to install Batch:

```bash
brew install --cask --no-quarantine wine-stable
```

## Ubuntu

1. If your system is 64 bit, enable 32 bit architecture (if you haven't already):

```bash
sudo dpkg --add-architecture i386
```

2. Add the WineHQ repository:

```bash
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo apt update
```

3. Install WineHQ:

```bash
sudo apt install --install-recommends winehq-stable
```

## Debian

1. If your system is 64 bit, enable 32 bit architecture (if you haven't already):

```bash
sudo dpkg --add-architecture i386
```

2. Add the WineHQ repository:

```bash
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo apt update
```

3. Install WineHQ:

```bash
sudo apt install --install-recommends winehq-stable
```

## Fedora

1. Enable the Wine repository:

```bash
# Fedore 39
dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/39/winehq.repo

# Fedora 40
dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/40/winehq.repo
```

2. Install WineHQ:

```bash
dnf install winehq-stable
```
