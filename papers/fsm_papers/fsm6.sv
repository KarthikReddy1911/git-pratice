module fsm6 (output reg rd, ds,
             input go, ws, clk, rst_n);
  
  parameter IDLE = 4'b0001,READ = 4'b0010,DLY = 4'b0100,DONE = 4'b1000;
  
  reg [3:0] state, next;
  
  always @(posedge clk or negedge rst_n)begin
    if (!rst_n) state <= IDLE;
    else state <= next;
  end
  
  always @(state or go or ws) begin
    next = 4'bx;
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
