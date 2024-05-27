module fsm4(output reg rd, ds,
            input go, ws, clk, rst_n);
  
  parameter IDLE = 2'b00,READ = 2'b01,DLY = 2'b11,DONE = 2'b10;
  
  reg [1:0] state, next;
  
  always @(posedge clk or negedge rst_n)begin
    if (!rst_n) state <= IDLE;
    else state <= next;
  end
  
  always @(state or go or ws) begin
    next = 'bx;
    case (state)
      IDLE : if (go) next = READ;
       else next = IDLE;
      READ : next = DLY;
      DLY : if (!ws) next = DONE;
      else next = READ;
      DONE : next = IDLE;
    endcase
  end
  
  always @(posedge clk or negedge rst_n)begin
    if (!rst_n) begin
      rd <= 1'b0;
      ds <= 1'b0;
    end
    else begin
      rd <= 1'b0;
      ds <= 1'b0;
      case (next)
        READ : rd <= 1'b1;
        DLY : rd <= 1'b1;
        DONE : ds <= 1'b1;
      endcase
    end
  end
endmodule
