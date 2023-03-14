library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.env.stop;

entity reciver_tb is
end;

architecture bench of reciver_tb is

    component reciver
        port (
            rxdv     : in std_logic;
            clk      : in std_logic;
            rxd      : in std_logic_vector (3 downto 0);
            rxd_out  : out std_logic_vector(3 downto 0);
            rxdv_out : out std_logic;
            resetb   : out std_logic;
            mdk      : out std_logic
        );
    end component;

    -- Clock period
    constant clk_period : time := 40 ns;
    -- Generics

    -- Ports
    signal rxdv         : std_logic;
    signal clk          : std_logic;
    signal rxd          : std_logic_vector (3 downto 0);
    signal rxd_out      : std_logic_vector(3 downto 0);
    signal rxdv_out     : std_logic;
    signal resetb       : std_logic;
    signal mdk          : std_logic;

begin

    reciver_inst : reciver
    port map(
        rxdv     => rxdv,
        clk      => clk,
        rxd      => rxd,
        rxd_out  => rxd_out,
        rxdv_out => rxdv_out,
        resetb   => resetb,
        mdk      => mdk
    );


    process
    begin
        rxdv <= '0';
        rxd <= (others => '0');
        wait until falling_edge(clk);
        rxdv <= '1';
        rxd <= "0101";
        wait for clk_period*15;
        rxd <= "1101";
        wait for clk_period;
        stop;
    end process;

    clk_process : process
    begin
        clk <= '1';
        wait for clk_period/2;
        clk <= '0';
        wait for clk_period/2;
    end process clk_process;

end;