library IEEE;
use IEEE.std_logic_1164.all;

ENTITY RCAdder IS
PORT ( a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
--Cin : IN STD_LOGIC;
s : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
Cout : OUT STD_LOGIC);
end ENTITY;

ARCHITECTURE BEHAVIORAL OF RCAdder IS
COMPONENT full_adder
PORT ( a : IN STD_LOGIC;
b : IN STD_LOGIC;
Cin : IN STD_LOGIC;
s : OUT STD_LOGIC;
Cout : OUT STD_LOGIC);
end COMPONENT;

signal c1,c2,c3: STD_LOGIC;

BEGIN
	F0: full_adder PORT MAP(a=>a(0) , b=>b(0) , Cin=>'0' , s=>s(0) , Cout=>c1);
	F1: full_adder PORT MAP(a=>a(1) , b=>b(1) , Cin=>c1 , s=>s(1) , Cout=>c2);
	F2: full_adder PORT MAP(a=>a(2) , b=>b(2) , Cin=>c2 , s=>s(2) , Cout=>c3);
	F3: full_adder PORT MAP(a=>a(3) , b=>b(3) , Cin=>c3 , s=>s(3) , Cout=>Cout);

END BEHAVIORAL;