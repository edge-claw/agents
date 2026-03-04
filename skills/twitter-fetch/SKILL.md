---
name: twitter-fetch
description: "获取 Twitter/X 推文内容，支持普通推文和 Twitter Article（长文章）。使用 fxtwitter API，完全免费。"
metadata:
  {
    "openclaw":
      {
        "emoji": "🐦",
        "requires": { "bins": ["curl", "python3"] }
      }
  }
---

# Twitter Fetch - 推文内容获取

使用 fxtwitter API 获取 Twitter/X 推文内容，支持普通推文和 Twitter Article。

## 使用方法

```bash
# 获取推文内容
curl -s "https://api.fxtwitter.com/用户名/status/推文ID" | python3 -c "
import json, sys
data = json.load(sys.stdin)
tweet = data['tweet']
print(f\"作者: {tweet['author']['name']} (@{tweet['author']['screen_name']})\")
print(f\"内容: {tweet.get('text', '')}\")
if 'article' in tweet:
    article = tweet['article']
    print(f\"\n文章标题: {article['title']}\")
    for block in article['content']['blocks']:
        text = block.get('text', '').strip()
        if text and block.get('type') != 'atomic':
            print(text)
"
```

## 示例

```bash
# 获取推文
curl -s "https://api.fxtwitter.com/wangray/status/2017624068997189807" | python3 -c "..."
```

## 支持的 URL 格式

- `https://twitter.com/user/status/123456789`
- `https://x.com/user/status/123456789`
- `https://x.com/user/article/123456789`

## 特点

- ✅ 完全免费，无需 API Key
- ✅ 支持 Twitter Article（长文章）
- ✅ 支持普通推文
- ✅ 返回作者、内容、统计数据
