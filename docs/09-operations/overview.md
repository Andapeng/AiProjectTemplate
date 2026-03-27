# 运维与运营（Operations）

## 1. 范围

- **可观测性（Observability）**：日志、指标、追踪
- **可靠性（Reliability）**：SLO、错误预算、值班与事故响应
- **成本（Cost）**：Token、推理费用、存储与带宽
- **容量（Capacity）**：并发、限流、队列深度
- **发布（Releases）**：节奏、回滚、功能开关

## 2. 运行手册（Runbooks）

项目落地后在本目录补充，例如：

- `runbook-incident.md`：事故分诊
- `runbook-deploy.md`：`L2/L3` 发布步骤
- `runbook-model-cutover.md`：模型切换与评测门槛

## 3. 环境分级

| 环境 | 用途 | 数据 |
|------|------|------|
| dev | 开发自测 | 合成/脱敏 |
| staging | 预发验证 | 近生产脱敏 |
| prod | 线上 | 真实数据（按分级管控） |

## 4. 告警原则

- 面向 **SLO 与用户影响**，避免仅 CPU 类噪音
- 告警须带 **Runbook 链接** 与 **已知依赖** 说明

## 5. 成本治理

- 对 Agent：记录每类任务的 **预算上限** 与 **批大小**
- 定期复盘：见 [`metrics.md`](metrics.md)
