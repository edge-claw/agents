---
name: twitter-lists
description: "监控多个 Twitter Lists，按区块链/AI 分类显示重要推文。支持过滤查看。"
metadata:
  {
    "openclaw":
      {
        "emoji": "🐦",
        "requires": { "bins": ["bash"] }
      }
  }
---

# Twitter Lists 监控

监控多个 Twitter Lists，按区块链/AI 分类显示重要推文。

## 使用方法

### 查看所有推文
```bash
bash ~/.openclaw/workspace/scripts/check-multiple-lists.sh
```

### 在 Telegram 中使用
直接发送：
```
查看推特列表
```

或者：
```
/twitter-lists
```

## 功能

- ✅ 自动监控 2 个 Twitter Lists（可扩展到 6 个）
- ✅ 智能关键词筛选
- ✅ 分类显示：区块链 🔗 和 AI 🤖
- ✅ 统计信息
- ✅ 推文链接

## 关键词

**区块链**: 空投、airdrop、新项目、alpha、测试网、mainnet、TGE、IDO、融资、上线、launch、撸毛、交互、DeFi、NFT、质押、staking、挖矿、mining

**AI**: GPT、Claude、模型、发布、开源、breakthrough、研究、paper、AGI、LLM、Anthropic、OpenAI、Gemini、Llama、训练、training

## 配置

Lists 配置在脚本中：`~/.openclaw/workspace/scripts/check-multiple-lists.sh`

当前监控的 Lists：
- List 1: 1511830806825635841 (原有 List)
- List 2: 1705702737835643273 (新增 List)

## 示例输出

```
╔════════════════════════════════════════╗
║       🔗 区块链/加密货币推文           ║
╚════════════════════════════════════════╝

📊 共发现 2 条重要推文

**1. @username (Name):**
   推文内容...
   🔗 https://x.com/...

╔════════════════════════════════════════╗
║          🤖 AI/人工智能推文            ║
╚════════════════════════════════════════╝

📊 共发现 1 条重要推文

**1. @claudeai (Claude):**
   推文内容...
   🔗 https://x.com/...

✅ 检查完成: 2026-02-04 06:30:08
📈 总计: 区块链 2 条 | AI 1 条
```

## 自动监控

此功能被 HEARTBEAT 使用，每 1 小时自动检查一次。

配置位置：`~/.openclaw/workspace/HEARTBEAT.md`

## 技术细节

- 使用 bird CLI 获取推文
- 环境变量：AUTH_TOKEN, CT0
- 输出格式：分类、统计、链接
- 脚本位置：`~/.openclaw/workspace/scripts/check-multiple-lists.sh`
