module priority_enc_tb;
 logic  clk;
 logic  rst;
 logic  [3:0] D;	
 logic  [1:0] Y;	
 logic valid;

 priority_enc m1 (.*);

 initial begin
  clk =0;
  forever  
  #1
  clk =~clk;
  end

  initial 
  begin
         assert_reset;

         D= 4'b1000; check_result(0);@(negedge clk);

         D= 4'b0100; check_result(1);@(negedge clk);
         D= 4'b1100; check_result(1);@(negedge clk);

         D= 4'b0010; check_result(2);@(negedge clk);
         D= 4'b1010; check_result(2);@(negedge clk);
         D= 4'b0110; check_result(2);@(negedge clk);
         D= 4'b1110; check_result(2);@(negedge clk);

         D= 4'b0001; check_result(3);@(negedge clk);
         D= 4'b1001; check_result(3);@(negedge clk);
         D= 4'b0101; check_result(3);@(negedge clk);
         D= 4'b0011; check_result(3);@(negedge clk);
         D= 4'b1101; check_result(3);@(negedge clk);
         D= 4'b1011; check_result(3);@(negedge clk);
         D= 4'b0111; check_result(3);@(negedge clk);
         D= 4'b1111; check_result(3);@(negedge clk);
         assert_reset;
    $stop;
  end

  task check_result(input [1:0] exc_res);
  	@(negedge clk);
  	if (exc_res !== Y) begin
  		 $display ("incorrect result");
  	end
  	else begin
  		$display ("correct result");
  	end
  endtask 

  task assert_reset;
  rst=1;
  check_result(0);
  rst =0;
  endtask 
endmodule 

