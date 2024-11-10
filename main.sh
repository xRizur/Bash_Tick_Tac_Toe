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
    echo "To pole jest już zajęte."
    return 1
  fi
}

check_win() {
  local win_combinations=(
    "0 1 2" "3 4 5" "6 7 8" 
    "0 3 6" "1 4 7" "2 5 8" 
    "0 4 8" "2 4 6"        
  )

  for combo in "${win_combinations[@]}"; do
    set -- $combo
    if [[ ${board[$1]} == ${board[$2]} && ${board[$2]} == ${board[$3]} ]]; then
      echo "Gracz ${board[$1]} wygrywa!"
      return 0
    fi
  done

  return 1
}

check_draw() {
  for i in "${board[@]}"; do
    if [[ $i != "X" && $i != "O" ]]; then
      return 1
    fi
  done
  echo "Remis!"
  return 0
}

current_player="X"

while true; do
  draw_board
  echo "Gracz $current_player, wybierz pole (1-9):"
  read -r move

  if ! [[ $move =~ ^[1-9]$ ]]; then
    echo "Niepoprawny ruch. Wybierz numer od 1 do 9."
    continue
  fi

  if make_move "$current_player" "$move"; then
    if check_win; then
      draw_board
      break
    elif check_draw; then
      draw_board
      break
    fi

    if [[ $current_player == "X" ]]; then
      current_player="O"
    else
      current_player="X"
    fi
  fi
done

