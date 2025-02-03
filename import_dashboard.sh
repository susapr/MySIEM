#!/usr/bin/env bash
# Usage: ./import_dashboard.sh <DASHBOARDS_ENDPOINT> <PATH_TO_JSON>

DASHBOARDS_ENDPOINT="$1"
DASHBOARD_JSON="$2"

if [ -z "$DASHBOARDS_ENDPOINT" ] || [ -z "$DASHBOARD_JSON" ]; then
  echo "Usage: $0 <opensearch-dashboards-url> <path-to-dashboard-json>"
  exit 1
fi

echo "Importing dashboard from $DASHBOARD_JSON into $DASHBOARDS_ENDPOINT"

curl -X POST "${DASHBOARDS_ENDPOINT}/api/saved_objects/_import?overwrite=true" \
  -H "osd-xsrf: true" \
  -F file="@$DASHBOARD_JSON"

echo "Import completed."
