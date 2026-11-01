#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
HOOK_SOURCE="${REPO_ROOT}/.githooks/pre-commit"

if [[ ! -x "${HOOK_SOURCE}" ]]; then
  echo "error: hook source is missing or not executable: ${HOOK_SOURCE}" >&2
  exit 1
fi

if git config core.hooksPath .githooks; then
  echo "configured git hooks path: ${REPO_ROOT}/.githooks"
else
  echo "error: failed to configure git hooks path to .githooks" >&2
  exit 1
fi

echo ">>> ${REPO_ROOT}/.githooks"
