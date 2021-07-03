#define VRAM_ADDR 0xd0000000
#define PIXEL_SIZE 2
#define VRAM_PALATTE_ADDR 0xc0000000
#define XSIZE 1024  // 640 valid
#define YSIZE 512   // 480 valid
#define XSIZE_VALID 640
#define YSIZE_VALID 480

typedef unsigned char *VRAM_TYPE;
typedef unsigned char COLOR_TYPE;

void init_palette(void);
void boxfill8(VRAM_TYPE vram, int xsize, COLOR_TYPE c, int x0, int y0,
              int x1, int y1);
void hlt_t(int t) {
  for (int i = 0; i < t; i++) {
  }
  return;
}
void hlt(void) {
  int i = 0;
  while (1) {
    i = i++;
  }
}

#define COL8_000000 0
#define COL8_FF0000 1
#define COL8_00FF00 2
#define COL8_FFFF00 3
#define COL8_0000FF 4
#define COL8_FF00FF 5
#define COL8_00FFFF 6
#define COL8_FFFFFF 7
#define COL8_C6C6C6 8
#define COL8_840000 9
#define COL8_008400 10
#define COL8_848400 11
#define COL8_000084 12
#define COL8_840084 13
#define COL8_008484 14
#define COL8_848484 15

void init_palatte() {
  static unsigned short table[16] = {
      0x0000, //  0 黑色
      0x0f00, //  1 亮红
      0x00f0, //  2 亮绿
      0x0ff0, //  3 亮黄
      0x000f, //  4 亮蓝
      0x0f0f, //  5 亮紫
      0x00ff, //  6 浅蓝
      0x0fff, //  7 白
      0x0aaa, //  8 灰
      0x0900, //  9 暗红
      0x0090, // 10 暗绿
      0x0990, // 11 暗黄
      0x0009, // 12 深蓝
      0x0909, // 13 暗紫
      0x0099, // 14 暗蓝
      0x0aaa  // 15 暗灰
  };
  unsigned short *vram_palatte_addr = VRAM_PALATTE_ADDR;
  for (int i = 0; i < 15; i++) {
    vram_palatte_addr[i] = table[i];
  }
  return;
}

void boxfill8(VRAM_TYPE vram, int xsize, COLOR_TYPE c, int x0, int y0,
              int x1, int y1) {
  int x, y;
  for (y = y0; y <= y1; y++) {
    for (x = x0; x <= x1; x++)
      vram[y * XSIZE + x] = c;
  }
  return;
}

void main() {
  char *p;
  init_palatte();
  p = (char *)VRAM_ADDR;
  boxfill8(p, 320, COL8_FF0000, 20, 20, 120, 120);
  boxfill8(p, 320, COL8_00FF00, 70, 50, 170, 150);
  boxfill8(p, 320, COL8_0000FF, 120, 80, 220, 180);
  hlt();
}