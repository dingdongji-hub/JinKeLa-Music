# 金坷垃云音乐 · JinKeLa-Music

> 一个基于 **HarmonyOS(鸿蒙)** 开发的音乐播放器 App
> 使用 **DevEco Studio** + **ArkTS** + **ArkUI** 声明式框架,Stage 工程模型。

---

## 📱 项目简介

仿「网易云音乐」风格的手机音乐 App,包含引导页、底部四页签、推荐歌单、在线播放、播放列表等完整功能。

| 项目信息 | 值 |
|---|---|
| 应用包名 | `com.example.music` |
| 开发工具 | DevEco Studio |
| 开发语言 | ArkTS(方舟语言,基于 TypeScript) |
| UI 框架 | ArkUI(声明式 UI) |
| 工程模型 | Stage 模型 |
| SDK | HarmonyOS(API 16 → 26) |
| 支持设备 | phone / tablet / 2in1 |

---

## ✨ 功能特性

- 🚀 **引导 / 广告页**:展示海报,3 秒自动进入主界面,支持"跳过"
- 🧭 **底部四页签**:推荐 / 发现 / 动态 / 我的
- 🎵 **推荐页**:搜索框、Banner 轮播、每日推荐横滑、推荐歌单
- 🔍 **发现页**:「猜你喜欢」歌曲列表,点击任意一首即可播放
- 💿 **播放页**:旋转唱片 + 唱针动画、模糊封面背景、进度条拖动、播放列表面板(支持侧滑删除)
- 🎧 **在线播放**:基于 `@kit.MediaKit` 的 `AVPlayer` 实现
- 🔄 **全局状态**:用 `AppStorageV2` + `@ObservedV2 / @Trace` 跨页面共享"当前正在播放的歌曲"

---

## 🛠️ 技术要点

| 技术 | 用途 |
|---|---|
| `Navigation` + `NavPathStack` | 页面路由与跳转 |
| `Tabs` + `TabContent` | 底部导航栏 |
| `media.AVPlayer` | 音频播放引擎(状态机:initialized → prepared → play) |
| `AppStorageV2` + `@ObservedV2 / @Trace` | 跨页面响应式状态共享 |
| `@ComponentV2` / `@Local` | 组件级状态管理 |
| `@Builder` / `NavDestination` | 自定义构建函数与路由页面 |

---

## 📂 目录结构

```
music/
├── AppScope/                      # 应用级配置与图标
├── entry/                         # 主模块(entry)
│   └── src/main/
│       ├── ets/
│       │   ├── entryability/      # EntryAbility:应用入口
│       │   ├── models/            # 数据模型
│       │   │   ├── music.ets          # SongItemType 歌曲结构
│       │   │   └── globalMusic.ets    # 全局当前歌曲状态
│       │   ├── pages/             # 页面
│       │   │   ├── Index.ets          # 入口页 / 路由容器
│       │   │   ├── Start.ets          # 引导 / 广告页
│       │   │   ├── Layout.ets         # 主界面(底部四页签)
│       │   │   ├── recommend.ets      # 推荐页
│       │   │   ├── find.ets           # 发现页
│       │   │   ├── Play.ets           # 播放页(核心)
│       │   │   ├── moment.ets         # 动态页(占位)
│       │   │   └── mind.ets           # 我的页(占位)
│       │   └── utils/
│       │       └── AvPlayerManager.ets # 播放器管理(单例)
│       ├── resources/             # 图片 / 图标 / 配色 / 路由配置
│       └── module.json5           # 模块配置(含 INTERNET 权限)
├── build-profile.json5            # 工程构建与 SDK 配置
├── oh-package.json5               # 依赖管理
└── hvigorfile.ts                  # 构建脚本
```

---

## 🚀 如何运行

1. 用 **DevEco Studio** 打开本工程根目录
2. 等待工程同步(Sync)完成
3. 连接真机 / 启动模拟器(或使用内置预览器 Previewer)
4. 选择 `entry` 模块,点击运行 ▶

---

## 📌 说明

- 音频与图片资源来自网络(教学用 OSS 存储),**运行需要联网**。
- 「动态」「我的」两个页签目前为占位页,后续可继续完善。

---

## 📄 License

本项目仅供学习交流使用。
