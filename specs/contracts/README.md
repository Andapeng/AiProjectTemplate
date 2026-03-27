# 契约（Contracts）

将可机读契约放在此目录，例如：

- `api/openapi.yaml`
- `tools/*.schema.json`
- `events/*.schema.json`
- `prompts/io-schema.json`

并在 `docs/02-interfaces/overview.md` 中登记版本策略。

## 版本与变更

- 破坏性变更：bump major（或团队约定版本字段）+ ADR 或变更说明
- 非破坏：minor/patch + 更新示例
