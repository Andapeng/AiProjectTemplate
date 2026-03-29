# Agent 角色（Agents）

本目录定义 **默认多智能体角色** 的输入/输出契约与权限边界。运行时实现可替换，文档为 **Source of Truth**。

在 **Cursor** 中可将各角色落地为 Subagent：见 [`.cursor/agents/`](../.cursor/agents/README.md)（精简委派提示；本目录仍为完整契约）。

| 文件 | 角色 |
|------|------|
| [planner.md](planner.md) | Planner — 分解与上下文裁剪 |
| [architect.md](architect.md) | Architect — 设计与 ADR |
| [implementer.md](implementer.md) | Implementer — 实现 |
| [reviewer.md](reviewer.md) | Reviewer — 审查 |
| [tester.md](tester.md) | Tester — 测试与评测 |
| [ops-observer.md](ops-observer.md) | OpsObserver — 运维与成本 |

编排总则：[`docs/04-agent-orchestration/overview.md`](../docs/04-agent-orchestration/overview.md)
