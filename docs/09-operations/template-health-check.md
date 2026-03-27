# 模板健康检查（Template Health Check）

## 目标

将模板规则转为可重复执行的检查流程，降低“规则存在但未落地”的风险。

## 检查入口

- 文档入口：本文件
- 脚本入口：[`scripts/template-health-check.ps1`](../../scripts/template-health-check.ps1)
- 报告输出：`scripts/reports/template-health-report.json`

## 最小检查项（MVP）

### 1) 规格与任务关联

- 检查 `specs/requirements/`、`specs/design/`、`specs/acceptance/` 是否存在至少一个样例/任务文件。
- 若无，提示“先补最小规格，再继续实现”。

### 2) 记忆写回痕迹

- 检查 `memory/index.md` 是否存在。
- 检查 `memory/entries/` 是否存在条目文件。
- 检查 `memory/timeline.md` 是否存在。

### 3) 架构与契约触发点

- 检查 ADR 目录中是否有至少一条 ADR（`0001` 起步）。
- 检查 `specs/contracts/` 与 `docs/02-interfaces/overview.md` 是否存在。

## 执行建议

- 本地：任务收尾时执行一次。
- CI：在 PR 验证阶段执行（后续可接入）。

## 当前能力

当前脚本已支持：

1. 文件存在性检查（spec/memory/ADR/contracts/health-check doc）。
2. 最小示例链路 ID 一致性检查（`REQ-001`、`DES-001`、`ACC-001`）。
3. 生成机器可读报告（JSON）。

## 使用方式

```powershell
powershell -ExecutionPolicy Bypass -File "scripts/template-health-check.ps1"
```

自定义报告路径：

```powershell
powershell -ExecutionPolicy Bypass -File "scripts/template-health-check.ps1" -ReportPath "scripts/reports/custom-report.json"
```
