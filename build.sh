#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

JAVA_BIN="${JAVA_HOME:-}/bin/java"
if [[ ! -x "$JAVA_BIN" ]]; then
  JAVA_BIN="$(command -v java || true)"
fi
if [[ -z "$JAVA_BIN" || ! -x "$JAVA_BIN" ]]; then
  echo "[ERROR] Java 21 is required. Java was not found."
  exit 2
fi
JAVA_MAJOR="$($JAVA_BIN -version 2>&1 | sed -n 's/.*version "\([0-9][0-9]*\).*/\1/p' | head -n1)"
if [[ "$JAVA_MAJOR" != "21" ]]; then
  echo "[ERROR] Java 21 is required; detected Java $JAVA_MAJOR."
  exit 2
fi
JAVA_HOME="$(cd "$(dirname "$JAVA_BIN")/.." && pwd)"
export JAVA_HOME

GRADLE="./.gradle-local/gradle-8.10.2/bin/gradle"
if [[ ! -x "$GRADLE" ]]; then
  echo "[ERROR] Gradle 8.10.2 is not installed locally. Use build.bat on Windows or install Gradle 8.10.2."
  exit 3
fi

exec "$GRADLE" --no-daemon "-Dorg.gradle.java.home=$JAVA_HOME" clean build
