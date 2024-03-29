from collections import deque

def is_valid(state):
    m, c, b = state
    return 0 <= m <= 3 and 0 <= c <= 3 and (m >= c or m == 0) and ((3 - m) >= (3 - c) or (3 - m) == 0)

def generate_next_states(state):
    moves = [(1, 0), (2, 0), (0, 1), (0, 2), (1, 1)]
    next_states = []
    for move in moves:
        m, c, b = state
        if b == 1:
            new_state = (m - move[0], c - move[1], 0)
        else:
            new_state = (m + move[0], c + move[1], 1)
        if is_valid(new_state):
            next_states.append(new_state)
    return next_states

def bfs():
    initial_state = (3, 3, 1)
    goal_state = (0, 0, 0)
    visited = set()
    queue = deque([(initial_state, [])])

    while queue:
        state, path = queue.popleft()
        if state == goal_state:
            return path
        visited.add(state)
        for next_state in generate_next_states(state):
            if next_state not in visited:
                queue.append((next_state, path + [next_state]))
    return None

solution_path = bfs()

if solution_path:
    for state in solution_path:
        print(state)
else:
    print("No solution")
