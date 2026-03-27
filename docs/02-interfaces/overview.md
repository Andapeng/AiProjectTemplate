# 接口与契约总览（Interfaces & Contracts）

## 1. 契约类型（Contract Types）

本模板将“接口”广义定义为可机读或可评审的边界：

| 类型 | 说明 | 存放建议 |
|------|------|----------|
| **HTTP / RPC API** | REST、gRPC、GraphQL 等 | `specs/contracts/api/` 或 OpenAPI 文件 |
| **Tool / Function Calling** | 模型可调用的工具签名 | `specs/contracts/tools/` |
| **Event / Message** | 异步事件 schema | `specs/contracts/events/` |
| **Prompt I/O** | 提示词输入槽位与输出结构 | `prompts/` + `specs/contracts/prompts/` |
| **数据集 / 评测接口** | 评测集格式、 golden 输出 | `tests/evals/` |

## 2. 通用规则（Cross-Cutting Rules）

1. **向后兼容**：破坏兼容的变更必须 bump 版本，并在 ADR 中记录。
2. **错误模型**：统一错误码/错误体结构；区分可重试与不可重试。
3. **幂等**：写操作在可能重复调用时必须幂等（`Idempotency-Key` 或业务键）。
4. **安全**：敏感字段分级见 [`docs/10-governance/security-privacy.md`](../10-governance/security-privacy.md)。

## 3. API 设计检查清单（Checklist）

- [ ] 请求/响应 schema 已文档化
- [ ] 鉴权方式明确（API Key、OAuth、mTLS…）
- [ ] 分页、过滤、限流策略明确
- [ ] 速率限制与超时对调用方可见
- [ ] 与 ADR / 路线图条目双向链接

## 4. Tool Calling 设计检查清单

- [ ] 每个 tool 有单一职责（Single Responsibility）
- [ ] 入参 JSON Schema 完整；枚举值封闭
- [ ] 返回值结构稳定，便于模型解析
- [ ] 危险操作需人工确认或二次授权（Human-in-the-loop）

## 5. Prompt I/O 契约

- 输入槽位：系统约束、任务目标、引用材料、输出格式（JSON / Markdown）
- 输出：尽量结构化；需通过 `tests/evals/` 中样例回归

## 6. 版本策略（Versioning）

- **API**：URL 或 Header 版本号；弃用周期在路线图标注。
- **Prompt**：以文件路径 + Git 版本为准；重大变更记 ADR 或 RFC。

详见各子目录下的占位说明（可复制至具体项目）。
