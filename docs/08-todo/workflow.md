# 任务工作流（Task Workflow）

> 衔接规范驱动开发：每个任务可追溯需求、设计、实现、测试与记忆写回。

## 1. 任务生命周期

```text
提出 → 规格对齐 → 分解 → 实现 → 评审 → 测试/评测 → 发布/合并 → 记忆写回
```

## 2. 任务单必备字段

使用 [templates/task-template.md](../../templates/task-template.md)：

- **Task ID**：唯一标识（建议 `TASK-YYYYMMDD-序号` 或 issue 号）
- **目标**：可验收的一段话
- **关联规格**：`specs/` 路径
- **范围 In / Out**：防止范围蠕变
- **验收标准**：可勾选 checklist
- **风险与回滚**：特别是数据迁移与接口破坏
- **记忆写回**：要更新 `memory/` 哪些条目

## 3. 角色职责（摘要）

| 角色 | 职责 |
|------|------|
| Planner | 分解任务、维护 TaskContext 裁剪列表 |
| Architect | 对齐架构与 ADR，批准重大结构变更 |
| Implementer | 按契约实现 |
| Reviewer | 代码/文档/安全审查 |
| Tester | 测试与评测执行 |
| OpsObserver | 观测、告警、容量与成本关注 |

详见 [`../04-agent-orchestration/overview.md`](../04-agent-orchestration/overview.md)。

## 4. 完成定义（Definition of Done, DoD）

- [ ] 验收标准全部满足
- [ ] 相关测试或评测用例已添加/更新并通过
- [ ] 契约变更已反映在 `specs/` 并有版本说明
- [ ] `memory/index.md`（及必要条目）已更新
- [ ] 若涉及发布：`docs/09-operations/` 或发布说明已补充

## 5. 与路线图的关系

- **Now**：当前迭代任务应能映射到 roadmap 中 Now 段
- **Next / Later**：任务若无路线图依据，需先更新 [`../07-roadmap/roadmap.md`](../07-roadmap/roadmap.md) 或记录原因于 ADR/RFC
