module fsm5(output reg rd, ds,
            input go, ws, clk, rst_n);
  
  parameter IDLE = 0,READ = 1,DLY = 2,DONE = 3;
  
  reg [3:0] state, next;
  
  always @(posedge clk or negedge rst_n)begin 
    if (!rst_n) begin
      state <= 4'b0;
      state[IDLE] <= 1'b1;
    end
    else state <= next;
  end
    
    always @(state or go or ws) begin next = 4'b0;
      case (1'b1)                                      // synopsys parallel_case
        state[IDLE] : begin if (go) next[READ] = 1'b1;
          else next[IDLE] = 1'b1;
        end
        state[READ] : next[ DLY] = 1'b1;
        state[ DLY] :begin if (!ws) next[DONE] = 1'b1;
        else next[READ] = 1'b1;
        end
        state[DONE] : next[IDLE] = 1'b1;
      endcase
    end
  
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      rd <= 1'b0;
      ds <= 1'b0;
    end
    else begin
      rd <= 1'b0;
      ds <= 1'b0;
      case (1'b1)                                     // synopsys parallel_case
        next[READ] : rd <= 1'b1;
        next[ DLY] : rd <= 1'b1;
        next[DONE] : ds <= 1'b1;
      endcase
    end 
  end
endmodule
