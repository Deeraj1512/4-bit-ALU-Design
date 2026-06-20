module alu_4bit_tb;

reg  [3:0] A, B;
reg  [2:0] opcode;
wire [3:0] result;
wire carry, zero;

// Instantiate ALU
alu_4bit uut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry(carry),
    .zero(zero)
);

initial begin
    $display("=== 4-bit ALU Testbench ===");
    $display("Opcode | A    | B    | Result | Carry | Zero");
    $display("-------|------|------|--------|-------|-----");

    // Test ADD
    A = 4'b0011; B = 4'b0101; opcode = 3'b000; #10;
    $display("ADD    | %b | %b | %b   |   %b   |  %b", A, B, result, carry, zero);

    // Test SUB
    A = 4'b1000; B = 4'b0011; opcode = 3'b001; #10;
    $display("SUB    | %b | %b | %b   |   %b   |  %b", A, B, result, carry, zero);

    // Test AND
    A = 4'b1100; B = 4'b1010; opcode = 3'b010; #10;
    $display("AND    | %b | %b | %b   |   %b   |  %b", A, B, result, carry, zero);

    // Test OR
    A = 4'b1100; B = 4'b1010; opcode = 3'b011; #10;
    $display("OR     | %b | %b | %b   |   %b   |  %b", A, B, result, carry, zero);

    // Test XOR
    A = 4'b1100; B = 4'b1010; opcode = 3'b100; #10;
    $display("XOR    | %b | %b | %b   |   %b   |  %b", A, B, result, carry, zero);

    // Test NOT
    A = 4'b1010; B = 4'b0000; opcode = 3'b101; #10;
    $display("NOT    | %b | %b | %b   |   %b   |  %b", A, B, result, carry, zero);

    // Test Shift Left
    A = 4'b0011; B = 4'b0000; opcode = 3'b110; #10;
    $display("SHL    | %b | %b | %b   |   %b   |  %b", A, B, result, carry, zero);

    // Test Shift Right
    A = 4'b1100; B = 4'b0000; opcode = 3'b111; #10;
    $display("SHR    | %b | %b | %b   |   %b   |  %b", A, B, result, carry, zero);

    // Zero flag test
    A = 4'b0000; B = 4'b0000; opcode = 3'b010; #10;
    $display("AND(0) | %b | %b | %b   |   %b   |  %b", A, B, result, carry, zero);

    $display("=== Simulation Complete ===");
    $finish;
end

initial begin
    $dumpfile("alu_4bit.vcd");
    $dumpvars(0, alu_4bit_tb);
end

endmodule
