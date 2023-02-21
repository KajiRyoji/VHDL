library ieee;
use ieee.std_logic_1164.all;
entity shifr is
	port(
	A,B:in std_logic_vector
	exit1,exit2,exit3,exit4: out std_logic);
end shifr;
architecture deshifr of shifr is
begin
	exit1<= A and B
	exit2<= A and (not B)
	exit3<=	(not A) and B
	exit4<=(not A) and (not B)
	
end deshifr;
	
