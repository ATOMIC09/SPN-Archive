board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
PlayerTurn = 'X'
index = -1

def printboard():
    print()
    print('Player :', PlayerTurn)
    print('-------')
    i = 0
    while i < 3:
        print('|', end='')
        j = 0
        while j < 3:
            print(board[i][j], end='|')
            j = j + 1 
        print('')
        i = i + 1
    print('-------')

def flipPlayer():
    global PlayerTurn
    if PlayerTurn == 'X':
        PlayerTurn = 'O'
    else:
        PlayerTurn = 'X'

def userinput():
    global PlayerTurn
    global index
    
    if index == 7:
        board[0][0] = PlayerTurn
    if index == 8:
        board[0][1] = PlayerTurn
    if index == 9:
        board[0][2] = PlayerTurn
    if index == 4:
        board[1][0] = PlayerTurn
    if index == 5:
        board[1][1] = PlayerTurn
    if index == 6:
        board[1][2] = PlayerTurn
    if index == 1:
        board[2][0] = PlayerTurn
    if index == 2:
        board[2][1] = PlayerTurn
    if index == 3:
        board[2][2] = PlayerTurn

    printboard()

def checkCount():
    count = 0
    i = 0
    while i < 3:
        j = 0
        while j < 3:
            if board[i][j] == 'X' or board[i][j] == 'O':
                count = count + 1
            j = j + 1
        i = i + 1
    if count == 9:
        print('Game Over')
        exit()

def checkWin():
    if board[0][0] == board[0][1] == board[0][2] == 'X' or board[0][0] == board[0][1] == board[0][2] == 'O':
        print('Winner :', PlayerTurn)
        exit()
    if board[1][0] == board[1][1] == board[1][2] == 'X' or board[1][0] == board[1][1] == board[1][2] == 'O':
        print('Winner :', PlayerTurn)
        exit()
    if board[2][0] == board[2][1] == board[2][2] == 'X' or board[2][0] == board[2][1] == board[2][2] == 'O':
        print('Winner :', PlayerTurn)
        exit()
    if board[0][0] == board[1][0] == board[2][0] == 'X' or board[0][0] == board[1][0] == board[2][0] == 'O':
        print('Winner :', PlayerTurn)
        exit()
    if board[0][1] == board[1][1] == board[2][1] == 'X' or board[0][1] == board[1][1] == board[2][1] == 'O':
        print('Winner :', PlayerTurn)
        exit()
    if board[0][2] == board[1][2] == board[2][2] == 'X' or board[0][2] == board[1][2] == board[2][2] == 'O':
        print('Winner :', PlayerTurn)
        exit()
    if board[0][0] == board[1][1] == board[2][2] == 'X' or board[0][0] == board[1][1] == board[2][2] == 'O':
        print('Winner :', PlayerTurn)
        exit()
    if board[0][2] == board[1][1] == board[2][0] == 'X' or board[0][2] == board[1][1] == board[2][0] == 'O':
        print('Winner :', PlayerTurn)
        exit()    

while index != 0:
    printboard()
    index = int(input('Enter : '))
    userinput()
    checkWin()
    checkCount()
    flipPlayer()
else:
    print('Game Over')
