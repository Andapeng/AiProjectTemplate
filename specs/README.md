# 规格目录（Specs）

规范驱动开发的三类规格建议分目录维护：

| 目录 | 内容 |
|------|------|
| `requirements/` | 需求规格：用户故事、验收叙事 |
| `design/` | 设计规格：方案、数据流、边界 |
| `acceptance/` | 验收规格：可勾选 AC、评测链接 |
| `contracts/` | 机读契约：OpenAPI、JSON Schema、评测集格式 |

## 链接规则

- 每个规格文件头部用 YAML 或表格标明：**任务 ID、负责人、状态、关联 roadmap 条目**。
- 需求 → 设计 → 验收 应能双向导航。

## 命名建议

- `REQ-xxx-short-name.md`
- `DES-xxx-short-name.md`
- `ACC-xxx-short-name.md`
