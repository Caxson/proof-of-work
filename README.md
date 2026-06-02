<div align="center">

# proof-of-work

**Make your coding agent prove its work — instead of claiming it.**
**让你的编码 Agent 拿证据说话 —— 而不是嘴上说"搞定了"。**

An engineering-discipline layer for [Claude Code](https://claude.com/claude-code) and [Codex](https://github.com/openai/codex).

`Apache-2.0` · works with Claude Code & Codex · zero dependencies

[English](#english) · [简体中文](#简体中文)

</div>

---

## English

### The problem

Coding agents fail in the same predictable ways, over and over:

- 🩹 They **blame the environment** ("must be a permissions issue") instead of their own bug.
- 🏳️ They **give up at the first blocker** instead of routing around it.
- 🔧 They **patch the symptom** the log printed, not the root cause.
- 🧩 They **special-case** what should be abstracted — and context engineering collapses.
- 🎭 They **claim success without proof**, and you find out it never worked.

**proof-of-work** is a thin, opinionated layer that pushes back on all of that.

### What it does

1. **Injects an Engineering Doctrine every session** — nine hard rules distilled
   from real failure modes: evidence-first attribution, root-cause-not-symptom,
   abstraction-over-special-casing, horizontal testing, "don't stop until you've
   ruled out your own bug," and more.
2. **`verified-delivery`** — when building or fixing, decompose into steps and
   prove **each** one with real actions on **real data** (Playwright screenshots,
   SQL checks, API round-trips, device screenshots). Nothing is "done" without a
   user-confirmed evidence bundle.
3. **`evidence-first-debugging`** — when diagnosing, gather evidence **before**
   naming a cause, suspect your own code first, rank hypotheses with evidence,
   and fix the root cause.

### Works with Claude Code **and** Codex

| Harness | How the doctrine loads | Skills |
|---|---|---|
| **Claude Code** | `SessionStart` hook injects `doctrine.md` into context every session | `verified-delivery` & `evidence-first-debugging` auto-activate; also `/verify`, `/diagnose`, `/doctrine` |
| **Codex** | Ships `AGENTS.md` (Codex auto-reads it) carrying the same doctrine | the two workflows are baked into the doctrine text |

### Install — Claude Code

```
/plugin marketplace add Caxson/proof-of-work
/plugin install proof-of-work
```

Restart Claude Code (or `/clear`). At the next session start you'll see the
Engineering Doctrine injected as additional context.

**Manual triggers:** `/doctrine` (re-surface the doctrine) · `/verify [task]`
(force verified-delivery) · `/diagnose [bug]` (force evidence-first debugging).

### Install — Codex

Codex reads `AGENTS.md`. Either:

- **Per project:** copy this repo's `AGENTS.md` into your project root, or append
  its contents to your existing `AGENTS.md`; or
- **Globally:** append it to `~/.codex/AGENTS.md`.

Codex then follows the doctrine automatically while it works.

### The Doctrine (the nine rules)

1. **Attribution discipline** — assume the bug is *yours* first; read logs before naming a cause.
2. **Engineer around blockers** — route around them; don't blame the environment or quit.
3. **Root cause, not symptom** — never delete data or run on degraded state to "work around" it.
4. **Abstraction over special-casing** — solve the *class* of problem; regex/if-else only for true edge cases.
5. **Integrate across modules** — exercise cross-module contracts; if unsure how they connect, *ask*.
6. **Test horizontally** — cover many realistic paths like a real user, not one happy path.
7. **Don't wait to be scolded** — treat correction as evidence you're wrong; re-examine, don't re-defend.
8. **Stop only for the right reason** — "N failures → stop" is valid *only* after ruling out your own cause.
9. **Use subagents & workflows to verify** — an independent/adversarial perspective catches your own bugs.

Full text: [`doctrine.md`](./doctrine.md).

### What this is **not**

These are **behavioral** rules injected into context. The hook makes the doctrine
present and prominent every session — it does **not** mechanically *enforce*
compliance. It raises the floor; it is not a sandbox.

### License

[Apache-2.0](./LICENSE).

---

## 简体中文

### 问题

编码 Agent 总在同样的地方翻车，一次又一次：

- 🩹 **甩锅环境**（"应该是权限问题吧"），而不是查自己的 bug。
- 🏳️ **一遇阻碍就放弃**，而不是想办法绕过去。
- 🔧 **只修日志报的那一条**（治标），不找根因。
- 🧩 该抽象的地方用**特例/正则硬凑** —— 上下文工程直接崩塌。
- 🎭 **没有证据就说"成功了"**，结果你发现它根本没跑通。

**proof-of-work** 是一层精简、有主见的约束，专门跟这些毛病对着干。

### 它做三件事

1. **每次会话注入一套工程行为准则** —— 9 条从真实翻车里提炼的硬规则：
   归因先怀疑自己、根因而非治标、抽象优先于特例、水平/发散测试、
   "没排除自己的 bug 之前不准停" 等等。
2. **`verified-delivery`（实证交付）** —— 做功能/修 bug 时，拆成多步，
   **每一步**都用真实操作 + **真实数据**去证明（Playwright 截图、查 SQL、
   API 闭环、真机截图）。没有用户确认的凭证链，就不算"完成"。
3. **`evidence-first-debugging`（证据优先调试）** —— 诊断时**先拿证据再下结论**，
   先怀疑自己的代码，按证据给假设排序，修根因。

### 同时支持 Claude Code **和** Codex

| Harness | doctrine 怎么加载 | Skill |
|---|---|---|
| **Claude Code** | `SessionStart` hook 每次会话把 `doctrine.md` 注入上下文 | `verified-delivery` / `evidence-first-debugging` 自动触发；另有 `/verify`、`/diagnose`、`/doctrine` |
| **Codex** | 提供 `AGENTS.md`（Codex 自动读取），承载同一份 doctrine | 两条工作流已写进 doctrine 文本里 |

### 安装 —— Claude Code

```
/plugin marketplace add Caxson/proof-of-work
/plugin install proof-of-work
```

重启 Claude Code（或 `/clear`）。下次会话开头就能看到工程行为准则被注入。

**手动触发：** `/doctrine`（重新唤出准则）· `/verify [任务]`（强制走实证交付）·
`/diagnose [bug]`（强制走证据优先调试）。

### 安装 —— Codex

Codex 读取 `AGENTS.md`。二选一：

- **按项目：** 把本仓库的 `AGENTS.md` 复制到你的项目根目录，或把内容追加到你已有的 `AGENTS.md`；
- **全局：** 追加到 `~/.codex/AGENTS.md`。

之后 Codex 干活时会自动遵循这套准则。

### 准则（9 条）

1. **归因纪律** —— 卡住时先假设是*自己*的 bug；下结论前先读日志。
2. **障碍工程** —— 想办法绕过去，别甩锅环境、别摆烂。
3. **根因而非治标** —— 绝不靠删数据 / 降级状态去"绕过"问题。
4. **抽象优先** —— 解决"这一类"问题；正则/if-else 只留给真·特例。
5. **跨模块关联** —— 联调模块间契约；不懂怎么连就*问*。
6. **水平测试** —— 像真实用户那样覆盖多条路径，不是一条 happy path。
7. **不等挨骂** —— 把纠正当成"我错了"的信号，复查而非辩护。
8. **正确的止损条件** —— "失败 N 次就停"仅在已排除自身原因后才成立。
9. **善用子 agent 与 workflow 验证** —— 独立/对抗式视角最能抓出自己的 bug。

完整版见 [`doctrine.md`](./doctrine.md)。

### 最后的话

这些是注入上下文的**行为**规则。hook 只能让准则每次会话都醒目地摆在 Agent 面前，
**并不能机械强制**它遵守。它抬高下限，但不是沙箱。

### 协议

[Apache-2.0](./LICENSE)。
