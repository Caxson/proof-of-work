#!/usr/bin/env bash
# proof-of-work hook dispatcher.
# Usage: run-hook.sh <event>
# Currently handles: session-start -> inject the Engineering Doctrine into context.
set -euo pipefail

EVENT="${1:-}"
HOOK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_ROOT="$(cd "${HOOK_DIR}/.." && pwd)"

case "${EVENT}" in
  session-start)
    # stdout from a SessionStart hook is injected into the model's context.
    cat "${PLUGIN_ROOT}/doctrine.md"
    ;;
  *)
    echo "run-hook.sh: unknown event '${EVENT}'" >&2
    exit 1
    ;;
esac
