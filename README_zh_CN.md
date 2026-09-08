# YuKaze

[English](README.md)

[![Release](https://img.shields.io/github/v/release/Hikazuki-Network/YuKaze?display_name=tag&sort=semver&style=flat-square)](https://github.com/Hikazuki-Network/YuKaze/releases)
[![Downloads](https://img.shields.io/github/downloads/Hikazuki-Network/YuKaze/total?style=flat-square)](https://github.com/Hikazuki-Network/YuKaze/releases)
[![License](https://img.shields.io/github/license/Hikazuki-Network/YuKaze?style=flat-square)](LICENSE)

YuKaze 是基于 [Mihomo](https://github.com/MetaCubeX/mihomo) 的开源多平台代理客户端，可在 Android、Windows、macOS 和 Linux 上统一管理代理配置、订阅、规则与运行状态。

YuKaze 不提供代理节点或订阅服务。请仅在合法且获得授权的场景中使用配置与订阅。

## 功能

- 支持 Android、Windows、macOS 和 Linux。
- 管理配置文件、订阅、代理组和 Provider。
- 提供代理延迟测试、连接与流量视图、运行日志。
- 支持规则、脚本与覆写配置工具。
- 自适应 Material 3 界面，支持浅色和深色主题。
- 支持 WebDAV 备份与恢复。
- 在支持的平台提供桌面系统代理、托盘和全局快捷键集成。
- 支持 Android VPN 模式，以及 Windows 通过提权 Helper 使用 TUN 的工作流。

不同操作系统上的系统集成和权限要求有所差异。

## 下载

请从 [GitHub Releases](https://github.com/Hikazuki-Network/YuKaze/releases) 下载最新版本。

不同版本和平台提供的文件不同，可能包括 Android APK、Windows 便携 ZIP 或安装包、macOS DMG 和 Linux 软件包。

## 私有面板配置

仓库不会提交面板地址、中间件 URL 或 AES 密钥。构建启用面板功能的发行版前，请在 `lib/common/site_config.dart` 中填入部署专用配置，并确保填入真实值的文件不会被提交到公开仓库。

| 配置项 | 需要配置的场景 | 用途 |
| --- | --- | --- |
| `middlewareEnabled` | 始终 | 为 `true` 时经由中间件路由；为 `false` 时直接请求面板 API。 |
| `middlewareHost` | `middlewareEnabled` 为 `true` | 私有中间件的 HTTPS 源站地址，不包含路由后缀。 |
| `middlewarePath` | `middlewareEnabled` 为 `true` | 接收加密请求载荷的中间件路由前缀。 |
| `aesKey` | `middlewareEnabled` 为 `true` | 客户端和中间件用于加密请求载荷的 AES 密钥。 |
| `panelHost` | `middlewareEnabled` 为 `false` | 兼容面板 API 的 HTTPS 源站地址。 |
| `apiPrefix` | `middlewareEnabled` 为 `false` | API 路径前缀，通常为 `/api/v1`。 |
| `siteName` | 可选 | 面板界面显示的站点名称。 |
| `globalUa` | 可选 | 订阅和面板请求使用的默认 User-Agent。 |

本地请使用占位值，不要写入真实部署信息：

```dart
static const bool middlewareEnabled = true;
static const String middlewareHost = 'https://middleware.example.com';
static const String middlewarePath = '/private-route';
static const String aesKey = '<private-aes-key>';
```

请勿在 issue、PR、发布说明、截图或提交中暴露真实中间件地址和 AES 密钥。公开构建可以保持这些字段为空，但必须在提供有效部署配置后才能使用面板请求。任何被编译进公开客户端的 AES 密钥都可以被提取，因此它只能用于请求载荷兼容或混淆，身份验证与授权必须由中间件执行。

## 从源码构建

发布工作流使用 Flutter `3.44.4`。构建前请安装 Flutter、Go、Git 和对应平台依赖。

```bash
git clone --recurse-submodules https://github.com/Hikazuki-Network/YuKaze.git
cd YuKaze
flutter pub get
```

### Windows

请准备 Flutter Windows 桌面开发工具链、Rust/Cargo；如需生成安装器，还需要 Inno Setup。

```bash
dart setup.dart windows
```

### Android

安装 Android SDK 和 NDK，设置 `ANDROID_NDK` 后运行：

```bash
dart setup.dart android
```

### Linux

安装桌面端依赖后运行：

```bash
sudo apt-get install -y libayatana-appindicator3-dev libkeybinder-3.0-dev
dart setup.dart linux
```

### macOS

```bash
dart setup.dart macos
```

## 开发验证

```bash
flutter analyze --no-fatal-infos
flutter test --reporter expanded
```

仓库专用的构建与验证说明见 [AGENTS.md](AGENTS.md) 和 `.agents/commands.md`。

## 贡献与反馈

请通过 [GitHub Issues](https://github.com/Hikazuki-Network/YuKaze/issues) 提交问题和建议。提交前请搜索已有 issue，并附上 YuKaze 版本、操作系统、复现步骤和相关日志。

## 致谢

YuKaze 基于 [Mihomo](https://github.com/MetaCubeX/mihomo) 和 [FlClash](https://github.com/chen08209/FlClash) 项目的工作构建。

## 许可证

YuKaze 使用 [GNU General Public License v3.0](LICENSE) 许可证。
