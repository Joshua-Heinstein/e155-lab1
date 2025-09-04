// Joshua Heinstein
// 9/3/2025
// joshuaheinstein@gmail.com


// Module top takes the switches as an input to drive the leds
// and connect the sevseg module, and also reads the clock and
// implements a counter to blink led2 at 2.4Hz

module top(input logic [3:0] s,
		   output logic [2:0] led,
		   output logic [6:0] seg);
		  
	// counter (from starter code)
	logic int_osc;
	logic [24:0] counter;
  
   // Internal high-speed oscillator
	HSOSC #(.CLKHF_DIV(2'b01)) 
		hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
  
   // Counter
	always_ff @(posedge int_osc) begin
		counter <= counter + 1;
		if (counter >= 5000000) begin
			counter <= 0;
			led[2] = ~led[2];
		end 
    end


	// leds
	assign led[0] = s[1]^s[0]; // led[0] = s[1] xor s[0]
	assign led[1] = s[3]&s[2]; // led[1] = s[3] and s[2]

	sevseg display(s, seg);

endmodule



			
			
			
	