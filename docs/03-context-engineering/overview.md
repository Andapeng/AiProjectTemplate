# 上下文工程（Context Engineering）

## 1. 目标

在有限 context window 下，**最大化正确决策概率**：减少幻觉、减少遗忘约束、减少与历史决策冲突。

## 2. 三层上下文模型

| 层级 | 英文 | 内容 | 典型来源 | 更新频率 |
|------|------|------|----------|----------|
| 核心层 | CoreContext | 宪章、架构原则、接口总则、安全分级 | `docs/` | 低 |
| 任务层 | TaskContext | 当前目标、验收、相关 spec、分支范围 | `specs/`、任务单 | 高 |
| 记忆层 | MemoryContext | ADR 摘要、术语、踩坑、时间线 | `memory/` | 中 |

## 3. 推荐检索顺序（Retrieval Order）

1. `docs/00-project-charter.md`（边界与指标）
2. `docs/01-architecture/overview.md` + 相关 ADR
3. `docs/02-interfaces/overview.md` + 本次任务涉及的契约
4. 当前任务对应的 `specs/` 与 `docs/08-todo/` 条目
5. `memory/index.md` 关键词 → 具体记忆条目
6. 外部文档 / 网页（最后）

## 4. 压缩与摘要策略（Compression）

| 场景 | 做法 |
|------|------|
| 长文档 | 先读目录与「决策/约束」小节，再按需展开 |
| 长代码 | 先读公开 API / 模块边界，再读实现 |
| 多轮对话 | 每轮结束将「未决问题、关键结论」写入任务单或 checkpoint |
| 历史对话不可载入 | 依赖 `memory/` 与 ADR，而非聊天全文 |

## 5. 记忆写回规则（Write-Back）

任务结束后必须至少完成：

1. 更新 `memory/index.md`（新增或调整索引条目）
2. 若有新事实/术语/反模式：新增 `memory/entries/` 下文件
3. 若有架构级决策：新增 ADR
4. 在 `memory/timeline.md` 追加一条简述（可选但推荐）

详见 [`memory/CONTRIBUTING.md`](../../memory/CONTRIBUTING.md)。

## 6. 反模式（Anti-Patterns）

- 把唯一真理放在聊天里而不写回仓库
- 无契约直接改接口，导致 Agent 与用户脚本集体失效
- 记忆文件过大无索引，检索时整文件塞进上下文

## 7. 与多智能体协作

- Planner 负责**裁剪** TaskContext（只给本轮需要的文档路径列表）
- Reviewer 核对输出是否与 CoreContext / MemoryContext 冲突

更多见 [`docs/04-agent-orchestration/overview.md`](../04-agent-orchestration/overview.md)。
