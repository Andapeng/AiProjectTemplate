# ADR 0001: 记录架构决策（Record Architecture Decisions）

## 状态（Status）

**Accepted**

## 背景（Context）

项目需要可追溯到「为何如此设计」的记录，以便新成员与 AI 在多会话、多角色协作下仍能快速对齐；口头决策容易丢失或与后续实现不一致。

## 决策（Decision）

采用 **Architecture Decision Records（ADR）**：

- 存放于 `docs/01-architecture/decision-records/`
- 使用 [templates/adr-template.md](../../../templates/adr-template.md)
- 冲突通过新 ADR **显式废止**旧 ADR，而非静默覆盖

## 备选方案（Considered Options）

| 方案 | 说明 |
|------|------|
| 仅依赖 Wiki | 难与代码库版本同步 |
| 仅用聊天/邮件 | 不可检索、易歧义 |
| ADR + 记忆库 | 决策结构化 + 快速索引（本方案）|

## 后果（Consequences）

- **正**：设计知识可版本管理；Reviewer 有明确要求参照对象。
- **负**：需要习惯在重大变更时写 ADR，略有成本。
- **风险**：若 ADR 滞后于实现，造成文档漂移——以门禁与 Review 纠正。

## 合规与安全（Compliance / Security）

不适用（流程类决策）。

## 链接（Links）

- [仓库入口 README](../../../README.md)

## 元数据

- **日期**：2026-03-27
- **决策者**：模板初始化
