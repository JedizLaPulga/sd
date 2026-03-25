import arsd.terminal;
import std.stdio;

void main() {
    // 'realTime' mode turns off the terminal's "Line Buffer"
    // This means bytes go from keyboard -> OS -> D program immediately
    auto terminal = Terminal(ConsoleOutputMode.realTime);
    
    terminal.writeln("--- ARSD Input Debugger ---");
    terminal.writeln("Press keys, move mouse, or 'q' to quit.");

    bool running = true;
    while(running) {
        // Wait for a hardware event
        auto event = terminal.expectInput(); 

        if(event.type == TerminalInput.Type.keyEvent && event.keyEvent.pressed) {
            char c = event.keyEvent.character;
            if(c == 'q' || c == 'Q') running = false;

            terminal.writef("\rKey Pressed: %s | Char Code: %d    ", 
                c == 0 ? "Special" : [c], cast(int)c);
        }

        if(event.type == TerminalInput.Type.mouseEvent) {
            // This shows how ARSD translates raw terminal escape codes
            // like \033[M... into X/Y coordinates
            terminal.moveTo(0, 5);
            terminal.writef("Mouse Logic Position: X:%d Y:%d   ", 
                event.mouseEvent.x, event.mouseEvent.y);
        }
    }
    
    terminal.reset(); // Clean up so the terminal isn't "broken" after exit
}