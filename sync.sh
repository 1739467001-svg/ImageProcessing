#!/bin/bash
# 自动同步到 GitHub：有改动才提交并推送，幂等、失败不报错中断。
cd "/Users/mac/Documents/CJY项目/ImageProcessing" 2>/dev/null || exit 0
[ -d .git ] || exit 0
if [ -n "$(git status --porcelain)" ]; then
  git add -A
  git commit -m "auto-sync: $(date '+%Y-%m-%d %H:%M:%S')" >/dev/null 2>&1
  if git push origin main >/dev/null 2>&1; then
    echo "✓ 已同步到 GitHub"
  else
    echo "⚠ git push 失败（检查网络/认证：gh auth status）"
  fi
fi
