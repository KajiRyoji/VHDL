library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity Alu is
	port(
	A,B:in std_logic_vector (3 downto 0);
	flag:inout std_logic;
	command:in std_logic_vector (2 downto 0);
	result:out std_logic_vector (3 downto 0)
	);
end alu;
architecture xz of alu is
	signal sum,dif:std_logic_vector (3 downto 0);
begin
	sum <=std_logic_vector(signed(A)+signed (B));
	dif <=std_logic_vector(signed(A)-signed (B));
	with command select	
	result	<= A or B when "000",
		   A and B when "001",
		   sum when "010",
		   dif when "110",
		   "0000" when others;
	flag <= '1' when ((command = "010") and ((resize(signed(A),16)+resize(signed(B),16)>7) or (resize(signed(A),16)+resize(signed(B),16)<-8))) 
		      or ((command = "110") and ((resize(signed(A),16)-resize(signed(B),16)>7) or (resize(signed(A),16)-resize(signed(B),16)<-8)))
		    else
		   '0' ;
end xz;
	
