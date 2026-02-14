#!/bin/bash

# Script to switch workspace and move Slack drawing windows along
target_workspace=$1

# Switch to the target workspace
aerospace workspace $target_workspace

# Find and move any Slack windows with title exactly "Slack" to the current workspace
aerospace list-windows --all --format '%{window-id}|%{app-bundle-id}|%{window-title}' | \
  grep "com.tinyspeck.slackmacgap.*|Slack$" | \
  cut -d'|' -f1 | \
  while read window_id; do
    if [ -n "$window_id" ]; then
      aerospace move-node-to-workspace $target_workspace --window-id $window_id
    fi
  done

aerospace list-windows --all --format '%{window-id}|%{app-bundle-id}|%{window-title}' | \
  grep "com.tinyspeck.slackmacgap.*|Slack$" | \
  cut -d'|' -f1 | \
  while read window_id; do
    if [ -n "$window_id" ]; then
      aerospace move-node-to-workspace $target_workspace --window-id $window_id
    fi
  done

sleep 0.05
aerospace list-windows --all --format '%{window-id}|%{app-bundle-id}|%{window-title}' | \
  grep "com.tinyspeck.slackmacgap.*|Slack$" | \
  cut -d'|' -f1 | \
  while read window_id; do
    if [ -n "$window_id" ]; then
      aerospace move-node-to-workspace $target_workspace --window-id $window_id
    fi
  done

sleep 0.10
aerospace list-windows --all --format '%{window-id}|%{app-bundle-id}|%{window-title}' | \
  grep "com.tinyspeck.slackmacgap.*|Slack$" | \
  cut -d'|' -f1 | \
  while read window_id; do
    if [ -n "$window_id" ]; then
      aerospace move-node-to-workspace $target_workspace --window-id $window_id
    fi
  done
