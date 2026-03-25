import arsd.simpledisplay;
import arsd.color;

void main() {
    // 1. Create your color
    auto myColor = Color(255, 128, 0); // Orange

    // 2. Create the window
    auto window = new SimpleWindow(500, 400, "ARSD Color Check");

    // 3. Define the paint handler
    window.onPaint = delegate () {
        auto painter = window.draw(); // Get the painter object
        
        painter.clear(Color.white);
        
        // Set the color and draw the box
        painter.fillColor = myColor;
        painter.drawRectangle(Point(100, 100), 300, 200);
        
        painter.outlineColor = Color.black;
        painter.drawRectangle(Point(100, 100), 300, 200);
    };

    // 4. Start the loop
    window.eventLoop(0);
}