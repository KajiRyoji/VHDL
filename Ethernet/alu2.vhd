library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity Alu is
	port(
	A,B:in std_logic_vector (3 downto 0);
	flag:inout std_logic;
	command:in std_logic_vector (2 downto 0);
	result:out std_logic_vector (4 downto 0)
	);
end alu;
architecture qwe of alu is
	signal sum,dif:std_logic_vector (4 downto 0);
begin
	sum <=std_logic_vector(signed(A)+signed (B));
	dif <=std_logic_vector(signed(A)-signed (B));
	process (A,B,command)
	begin
		case command is 
			when "000" =>
			result<=A or B;
			when "010" =>
			result<=sum;
			when "001" =>
			result<=A and B;
			when "110" =>
			result<= dif;
			when others  =>
			result <= "00000";
		end case;
		if ((command = "010") and ((resize(signed(A),16)+resize(signed(B),16)>7) or (resize(signed(A),16)+resize(signed(B),16)<-8))) or 
		((command = "110") and ((resize(signed(A),16)-resize(signed(B),16)>7) or (resize(signed(A),16)-resize(signed(B),16)<-8))) then
			flag<='1';
		else
			flag<='0';	
		end if;	
	end process;

end qwe;
	
