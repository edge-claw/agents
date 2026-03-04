# Skills 速查表

> 更新时间：2026-03-04 | 共 24 个 skill
> **使用方式：直接描述需求，无需指定 skill 名**

---

## 一、币安市场数据

### `crypto-market-rank` v2.0
**功能**：查询加密货币综合排行榜，包括趋势代币、热搜榜、聪明钱净流入榜、Binance Alpha 榜、顶级交易员 PnL 榜。

**用例**：
- "现在哪些代币最火，聪明钱在买什么"
- "Binance Alpha 今日有哪些推荐代币"
- "过去 4 小时净流入最多的前 10 个代币"
- "查看 BSC 链顶级交易员今日盈亏排行"

---

### `meme-rush` v1.0
**功能**：追踪 BSC（Four.meme）和 Solana（Pump.fun）上 Meme 代币的全生命周期，分新建 / 接近迁移 / 已迁移三个阶段；同时提供 AI 驱动的热门叙事榜。

**用例**：
- "BSC 上最近热门的 Meme 币有哪些"
- "Four.meme 上有哪些快要迁移到 DEX 的代币"
- "Pump.fun 今天刚上的新 Meme 币，过滤掉开发者刷量的"
- "当前最热的链上叙事是什么，关联哪些代币"

---

### `trading-signal` v1.0
**功能**：获取链上聪明钱交易信号，包括触发价、当前价、历史最高收益（maxGain）和聪明钱离场率（exitRate）。

**用例**：
- "有哪些聪明钱正在买入的信号"
- "给我 BSC 上 maxGain 最高的几个活跃信号"
- "这个代币有没有聪明钱买入信号"
- "聪明钱离场率低于 30% 的活跃信号有哪些"

---

## 二、代币分析

### `query-token-info` v1.0
**功能**：按名称、symbol 或合约地址查询代币详情，包括价格、24h 涨跌幅、市值、流动性、持有人、K 线（支持 15 档时间粒度）。

**用例**：
- "查一下 PEPE 的当前价格和市值"
- "这个合约地址 0x... 是什么代币"
- "给我看 BNB 最近 4 小时的 K 线"
- "这个代币的持有人数和聪明钱持有比例"

---

### `query-token-audit` v1.4
**功能**：交易前自动审计代币合约安全性，检测蜜罐、跑路风险、增发权限、冻结权限、买卖税等，支持 BSC / ETH / Base / Solana。

**用例**：
- "这个代币合约安全吗，帮我查一下有没有风险"
- "买之前先审计一下 0x... 合约"
- "这个代币的买卖税是多少，有没有黑名单"
- "判断这是不是蜜罐合约"

---

### `query-address-info` v1.0
**功能**：查询任意链上钱包地址的持仓，返回所有代币余额、当前价格、24h 涨跌幅和持有数量。

**用例**：
- "查一下这个地址 0x... 持有哪些代币"
- "分析这个聪明钱地址的持仓"
- "这个鲸鱼钱包现在重仓了什么"
- "我的钱包 0x... 当前总资产和持仓列表"

---

## 三、BNB Chain 链上操作

### `bnbchain-mcp` v1.0
**功能**：连接 BNB Chain MCP 服务器，执行完整链上操作：查区块 / 交易、读写合约、转账 BNB/ERC20/NFT、ERC-8004 AI Agent 身份注册、Greenfield 去中心化存储。需本地运行 `npx @bnb-chain/mcp@latest`。

**用例**：
- "查一下地址 0x... 在 BSC 上的 BNB 余额"
- "帮我把 0.1 BNB 转到 0x... 地址"
- "读取这个合约的 balanceOf 函数"
- "在 Greenfield 上创建一个存储桶"
- "帮我注册 ERC-8004 AI Agent 身份"

---

## 四、OKX OnchainOS（多链 DEX）

> 需要 OKX API Key：https://web3.okx.com/onchain-os/dev-portal

