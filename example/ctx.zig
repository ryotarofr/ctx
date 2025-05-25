const std = @import("std");
const ctx = @import("ctx.zig");

pub fn main() anyerror!void {
    var context: ctx.Ctx = ctx.Ctx.init(std.heap.page_allocator);

    context.set_value("apple", 123);
    context.set_value("banana", 456);

    var out: i32 = 0;
    if (context.get_value("apple", &out)) {
        std.debug.print("apple = {}\n", .{out});
    } else {
        std.debug.print("apple not found\n", .{});
    }

    if (context.get_value("cherry", &out)) {
        std.debug.print("cherry = {}\n", .{out});
    } else {
        std.debug.print("cherry not found\n", .{});
    }
}
