const std = @import("std");

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    // You can use print statements as follows for debugging, they'll be visible when running tests.
    try std.Io.File.writeStreamingAll(std.Io.File.stderr(), io, "Logs from your program will appear here!");

    // TODO: Uncomment the code below to pass the first stage
    // try std.Io.File.writeStreamingAll(std.Io.File.stdout(), io, "Implement code here!\n");
}
