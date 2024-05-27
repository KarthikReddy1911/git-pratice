module fsm(
  input start,clk,resetn,
  output reg reset,load,enable);
 
 
typedef enum logic [1:0] {IDLE,LOAD,SHIFT} state_t;
 
state_t state,next;
  
  always_ff @(posedge clk or negedge resetn) begin
      if(!resetn) state<=IDLE;
      else        state<=next;
  end
 
  always_comb  begin
      case(state)
           IDLE: begin reset=1;load=0;enable=0;
                if(start)    next=LOAD;
                 else         next=IDLE;
                 end
           LOAD: begin reset=1;load=1;enable=0;
                 if(!start)  next=SHIFT;
                 else        next=LOAD;
                 end
           SHIFT:begin  reset=0;load=0;enable=1;
                  if(start)  next=LOAD;
                  else       next=SHIFT;
                  end
      endcase
   end 
endmodule
