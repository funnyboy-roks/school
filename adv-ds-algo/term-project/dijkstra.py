from PIL import Image;
from perlin_noise import PerlinNoise;
import random, math;

# TODO: rename to mat so that Min doesn't know it's really a matrix
Matrix = list[list[int]]

def print_matrix(mat: Matrix):
    for r in mat:
        for v in r:
            print(f'{v} ', end='');
        print();

INF = 10000000

def dijkstra(mat: Matrix):
    (h, w) = (len(mat), len(mat[0]));
    dist: Matrix = [[INF] * w for _ in range(0, h)];
    prev: list[list[tuple[int, int] | None]] = [[None] * w for _ in range(0, h)];
    Q = set();

    def pop() -> tuple[int, int]:
        mv = INF;
        me = None;
        for (ex, ey) in Q:
            if dist[ey][ex] < mv:
                mv = dist[ey][ex];
                me = (ex, ey);
        Q.remove(me);
        return me;

    for y in range(0, h):
        for x in range(0, w):
            Q.add((x, y));
    dist[0][0] = 0;

    i = 0;
    while len(Q):
        if i % len(mat) == len(mat) - 1:
            print('y =', i // len(mat))
        i += 1; 
        (ux, uy) = pop();
        neighbours = Q.intersection({ (ux + dx, uy + dy) for (dx, dy) in [(0, -1), (-1, 0), (0, 1), (1, 0)] });
        for (nx, ny) in neighbours:
            alt = dist[uy][ux] + mat[ny][nx];
            if alt < dist[ny][nx]:
                dist[ny][nx] = alt
                prev[ny][nx] = (ux, uy)
    return (dist, prev)

def save_matrix_bw(mat: Matrix, file_path: str, threshold: int):
    out = Image.new('1', (len(mat), len(mat[0])));
    for y in range(0, len(mat)):
        for x in range(0, len(mat[0])):
            out.putpixel((x, y), 1 if mat[y][x] is not None and mat[y][x] != threshold else 0);
    out.save(file_path);


def main():
    (w, h) = (128, 128);
    target = (w - 1, h - 1);
    noise = PerlinNoise(seed=random.randint(0, INF));
    mat: Matrix = [[math.floor(50 * (noise([x / 20, y / 20]) / 2 + .5)) for x in range(0, w)] for y in range(0, h)];
    # mat: Matrix = [[100 if noise([x / 20, y / 20]) > 0 else 1 for x in range(0, w)] for y in range(0, h)];

    # for y in range(0, h):
    #     for x in range(0, w):
    #         n = noise([x / 100 + 50, y / 50 + 100]);
    #         if n > 0:
    #             mat[y][x] = 100;

    theta = 0;
    while theta < 2 * math.pi:
        x = math.floor(w // 2 + math.cos(theta) * 50);
        y = math.floor(h // 2 + math.sin(theta) * 50);
        print((x, y));
        mat[y][x] = 1000;
        theta += .01;
    # for x in range(w // 2, w):
    #     mat[h // 2][x] = 100;
    # print_matrix(mat);
    # save_matrix_bw(mat, 'mat.png', 100);

    (dist, prev) = dijkstra(mat);

    S = [];
    u = target
    if prev[u[1]][u[0]] is not None or u == (0, 0):
        while u is not None:
            S.insert(0, u);
            u = prev[u[1]][u[0]];

    out = Image.new('RGB', (w, h));
    for y in range(0, h):
        for x in range(0, w):
            out.putpixel((x, y), (min(255, mat[y][x] * 255 // 100), 0, 0));
    for pt in S:
        out.putpixel(pt, 0xffffff);
    out.save('dijkstra.png');
main();
