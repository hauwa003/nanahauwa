#!/usr/bin/env bash
#
# test_gsd.sh - Tests for the gsd CLI tool.

set -euo pipefail

GSD="$(cd "$(dirname "$0")" && pwd)/gsd"
PASS=0
FAIL=0

setup() {
  export GSD_DATA_DIR
  GSD_DATA_DIR=$(mktemp -d)
}

teardown() {
  rm -rf "$GSD_DATA_DIR"
}

assert_eq() {
  local label="$1" expected="$2" actual="$3"
  if [[ "$expected" == "$actual" ]]; then
    echo "  PASS: $label"
    PASS=$((PASS + 1))
  else
    echo "  FAIL: $label"
    echo "    expected: $expected"
    echo "    actual:   $actual"
    FAIL=$((FAIL + 1))
  fi
}

assert_contains() {
  local label="$1" pattern="$2" actual="$3"
  if echo "$actual" | grep -qF "$pattern"; then
    echo "  PASS: $label"
    PASS=$((PASS + 1))
  else
    echo "  FAIL: $label"
    echo "    expected to contain: $pattern"
    echo "    actual: $actual"
    FAIL=$((FAIL + 1))
  fi
}

assert_exit_code() {
  local label="$1" expected="$2"
  shift 2
  local actual=0
  "$@" >/dev/null 2>&1 || actual=$?
  if [[ "$expected" -eq "$actual" ]]; then
    echo "  PASS: $label"
    PASS=$((PASS + 1))
  else
    echo "  FAIL: $label"
    echo "    expected exit code: $expected"
    echo "    actual exit code:   $actual"
    FAIL=$((FAIL + 1))
  fi
}

# ── Tests ────────────────────────────────────────────────────────────────

echo "=== help ==="
setup
  out=$("$GSD" help)
  assert_contains "shows program name" "gsd" "$out"
  assert_contains "shows version" "0.1.0" "$out"
  assert_contains "lists add command" "add" "$out"
teardown

echo "=== version ==="
setup
  out=$("$GSD" version)
  assert_eq "version output" "gsd 0.1.0" "$out"
teardown

echo "=== add ==="
setup
  out=$("$GSD" add "Buy groceries")
  assert_contains "confirms add" "Added task 1: Buy groceries" "$out"

  out=$("$GSD" add "Walk the dog")
  assert_contains "increments id" "Added task 2" "$out"

  assert_exit_code "add without description fails" 1 "$GSD" add
teardown

echo "=== list ==="
setup
  out=$("$GSD" list)
  assert_contains "empty list message" "No tasks yet" "$out"

  "$GSD" add "Task A" >/dev/null
  "$GSD" add "Task B" >/dev/null

  out=$("$GSD" list)
  assert_contains "shows task A" "Task A" "$out"
  assert_contains "shows task B" "Task B" "$out"
  assert_contains "pending marker" "[ ]" "$out"
teardown

echo "=== list filters ==="
setup
  "$GSD" add "Pending task" >/dev/null
  "$GSD" add "Done task" >/dev/null
  "$GSD" done 2 >/dev/null

  out=$("$GSD" list --pending)
  assert_contains "pending filter shows pending" "Pending task" "$out"

  out=$("$GSD" list --done)
  assert_contains "done filter shows done" "Done task" "$out"
  assert_contains "done marker" "[x]" "$out"
teardown

echo "=== done ==="
setup
  "$GSD" add "Finish report" >/dev/null

  out=$("$GSD" done 1)
  assert_contains "marks task done" "Completed task 1" "$out"

  out=$("$GSD" done 1)
  assert_contains "already done message" "already marked as done" "$out"

  assert_exit_code "done with missing id fails" 1 "$GSD" done
  assert_exit_code "done with invalid id fails" 1 "$GSD" done 999
  assert_exit_code "done with non-numeric fails" 1 "$GSD" done abc
teardown

echo "=== remove ==="
setup
  "$GSD" add "Temporary task" >/dev/null
  "$GSD" add "Keep this" >/dev/null

  out=$("$GSD" remove 1)
  assert_contains "confirms removal" "Removed task 1" "$out"

  out=$("$GSD" list)
  assert_contains "removed task is gone" "Keep this" "$out"

  assert_exit_code "remove with missing id fails" 1 "$GSD" remove
  assert_exit_code "remove nonexistent fails" 1 "$GSD" remove 999
teardown

echo "=== status ==="
setup
  out=$("$GSD" status)
  assert_contains "empty status" "No tasks yet" "$out"

  "$GSD" add "Task 1" >/dev/null
  "$GSD" add "Task 2" >/dev/null
  "$GSD" done 1 >/dev/null

  out=$("$GSD" status)
  assert_contains "total count" "2 total" "$out"
  assert_contains "pending count" "1 pending" "$out"
  assert_contains "done count" "1 done" "$out"
  assert_contains "progress" "50% complete" "$out"
teardown

echo "=== unknown command ==="
setup
  assert_exit_code "unknown command fails" 1 "$GSD" foobar
teardown

# ── Summary ──────────────────────────────────────────────────────────────

echo ""
echo "Results: $PASS passed, $FAIL failed"
if [[ "$FAIL" -gt 0 ]]; then
  exit 1
fi
