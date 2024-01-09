from PIL import Image;
import sys, random, time, math;

# [u8; 3]
def col(c: tuple[int, int, int]):
    return c[0] << 16 | c[1] << 8 | c[2];

Point = tuple[int, int, int];

def dist_sq(a: Point, b: Point) -> int:
    return (b[0] - a[0]) ** 2 + (b[1] - a[1]) ** 2;

def cluster(pts: set[Point], means: list[Point]) -> list[list[Point]]:
    out = [[] for _ in means];
    for pt in pts:
        md = 10000000;
        mi = 0;
        for i, m in enumerate(means):
            d = dist_sq(pt, m);
            if d < md:
                md = d;
                mi = i;
        out[mi].append(pt);
    return out;

def update_means(means: list[Point], clustered: list[list[Point]]) -> None:
    for (i, _) in enumerate(means):
        ar = 0;
        ag = 0;
        ab = 0;
        for c in clustered[i]:
            ar += c[0];
            ag += c[1];
            ab += c[2];
        ar //= len(clustered[i]);
        ag //= len(clustered[i]);
        ab //= len(clustered[i]);
        means[i] = (ar, ag, ab);

def max_diff(a: list[Point], b: list[Point]):
    return max(b[n][i] - a[n][i] for i in range(0, 3) for n in range(0, len(a)))

def k_means(img, K: int):
    print('dims:       ', (img.width, img.height));
    pts = { img.getpixel((x, y)) for y in range(0, img.height) for x in range(0, img.width) };
    print('unique cols:', len(pts));
    means = random.choices(list(pts), k = K);

    # means = []
    # for _ in range(1, K + 1):
    #     means.append((
    #         random.randrange(0, 256),
    #         random.randrange(0, 256),
    #         random.randrange(0, 256),
    #     ));

    # print([len(c) for c in clustered]);

    prev = None;
    i = 0;
    start = time.time();
    d = 0;
    clustered: list[list[Point]] = [];
    while (prev is None or d > 0x08) and i < 100:
        clustered = cluster(pts, means)
        prev = [*means];
        update_means(means, clustered);
        print('d:', d);
        print('cols:', ', '.join([f'\033[38;2;{m[0]};{m[1]};{m[2]}m{hex(col(m))}\033[0m' for m in means]), end = '');
        print(f' {math.floor((time.time() - start) * 1000)}ms')
        start = time.time()
        i += 1;
        d = max_diff(prev, means)
    print('d:', d);

    print(f'finished in {i} iterations')

    return (means, clustered)

def chart(means, clustered):
    print('graphing');

    chart = Image.new('RGB', (256, 256));
    for (i, c) in enumerate(clustered):
        for pt in c:
            chart.putpixel((pt[0], pt[1]), means[i])
    chart.save("chart-rg.png");
    for (i, c) in enumerate(clustered):
        for pt in c:
            chart.putpixel((pt[0], pt[2]), means[i])
    chart.save("chart-rb.png");
    for (i, c) in enumerate(clustered):
        for pt in c:
            chart.putpixel((pt[1], pt[2]), means[i])
    chart.save("chart-gb.png");

def recolour(img: Image.Image, means: list[Point]):
    img = img.copy();
    for y in range(0, img.height):
        for x in range(0, img.width):
            px = img.getpixel((x, y));
            mn = 10000000;
            mi = 0;
            for (i, m) in enumerate(means):
                d = dist_sq(m, px);
                if d < mn:
                    mn = d;
                    mi = i;
            img.putpixel((x, y), means[mi]);
    return img;

def get_closest_col(cols, px: Point) -> Point | None:
    mn = 10000000;
    mc = None;
    for m in cols:
        d = dist_sq(m, px);
        if d < mn:
            mn = d;
            mc = m;
    return mc;

quantise = lambda a, b: (a[0] - b[0], a[1] - b[1], a[2] - b[2]);

def dither(img: Image.Image, cols) -> Image.Image:
    img = img.copy();
    for y in range(0, img.height):
        for x in range(0, img.width):
            px = img.getpixel((x, y));
            new = get_closest_col(cols, px);
            img.putpixel((x, y), new)
            quant = quantise(px, new);
            valid = lambda x, y: x > 0 and x < img.width and y > 0 and y < img.height;
            if valid(x + 1, y):
                np = list(img.getpixel((x + 1, y)));
                np[0] += quant[0] * 7 // 16;
                np[1] += quant[1] * 7 // 16;
                np[2] += quant[2] * 7 // 16;
                img.putpixel((x + 1, y), tuple(np))
            if valid(x - 1, y + 1):
                np = list(img.getpixel((x - 1, y + 1)));
                np[0] += quant[0] * 3 // 16;
                np[1] += quant[1] * 3 // 16;
                np[2] += quant[2] * 3 // 16;
                img.putpixel((x - 1, y + 1), tuple(np))
            if valid(x, y + 1):
                np = list(img.getpixel((x, y + 1)));
                np[0] += quant[0] * 5 // 16;
                np[1] += quant[1] * 5 // 16;
                np[2] += quant[2] * 5 // 16;
                img.putpixel((x, y + 1), tuple(np))
            if valid(x + 1, y + 1):
                np = list(img.getpixel((x + 1, y + 1)));
                np[0] += quant[0] * 1 // 16;
                np[1] += quant[1] * 1 // 16;
                np[2] += quant[2] * 1 // 16;
                img.putpixel((x + 1, y + 1), tuple(np))
    return img

with Image.open(sys.argv[1]) as img:
    (cols, clusters) = k_means(img, 64);
    chart(cols, clusters);
    # c = list(map(lambda c: get_closest_col(cols, c), cols))
    print('recolouring image');
    recoloured = recolour(img, cols);
    print('saving image')
    recoloured.save("out.png");
    print('dithering')
    dither = dither(img, cols);
    dither.save("dither.png");
