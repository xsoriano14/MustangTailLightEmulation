library ieee;
use ieee.std_logic_1164.all;

entity FSM_tb is
end FSM_tb;

architecture test of FSM_tb is
	component FSM is
	port (RIGHT, LEFT, rst, clk, FLICK: in std_logic;
		LC, LB, LA, RA, RB, RC: out std_logic
		);
	end component;

	signal tb_R, tb_L, tb_rst: std_logic;
	signal tb_LC, tb_LB, tb_LA, tb_RA, tb_RB, tb_RC: std_logic;
	SIGNAL tb_clk : std_logic := '1';
	
	constant clk_hz: integer := 50e6;
	constant clk_period: time := 1 sec/clk_hz;
	
begin
 dut: FSM
	port map (RIGHT => tb_R, LEFT => tb_L, rst => tb_rst, clk => tb_clk, Flick=>'0',
		LC => tb_LC, LB => tb_LB, LA => tb_LA, RA => tb_RA, RB => tb_RB, RC => tb_RC);
tb_clk <= NOT tb_clk after clk_period/2; --every 1/2 period, invert the clock
	process is
	begin
		
		
		tb_rst <= '0';
		tb_R <= '0';
		tb_L <= '0';
		wait for 20 ns;
	
		tb_L <= '1';
		wait for 20 ns;
	
		tb_R <= '1';
		tb_L <= '0';
		wait for 20 ns;
	
		tb_L <= '1';
		wait for 20 ns;
	
		tb_rst <= '1';
		tb_R <= '0';
		tb_L <= '0';
		wait for 20 ns;
	
		tb_L <= '1';
		wait for 20 ns;
	
		tb_R <= '1';
		tb_L <= '0';
		wait for 20 ns;
	
		tb_L <= '1';
		wait for 20 ns;
		wait;
			
		
		
	end process;
	
end test;
	