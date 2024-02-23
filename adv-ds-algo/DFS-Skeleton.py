def DFSR(node, adjacency_map, visited, edge_type):
    visited[node] = True
    print(node)
    for adjacent_node in adjacency_map[node][1]:
        incident_edge = adjacency_map[node][1][adjacent_node]
        if edge_type[incident_edge] == "Unexplored":
            if not visited[adjacent_node]:
                edge_type[incident_edge] = "Discovery"
                print(incident_edge, edge_type[incident_edge])
                DFSR(adjacent_node, adjacency_map, visited, edge_type)
            else:
                edge_type[incident_edge] = "BACK"
                print(incident_edge, edge_type[incident_edge])

def DFSI(node, adjacency_map, visited, edge_type):
   # Implement this iterative function by mimicking the execution of the
   # recursive function above
   # Rec functions can be implemented iteratively via stack
   stack = []
   visited[node] = True
   print(node)
   for adjacent_node in adjacency_map[node][1]:
      stack.append(adjacent_node)

   while len(stack):
      node = stack.pop(-1)
      incident_edge = adjacency_map[node][1][node]

      if edge_type[incident_edge] == "Unexplored":
         if not visited[node]:
            edge_type[incident_edge] = "Discovery"
            visited[node] = True
            for adjacent_node in adjacency_map[node][1]:
               stack.append(adjacent_node)
            print(incident_edge, edge_type[incident_edge])
         else:
            edge_type[incident_edge] = "BACK"
            print(incident_edge, edge_type[incident_edge])
    

def DFS(V, E):
    visited = {}
    visitedI = {}
    edge_type = {}
    edge_typeI = {}
    adjacency_map = {}
    for node in V:
        visited[node] = False
        visitedI[node] = False
    for edge in E:
        edge_type[edge] = "Unexplored"
        edge_typeI[edge] = "Unexplored"
        for i in range(2):
            if edge[i] not in adjacency_map:
                adjacency_map[edge[i]] = [{}, {}]
        adjacency_map[edge[0]][1][edge[1]] = edge
        adjacency_map[edge[1]][0][edge[0]] = edge
    for node in V:
        if not visited[node]:
            DFSR(node, adjacency_map, visited, edge_type)

    print("Now iteratve version:")
    for node in V:
        if not visitedI[node]:
            DFSI(node, adjacency_map, visitedI, edge_typeI)


V = ['A', 'B', 'C', 'D', 'E']
E = [('A', 'B'), ('A', 'C'), ('A', 'D'), ('A', 'E'), ('B', 'C'), ('C', 'D'), ('C', 'E')]
for i in range(len(E)):
    E.append((E[i][1], E[i][0]))

DFS(V, E);
