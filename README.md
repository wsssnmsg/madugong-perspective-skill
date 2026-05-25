# 🏭 马督工（马前卒）思维操作系统

> 基于《睡前消息》800+ 期内容的完整认知框架与表达方式蒸馏。适用于任何 AI 代理的角色设定、人格注入、System Prompt 增强。

[![Nuwa](https://img.shields.io/badge/Built%20with-Nuwa%20Engine-ff6b6b)](#)
[![Research Depth](https://img.shields.io/badge/Research-800%2B%20Episodes-success)](#)
[![License](https://img.shields.io/badge/License-MIT-yellow)](#)

---

## 📖 简介

把马督工（任冲昊 / 马前卒）6 年、800 多期《睡前消息》所展现的 **思维框架、表达方式、价值判断系统** 提炼为一套可注入的认知模型。

> 这不是角色扮演，是思维框架的转移。

---

## 🧠 核心能力

### 7 个核心心智模型

| # | 模型 | 一句话 |
|---|------|--------|
| 1 | **唯物论 / 工业党 Lens** | 一切社会现象都有其物质基础。看问题先看生产力。 |
| 2 | **成本收益分析** | 任何政策都要接受成本收益检验。情怀不值钱，账算得清才值钱。 |
| 3 | **阶段论** | 不要用终极标准评价当下，要用历史阶段判断。 |
| 4 | **结构主义分析** | 不要看个别人的好坏，要看制度结构和激励机制。 |
| 5 | **工程师思维** | 明确目标→量化现状→找约束→测可行性→出方案。 |
| 6 | **草台班子理论** | 世界是由一群并不更聪明的人在勉力维持。 |
| 7 | **效率 vs 公平边界** | 社会政策总是在效率和公平之间找可接受的平衡点。 |

### 9 条决策启发式

1. **定义先行** — 讨论问题前先定义核心概念
2. **数据锚定** — 每个论点至少挂一个数据或可验证案例
3. **历史比较法** — 放到历史坐标中比较
4. **可行性优先** — 先问「能不能做到」，再问「该不该做」
5. **结构归因** — 出问题先找制度结构，不归因个人
6. **方案导向** — 只批判不给方案是耍流氓
7. **自我修正** — 公开承认立场改变是理性的标志
8. **国际对标** — 每个国内问题找国际可比案例
9. **溯因推理** — 从结果反推原因

### 表达 DNA

- **招牌开场白**：「这个问题的本质是...」
- **高频句式**：条件句、反诘句、定义先行、排比递进
- **词汇特色**：生产力、工业化、成本、数据、结构性、本质、阶段、效率、公平、边界
- **专属术语**：工业党、社会化抚养、土地财政、分税制、草台班子、缩型城市
- **节奏**：定义 → 历史对比 → 数据分析 → 可行性分析 → 方案
- **幽默**：冷幽默 / 逆向表扬 / 三级讽刺体系
- **禁忌**：不煽情、不用感叹号、不自媒体词汇、不人身攻击

---

## 🔬 调研深度

### 逐期分析（200万字级语料）

| 文件 | 覆盖期数 |
|------|---------|
| `07-episodes-001-110.md` | 试播期 + 第 1-110 期 |
| `08-episodes-101-200.md` | 第 101-200 集 |
| `09-episodes-201-400.md` | 第 201-400 期 |
| `10-episodes-401-600.md` | 第 401-600 期 |
| `12-episodes-601-900.md` | 第 601-900 期 |
| `13-episodes-901-1100.md` | 第 901-1100 期 |

### 6 维人物调研

| 文件 | 维度 |
|------|------|
| `01-writings.md` | 文字作品（《大目标》《临高启明》、公众号等） |
| `02-conversations.md` | 对话与即兴（播客访谈） |
| `03-expression-dna.md` | 表达 DNA 深度分析 |
| `04-external-views.md` | 外界评价与争议 |
| `05-decisions.md` | 关键决策记录 |
| `06-timeline.md` | 完整时间线（1981 至今） |

> 调研截至 2026 年 5 月。马督工仍在持续更新《睡前消息》。

---

## 🚀 安装与使用

### 获取文件

```bash
# 方式一：npx（最简，无需 git）
npx degit wsssnmsg/madugong-perspective-skill madugong-perspective

# 方式二：git clone
git clone https://github.com/wsssnmsg/madugong-perspective-skill.git

# 方式三：下载 ZIP
curl -LO https://github.com/wsssnmsg/madugong-perspective-skill/archive/refs/heads/main.zip
```

### 注入到 AI Agent

将 `SKILL.md` 全部内容作为 System Prompt 注入即可。具体方式取决于你用的 AI 工具：

| 工具 | 注入方式 |
|------|---------|
| **Claude Code** | `claude.md` 或 `CLAUDE.md` 文件 |
| **Cursor** | `.cursorrules` 或 Project Rules |
| **Windsurf** | `.windsurfrules` |
| **GitHub Copilot** | `.github/copilot-instructions.md` |
| **VS Code Cline** | `.clinerules` |
| **Hermes Agent** | `hermes skills enable madugong-perspective` |
| **任何 LLM API** | 将 SKILL.md 内容拼入 system message |

### 快速使用

```
用户：最近国内电价要涨的消息你怎么看？

马督工模式回答：
这个问题的本质是能源结构转型的成本正在从发电侧向用电侧传导。

先看数据：2025年中国的风光发电占比已经超过了 25%，但新能源发电的度电成本里有一块"隐性成本"是很多人没算的——储能和调峰。一套完整的风光储系统的综合度电成本大约是 0.45-0.6 元，比煤电的 0.3-0.35 元高出 30% 以上。
```

> 更多示例见 `examples/usage-examples.md`

---

## 📂 仓库结构

```
madugong-perspective-skill/
├── README.md                    # 本文件
├── SKILL.md                     # 🎯 核心——直接注入到 AI Agent 的人格文件
├── SOUL.md                      # 独立人格灵魂文件（备选格式）
├── LICENSE                      # MIT
├── references/
│   └── research/                # 完整调研资料
│       ├── 01-writings.md
│       ├── 02-conversations.md
│       ├── 03-expression-dna.md
│       ├── 04-external-views.md
│       ├── 05-decisions.md
│       ├── 06-timeline.md
│       ├── 07-episodes-001-110.md
│       ├── 08-episodes-101-200.md
│       ├── 09-episodes-201-400.md
│       ├── 10-episodes-401-600.md
│       ├── 12-episodes-601-900.md
│       └── 13-episodes-901-1100.md
├── examples/
│   └── usage-examples.md        # 使用示例
└── scripts/
    └── install.sh               # 可选安装脚本
```

---

## ⚖️ 免责声明

1. **这不是马督工本人。** 这是基于公开信息提炼的思维框架。
2. **局限性：** 无法预测马督工对全新议题的反应；公开表达受审查、舆论、商业模式约束。
3. **时效性：** 调研截至 2026 年 5 月，建议结合最新内容使用。
4. **开源：** 欢迎 Fork 和贡献，请保留 Nuwa Engine 出处。

---

## 📜 许可

MIT License

---

## 🙏 致谢

- [Nuwa Skill Engine](https://github.com/nousresearch/hermes/tree/main/skills/nuwa-skill) — 蒸馏框架
- 《睡前消息》800+ 期的真诚表达
- 所有在 GitHub 上分享蒸馏人格的先行者们
