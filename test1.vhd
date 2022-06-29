library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY test1 IS 
END test1;

ARCHITECTURE test OF test1 IS

COMPONENT myALU IS
PORT(a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
s : IN BIT_VECTOR(1 DOWNTO 0);
en : IN STD_LOGIC;
clk : IN STD_LOGIC;
z : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
cout : OUT STD_LOGIC );
END COMPONENT;

	SIGNAL aa , bb , zz : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL ss : BIT_VECTOR(1 DOWNTO 0);
	SIGNAL enable , ccout : STD_LOGIC;
	SIGNAL clk : STD_LOGIC := '0';

BEGIN 

	TST: myALU PORT MAP( aa , bb , ss , enable , clk , zz , ccout);
	aa <= "0101" , "1010" AFTER 100 NS;
	bb <= "1001" , "0001" AFTER 100 NS;
	clk <= NOT clk AFTER 25 NS;
	enable <= '0', '1' AFTER 20 NS, '0' AFTER 200 NS;
	ss <= "00" , "01" AFTER 50 NS , "10" AFTER 100 NS , "11" AFTER 150 NS;
END test;
