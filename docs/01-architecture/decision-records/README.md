# 架构决策记录（ADR）目录

## 用途

记录 **Architecture Decision Record（ADR）**：在特定时间点，针对重要架构/流程选择做出的决策及理由，避免口头记忆丢失。

## 命名规范

- 文件：`NNNN-short-title.md`，`NNNN` 为四位序号，全局递增。
- 可从 `0001-record-architecture-decisions.md` 开始。

## 何时写 ADR

- 引入/替换关键技术、框架、模型供应商
- 改变数据模型、信任边界、多租户策略
- 改变 Agent 编排、长任务状态机、评测门禁

## 流程

1. 复制 [templates/adr-template.md](../../templates/adr-template.md)
2. 提交评审（人类或 Reviewer Agent）
3. 合并后，在 `memory/index.md` 增加指向该 ADR 的条目

## 冲突解决

若新方案与旧 ADR 冲突：**用新 ADR 明确废止（Supersedes）旧 ADR**，不得静默覆盖。
