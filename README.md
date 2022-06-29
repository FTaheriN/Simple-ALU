# Simple-ALU
This simple ALU is implemented in VHDL and works as below:

* s1s0 are the two selectors
 
  s1s0 == 00) Arithmetic Shift input A
  
  s1s0 == 01) Ripple Carry Add input A and B
  
  s1s0 == 10) Two's complement input B
  
  s1s0 == 11) Input A XOR input B 
  
  
  
Also there is a test file included to test the ALU.
  
