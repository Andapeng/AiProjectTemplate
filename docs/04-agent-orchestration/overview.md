# 多智能体编排（Multi-Agent Orchestration）

## 1. 目标

将复杂工作拆给**角色清晰、权限可控**的多个 Agent，通过统一**交接协议（Handoff Protocol）**传递上下文，避免单 Agent 过载与职责混乱。

## 2. 默认角色（Default Roles）

| 角色 | 英文名 | 核心产出 | 工具权限建议 |
|------|--------|----------|----------------|
| 规划 | Planner | 任务分解、Context 裁剪列表、依赖排序 | 读 docs/specs/memory；可写任务单草稿 |
| 架构 | Architect | 设计与 ADR 草案、模块边界 | 读全库；写 ADR/specs；禁止直接写生产密钥 |
| 实现 | Implementer | 代码与配置（若项目含代码） | 按最小权限开放终端/文件 |
| 评审 | Reviewer | 审查意见、合并建议 | 只读 + 评论；可写 review 记录 |
| 测试 | Tester | 测试用例、评测跑批、报告 | 读+写 `tests/`；受限执行 |
| 运维观察 | OpsObserver | 可观测性、SLO、成本与告警建议 | 读运维文档与指标；通常无写生产权限 |

每个角色的详细契约见 [agents/](../../agents/README.md)。

## 3. 交接协议（Handoff Protocol）

每轮交接必须包含以下结构化字段（可复制到任务评论或 checkpoint 文件）：

```yaml
handoff:
  task_id: "TASK-..."
  from_role: "Planner"
  to_role: "Implementer"
  goal_summary: "一句话目标"
  inputs:
    - "路径或链接到 specs/、docs/"
  outputs_expected:
    - "预期文件路径或 PR"
  decisions:
    - "已确认决策（或写 ADR ID）"
  risks:
    - "已知风险"
  open_questions:
    - "未决问题，需人类或 Architect"
  constraints:
    - "硬约束：时间、合规、不能改的接口"
```

## 4. 编排模式（Patterns）

| 模式 | 适用 | 说明 |
|------|------|------|
| 流水线（Pipeline） | 规格稳定、步骤清晰 | Planner → Architect → Implementer → Reviewer → Tester |
| 评审环（Review Loop） | 质量敏感 | Implementer 与 Reviewer 多轮直到 DoD |
| 并行扇出（Fan-out） | 独立子任务 | Planner 拆分为多个子 task_id，最后合并 |
| 人类介入（HITL） | 高风险操作 | 必须显式等待人工批准 |

## 5. 冲突解决（Conflict Resolution）

1. **与 ADR 冲突**：以最新 ADR 为准；若需推翻，写新 ADR `Supersedes` 旧 ADR。
2. **与路线图冲突**：先更新 roadmap 或记录例外（RFC/任务单说明）。
3. **与安全策略冲突**：**一律**以 [`docs/10-governance/security-privacy.md`](../10-governance/security-privacy.md) 为准，停止自动化执行。

## 6. 失败与恢复

- 单 Agent 超时或输出不可用：保存 checkpoint（见长时运行文档），由 Planner 重派任务。
- 不得删除已写 ADR；错误用新 ADR 或勘误段补充。

## 7. 实施提示（Implementation Hints）

具体编排运行时（LangGraph、自有调度、CI 中多 job）由项目选型；**本仓库只强制规范化交接与文档沉淀**，以保持技术栈无关。
