# 长时运行 Agent（Long-Running Agents）

## 1. 适用场景

- 跨多会话、多小时的编码/迁移/评测批处理
- 依赖外部系统、易中断（网络、Rate limit）
- 需要**可恢复（Resumable）**与**可审计（Auditable）**

## 2. 状态机（Task State Machine）

```text
queued → running → checkpointed → completed
                      ↓           ↑
                    failed ───── retry（有限次数）
                      ↓
                    aborted（人工终止）
```

| 状态 | 含义 |
|------|------|
| queued | 已排程，未开始 |
| running | 执行中 |
| checkpointed | 安全落盘检查点，可暂停/换会话恢复 |
| completed | 成功结束，已满足 DoD |
| failed | 不可恢复错误或超过重试 |
| retry | 按策略退避重试 |
| aborted | 人为中止，需记录原因 |

## 3. 检查点最小内容（Checkpoint Minimum）

每个 checkpoint 建议为可读文件（如 `checkpoints/<task_id>/NNN.md` 或 JSON）：

```yaml
checkpoint:
  task_id: ""
  updated_at: "ISO8601"
  goal_summary: ""
  progress_pct: 0-100
  done_steps: []
  next_steps: []
  artifact_paths: []      # 代码、报告、日志索引
  decisions_snapshot: []  # ADR / 任务决策 ID
  errors_last: []
  resume_instructions: "" # 下一会话第一句应做什么
```

## 4. 恢复流程（Resume Procedure）

1. 读取最新 checkpoint + `memory/index.md` 中该 task 条目
2. 校验关联 `specs/` 与 ADR 是否仍有效
3. 从 `next_steps` 继续；若上下文不足，由 Planner 重算 TaskContext
4. 恢复后在 checkpoint 或任务单记录「恢复了哪一版」

## 5. 异常策略（Failure Handling）

| 异常 | 处理 |
|------|------|
| 超时 | 写入 checkpoint → 标记 retry → 退避 |
| 依赖失败（API/DB） | 区分可重试；记录错误类型 |
| 输出不确定（模型含糊） | 降采样策略或换强模型；必要时 HITL |
| 资源耗尽（Token/费用） | OpsObserver 介入；调整 batch 或暂停队列 |

## 6. 人机协作（Human-in-the-loop）

以下情况**必须**暂停自动化并等人：

- 生产数据删除、权限提升、不可逆迁移
- 安全告警、依赖漏洞需要立即决策
- 合同/法务类输出需签核

在任务单中预先列出触发条件。

## 7. 与多智能体关系

- Planner：维护 checkpoint 模板与恢复指令质量
- Implementer：按 checkpoint 粒度提交中间产物
- Reviewer：可抽查 checkpoint 是否夸大进度或遗漏风险
