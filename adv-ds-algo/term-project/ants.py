import random, math, sys;

# Usage: python ants.py [NC]
# If you intend to use `DRAW_IMAGES`, you must install the `pixie-python` package


## The following constants are parameters for the algorithm and may impact the performance ##
ALPHA = 1    # Relative importance of trail
BETA  = 5    # Relative importance of visibility (inverse of distance)
RHO   = .5   # Trail persistence
Q     = 100  # Quantity of trail laid
NC    = 500  # Number of cycles
N     = 20   # Number of cities to randomly generate


## Configuration that does not affect how the algorithm behaves but may affect the time it takes ##
USE_FONT = False    # Whether to use the font (Note: this requires a file in the current directory called font.ttf)
DRAW_IMAGES = False # Whether to ourput images into the `img/` directory.  Note: this creates two images each cycle and will slow down the algorithm very heavily

# some type defs
Point = tuple[int, int]
FloatGraph = list[list[float]]
IntGraph = list[list[int]]

MIN_P_FLOAT = 5e-324 # the minimum positive floating point value in this here language

class Ant:
    def __init__(self, start: int, graph: IntGraph, intensity: FloatGraph) -> None:
        # Initialise the values in the Ant class
        self.curr = start
        self.history = [self.curr] # It has already visited self.curr
        self.graph = graph
        self.intensity = intensity

    def pick_neighbour(self):
        # Choose the allowed verticies to which we can travel
        if len(self.history) == len(self.graph): # If we have been to every vertex, we can now only go to the last one.
            allowed = [(self.history[0], self.graph[self.curr][self.history[0]])]
        else: # Otherwise, find the verticies that we have not yet visited.
            allowed = list(filter(lambda n: n[1] != 0 and n[0] not in self.history, enumerate(self.graph[self.curr])))

        # allowed is a list of tuples which contain (index, distance)

        # This matches the numerator of formula 4.  We do not have the
        # denominator, since that is used to convert the weights into
        # probability and `random.choice` handles this for us. We need the
        # `max` function to counteract the effects of the lack of perfect
        # precision in floating point numbers.  Without it, many numbers would
        # go to zero and `random.choices` does not like zero.
        weights = [
            max(self.intensity[self.curr][j] ** ALPHA
                * (1 / (allowed[j][1]) ** BETA), MIN_P_FLOAT)
            for (j, _) in enumerate(allowed)
        ]

        # Get a "random" vertex from the allowed verticies using the weights
        [(n, _)] = random.choices(allowed, weights=weights)

        # Update the current and append it to the history
        self.curr = n
        self.history.append(self.curr)

# Euclidean distance between two points
def dist(a, b): return int(math.sqrt((b[0] - a[0]) ** 2 + (b[1] - a[1]) ** 2))

# Generate a graph by choosing N random points and forming an adjacency matrix for them based on their Euclidean distance
def generate_graph(p: list[Point] = [(random.randint(5, 95), random.randint(5, 95)) for _ in range(N)]):
    g = [[dist(i, j) for j in p] for i in p];
    print(f'\npoints: {p}\n\nadjacency matrix: {g}\n')
    return p, g

# Get the length of a `path` on `graph` where `path` is a list of verticies and `graph` is an adjacency matrix
def len_of(graph: IntGraph, path: list[int]):
    l = 0
    prev = path[0]
    for n in path[1:]:
        l += graph[prev][n]
        prev = n
    return l

# Walk the path and update the edges in the `intensity` graph by adding `pheromone` to each edge
def update_intensity(intensity: FloatGraph, path: list[int], pheromone: float):
    prev = path[0]
    for n in path[1:]:
        intensity[prev][n] += pheromone
        intensity[n][prev] += pheromone
        prev = n

# Import the drawing library if we're drawing images
if DRAW_IMAGES: import pixie;

# Setup the font if we're using it
if USE_FONT and DRAW_IMAGES:
    FONT = pixie.read_font('font.ttf')
    FONT.size = 20

    paint = pixie.Paint(pixie.SOLID_PAINT)
    paint.color = pixie.parse_color('#facade')
    FONT.paint = paint

