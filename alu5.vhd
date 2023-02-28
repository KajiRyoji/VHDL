library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity Alu5 is
	port(
	A,B:in std_logic_vector (3 downto 0);
	flag:inout std_logic;
	command:in std_logic_vector (2 downto 0);
	result:inout std_logic_vector (4 downto 0);
	clk:in std_logic
	
	);
end alu5;
architecture mnp of alu5 is
	signal sum,dif,buff,or_sim,and_sim:std_logic_vector (4 downto 0);
	signal a_1,b_1:std_logic_vector (4 downto 0);
  
begin
	
	
	process (A,B,command,clk)
	
	begin
		if rising_edge(clk) then
		a_1<=a(3)& a;
	b_1<=b(3)& b;
	
		
	
	end if;
	or_sim<= (A_1 or B_1);
	and_sim<=(A_1 and B_1);
	sum <=std_logic_vector((signed(a_1)+signed (b_1)));
		dif <=std_logic_vector(((signed(a_1)-signed (b_1))));
        if rising_edge(clk) then
            case command is 
                when "000" =>
                result<=or_sim;
                when "010" =>
                result<=sum;
                when "001" =>
                result<=and_sim;
                when "110" =>
                result<= dif;
              when others  =>
              --result <= "00000";
				  null;
            end case;
            
        end if;
--		  result <=resize (result,4+flag);
       
	
	end process;

end mnp;
	
