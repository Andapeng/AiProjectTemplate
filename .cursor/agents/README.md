# Cursor Subagents（`.cursor/agents/`）

本目录为 [Cursor Subagents](https://www.cursor.com/docs/context/subagents) 定义文件。详细角色契约仍以仓库根目录 [`agents/`](../agents/README.md) 为 **Source of Truth**；此处为**精简、可委派**的提示与元数据。

## 与 `agents/` 的对应关系

| Subagent 文件 | 完整契约 | 典型触发 |
|---------------|----------|----------|
| `planner.md` | [`agents/planner.md`](../agents/planner.md) | 拆任务、产出 Context Pack、任务单草案 |
| `architect.md` | [`agents/architect.md`](../agents/architect.md) | 模块边界、ADR/设计规格草案 |
| `implementer.md` | [`agents/implementer.md`](../agents/implementer.md) | 主 Agent 已锁定规格后，委派实现（可选） |
| `reviewer.md` | [`agents/reviewer.md`](../agents/reviewer.md) | 变更后独立审查（建议显式 `/reviewer`） |
| `tester.md` | [`agents/tester.md`](../agents/tester.md) | 跑测试/补评测、输出报告 |
| `ops-observer.md` | [`agents/ops-observer.md`](../agents/ops-observer.md) | 运维/成本/SLO 影响评估（只读建议） |

## 调用方式

- 显式：`/planner`、`/reviewer` 等（以各文件 `name` 为准）。
- 自然语言：「用 reviewer 子代理审查本次改动」。
- 自动委派：依赖各文件 `description`；请把描述写得**具体**（官方建议）。

编排协议见 [`docs/04-agent-orchestration/overview.md`](../docs/04-agent-orchestration/overview.md)。
