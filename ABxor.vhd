library IEEE;
use IEEE.std_logic_1164.all;

ENTITY ABxor IS
PORT(a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
z : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
--clk : IN STD_LOGIC;
--en : IN STD_LOGIC);
END ENTITY;

ARCHITECTURE BEHAVIORAL OF ABxor IS
BEGIN
--PROCESS(clk , en)
--BEGIN 
--IF( en ='1'1 AND clk = '1' AND clk'event) then 
	z(0) <= a(0) XOR b(0);
	z(1) <= a(1) XOR b(1);
	z(2) <= a(2) XOR b(2);
	z(3) <= a(3) XOR b(3);
--END IF; 
--END PROCESS;
END BEHAVIORAL;

