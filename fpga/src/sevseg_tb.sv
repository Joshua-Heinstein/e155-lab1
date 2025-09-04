module testbench();
	logic							clk, reset;
	logic							[3:0] s;
	logic							[6:0] seg, segexpected;
	logic [31:0] vectornum, errors;
	logic [10:0] testvectors[15:0];
	
	
	
sevseg dut(s, led, seg);

always

	begin
	
		clk=1; #5;
		clk=0; #5;
		
	end
	
	
	
	
initial
	
	begin
		
		$readmemb("lab1sevseg.tv", testvectors);
		
		vectornum=0;
		errors=0;
		
		reset=1; #22;
		reset=0;
		
	end
	
	
	
always @(posedge clk)
	
	begin
		
		#1;
		
		{s, ledexpected, segexpected} = testvectors[vectornum];
	
	end
	
	
	
always @(negedge clk)
	
	if (~reset) begin
	
		if (led !== ledexpected || seg !== segexpected) begin
		
				$display("Error: inputs = %b", {s});
				
				$display(" outputs = %b (%b expected)", seg,
					segexpected);
					
				errors = errors + 1;
		end
		
		vectornum =vectornum + 1;
		
		
		if (testvectors[vectornum] === 10'bx) begin
		
			$display("%d tests completed with %d errors", vectornum, 
				errors);
				
			$stop;
			
		end
		
	end

endmodule