### `okx-wallet-portfolio`
**功能**：查询钱包在 20+ 条链上的代币余额、持仓分布和总资产价值。

**用例**：
- "查看我钱包 0x... 在所有链上的总资产"
- "我在 Base 链上持有哪些代币"
- "统计我的跨链总持仓价值"

---

### `okx-dex-market`
**功能**：获取实时代币价格、K 线图（OHLCV）、成交历史、指数价格，覆盖 20+ 条链。

**用例**：
- "ETH 当前价格是多少"
- "查看 OKB 近 4 小时 K 线"
- "这个代币最近的成交历史"

---

### `okx-dex-token`
**功能**：搜索代币、获取元数据（创建者、社交链接）、市值排名、持仓人分析，覆盖 20+ 条链。

**用例**：
- "搜索名字里带 AI 的代币"
- "X Layer 链上现在最热的代币是什么"
- "这个代币的最大持仓地址是谁"
- "查询合约 0x... 的代币详情和社交链接"

---

### `okx-dex-swap`
**功能**：通过 OKX 聚合 500+ DEX 流动性，获取最优兑换报价并生成完整 swap 交易数据（含 calldata），支持 20+ 链。

**用例**：
- "用 100 USDT 换 ETH，给我最优报价"
- "在 Base 链上把 2 ETH 换成 USDC"
- "Solana 上换 1 SOL 为 USDC"
- "帮我生成 USDT approve 的授权 calldata"

---

### `okx-onchain-gateway`
**功能**：Gas 估算、交易模拟（防失败）、交易广播上链、订单状态追踪。

**用例**：
- "模拟一下这笔交易会不会成功"
- "当前 ETH 的 Gas 费大概多少"
- "广播这笔已签名的交易"
- "追踪这个交易哈希 0x... 的状态"

---

## 五、Uniswap / DeFi 开发

### `swap-planner` v0.2.1
**功能**：规划 Uniswap 上的代币兑换，生成可直接在 Uniswap 界面执行的深链接，支持代币关键词搜索发现。

**用例**：
- "我想在 Uniswap 上把 ETH 换成 USDC，帮我生成链接"
- "查一下有没有值得买的 AI 相关代币"
- "生成在 Base 链 swap 0.1 ETH → PEPE 的链接"

---

### `swap-integration` v1.2.0
**功能**：在应用程序中集成 Uniswap swap，支持前端（Trading API）和智能合约（Universal Router）两种方案，提供完整代码。

**用例**：
- "帮我在 React 项目里集成 Uniswap swap 组件"
- "写一个用 Universal Router 执行 swap 的脚本"
- "用 Trading API 实现自动化交易机器人"

---

### `liquidity-planner` v0.2.0
**功能**：规划 Uniswap v2/v3/v4 流动性头寸，根据当前价格建议价格区间，生成一键创建 LP 的深链接。

**用例**：
- "我想在 Uniswap v3 上为 ETH/USDC 提供流动性，帮我规划"
- "给我生成一个 ETH/USDC 集中流动性头寸的链接"
- "v4 上怎么创建一个 ±10% 价格区间的 LP"

---

### `viem-integration` v1.0.0
**功能**：为 TypeScript/JavaScript 项目集成 viem 库，连接 EVM 区块链、读取链上数据、发送交易、交互合约、集成钱包（支持 wagmi）。

**用例**：
- "用 viem 读取 BSC 上某合约的数据，帮我写代码"
- "用 wagmi 在 React 里集成钱包连接功能"
- "写一个监听 Transfer 事件的脚本"

---

### `v4-security-foundations` v1.1.0
**功能**：Uniswap v4 Hook 安全开发指南，涵盖 14 种 Hook 权限风险矩阵、常见漏洞模式、审计要点。

**用例**：
- "我要写一个 v4 Hook，有哪些安全注意事项"
- "帮我分析这个 beforeSwap Hook 有没有重入漏洞"
- "v4 Hook 审计清单给我看看"

---

