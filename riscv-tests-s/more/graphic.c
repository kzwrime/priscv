void boxfill8(unsigned short *vram, int xsize, unsigned short color, int x0,
              int y0, int x1, int y1) {
  int x, y;
  for (y = y0; y <= y1; y++) {
    for (x = x0; x <= x1; x++) {
      vram[y * xsize + x] = color;
    }
  }
  return;
}

void linefill8(unsigned short *vram, unsigned short color) {
  vram[0x123] = color;
  return;
}

void main() {
  boxfill8((unsigned short *)0xEEEFF000, 1024, 0x0FFF, 40, 40, 200, 200);
  linefill8((unsigned short *)0x123, 0x000FFF);
  return;
}