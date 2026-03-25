import arsd.terminal;
import std.stdio;

void main() {
    // 1. In 12.1.0, 'allInput' usually enables keys + mouse
    auto terminal = Terminal(ConsoleOutputType.allInput);
    
    terminal.clear();
    terminal.setTitle("ARSD 12.1 Debugger");
    terminal.writeln("--- ARSD Input Debugger ---");
    terminal.writeln("Press keys or move mouse. Press 'q' to quit.");

    bool running = true;
    while(running) {
        // expectInput() returns an InputEvent
        auto event = terminal.expectInput(); 

        // 2. Accessing the Event Type
        // In this version, 'Type' is likely an enum INSIDE InputEvent
        if (event.type == InputEvent.Type.Key) {
            auto k = event.key;
            if (k.pressed) {
                if (k.character == 'q' || k.character == 'Q') running = false;

                terminal.moveTo(0, 5);
                terminal.writef("Key: %s (ASCII: %d)      ", 
                    k.character == 0 ? "Special" : [k.character], 
                    cast(int)k.character);
            }
        }

        if (event.type == InputEvent.Type.Mouse) {
            auto m = event.mouse;
            terminal.moveTo(0, 6);
            terminal.writef("Mouse Cell -> X:%d Y:%d   ", m.x, m.y);
        }
    }
    
    terminal.reset(); 
}