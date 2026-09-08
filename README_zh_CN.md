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
