#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
TARGET_FILE="${REPO_ROOT}/modules/home/alice/desktop/dms-settings.json"

SETTINGS_JSON="$(dms ipc call settings dump)"

if [[ -z "${SETTINGS_JSON}" ]]; then
	echo "error: 'dms ipc call settings dump' returned nothing. Is DMS running?" >&2
	exit 1
fi

if ! printf '%s' "${SETTINGS_JSON}" | python3 -c "import json,sys; json.load(sys.stdin)" >/dev/null 2>&1; then
	echo "error: dump output is not valid JSON" >&2
	exit 1
fi

mkdir -p "$(dirname "${TARGET_FILE}")"
printf '%s\n' "${SETTINGS_JSON}" > "${TARGET_FILE}"

echo "synced: dms ipc call settings dump -> ${TARGET_FILE}"
