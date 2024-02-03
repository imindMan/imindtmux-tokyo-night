#!/usr/bin/env bash
function generate_left_side_string() {
  local separator_end="#[bg=${PALLETE[bg_highlight]}]#{?client_prefix,#[fg=${PALLETE[yellow]}],#[fg=${PALLETE[green]}]}${left_separator:?}#[none]"

  echo "#[fg=${PALLETE[fg_gutter]},bold]#{?client_prefix,#[bg=${PALLETE[yellow]}],#[bg=${PALLETE[green]}]}  #S ${separator_end}"
}

function generate_inactive_window_string() {
  local separator_start="#[bg=${PALLETE['dark5']},fg=${PALLETE['bg_dark']}]${left_separator:?}#[none]"
  local separator_internal="#[bg=${PALLETE['dark3']},fg=${PALLETE['dark5']}]${left_separator:?}#[none]"
  local separator_end="#[bg=${PALLETE[bg_dark]},fg=${PALLETE['dark3']}]${left_separator:?}#[none]"

  echo "${separator_start}#[fg=${PALLETE[bg]}]#I${separator_internal}#[fg=${PALLETE[bg]}] #{?window_zoomed_flag, , }#W ${separator_end}"
}

function generate_active_window_string() {
  separator_start="#[bg=${PALLETE['blue0']},fg=${PALLETE['bg_dark']}]${left_separator:?}#[none]"
  separator_internal="#[bg=${PALLETE['blue']},fg=${PALLETE['blue0']}]${left_separator:?}#[none]"
  separator_end="#[bg=${PALLETE[bg_dark]},fg=${PALLETE['blue']}]${left_separator:?}#[none]"

  echo  "${separator_start}#[fg=${PALLETE[bg]}]#I${separator_internal}#[fg=${PALLETE[bg]}] #{?window_zoomed_flag, , }#W ${separator_end}#[none]"
}
