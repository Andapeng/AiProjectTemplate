# 提示词资产（Prompts）

## 目录说明

| 文件 | 用途 |
|------|------|
| [system-default.md](system-default.md) | 通用系统提示骨架（约束、安全、输出格式） |
| [task-execution.md](task-execution.md) | 单机任务执行提示（读哪些 doc、如何写回） |
| [eval-judge.md](eval-judge.md) | 评测裁判/评分提示（rubric） |

## 版本与契约

- 提示词变更视为 **接口变更**：同步更新 `specs/contracts/prompts/`（若已建立）与 `tests/evals/`。
- 重大行为变化：新增 ADR 或在 ADR 中引用提示词版本（commit hash）。

## 安全

- 不得在此目录存放密钥；对用户内容使用清晰边界标记（如 `---USER---`）。
