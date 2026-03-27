# 空工程启动指令模板（Project Kickoff for Empty Repo）

> 用法：在一个「空工程但已有高层计划」的仓库中，把下面整段指令粘贴给 AI，并把你的项目计划文本附在后面。

你现在在一个**空工程仓库**中工作，我已经为这个工程生成了一份「整体计划/构想」。  
本仓库会采用我提供的 AI 工程模板结构（docs/specs/memory/agents 等），请严格按如下步骤启动项目：

## 1. 读取与对齐

1. 仔细阅读我在本指令后面贴出的「项目计划文本」。
2. 若仓库中已存在下列文件，则先读取它们；若不存在，则在后续步骤中帮我创建并填充内容：
   - `docs/00-project-charter.md`
   - `docs/07-roadmap/roadmap.md`

## 2. 把计划落入模板文档

请根据「项目计划文本」，在这个模板结构下完成**首轮落地**：

1. 生成或更新 `docs/00-project-charter.md`：
   - 愿景 / 目标用户 / 核心价值
   - 范围 In/Out，关键约束（时间、预算、技术栈偏好如有）
   - 成功指标（2–5 个可衡量指标）
2. 生成或更新 `docs/07-roadmap/roadmap.md`：
   - 按 Now / Next / Later 把计划拆分成若干条路线图条目
   - 明确每条的目标与依赖关系

## 3. 规范驱动拆分（Spec-First）

在对齐 Charter 与 Roadmap 后，进行**任务与规格拆分**：

1. 选择 1–3 个 Now 阶段的路线图条目，作为“第一批要做的事”。
2. 为每个选中的条目：
   - 在 `specs/requirements/` 下创建 `REQ-xxx-*.md`
   - 在 `specs/design/` 下创建对应 `DES-xxx-*.md`
   - 在 `specs/acceptance/` 下创建对应 `ACC-xxx-*.md`
   - 每个 REQ/DES/ACC 之间用表格中的 ID 字段互相链接（参考模板中的 REQ-001/DES-001/ACC-001）
3. 使用本仓库的约定（spec-first / review-gate / context-budget / memory-writeback 规则），保证：
   - 没有规格的任务不要直接进入实现
   - 每个规格文件顶部都包含元数据（ID、状态、关联路线图条目）

## 4. 初始化最小任务单（Task）

1. 复制 `templates/task-template.md` 为至少 1 个任务单文件（例如放在 `docs/08-todo/TASK-DEMO-001.md`）。
2. 将上述某个 REQ/DES/ACC 组合映射到这个任务上：
   - 填写 Task ID、目标、范围、验收标准
   - 在“记忆写回”与“交接记录”中预置需要更新的 memory/ADR 位置

## 5. 记忆与 ADR 准备

1. 确认 `memory/index.md`、`memory/timeline.md`、`memory/entries/` 存在；若不存在，则根据模板仓库结构创建并填入最小内容。
2. 为“采用此 AI 工程模板”的决策创建一条 ADR（若尚未存在），放在：
   - `docs/01-architecture/decision-records/` 中，使用 `templates/adr-template.md`

## 6. 检查与报告

1. 运行模板健康检查脚本（若存在）：
   - `powershell -ExecutionPolicy Bypass -File "scripts/template-health-check.ps1"`
2. 总结本次启动阶段输出：
   - 已创建/更新的文件列表
   - 还有哪些规格/任务/记忆尚未补齐（作为后续 TODO）

## 7. 输出格式要求

请用**中文**输出，结构如下：

1. 「本次根据项目计划生成/更新了哪些核心文档」的列表（带路径）
2. 「第一批可执行任务」清单（Task ID + 简要说明）
3. 「建议下一步行动」清单（例如：开始实现哪个任务、何时补充更多 REQ/DES/ACC、是否需要接入 CI 等）

