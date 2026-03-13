#!/usr/bin/env sh
set -eu

root="/Users/linzeran/code/2026-zn/harnees_aimp"

"$root/agent-gateway-basic/scripts/test.sh"
"$root/agent-business-solution/scripts/test.sh"
echo "skip L3 runtime test: atomic-ai-engine is SDK mode"
"$root/agent-model-runtime/scripts/test.sh"
"$root/agent-knowledge-ops/scripts/test.sh"
"$root/agent-model-hub/scripts/test.sh"
"$root/agent-platform-foundation/scripts/test.sh"

echo "test runner ok"
