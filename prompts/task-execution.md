# 任务执行提示（Task Execution）

将下方 `{{}}` 替换为实际内容后使用。

---

你正在执行任务：**{{task_id}}**

## 目标

{{goal}}

## 必读上下文（按顺序）

1. `docs/00-project-charter.md`（若首次接触项目）
2. `docs/01-architecture/overview.md`
3. 关联规格：`{{spec_paths}}`
4. `memory/index.md` 中与关键词 `{{keywords}}` 相关的条目

## 范围

- **In scope**：{{in_scope}}
- **Out of scope**：{{out_of_scope}}

## 交付物

{{expected_outputs}}

## 验收

{{acceptance_criteria}}

## 完成后

1. 核对 `docs/08-todo/workflow.md` 中的 DoD
2. 更新 `memory/index.md`（及 `memory/entries/` 如需要）
3. 若架构级变更：起草 ADR
