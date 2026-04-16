#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
HOOK_SOURCE="${REPO_ROOT}/.githooks/pre-commit"
HOOK_TARGET="${REPO_ROOT}/.git/hooks/pre-commit"

if [[ ! -x "${HOOK_SOURCE}" ]]; then
  echo "error: hook source is missing or not executable: ${HOOK_SOURCE}" >&2
  exit 1
fi

cp "${HOOK_SOURCE}" "${HOOK_TARGET}"
chmod +x "${HOOK_TARGET}"

echo "installed git hook: ${HOOK_TARGET}"
