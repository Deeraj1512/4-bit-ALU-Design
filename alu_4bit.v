module alu_4bit (
    input  [3:0] A,       // 4-bit input A
    input  [3:0] B,       // 4-bit input B
    input  [2:0] opcode,  // 3-bit operation selector
    output reg [3:0] result,  // 4-bit result
    output reg carry,         // Carry out flag
    output reg zero           // Zero flag (result == 0)
);

// ALU Operation Codes
parameter ADD  = 3'b000;  // A + B
parameter SUB  = 3'b001;  // A - B
parameter AND  = 3'b010;  // A AND B
parameter OR   = 3'b011;  // A OR B
parameter XOR  = 3'b100;  // A XOR B
parameter NOT  = 3'b101;  // NOT A
parameter SHL  = 3'b110;  // Shift Left A
parameter SHR  = 3'b111;  // Shift Right A

reg [4:0] temp; // 5-bit temp to capture carry

always @(*) begin
    carry  = 0;
    temp   = 0;
    result = 0;

    case (opcode)
        ADD: begin
            temp   = A + B;
            result = temp[3:0];
            carry  = temp[4];       // MSB is carry
        end
        SUB: begin
            temp   = A - B;
            result = temp[3:0];
            carry  = temp[4];       // Borrow flag
        end
        AND: result = A & B;
        OR:  result = A | B;
        XOR: result = A ^ B;
        NOT: result = ~A;
        SHL: begin
            result = A << 1;
            carry  = A[3];          // MSB shifted out
        end
        SHR: begin
            result = A >> 1;
            carry  = A[0];          // LSB shifted out
        end
        default: result = 4'b0000;
    endcase

    zero = (result == 4'b0000) ? 1 : 0;  // Set zero flag
end

endmodule