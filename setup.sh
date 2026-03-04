#!/usr/bin/env bash
# ~/.agents/setup.sh
# 新设备一键配置：创建所有必要的符号链接
# 用法: bash ~/.agents/setup.sh
set -e

AGENTS_DIR="$HOME/.agents"
CLAUDE_SKILLS="$HOME/.claude/skills"
OPENCLAW_SKILLS="$HOME/.openclaw/skills"

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'

echo -e "${CYAN}=== 配置 ~/.claude/skills 符号链接 ===${NC}"
mkdir -p "$CLAUDE_SKILLS"

for skill_dir in "$AGENTS_DIR/skills"/*/; do
    skill_name=$(basename "$skill_dir")
    target="$CLAUDE_SKILLS/$skill_name"
    if [ -L "$target" ] || [ -e "$target" ]; then
        echo -e "  ${YELLOW}跳过${NC} $skill_name (已存在)"
    else
        ln -sf "$skill_dir" "$target"
        echo -e "  ${GREEN}链接${NC} $skill_name"
    fi
done

echo ""
echo -e "${CYAN}=== 配置 ~/.openclaw/skills 符号链接 ===${NC}"
mkdir -p "$OPENCLAW_SKILLS"

for skill_dir in "$AGENTS_DIR/skills"/*/; do
    skill_name=$(basename "$skill_dir")
    target="$OPENCLAW_SKILLS/$skill_name"
    if [ -L "$target" ] || [ -e "$target" ]; then
        echo -e "  ${YELLOW}跳过${NC} $skill_name (已存在)"
    else
        ln -sf "$skill_dir" "$target"
        echo -e "  ${GREEN}链接${NC} $skill_name"
    fi
done

echo ""
echo -e "${CYAN}=== notebooklm 本地缓存目录 ===${NC}"
NB_CACHE="$HOME/.local/share/notebooklm"
mkdir -p "$NB_CACHE/data/browser_state"

NB_SKILL="$AGENTS_DIR/skills/notebooklm"
for link_name in .venv data; do
    if [ ! -L "$NB_SKILL/$link_name" ]; then
        ln -sf "$NB_CACHE/$link_name" "$NB_SKILL/$link_name"
        echo -e "  ${GREEN}链接${NC} notebooklm/$link_name -> $NB_CACHE/$link_name"
    else
        echo -e "  ${YELLOW}跳过${NC} notebooklm/$link_name (已存在)"
    fi
done

echo ""
echo -e "${GREEN}=== 完成 ===${NC}"
echo ""
echo "下一步："
echo "  1. 将 API Keys 写入 ~/.bashrc："
echo "     export TELEGRAM_BOT_TOKEN=\"...\""
echo "     export TELEGRAM_CHAT_ID=\"...\""
echo "     export OKX_API_KEY=\"...\""
echo "     export TWITTER_TOKEN=\"...\""
echo "     export OPENNEWS_TOKEN=\"...\""
echo "  2. notebooklm 需在有界面的设备上重新登录 Google："
echo "     python ~/.agents/skills/notebooklm/scripts/run.py auth_manager.py setup"