下面是本项目的高层计划，请据此执行上述步骤：\n\n【在这里粘贴项目计划文本】\n*** End Patch```}ற்குญ่!assistant to=functions.ApplyPatch +#+#+#+#+#+assistant to=functions.ApplyPatchอภิปราย to=functions.ApplyPatch forKeyPath="*** Begin Patch\n*** Add File: d:\\Workspace\\AiProject\\AiProjectTemplate\\prompts\\project-kickoff-empty-repo.md\n+# 空工程启动指令模板（Project Kickoff for Empty Repo）\n+\n+> 用法：在一个「空工程但已有高层计划」的仓库中，把下面整段指令粘贴给 AI，并把你的项目计划文本附在后面。\n+\n+你现在在一个**空工程仓库**中工作，我已经为这个工程生成了一份「整体计划/构想」。  \n+本仓库会采用我提供的 AI 工程模板结构（docs/specs/memory/agents 等），请严格按如下步骤启动项目：\n+\n+## 1. 读取与对齐\n+\n+1. 仔细阅读我在本指令后面贴出的「项目计划文本」。\n+2. 若仓库中已存在下列文件，则先读取它们；若不存在，则在后续步骤中帮我创建并填充内容：\n+   - `docs/00-project-charter.md`\n+   - `docs/07-roadmap/roadmap.md`\n+\n+## 2. 把计划落入模板文档\n+\n+请根据「项目计划文本」，在这个模板结构下完成**首轮落地**：\n+\n+1. 生成或更新 `docs/00-project-charter.md`：\n+   - 愿景 / 目标用户 / 核心价值\n+   - 范围 In/Out，关键约束（时间、预算、技术栈偏好如有）\n+   - 成功指标（2–5 个可衡量指标）\n+2. 生成或更新 `docs/07-roadmap/roadmap.md`：\n+   - 按 Now / Next / Later 把计划拆分成若干条路线图条目\n+   - 明确每条的目标与依赖关系\n+\n+## 3. 规范驱动拆分（Spec-First）\n+\n+在对齐 Charter 与 Roadmap 后，进行**任务与规格拆分**：\n+\n+1. 选择 1–3 个 Now 阶段的路线图条目，作为“第一批要做的事”。\n+2. 为每个选中的条目：\n+   - 在 `specs/requirements/` 下创建 `REQ-xxx-*.md`\n+   - 在 `specs/design/` 下创建对应 `DES-xxx-*.md`\n+   - 在 `specs/acceptance/` 下创建对应 `ACC-xxx-*.md`\n+   - 每个 REQ/DES/ACC 之间用表格中的 ID 字段互相链接（参考模板中的 REQ-001/DES-001/ACC-001）\n+3. 使用本仓库的约定（spec-first / review-gate / context-budget / memory-writeback 规则），保证：\n+   - 没有规格的任务不要直接进入实现\n+   - 每个规格文件顶部都包含元数据（ID、状态、关联路线图条目）\n+\n+## 4. 初始化最小任务单（Task）\n+\n+1. 复制 `templates/task-template.md` 为至少 1 个任务单文件（例如放在 `docs/08-todo/TASK-DEMO-001.md`）。\n+2. 将上述某个 REQ/DES/ACC 组合映射到这个任务上：\n+   - 填写 Task ID、目标、范围、验收标准\n+   - 在“记忆写回”与“交接记录”中预置需要更新的 memory/ADR 位置\n+\n+## 5. 记忆与 ADR 准备\n+\n+1. 确认 `memory/index.md`、`memory/timeline.md`、`memory/entries/` 存在；若不存在，则根据模板仓库结构创建并填入最小内容。\n+2. 为“采用此 AI 工程模板”的决策创建一条 ADR（若尚未存在），放在：\n+   - `docs/01-architecture/decision-records/` 中，使用 `templates/adr-template.md`\n+\n+## 6. 检查与报告\n+\n+1. 运行模板健康检查脚本（若存在）：\n+   - `powershell -ExecutionPolicy Bypass -File \"scripts/template-health-check.ps1\"`\n+2. 总结本次启动阶段输出：\n+   - 已创建/更新的文件列表\n+   - 还有哪些规格/任务/记忆尚未补齐（作为后续 TODO）\n+\n+## 7. 输出格式要求\n+\n+请用**中文**输出，结构如下：\n+\n+1. 「本次根据项目计划生成/更新了哪些核心文档」的列表（带路径）\n+2. 「第一批可执行任务」清单（Task ID + 简要说明）\n+3. 「建议下一步行动」清单（例如：开始实现哪个任务、何时补充更多 REQ/DES/ACC、是否需要接入 CI 等）\n+\n+下面是本项目的高层计划，请据此执行上述步骤：\\n\\n【在这里粘贴项目计划文本】\\n*** End Patch"]} ***!
