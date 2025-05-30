const std = @import("std");

pub const Ctx = struct {
    allocator: std.mem.Allocator,
    map: std.StringHashMap(i32),

    pub fn init(allocator: std.mem.Allocator) Ctx {
        return .{ .allocator = allocator, .map = std.StringHashMap(i32).init(allocator) };
    }

    pub fn deinit(self: *Ctx) void {
        self.map.deinit();
    }

    fn c_strlen(ptr: [*:0]const u8) usize {
        var len: usize = 0;
        while (ptr[len] != 0) : (len += 1) {}
        return len;
    }

    pub fn set_value(self: *Ctx, key_ptr: [*:0]const u8, value: i32) void {
        const len = c_strlen(key_ptr);
        const slice: []const u8 = key_ptr[0..len];
        // skip put error
        _ = self.map.put(slice, value) catch {};
    }

    pub fn get_value(self: *Ctx, key_ptr: [*:0]const u8, value_out: *i32) bool {
        const len = c_strlen(key_ptr);
        const slice: []const u8 = key_ptr[0..len];
        if (self.map.get(slice)) |v| {
            value_out.* = v;
            return true;
        }
        return false;
    }
};
