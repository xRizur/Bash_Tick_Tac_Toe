#!/bin/bash

board=(1 2 3 4 5 6 7 8 9)

draw_board() {
  echo ""
  echo " ${board[0]} | ${board[1]} | ${board[2]}"
  echo "---+---+---"
  echo " ${board[3]} | ${board[4]} | ${board[5]}"
  echo "---+---+---"
  echo " ${board[6]} | ${board[7]} | ${board[8]}"
  echo ""
}

make_move() {
  local player=$1
  local position=$2

  if [[ ${board[$position-1]} != "X" && ${board[$position-1]} != "O" ]]; then
    board[$position-1]=$player
    return 0
  else
    echo "This cell is already occupied. Try again."
    return 1
  fi
}

save_game() {
  echo "${board[@]}" > "${username}_save.txt"
  echo "$current_player" >> "${username}_save.txt"
  echo "$mode" >> "${username}_save.txt"
  echo "Game saved for player '$username'."
}

load_game() {
  if [[ -f "${username}_save.txt" ]]; then
    read -r -a board < "${username}_save.txt"
    read -r current_player < <(tail -n 2 "${username}_save.txt" | head -n 1)
    read -r mode < <(tail -n 1 "${username}_save.txt")
    echo "Game loaded for player '$username'."
  else
    echo "No saved game found for player '$username'."
  fi
}

check_game_status() {
  local win_combinations=(
    "0 1 2" "3 4 5" "6 7 8"
    "0 3 6" "1 4 7" "2 5 8"
    "0 4 8" "2 4 6"
  )

  for combo in "${win_combinations[@]}"; do
    set -- $combo
    if [[ ${board[$1]} == "${board[$2]}" && ${board[$2]} == "${board[$3]}" ]]; then
      echo "Player ${board[$1]} wins!"
      return 1
    fi
  done

  for i in "${board[@]}"; do
    if [[ $i != "X" && $i != "O" ]]; then
      return 0
    fi
  done

  echo "It's a draw!"
  return 2
}

ai_move() {
  local available_moves=()

  for i in {0..8}; do
    if [[ ${board[$i]} != "X" && ${board[$i]} != "O" ]]; then
      available_moves+=($i)
    fi
  done

  if [[ ${#available_moves[@]} -gt 0 ]]; then
    local random_index=$((RANDOM % ${#available_moves[@]}))
    local position=${available_moves[$random_index]}
    board[$position]="O"
    echo "AI made a move at cell $((position + 1))"
  fi
}

list_saved_games() {
  echo "Available saved games:"
  ls *_save.txt 2>/dev/null | sed 's/_save.txt//'
}

current_player="X"
mode=""
username=""

list_saved_games

echo "Enter your name:"
read -r username

if [[ -f "${username}_save.txt" ]]; then
  echo "A saved game was found for player '$username'. Do you want to continue? (y/n)"
  read -r resume
  if [[ $resume == "y" ]]; then
    load_game
  fi
fi

if [[ -z "$mode" ]]; then
  echo "Select game mode: (1) Player vs Player, (2) Player vs AI"
  read -r game_mode
  if [[ $game_mode == "2" ]]; then
    mode="ai"
  else
    mode="player"
  fi
fi

while true; do
  draw_board

  if [[ $mode == "ai" && $current_player == "O" ]]; then
    ai_move
    current_player="X"
  else
    echo "Player $current_player, choose a cell (1-9) or type 's' to save and exit:"
    read -r move

    if [[ $move == "s" ]]; then
      save_game
      break
    fi

    if ! [[ $move =~ ^[1-9]$ ]]; then
      echo "Invalid move. Choose a number between 1 and 9."
      continue
    fi

    if make_move "$current_player" "$move"; then
      if [[ $mode == "ai" ]]; then
        current_player="O"
      else
        current_player=$([[ $current_player == "X" ]] && echo "O" || echo "X")
      fi
    fi
  fi

  check_game_status
  status=$?

  if [[ $status -eq 1 || $status -eq 2 ]]; then
    draw_board
    rm -f "${username}_save.txt"
    break
  fi
done