MAIN_COLOUR = '#c0ffee';
LAST_COLOUR = '#c0ffee';
# Draw the path that an ant takes as an image and save it into the `img` directory
def draw_path(path: list[int], pts: list[Point], name: str, text: str = ""):
    if not DRAW_IMAGES: return;

    image = pixie.Image(500, 500)
    image.fill(pixie.parse_color('#000000'))
    paint = pixie.Paint(pixie.SOLID_PAINT)
    paint.color = pixie.parse_color('#ffffff')

    ctx = image.new_context();
    ctx.fill_style = paint
    for pt in pts:
        ctx.rounded_rect(pt[0] * 5 - 5, pt[1] * 5 - 5, 10, 10, 25, 25, 25, 25)
        ctx.fill()

    ctx.line_width = 2
    prev = path[0]
    for i, n in enumerate(path[1:]):
        paint = pixie.Paint(pixie.SOLID_PAINT)
        paint.color = pixie.parse_color(MAIN_COLOUR if i == len(path) - 2 else LAST_COLOUR)
        ctx.stroke_style = paint

        ctx.stroke_segment(pts[prev][0] * 5, pts[prev][1] * 5, pts[n][0] * 5, pts[n][1] * 5);
        ctx.stroke();
        prev = n;

    if USE_FONT and len(text):
        image.fill_text(
            FONT,
            text,
            transform = pixie.translate(0, 0)
        )

    image.write_file(f'img/{name}');

max_intensity = 0;
def draw_intensity(intensity: FloatGraph, pts: list[Point], name: str, text: str = ""):
    if not DRAW_IMAGES: return;

    global max_intensity

    image = pixie.Image(500, 500)
    image.fill(pixie.parse_color('#000000'))
    paint = pixie.Paint(pixie.SOLID_PAINT)
    paint.color = pixie.parse_color('#ffffff')

    ctx = image.new_context();
    ctx.fill_style = paint
    for pt in pts:
        ctx.rounded_rect(pt[0] * 5 - 5, pt[1] * 5 - 5, 10, 10, 25, 25, 25, 25)
        ctx.fill()

    ctx.line_width = 2

    max_intensity = max(max_intensity, max(max(r) for r in intensity));

    paint = pixie.Paint(pixie.SOLID_PAINT);
    paint.color = pixie.parse_color('red');
    for i, row in enumerate(intensity):
        for j, val in enumerate(row):
            paint.opacity = val / max_intensity; 
            ctx.stroke_style = paint;

            ctx.stroke_segment(pts[i][0] * 5, pts[i][1] * 5, pts[j][0] * 5, pts[j][1] * 5);
            ctx.stroke();

    if USE_FONT and len(text): image.fill_text(FONT, text)

    image.write_file(f'img/{name}');

def main():
    pts, graph = generate_graph(p=[(91, 29), (89, 10), (39, 10), (47, 43), (24, 49), (60, 55), (72, 63), (36, 25), (73, 11), (20, 61), (75, 27), (17, 39), (31, 70), (15, 87), (7, 62), (84, 95), (9, 34), (80, 37), (86, 39), (56, 72)])

    # Default value is the smallest positive constant so that we don't just multiply to zero
    intensity = [[MIN_P_FLOAT] * len(r) for r in graph]

    best = None;
    best_len = 1e100; # This is the problem with unsize int types

    last_best = None
    print('''-=-=-=-=-=-=-=-=-=-=-=-
 Beginning Iterations: 
-=-=-=-=-=-=-=-=-=-=-=-\n''');
    n = len(graph);
    for i in range(NC if len(sys.argv) == 1 else int(sys.argv[1])):

        # Create an ant starting at every vertex in the graph
        ants = [Ant(i, graph, intensity) for i in range(len(graph) - 1)];

        # Have the ants walk the graph n times to visit each vertex
        for _ in range(0, n):
            for ant in ants:
                ant.pick_neighbour()

        # Evaporate pheromone trails by multiplying each edge by RHO
        for row in intensity:
            for x in range(len(row)):
                row[x] *= RHO

        # Update the pheromone trails by adding \Delta \tau to each edge
        for ant in ants:
            L_k = len_of(graph, ant.history);
            update_intensity(intensity, ant.history, Q / L_k)
            if best is None or L_k < best_len:
                best = ant.history
                best_len = len_of(graph, best);
                
        # Update the best path
        if last_best != best: 
            print(f'best = {best}')
            print(f'i = {i}, best_len = {best_len}')
        last_best = best

        if DRAW_IMAGES:
            # When we get a new best path, output it as an image
            draw_path(best, pts, f'path{i:03}.png', f'i = {i:3}, len = {best_len}');
            draw_intensity(intensity, pts, f'trail{i:03}.png', f'i = {i:3}');

if __name__ == "__main__":
    main()
