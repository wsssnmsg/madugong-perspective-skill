#!/bin/bash
# ========================================================
# 马督工（马前卒）思维操作系统 — 一键安装脚本
# ========================================================
# 使用方法:
#   bash <(curl -sL https://raw.githubusercontent.com/<用户名>/madugong-perspective/main/scripts/install.sh)
#
# 或下载后:
#   chmod +x install.sh && ./install.sh
# ========================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}"
echo "  ╔═══════════════════════════════════════════╗"
echo "  ║   马督工（马前卒）思维操作系统 安装脚本   ║"
echo "  ║   MaduGong Perspective Skill Installer    ║"
echo "  ╚═══════════════════════════════════════════╝"
echo -e "${NC}"

# --- 检查 Hermes 是否已安装 ---
if ! command -v hermes &>/dev/null; then
    echo -e "${RED}[错误] 未检测到 hermes 命令。${NC}"
    echo ""
    echo "请先安装 Hermes Agent:"
    echo "  pip install hermes-agent"
    echo "  或参考: https://github.com/nousresearch/hermes"
    echo ""
    exit 1
fi

HERMES_VERSION=$(hermes --version 2>/dev/null || echo "未知")
echo -e "${GREEN}[✓] 检测到 Hermes: ${HERMES_VERSION}${NC}"

# --- 确定安装路径 ---
SKILLS_DIR="${HERMES_SKILLS_DIR:-$HOME/.hermes/skills}"
TARGET_DIR="$SKILLS_DIR/madugong-perspective"

# --- 检查是否已安装 ---
if [ -d "$TARGET_DIR" ]; then
    echo -e "${YELLOW}[!] 目录已存在: $TARGET_DIR${NC}"
    echo -n -e "${YELLOW}[?] 是否覆盖更新？(y/N): ${NC}"
    read -r confirm
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        echo -e "${RED}安装已取消${NC}"
        exit 0
    fi
    rm -rf "$TARGET_DIR"
fi

# --- 克隆或复制 ---
SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
if [ -f "$SCRIPT_DIR/SKILL.md" ]; then
    # 本地安装（下载了仓库文件）
    echo -e "${BLUE}[*] 检测到本地仓库，复制文件中...${NC}"
    mkdir -p "$TARGET_DIR"
    cp -r "$SCRIPT_DIR/SKILL.md" "$TARGET_DIR/"
    cp -r "$SCRIPT_DIR/references" "$TARGET_DIR/" 2>/dev/null || true
    mkdir -p "$TARGET_DIR/references"
    echo -e "${GREEN}[✓] 已从本地复制${NC}"
else
    # 克隆仓库
    echo -e "${BLUE}[*] 克隆仓库中...${NC}"
    REPO_URL="https://github.com/<用户名>/madugong-perspective.git"
    git clone "$REPO_URL" "$TARGET_DIR"
    echo -e "${GREEN}[✓] 仓库已克隆${NC}"
fi

# --- 启用 Skill ---
echo -e "${BLUE}[*] 启用 Skill...${NC}"
if hermes skills enable madugong-perspective 2>/dev/null; then
    echo -e "${GREEN}[✓] Skill 已启用${NC}"
else
    echo -e "${YELLOW}[!] 启用失败，尝试手动方法...${NC}"
    # 对于较老的 Hermes 版本
    echo -e "${YELLOW}[!] 请手动运行: hermes skills enable madugong-perspective${NC}"
fi

# --- 可选：配置为独立人格 ---
echo ""
echo -e "${CYAN}─────────────────────────────────────────${NC}"
echo -e "${CYAN}  配置为独立人格？（可选）${NC}"
echo -e "${CYAN}─────────────────────────────────────────${NC}"
echo -n -e "${YELLOW}[?] 是否创建马督工独立人格 profile？(y/N): ${NC}"
read -r setup_profile

if [[ "$setup_profile" =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}[*] 创建 profile...${NC}"
    hermes profile create madugong --clone-from default
    
    PROFILE_DIR="$HOME/.hermes/profiles/madugong"
    
    # 复制 SOUL.md
    if [ -f "$SCRIPT_DIR/SOUL.md" ]; then
        cp "$SCRIPT_DIR/SOUL.md" "$PROFILE_DIR/"
    fi
    
    # 复制 skill
    mkdir -p "$PROFILE_DIR/skills/madugong-perspective"
    cp -r "$TARGET_DIR"/* "$PROFILE_DIR/skills/madugong-perspective/"
    
    # 禁用冲突人格
    if [ -f "$PROFILE_DIR/config.yaml" ]; then
        echo -e "${YELLOW}[!] 请编辑 $PROFILE_DIR/config.yaml${NC}"
        echo -e "${YELLOW}    在 skills.disabled 中添加其他所有人格 skill 名称${NC}"
    fi
    
    echo ""
    echo -e "${GREEN}[✓] 独立人格已创建！启动方式:${NC}"
    echo -e "  tmux new -s madugong"
    echo -e "  hermes --profile madugong"
fi

# --- 完成 ---
echo ""
echo -e "${GREEN}═════════════════════════════════════════${NC}"
echo -e "${GREEN}  🎉 马督工思维操作系统安装完成！${NC}"
echo -e "${GREEN}═════════════════════════════════════════${NC}"
echo ""
echo -e "使用方式："
echo -e "  直接调用（Skill 模式）:"
echo -e "    「用马督工的视角看看这个」"
echo -e "    「督工会怎么评论这个新闻」"
echo -e ""
echo -e "  独立人格（Profile 模式）:"
echo -e "    tmux new -s madugong"
echo -e "    hermes --profile madugong"
echo ""
echo -e "  ${YELLOW}资源文件位于:${NC} $TARGET_DIR"
echo -e "  ${YELLOW}调研资料:${NC}    $TARGET_DIR/references/research/"
echo ""

# --- 验证 ---
echo -e "${BLUE}[*] 验证安装...${NC}"
if [ -f "$TARGET_DIR/SKILL.md" ]; then
    SKILL_SIZE=$(wc -c < "$TARGET_DIR/SKILL.md")
    RESEARCH_COUNT=$(find "$TARGET_DIR/references/research" -name "*.md" 2>/dev/null | wc -l)
    echo -e "${GREEN}[✓] SKILL.md ($SKILL_SIZE 字节) ${NC}"
    echo -e "${GREEN}[✓] 调研文件 ($RESEARCH_COUNT 个) ${NC}"
    echo -e "${GREEN}[✓] 安装完整性验证通过${NC}"
else
    echo -e "${RED}[!] 警告: SKILL.md 未找到，安装可能不完整${NC}"
fi
