library ieee;
use ieee.std_logic_1164.all;
entity bez is
	port(
	A,B,C,EN:in std_logic_vector
	OUT_STATE: out std_logic);
end bez;
architecture sisbez of bez is
	signal con:std_logic;
begin
	OUT_STATE<= (p1 and  EN);
	p1<=A or B or C
end sisbez;
	
