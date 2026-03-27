# 运营指标（Operational Metrics）

## 1. 建议跟踪项

| 指标 | 说明 | 目标/阈值（示例） |
|------|------|-------------------|
| 可用性 | 关键路径成功率 | <!-- 例：99.9% --> |
| P95 延迟 | 端到端或核心 API | |
| 错误率 | 按错误码分解 | |
| Eval 通过率 | 关键集 | 不允许环比下降无解释 |
| Token / 费用 | 每任务、每日 | 预算 |
| 评测/CI 队列时间 | Agent 批处理 | |

## 2. 复盘节奏

- **每周**：成本与关键错误简要复盘（可记入 `memory/timeline.md`）
- **每迭代**：路线图与指标对齐会议
- **事故后**：使用 [templates/incident-template.md](../../templates/incident-template.md)

## 3. 数据分级

指标中禁止出现未脱敏的 **L3+** 标识符；分级见 [`docs/10-governance/security-privacy.md`](../10-governance/security-privacy.md)。
