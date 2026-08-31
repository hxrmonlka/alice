#!/usr/bin/env bash
set -euo pipefail

SOURCE_FILE="$HOME/.config/DankMaterialShell/settings.json"
REPO_ROOT="$(git rev-parse --show-toplevel)"
TARGET_FILE="${REPO_ROOT}/modules/home/alice/desktop/dms-settings.json"

if [[ ! -f "${SOURCE_FILE}" ]]; then
	echo "error: source file not found: ${SOURCE_FILE}" >&2
	exit 1
fi

if [[ ! -s "${SOURCE_FILE}" ]]; then
	echo "error: source file is empty: ${SOURCE_FILE}" >&2
	exit 1
fi

mkdir -p "$(dirname "${TARGET_FILE}")"
cp "${SOURCE_FILE}" "${TARGET_FILE}"

echo "synced: ${SOURCE_FILE} -> ${TARGET_FILE}"
