import random, math;

def dist_sq(a, b): return int(math.sqrt((b[0] - a[0]) ** 2 + (b[1] - a[1]) ** 2));

def main():
    pts = [];
    for _ in range(20):
        pts.append((random.randint(0, 100), random.randint(0, 100)));
    graph = [[0 for _ in pts] for _ in pts];
    for ai, a in enumerate(pts):
        for bi, b in enumerate(pts):
            d = dist_sq(a, b);
            graph[bi][ai] = d;
            graph[ai][bi] = d;
    print(pts);
    print(graph);
    # print('\n'.join(map(lambda p: str(p),graph)));

main();
