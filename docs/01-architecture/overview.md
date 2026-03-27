# 架构总览（Architecture Overview）

## 1. 系统上下文（System Context）

```text
[用户/调用方] --> [本系统边界] --> [外部依赖：模型、存储、第三方 API]
```

- **主要外部依赖**：<!-- 列出 -->
- **信任边界（Trust Boundary）**：<!-- 何处起止不可信输入 -->

## 2. 分层与模块（Layers / Modules）

> 技术栈无关：用文字与框图描述逻辑分层即可；选定栈后在子文档补充部署拓扑。

| 层 / 模块 | 职责 | 不允许的职责（防腐） |
|-----------|------|----------------------|
| <!-- 例：接入层 --> | | |
| <!-- 例：领域/业务 --> | | |
| <!-- 例：基础设施 --> | | |

## 3. 关键数据流（Key Data Flows）

1. **流 1**：<!-- 从谁 → 到哪 → 存什么 -->
2. **流 2**：…

## 4. 架构原则（Architecture Principles）

1. **显式契约**：对外行为以 `specs/` 与 `docs/02-interfaces/` 为准。
2. **可观测**：关键路径具备日志/指标/追踪（见 `docs/09-operations/`）。
3. **可回滚**：变更有 ADR 或发布说明；长任务可 checkpoint（见 `docs/05-long-running-agents/`）。
4. **最小权限**：Agent 与密钥按角色拆分（见 `agents/` 与治理文档）。

## 5. 质量属性（Non-Functional Requirements）

| 属性 | 目标 | 验证方式 |
|------|------|----------|
| 可用性 | | |
| 延迟 | | |
| 安全 | | |
| 成本 | | |

## 6. 相关决策（ADRs）

- 在 `decision-records/` 中维护；此处仅列索引链接。

## 7. 演进注意点

- 与路线图对齐：[`../07-roadmap/roadmap.md`](../07-roadmap/roadmap.md)
- 变更后更新：`memory/index.md` 与相关术语条目
