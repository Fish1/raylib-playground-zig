const std = @import("std");
const rl = @import("raylib");
const Block = @import("./block.zig").Block;

var t1 = Block(0).init(1, 1);

pub fn main() !void {
    // Prints to stderr, ignoring potential errors.
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    std.debug.print("Testing!\n", .{});

    const width = 800;
    const height = 450;

    rl.initWindow(width, height, "My Game!");
    defer rl.closeWindow();

    rl.setTargetFPS(60);

    while (rl.windowShouldClose() == false) {
        update();
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(rl.Color.white);
        rl.drawText("Good Job!", 190, 200, 20, .light_gray);
        t1.draw();
    }

    std.debug.print("DONE!\n", .{});
}

fn update() void {
    t1.update();
}
