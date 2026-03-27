# 通用 AI 工程模板（技术栈无关）

本仓库提供一套**规范驱动开发（Specification-Driven Development）** + **上下文工程（Context Engineering）** 的工程骨架，用于缓解 AI **上下文窗口**与**短期记忆**限制，使人类与 AI 都能快速检索：约束、历史实现与演进路线。

## 核心理念

| 原则 | 含义 |
|------|------|
| 文档即上下文 | 稳定知识进 `docs/` 与 `memory/`，任务知识进 `specs/` 与任务单 |
| 规范即接口 | API / Tool / Prompt I/O 等契约在 `docs/02-interfaces/` 与 `specs/` 中显式定义 |
| 计划即记忆 | 路线图、ADR、时间线共同构成可追溯的长期判断依据 |

## 目录导览

| 路径 | 用途 |
|------|------|
| [docs/00-project-charter.md](docs/00-project-charter.md) | 项目宪章：愿景、边界、成功指标 |
| [docs/01-architecture/](docs/01-architecture/) | 架构总览与 ADR |
| [docs/02-interfaces/](docs/02-interfaces/) | 接口与契约规范 |
| [docs/03-context-engineering/](docs/03-context-engineering/) | 上下文分层、检索与压缩 |
| [docs/04-agent-orchestration/](docs/04-agent-orchestration/) | 多智能体编排 |
| [docs/05-long-running-agents/](docs/05-long-running-agents/) | 长时运行 Agent |
| [docs/06-quality-and-testing/](docs/06-quality-and-testing/) | 测试与 AI 评测、发布门禁 |
| [docs/07-roadmap/roadmap.md](docs/07-roadmap/roadmap.md) | 路线图 Now/Next/Later |
| [docs/08-todo/](docs/08-todo/) | 待办与任务规范 |
| [docs/09-operations/](docs/09-operations/) | 运维、成本与观测 |
| [docs/10-governance/security-privacy.md](docs/10-governance/security-privacy.md) | 安全、隐私与合规 |
| [memory/](memory/) | 长期记忆库与索引 |
| [agents/](agents/) | Agent 角色与契约 |
| [prompts/](prompts/) | 提示词资产 |
| [specs/](specs/) | 需求/设计/验收规格 |
| [tests/](tests/) | 测试与评测集组织 |
| [templates/](templates/) | ADR、RFC、任务单等模板 |

## 快速开始（复制为新项目后）

1. 阅读并填写 [docs/00-project-charter.md](docs/00-project-charter.md)。
2. 在 [specs/](specs/) 新建首条需求规格，并链接到 [docs/07-roadmap/roadmap.md](docs/07-roadmap/roadmap.md)。
3. 重大设计变更使用 [templates/adr-template.md](templates/adr-template.md) 写入 `docs/01-architecture/decision-records/`。
4. 每个可交付任务使用 [templates/task-template.md](templates/task-template.md)，完成后按 [memory/CONTRIBUTING.md](memory/CONTRIBUTING.md) 写回记忆。
5. 可先跑最小演练链路：
   - [specs/requirements/REQ-001-minimal-template-flow.md](specs/requirements/REQ-001-minimal-template-flow.md)
   - [specs/design/DES-001-minimal-template-flow.md](specs/design/DES-001-minimal-template-flow.md)
   - [specs/acceptance/ACC-001-minimal-template-flow.md](specs/acceptance/ACC-001-minimal-template-flow.md)
   - [tests/evals/critical/eval-0001-minimal-flow.yaml](tests/evals/critical/eval-0001-minimal-flow.yaml)
6. 运行模板健康检查：`powershell -ExecutionPolicy Bypass -File "scripts/template-health-check.ps1"`（报告输出到 `scripts/reports/template-health-report.json`）
7. 若使用 GitHub，可直接复用模板 CI：`.github/workflows/template-health-check.yml`

## AI / 协作者检索顺序（建议）

1. **CoreContext**：宪章 → 架构 overview → 接口总则 → 安全分级  
2. **TaskContext**：当前任务单 + 关联 `specs/`  
3. **MemoryContext**：`memory/index.md` → 相关条目与 ADR  
4. **外部资料**：仅在以上不足时检索

文档膨胀时先参考归档策略：

- [docs/03-context-engineering/archive-strategy.md](docs/03-context-engineering/archive-strategy.md)
- 检索优先级：主路径索引/overview > 定向归档条目

## Cursor 规则（已内置）

本模板已提供全局规则，位置：`.cursor/rules/`

- `context-retrieval-order.mdc`：固定文档检索顺序
- `spec-first.mdc`：先规格后实现
- `context-budget.mdc`：渐进检索与上下文预算
- `memory-writeback.mdc`：任务完成后记忆写回
- `review-gate.mdc`：变更审查与发布门禁

配套自检模板：

- [`templates/rule-self-checklist.md`](templates/rule-self-checklist.md)：将规则执行转为可勾选证据清单

## 模板 CI（可复用）

- 工作流文件：`.github/workflows/template-health-check.yml`
- 触发：`push` / `pull_request`
- 执行：运行 `scripts/template-health-check.ps1`
- 产物：上传 `scripts/reports/template-health-report.json`

## 许可证

本项目采用 [MIT License](LICENSE)。
