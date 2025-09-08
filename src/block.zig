const print = @import("std").debug.print;
const rl = @import("raylib");

pub fn Block(t: i32) type {
    return struct {
        x: i32,
        y: i32,

        pub fn init(x: i32, y: i32) @This() {
            return @This(){
                .x = x,
                .y = y,
            };
        }

        pub fn draw(self: @This()) void {
            rl.drawRectangle(self.x * 20, self.y * 20, 20, 20, .red);
        }

        pub fn update(self: *@This()) void {
            switch (t) {
                1 => self.fall(),
                else => self.fall(),
            }
        }

        fn fall(self: *@This()) void {
            self.y = self.y + 1;
        }
    };
}
