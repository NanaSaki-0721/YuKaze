# YuKaze

[简体中文](README_zh_CN.md)

[![Release](https://img.shields.io/github/v/release/Hikazuki-Network/YuKaze?display_name=tag&sort=semver&style=flat-square)](https://github.com/Hikazuki-Network/YuKaze/releases)
[![Downloads](https://img.shields.io/github/downloads/Hikazuki-Network/YuKaze/total?style=flat-square)](https://github.com/Hikazuki-Network/YuKaze/releases)
[![License](https://img.shields.io/github/license/Hikazuki-Network/YuKaze?style=flat-square)](LICENSE)

YuKaze is an open-source, multi-platform proxy client powered by [Mihomo](https://github.com/MetaCubeX/mihomo). It provides a unified interface for managing proxy profiles, subscriptions, rules, and runtime status on Android, Windows, macOS, and Linux.

YuKaze does not provide proxy nodes or subscription services. Use profiles and subscriptions only where they are lawful and authorized.

## Highlights

- Cross-platform support for Android, Windows, macOS, and Linux.
- Profile, subscription, proxy-group, and provider management.
- Proxy delay testing, connection and traffic views, and runtime logs.
- Rule, script, and override configuration tools.
- Adaptive Material 3 interface with light and dark themes.
- WebDAV backup and restore.
- Desktop system-proxy, tray, and hotkey integration where supported.
- Android VPN mode and Windows elevated-helper support for TUN workflows.

Platform integrations and permission requirements vary by operating system.

## Download

Download the latest release from [GitHub Releases](https://github.com/Hikazuki-Network/YuKaze/releases).

Release assets vary by tag and platform. They can include Android APKs, Windows portable ZIP or installer packages, macOS DMGs, and Linux packages.

## Private Panel Configuration

The repository intentionally contains no panel endpoint, middleware URL, or AES key. To build a panel-enabled distribution, configure `lib/common/site_config.dart` with deployment-specific values before building, and keep the configured file out of public commits.

| Field | Required when | Purpose |
| --- | --- | --- |
| `middlewareEnabled` | Always | Selects middleware routing when `true`, or direct panel API routing when `false`. |
| `middlewareHost` | `middlewareEnabled` is `true` | HTTPS origin of the private middleware, without the route suffix. |
| `middlewarePath` | `middlewareEnabled` is `true` | Middleware route prefix that accepts the encrypted request payload. |
| `aesKey` | `middlewareEnabled` is `true` | AES key used by the client and middleware to encrypt the request payload. |
| `panelHost` | `middlewareEnabled` is `false` | HTTPS origin of the compatible panel API. |
| `apiPrefix` | `middlewareEnabled` is `false` | API path prefix, normally `/api/v1`. |
| `siteName` | Optional | Name displayed by the panel interface. |
| `globalUa` | Optional | Default User-Agent for subscription and panel requests. |

Use placeholders locally rather than publishing real deployment data:

```dart
static const bool middlewareEnabled = true;
static const String middlewareHost = 'https://middleware.example.com';
static const String middlewarePath = '/private-route';
static const String aesKey = '<private-aes-key>';
```

Do not put real middleware endpoints or AES keys in issues, pull requests, release notes, screenshots, or commits. A public build can leave these fields empty, but panel requests will not work until valid deployment configuration is supplied. Any AES key compiled into a distributed client can be extracted, so use it only for request-payload compatibility or obfuscation; enforce authentication and authorization in the middleware.

## Build From Source

The release workflow uses Flutter `3.44.4`. Install Flutter, Go, Git, and the platform prerequisites before building.

```bash
git clone --recurse-submodules https://github.com/Hikazuki-Network/YuKaze.git
cd YuKaze
flutter pub get
```

### Windows

Use a Windows Flutter desktop toolchain, Rust/Cargo, and Inno Setup when producing an installer.

```bash
dart setup.dart windows
```

### Android

Install the Android SDK and NDK, set `ANDROID_NDK`, then run:

```bash
dart setup.dart android
```

### Linux

Install the desktop dependencies, then run:

```bash
sudo apt-get install -y libayatana-appindicator3-dev libkeybinder-3.0-dev
dart setup.dart linux
```

### macOS

```bash
dart setup.dart macos
```

## Development Checks

```bash
flutter analyze --no-fatal-infos
flutter test --reporter expanded
```

See [AGENTS.md](AGENTS.md) and `.agents/commands.md` for repository-specific build and verification guidance.

## Contributing

Report bugs and propose improvements through [GitHub Issues](https://github.com/Hikazuki-Network/YuKaze/issues). Before opening an issue, search existing reports and include the YuKaze version, operating system, reproduction steps, and relevant logs.

## Acknowledgements

YuKaze builds on the work of [Mihomo](https://github.com/MetaCubeX/mihomo) and the [FlClash](https://github.com/chen08209/FlClash) project.

## License

YuKaze is licensed under the [GNU General Public License v3.0](LICENSE).
