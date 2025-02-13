# Tic-Tac-Toe in Bash

This is a simple **Tic-Tac-Toe** game implemented in **Bash**. It allows you to play in turn-based mode, save and resume games, and play against an AI opponent. The game supports multiple players and maintains separate save files for each user.

## Features
- **Turn-based gameplay** (Requirement 3.0 ✅)
- **Game save and resume functionality** (Requirement 4.0 ✅)
- **Play against AI with random moves** (Requirement 5.0 ✅)
- **Multiple players with individual game saves**

## How the Requirements Are Met

| Requirement | Implementation |
|------------|---------------|
| **3.0 - Turn-based gameplay** | The game alternates turns between two players or between a player and AI, ensuring proper game flow. |
| **4.0 - Save and resume game** | The game saves progress in a file named `<username>_save.txt`, allowing the player to resume their game later. |
| **5.0 - Play against AI** | The AI selects random available positions and plays as `O`, ensuring a basic opponent. |


## Demo
In this demo video, you can see the Tic-Tac-Toe game in Bash in action. The video showcases the following steps:

- Starting the game – The player enters their username and selects the Player vs AI mode.
- Making moves – The player and the AI take turns placing X and O on the board.
- Saving the game – The player decides to save the game and exit.
- Resuming the game – The game is restarted, and the player successfully loads their previous session.
- Winning the game – The player makes strategic moves and wins against the AI.

https://private-user-images.githubusercontent.com/9299185/413029756-b3b7918d-9ec9-410a-b4f8-5ba2966d60f2.mp4?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mzk0NzQwMTAsIm5iZiI6MTczOTQ3MzcxMCwicGF0aCI6Ii85Mjk5MTg1LzQxMzAyOTc1Ni1iM2I3OTE4ZC05ZWM5LTQxMGEtYjRmOC01YmEyOTY2ZDYwZjIubXA0P1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MDIxMyUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTAyMTNUMTkwODMwWiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9ZjBjMzJhYjg3ZjU5OTY4ZTk5NWRkOTE4ZjM0Yzc3YmMyYzMwYzI0NGQ2MTE3ZDY2NzVhNTJhMjI0YTU4Y2M1MyZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.Uk_29d9zHNKldEdeOMyUICVvtUsc58R0cgNRtzx--j4
