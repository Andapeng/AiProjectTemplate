# 记忆库贡献指南（Memory Contributing Guide）

## 1. 记忆库用途

`memory/` 是 **MemoryContext** 的落地：**可检索、版本化** 的长期知识，弥补对话上下文无法持久保留的问题。

## 2. 何时更新

- 任务 **Definition of Done** 达成后（必须至少更新索引）
- 出现 **可复用结论**：术语定义、踩坑、性能调优、模型行为
- **ADR 之外**但需要快速查阅的“小知识”

## 3. 写回流程（Write-Back Checklist）

1. 打开 [`memory/index.md`](index.md)，按主题新增或更新一行索引（含链接与关键词）。
2. 若有独立条目：在 `memory/entries/` 新建 `kebab-case-topic.md`。
3. 重大里程碑：在 [`memory/timeline.md`](timeline.md) 追加一条（日期 + 一句说明 + 链接）。
4. 若内容属实为架构决策：应同时有 **ADR**，记忆文件仅放摘要与链接。

## 4. 条目模板（`entries/*.md`）

```markdown
# <标题>

## 摘要
-

## 细节
-

## 适用范围 / 不适用
-

## 相关链接
- specs:
- adr:
- task:

## 反模式
-

**最后更新**：YYYY-MM-DD
**维护者**：
```

## 5. 写作规范

- **短段落 + 标题**：便于人类扫读与 AI 引用
- **事实与推测分离**：推测标注「待验证」
- **敏感信息**：遵守 [`docs/10-governance/security-privacy.md`](../docs/10-governance/security-privacy.md)，禁止粘贴密钥与未脱敏 PII

## 6. 检索约定

- 优先从 [`index.md`](index.md) 关键词定位，避免单次加载超大文件
- 术语表：可集中在 `entries/glossary.md`（可后续创建）
