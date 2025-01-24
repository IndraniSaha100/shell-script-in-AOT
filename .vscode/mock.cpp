#include <iostream>
#include <vector>
#include <queue>

using namespace std;

struct Cell
{
    int x, y, dist;
    Cell(int _x, int _y, int _dist) : x(_x), y(_y), dist(_dist) {}
};

bool isValid(int x, int y, int M, int N, vector<vector<int>> &grid)
{
    return (x >= 0 && x < M && y >= 0 && y < N && grid[x][y] == 0);
}

int calculateNextX(int first, string move, int moveX, int moveY)
{
    if (move == "forward")
    {
        return first + moveX;
    }
    else if (move == "right")
    {
        return first + moveY;
    }
    else if (move == "left")
    {
        return first - moveY;
    }
    else if (move == "backward")
    {
        return first - moveX;
    }
    return first;
}

int calculateNextY(int second, string move, int moveX, int moveY)
{
    if (move == "forward")
    {
        return second + moveY;
    }
    else if (move == "right")
    {
        return second - moveX;
    }
    else if (move == "left")
    {
        return second + moveX;
    }
    else if (move == "backward")
    {
        return second - moveY;
    }
    return second;
}

int minStepsToReachDestination(int M, int N, vector<vector<int>> &grid, int sourceX, int sourceY, int destX, int destY, int moveX, int moveY)
{
    queue<Cell> q;
    q.push(Cell(sourceX, sourceY, 0));
    vector<vector<bool>> visited(M, vector<bool>(N, false));
    visited[sourceX][sourceY] = true;

    string moves[4] = {"forward", "right", "left", "backward"};

    while (!q.empty())
    {
        Cell current = q.front();
        q.pop();

        if (current.x == destX && current.y == destY)
        {
            return current.dist;
        }

        for (int i = 0; i < 4; i++)
        {
            int newX = calculateNextX(current.x, moves[i], moveX, moveY);
            int newY = calculateNextY(current.y, moves[i], moveX, moveY);

            if (isValid(newX, newY, M, N, grid) && !visited[newX][newY])
            {
                visited[newX][newY] = true;
                q.push(Cell(newX, newY, current.dist + 1));
            }
        }
    }

    return -1;
}

int main()
{
    int M, N;
    cin >> M >> N;

    vector<vector<int>> grid(M, vector<int>(N));
    for (int i = 0; i < M; ++i)
    {
        for (int j = 0; j < N; ++j)
        {
            cin >> grid[i][j];
        }
    }

    int sourceX, sourceY, destX, destY;
    cin >> sourceX >> sourceY;
    cin >> destX >> destY;

    int moveX, moveY;
    cin >> moveX >> moveY;

    int result = minStepsToReachDestination(M, N, grid, sourceX, sourceY, destX, destY, moveX, moveY);

    cout << result;

    return 0;
}
