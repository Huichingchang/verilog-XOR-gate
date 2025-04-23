`timescale 1ns/1ps
module xor_gate_tb;
    reg a, b;
    wire y;
    integer f;

    xor_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $dumpfile("xor_gate.vcd");
        $dumpvars(0, xor_gate_tb);

        f = $fopen("monitor_log_xor.txt", "w");
        if (!f) begin
            $display("Failed to open output file.");
            $finish;
        end else begin
            $display("File opened.");
        end

        a = 0; b = 0; #10;
        $fwrite(f, "a=%b, b=%b, y=%b @ %0t ns\n", a, b, y, $time);
        a = 0; b = 1; #10;
        $fwrite(f, "a=%b, b=%b, y=%b @ %0t ns\n", a, b, y, $time);
        a = 1; b = 0; #10;
        $fwrite(f, "a=%b, b=%b, y=%b @ %0t ns\n", a, b, y, $time);
        a = 1; b = 1; #10;
        $fwrite(f, "a=%b, b=%b, y=%b @ %0t ns\n", a, b, y, $time);

        #10;
        $fclose(f);
        $display("Simulation done.");
        $finish;
    end
endmodule
