import arsd.simpledisplay;

void main() {
    auto window = new SimpleWindow(400, 300, "My ARSD Window");
    window.eventLoop(0);
}