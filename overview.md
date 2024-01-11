Home Page:
  - Create New Game Button which returns a page listing the game id
  - Possibly allows you to send emails to the other players

Join Game Page:
  - Enter a code to join a game, specify your name and the race you will be playing
  - Redirect to game overview page

Overview Page:
  - Lists all player names, their races and their current score
  - Lists game timer?
  - Uses websocket/ajax to update as scores change
  - Button to go to Public Objectives Page
  - Button to reveal new Public Objective
  - Can click on a player to see player details

Public Objectives Page:
  - List all public objectives that are currently available, in order

Player Details Page
  - See the breakdown of the player's score
    - The public objectives they've claimed
    - The secret objectives they've claimed
    - Points received from promissory notes
    - Points received from Mechatol Rex
    - Points received from Political Cards
    - If you are looking at your own page, you can also see your secret objectives
    - Button to fetch new secret objective
    - Button to claim a secret objective
    - Button to claim a public objective
