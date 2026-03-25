import arsd.simpledisplay;
import arsd.color;

void main() {
    // 1. Create your color (Red: 255, Green: 128, Blue: 0 is a nice Orange)
    auto myColor = Color(255, 128, 0);

    // 2. Open a window (Width, Height, Title)
    auto window = new SimpleWindow(500, 400, "ARSD Color Check");

    // 3. The 'draw' delegate runs whenever the window needs to paint
    window.draw((ScreenPainter painter) {
        // Clear the background
        painter.clear(Color.white);

        // Set the 'brush' to your specific color bytes
        painter.fillColor = myColor;

        // Draw a rectangle using that color
        // This copies your Color struct into the window's back buffer
        painter.drawRectangle(Point(100, 100), 300, 200);
        
        // Outline it in black to see the edges
        painter.outlineColor = Color.black;
        painter.drawRectangle(Point(100, 100), 300, 200);
    });

    // 4. Start the Windows event loop to keep the window open
    window.eventLoop(0);
}