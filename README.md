# ProjectName

<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/MoonGrt/FPGA-videoScaler/">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>
  <h3 align="center">videoScaler</h3>
  <p align="center">
    基于fpga的视频流缩放
    <br />
    <a href="https://github.com/MoonGrt/FPGA-videoScaler"><strong>探索本项目的文档 ?</strong></a>
    <br />
    <br />
    <a href="https://github.com/MoonGrt/FPGA-videoScaler">查看Demo</a>
    ·
    <a href="https://github.com/MoonGrt/FPGA-videoScaler/issues">报告Bug</a>
    ·
    <a href="https://github.com/MoonGrt/FPGA-videoScaler/issues">提出新特性</a>
  </p>
</p>

通过双线性插值以及临近插值算法，对视频流进行逐帧缩放。
 
## 目录

- [上手指南](#上手指南)
  - [开发前的配置要求](#开发前的配置要求)
- [文件目录说明](#文件目录说明)
- [框架](#使用到的框架)
- [作者](#作者)
- [鸣谢](#鸣谢)

### 上手指南

…………………………………………………………………………………………

###### 开发前的配置要求

1. vivado 2018.3
2. 依元素科技 EES-331

### 文件目录说明

```
filetree 
├── README.md
├── video_scaler.srcs
│  ├── sources_1
│  │  ├── top.v
│  │  ├── algorithm
│  │  │  └── streamScaler.v
│  │  ├── hdmi_tx
│  │  │  └── dvi_transmitter_top.v
```

### 框架

- [xxxxxxx](https://getbootstrap.com)
- [xxxxxxx](https://jquery.com)
- [xxxxxxx](https://laravel.com)

### 作者

1561145394@qq.com
 *您也可以在贡献者名单中参看所有参与该项目的开发者。*

### 鸣谢

- [GitHub Pages](https://pages.github.com)
- [xxxxxxxxxxxxxx](https://xxxx)
- [xxxxxxxxxxxxxx](https://xxxx)

<!-- links -->
[contributors-shield]: https://img.shields.io/github/contributors/MoonGrt/FPGA-videoScaler.svg?style=flat-square
[contributors-url]: https://github.com/MoonGrt/FPGA-videoScaler/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/MoonGrt/FPGA-videoScaler.svg?style=flat-square
[forks-url]: https://github.com/MoonGrt/FPGA-videoScaler/network/members
[stars-shield]: https://img.shields.io/github/stars/MoonGrt/FPGA-videoScaler.svg?style=flat-square
[stars-url]: https://github.com/MoonGrt/FPGA-videoScaler/stargazers
[issues-shield]: https://img.shields.io/github/issues/MoonGrt/FPGA-videoScaler.svg?style=flat-square
[issues-url]: https://img.shields.io/github/issues/MoonGrt/FPGA-videoScaler.svg
[license-shield]: https://img.shields.io/github/license/MoonGrt/FPGA-videoScaler.svg?style=flat-square
[license-url]: https://github.com/MoonGrt/FPGA-videoScaler/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/shaojintian
