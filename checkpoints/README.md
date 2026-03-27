# 检查点目录（Checkpoints）

长时运行任务可将 checkpoint 文件存放于此，建议结构：

```text
checkpoints/
  README.md
  <task_id>/
    001-description.md
    002-description.md
```

规范见 [`docs/05-long-running-agents/overview.md`](../docs/05-long-running-agents/overview.md)。

**建议**：将 `checkpoints/*` 加入 `.gitignore`（若含环境私密信息）；模板仓库保留本说明文件即可。
