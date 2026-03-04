#!/usr/bin/env bash
# ~/.claude/skills/update-skills.sh
# 统一更新所有 Claude Skills
# 用法: bash ~/.claude/skills/update-skills.sh

set -e
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'

echo -e "${CYAN}=== Claude Skills 更新检查 ===${NC}"
echo ""

# ── 1. skills CLI 管理的 skill（bnbchain-mcp 等）──────────────────────────────
echo -e "${YELLOW}[1/2] skills CLI 检查更新...${NC}"
UPDATE_OUTPUT=$(npx skills check 2>&1)
echo "$UPDATE_OUTPUT"

if echo "$UPDATE_OUTPUT" | grep -q "update available\|updates available\|outdated"; then
    echo ""
    read -p "发现新版本，是否立即更新？ [y/N] " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        npx skills update
        echo -e "${GREEN}✓ skills CLI 管理的 skills 已更新${NC}"
    fi
else
    echo -e "${GREEN}✓ 已是最新版本${NC}"
fi

echo ""

# ── 2. OpenClaw Uniswap skills（GitHub 源，hash 追踪）────────────────────────
echo -e "${YELLOW}[2/2] 检查 OpenClaw skills (Uniswap/uniswap-ai)...${NC}"
LOCK_FILE="$HOME/.openclaw/skills-lock.json"
if [ -f "$LOCK_FILE" ]; then
    SOURCES=$(python3 -c "
import json
with open('$LOCK_FILE') as f:
    d = json.load(f)
repos = set()
for v in d.get('skills',{}).values():
    if v.get('sourceType') == 'github':
        repos.add(v.get('source',''))
for r in sorted(repos):
    print(r)
" 2>/dev/null)

    for repo in $SOURCES; do
        echo -n "  检查 $repo ... "
        LATEST=$(curl -sf "https://api.github.com/repos/$repo/commits/main" \
            -H "Accept: application/vnd.github.v3+json" 2>/dev/null \
            | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['sha'][:12], d['commit']['message'][:50])" 2>/dev/null)
        if [ -n "$LATEST" ]; then
            echo -e "${GREEN}最新 commit: $LATEST${NC}"
        else
            echo -e "${YELLOW}(无法获取，可能需要 GitHub token)${NC}"
        fi
    done

    echo ""
    echo -e "  ${CYAN}提示：OpenClaw skills 由 OpenClaw 自动管理。"
    echo -e "  手动更新：在 OpenClaw 中执行 skills update 命令${NC}"
else
    echo -e "  ${RED}未找到 skills-lock.json${NC}"
fi

echo ""
echo -e "${CYAN}=== 完成 ===${NC}"
echo ""
echo "快速命令参考："
echo "  检查更新: npx skills check"
echo "  立即更新: npx skills update"
echo "  查看列表: npx skills list"
