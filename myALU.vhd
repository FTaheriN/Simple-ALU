library IEEE;
use IEEE.std_logic_1164.all;

Entity myALU IS
PORT(a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
s : IN BIT_VECTOR(1 DOWNTO 0);
en : IN STD_LOGIC;
clk : IN STD_LOGIC;
z : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
cout : OUT STD_LOGIC );
END ENTITY;

ARCHITECTURE BEHAVIORAL OF myALU IS

COMPONENT ARShift IS
PORT(a : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
z : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));

END COMPONENT;

COMPONENT RCAdder IS
PORT ( a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
--Cin : IN STD_LOGIC;
s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
Cout : OUT STD_LOGIC);
end COMPONENT;

COMPONENT twosCompB IS
PORT ( b : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
	b2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT;

COMPONENT ABxor IS
PORT(a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
z : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT; 

signal ans1 , ans2 , ans3 , ans4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal co : STD_LOGIC; 

BEGIN
	SH1 : ARShift PORT MAP ( a => a , z => ans1);
	ADD1 : RCAdder PORT MAP (a => a , b => b , s => ans2 , Cout => co);
	COMP1 : twosCompB PORT MAP ( b => b , b2 => ans3);
	XOR1 : ABxor PORT MAP ( a => a , b => b , z => ans4);

PROCESS(clk , en)
BEGIN
	IF( en ='1' AND clk = '1' AND clk'event) then 
		CASE s IS
		WHEN "00" =>
			z <= ans1;
			Cout <= '0';
 		WHEN "01" =>
			z <= ans2;
			cout <= co;
		WHEN "10" => 
			z <= ans3;
			cout <= '0';
		WHEN "11" => 
			z <= ans4;
			cout <= '0';
		END CASE;
	END IF;
END PROCESS;
END BEHAVIORAL;