import arsd.simpledisplay;

void main() {
    // This opens a small window on Windows
    auto window = new SimpleWindow(200, 200, "Success");
    window.eventLoop(0);
}