import random, pixie, math;

dst_pwr = 2;
pher_pwr = 200;

class Ant:
    def __init__(self, start, graph, pheromones) -> None:
        self.curr = start; 
        self.history = [self.curr];
        self.graph = graph;
        self.pheromones = pheromones;

    def pick_neighbour(self):
        neighbours = list(filter(lambda n: n[1] != 0 and n[0] not in self.history, enumerate(self.graph[self.curr])));
        if len(neighbours) == 0:
            print(neighbours);
            raise Exception("fuck");
        weights = [(1 / (i + 1) ** dst_pwr) * max(self.pheromones[self.curr][i] ** pher_pwr, .00001) for i in range(0, len(neighbours))];
        [n] = random.choices(neighbours, weights=weights);
        self.curr = n[0];
        self.history.append(self.curr);


def len_of(graph, path):
    l = 0;
    prev = path[0];
    for n in path[1:]:
        l += graph[prev][n];
        prev = n;
    return l;

def update_pheromones(pheromones, path, amt):
    for row in pheromones:
        for x in range(len(row)):
            row[x] *= .1;
            if row[x] <= 0.0001: row[x] = 0.0001;
    prev = path[0];
    for n in path[1:]:
        pheromones[prev][n] += amt
        pheromones[n][prev] += amt
        prev = n

def dist_sq(a, b): return int(math.sqrt((b[0] - a[0]) ** 2 + (b[1] - a[1]) ** 2));

def main():
    pts = [(51, 86), (3, 60), (41, 40), (38, 16), (18, 39), (12, 15), (57, 16), (13, 61), (13, 58), (10, 87), (17, 39), (22, 86), (81, 91), (27, 3), (51, 32), (22, 19), (7, 29), (15, 93), (49, 81), (59, 42)];
    graph = [[0, 54, 47, 71, 57, 81, 70, 45, 47, 41, 58, 29, 30, 86, 54, 73, 72, 36, 5, 44], [54, 0, 42, 56, 25, 45, 69, 10, 10, 27, 25, 32, 83, 61, 55, 45, 31, 35, 50, 58], [47, 42, 0, 24, 23, 38, 28, 35, 33, 56, 24, 49, 64, 39, 12, 28, 35, 59, 41, 18], [71, 56, 24, 0, 30, 26, 19, 51, 48, 76, 31, 71, 86, 17, 20, 16, 33, 80, 65, 33], [57, 25, 23, 30, 0, 24, 45, 22, 19, 48, 1, 47, 81, 37, 33, 20, 14, 54, 52, 41], [81, 45, 38, 26, 24, 0, 45, 46, 43, 72, 24, 71, 102, 19, 42, 10, 14, 78, 75, 54], [70, 69, 28, 19, 45, 45, 0, 62, 60, 85, 46, 78, 78, 32, 17, 35, 51, 87, 65, 26], [45, 10, 35, 51, 22, 46, 62, 0, 3, 26, 22, 26, 74, 59, 47, 42, 32, 32, 41, 49], [47, 10, 33, 48, 19, 43, 60, 3, 0, 29, 19, 29, 75, 56, 46, 40, 29, 35, 42, 48], [41, 27, 56, 76, 48, 72, 85, 26, 29, 0, 48, 12, 71, 85, 68, 69, 58, 7, 39, 66], [58, 25, 24, 31, 1, 24, 46, 22, 19, 48, 0, 47, 82, 37, 34, 20, 14, 54, 52, 42], [29, 32, 49, 71, 47, 71, 78, 26, 29, 12, 47, 0, 59, 83, 61, 67, 58, 9, 27, 57], [30, 83, 64, 86, 81, 102, 78, 74, 75, 71, 82, 59, 0, 103, 66, 93, 96, 66, 33, 53], [86, 61, 39, 17, 37, 19, 32, 59, 56, 85, 37, 83, 103, 0, 37, 16, 32, 90, 81, 50], [54, 55, 12, 20, 33, 42, 17, 47, 46, 68, 34, 61, 66, 37, 0, 31, 44, 70, 49, 12], [73, 45, 28, 16, 20, 10, 35, 42, 40, 69, 20, 67, 93, 16, 31, 0, 18, 74, 67, 43], [72, 31, 35, 33, 14, 14, 51, 32, 29, 58, 14, 58, 96, 32, 44, 18, 0, 64, 66, 53], [36, 35, 59, 80, 54, 78, 87, 32, 35, 7, 54, 9, 66, 90, 70, 74, 64, 0, 36, 67], [5, 50, 41, 65, 52, 75, 65, 41, 42, 39, 52, 27, 33, 81, 49, 67, 66, 36, 0, 40], [44, 58, 18, 33, 41, 54, 26, 49, 48, 66, 42, 57, 53, 50, 12, 43, 53, 67, 40, 0]];
    pheromones = [[0.0001] * len(r) for r in graph];
    best = None;

    i = 0;
    steps = len(graph) - 1;
    last_best = None;
    for _ in range(500):
        for _ in range(100):
            ant = Ant(random.randint(0, len(graph) - 1), graph, pheromones);
            for _ in range(steps):
                ant.pick_neighbour();
            # print(ant.history);
            l = len_of(graph, ant.history);
            if best is None or l < len_of(graph, best):
                best = ant.history
            # update_pheromones(pheromones, ant.history, 1 / l)
            update_pheromones(pheromones, ant.history, 1)
        if last_best != best: 
            print(best);
            print(i, len_of(graph, best));

            image = pixie.Image(500, 500);
            image.fill(pixie.parse_color('#000000'));
            paint = pixie.Paint(pixie.SOLID_PAINT);
            paint.color = pixie.parse_color('#c0ffee');

            ctx = image.new_context();
            ctx.fill_style = paint
            for pt in pts:
                ctx.rounded_rect(pt[0] * 5 - 5, pt[1] * 5 - 5, 10, 10, 25, 25, 25, 25);
                ctx.fill();

            paint = pixie.Paint(pixie.SOLID_PAINT);
            paint.color = pixie.parse_color('brown');
            ctx.stroke_style = paint;
            ctx.line_width = 2;
            prev = best[0];
            for n in best[1:]:
                ctx.stroke_segment(pts[prev][0] * 5, pts[prev][1] * 5, pts[n][0] * 5, pts[n][1] * 5)
                ctx.stroke();
                prev = n;
            image.write_file(f"img/image{i:03}.png");
        last_best = best;
        i += 1;
main();
