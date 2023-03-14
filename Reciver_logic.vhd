library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity reciver is
    port (
        rxdv, clk             : in std_logic;
        rxd                   : in std_logic_vector (3 downto 0);
        rxd_out               : out std_logic_vector(3 downto 0);
        rxdv_out, resetb, mdk : out std_logic

    );

end reciver;
architecture fix of reciver is
    type reg_64 is array (0 to 12) of std_logic_vector (3 downto 0);
    signal a, b, ind       : natural := 1;
    signal mem             : reg_64;
    signal flag, mac_taken : std_logic := '0';

begin

    resetb <= '1';
    mdk    <= '0';
    process (rxd, rxdv, clk)
    begin
        if rising_edge(clk) then
            if rxdv = '1' then
                if a = 15 then
                    if rxd = "1101" then -- "D"-value start-of-frame
                        flag <= '1';        -- TODO: add flag=0
                    elsif rxd = "0101" then -- "preambule"-value
                        a <= 15;
                    else a<= 0;
                    end if;

                elsif rxd = "0101" then -- "preambule"-value
                    a <= a + 1;
                else
                    a <= 0;
                end if;

            else
                null;
            end if;
        end if;
    end process;
    process (clk)
    begin
        if rising_edge (clk) then
            if mac_taken /= '1' then
                if flag = '1' then
                    if b = 12 then
                        if ind /= 12 then
                            mem(ind) <= rxd;
                            ind      <= ind + 1;
                        else
                            mac_taken <= '1';
                        end if;
                    else
                        b <= b + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;
end fix;