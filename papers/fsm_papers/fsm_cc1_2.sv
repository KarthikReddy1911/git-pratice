module fsm2(output reg rd, ds,
            input go, ws, clk, rst_n);
  
  parameter IDLE = 2'b00,READ = 2'b01,DLY = 2'b11,DONE = 2'b10;
  
  reg [1:0] state, next;
  
  always @(posedge clk or negedge rst_n) begin 
    if (!rst_n) state <= IDLE;
    else state <= next;
  end
  
  always @(state or go or ws) begin
    next = 'bx;                               // Default next state assignment
    rd = 1'b0;                                // Default output assignments (this eliminates latches)
    ds = 1'b0;
    case (state)
      IDLE :begin if (go) next = READ;
        else next = IDLE;
      end
      READ : begin rd = 1'b1;
        next = DLY;
         end
      DLY : begin rd = 1'b1;
        if (!ws) next = DONE;
        else next = READ;
      end
      DONE : begin ds = 1'b1;
        next = IDLE;
      end
    endcase
  end
endmodule