### `configurator` v1.0.0
**功能**：交互式配置 CCA（持续清算拍卖）智能合约参数，通过批量问答引导完成全部配置。

**用例**：
- "帮我配置一个 CCA 拍卖合约参数"
- "设置代币拍卖的供应计划"

---

### `deployer` v1.0.0
**功能**：通过 Factory 模式部署 CCA 智能合约，支持 CREATE2 跨链一致地址。

**用例**：
- "部署一个 CCA 拍卖合约到 Base 链"
- "用 Factory 方式部署已配置好的拍卖合约"

---

## 六、信息获取

### `twitter-fetch`
**功能**：获取 Twitter/X 推文或 Article 长文内容，使用 fxtwitter API，免费无需 Key。

**用例**：
- "帮我看看这条推文说了什么 https://x.com/..."
- "获取这篇 Twitter Article 的全文"
- "读取这条推文的评论数和转发数"

---

### `twitter-lists`
**功能**：监控多个 Twitter Lists，按区块链 / AI 分类聚合展示重要推文，支持过滤。

**用例**：
- "查看我订阅的区块链推特列表最新动态"
- "有没有 AI 相关的重要推文更新"
- "查看推特列表"

---

### `opentwitter` v1.0.0
**功能**：通过 6551.io API 查询 Twitter/X 数据，支持用户信息、推文搜索、时间线、粉丝事件、已删推文、KOL 追踪。需 `TWITTER_TOKEN`（已配置）。

**用例**：
- "搜索推特上关于 BNB Chain 的最新讨论"
- "查看 @BNBChain 最近发了什么推文"
- "查询这个 KOL 的粉丝列表"
- "有没有人最近删推了，帮我找找"

---

### `opennews` v1.0.0
**功能**：加密货币新闻搜索，含 AI 评分、交易信号、Bloomberg/Reuters 聚合，支持关键词/币种/来源过滤，可订阅 WebSocket 实时推送。需 `OPENNEWS_TOKEN`（已配置）。

**用例**：
- "搜索关于 BTC ETF 的最新新闻"
- "有哪些高 AI 评分的 ETH 相关新闻"
- "从 Bloomberg 获取今天的加密货币新闻"
- "给我实时监控 SOL 相关新闻动态"

---

## 七、安全工具

### `skill-vetter` v1.0.0
**功能**：安装新 skill 前的安全审查协议。检查来源可信度、扫描危险代码模式（外发数据、读取凭据、混淆代码等），输出风险等级报告（🟢低/🟡中/🔴高/⛔极高）。

**用例**：
- "帮我审查一下这个 skill 安不安全：https://github.com/xxx/yyy"
- "安装这个 skill 之前先检查一下有没有风险"
- "这个 SKILL.md 有什么可疑的地方吗"

---

## 快速命令

```bash
npx skills list          # 查看已安装 skills
npx skills check         # 检查是否有更新
npx skills add <来源> --skill <名称> -g -y   # 安装新 skill

# 查看速查表（任意设备，无需登录）
# https://github.com/edge-claw/agents/blob/master/SKILLS_INDEX.md

# 更新速查表后同步到 GitHub
cd ~/.agents && git add -A && git commit -m "update: skills index" && git push
```

## 全链路能力图

```
信息发现层
  crypto-market-rank + meme-rush + trading-signal（Binance 数据）
  okx-dex-token + okx-dex-market（OKX 多链数据）
  twitter-fetch + twitter-lists（社交信息，免费）
  opentwitter + opennews（6551.io，深度 Twitter/新闻，需 Token）
          ↓
代币验证层
  query-token-info + query-token-audit + query-address-info
          ↓
执行层（链上）
  bnbchain-mcp（BSC/opBNB/EVM 链上操作）
  okx-dex-swap + okx-onchain-gateway（多链 DEX swap，需 OKX API Key）
执行层（开发）
  swap-planner / swap-integration / liquidity-planner（Uniswap）
  viem-integration（EVM 开发）
```
