# 测试目录（Tests）

## 组织建议

| 子目录 | 用途 |
|--------|------|
| `unit/` | 快速单元测试 |
| `integration/` | 跨模块/服务集成 |
| `contract/` | 契约测试（对齐 `specs/contracts/`） |
| `e2e/` | 端到端冒烟 |
| `evals/` | AI 评测集与批跑脚本占位 |

## 与门禁关系

见 [`docs/06-quality-and-testing/overview.md`](../docs/06-quality-and-testing/overview.md) 与 [`release-gates.md`](../docs/06-quality-and-testing/release-gates.md)。

## 说明

本模板 **不含具体语言运行器配置**；复制项目后按需添加 `package.json`、`pyproject.toml`、`go.mod` 等。
