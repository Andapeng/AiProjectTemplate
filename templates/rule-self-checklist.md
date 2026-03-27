# 规则自检清单（Rule Self-Checklist）

> 用途：把 `.cursor/rules/` 的规则转成“可勾选 + 可留证据”的交付清单。  
> 原则：**不新增规则**，只验证规则是否被执行。

## 1. 任务信息

| 字段 | 内容 |
|------|------|
| Task ID | |
| 标题 | |
| 执行者 | |
| 评审者 | |
| 日期 | |

## 2. 规则执行自检

### A. Context Retrieval Order（`context-retrieval-order.mdc`）

- [ ] 已按顺序读取核心文档（Charter → Architecture/ADR → Interfaces/Contracts → Task Specs/TODO → Memory）
- [ ] 输出方案前已引用仓库内路径
- [ ] 若存在冲突，已先明确冲突点与处理策略

证据路径：

- ``

### B. Spec First（`spec-first.mdc`）

- [ ] 已关联任务单与规格（`specs/requirements|design|acceptance`）
- [ ] 涉及接口时已对齐契约（`docs/02-interfaces/`、`specs/contracts/`）
- [ ] 若规格缺失，已先补最小可执行规格（而非直接实现）

证据路径：

- ``

### C. Context Budget（`context-budget.mdc`）

- [ ] 首轮检索保持最小必要范围（建议 3-6 个文件）
- [ ] 已使用二跳读取补足缺口，而非一次性加载大量文件
- [ ] 有简短工作记忆摘要（目标、约束、未决问题）

证据路径：

- ``

### D. Memory Write-Back（`memory-writeback.mdc`）

- [ ] 已更新 `memory/index.md`
- [ ] 如有可复用知识，已更新 `memory/entries/`
- [ ] 若为重大节点，已更新 `memory/timeline.md`
- [ ] 若为架构级变更，已新增/更新 ADR

证据路径：

- ``

### E. Review Gate（`review-gate.mdc`）

- [ ] 已完成变更前检查（任务/规格/契约/ADR/安全分级）
- [ ] 已完成变更后检查（测试/评测门禁、版本兼容说明）
- [ ] 已给出影响范围、风险等级、回滚思路、门禁结果

证据路径：

- ``

## 3. 阻塞项（Blockers）

| 阻塞项 | 等级 | 处理人 | 计划解决时间 |
|--------|------|--------|--------------|
| | | | |

## 4. 最终结论

- [ ] 通过（Ready for merge/release）
- [ ] 有条件通过（需在后续任务补齐）
- [ ] 不通过（阻塞）

说明：

-
