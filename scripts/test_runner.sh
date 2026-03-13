#!/usr/bin/env sh
set -eu

root="/Users/linzeran/code/2026-zn/harnees_aimp"

"$root/agent-gateway-basic/scripts/test.sh"
"$root/agent-business-solution/scripts/test.sh"
"$root/atomic-ai-service/scripts/test.sh"
"$root/agent-model-runtime/scripts/test.sh"
"$root/agent-knowledge-ops/scripts/test.sh"
"$root/agent-model-hub/scripts/test.sh"
"$root/agent-platform-foundation/scripts/test.sh"

echo "test runner ok"
