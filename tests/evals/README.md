# AI 评测集（Evaluations）

## 目录约定

| 路径 | 用途 |
|------|------|
| `critical/` | **发布必跑**子集，门禁引用 |
| `full/` | 完整回归，夜间或按需 |
| `fixtures/` | 共享输入片段 |
| `reports/` | 批跑输出（通常 gitignore，此处仅说明） |

## 用例文件格式（建议）

每例一个 YAML/JSON（按团队选型）：

```yaml
id: eval-0001
tags: [critical, formatting]
task: "用户问题或指令模板"
reference: "可选：参考答案或要点列表"
rubric:
  must_have: []
  must_not: []
```

## 基线

在表格中记录基线与模型/提示词版本：

| 基线名称 | Commit / Tag | 模型/提示 | 通过率 | 日期 |
|----------|--------------|-----------|--------|------|
| initial | | | | |

## 最小样例（可直接演练）

- critical 样例：[`critical/eval-0001-minimal-flow.yaml`](critical/eval-0001-minimal-flow.yaml)
- 对应规格链路：
  - [`../../specs/requirements/REQ-001-minimal-template-flow.md`](../../specs/requirements/REQ-001-minimal-template-flow.md)
  - [`../../specs/design/DES-001-minimal-template-flow.md`](../../specs/design/DES-001-minimal-template-flow.md)
  - [`../../specs/acceptance/ACC-001-minimal-template-flow.md`](../../specs/acceptance/ACC-001-minimal-template-flow.md)
