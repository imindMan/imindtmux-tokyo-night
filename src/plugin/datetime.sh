#!/usr/bin/env bash
#
# shellcheck disable=SC2005
plugin_datetime_icon=""
plugin_datetime_accent_color="magenta"
plugin_datetime_accent_color_icon="blue0"
plugin_datetime_format="%H:%M %d/%m/%Y"

function load_plugin() {
  echo "${plugin_datetime_format}"
} 

export plugin_datetime_icon plugin_datetime_accent_color plugin_datetime_accent_color_icon
