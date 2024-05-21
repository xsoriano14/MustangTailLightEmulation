library ieee;
Use ieee.numeric_std.all;
Use ieee.std_logic_1164.all;

entity lab08 is
port (CLOCK_50 : in std_logic;
SW : in std_logic_vector(17 downto 0);
KEY: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
LEDR : out std_logic_vector(17 downto 0));
end lab08;

architecture logic of lab08 is

component fsm is
	port( clK,RST,LeFT,RiGHT, FLICK : in std_logic;
			LA,LB,LC,RA,RB,RC: OUT std_logic);
			
end component;

component Prescale is
	port( clockin : in std_logic;
			clockout: out std_logic);
end component;
signal slowclk: std_logic;
signal r1,r2,r3,l1,l2,l3:std_logic;
begin

obj1: prescale port map(clockin=>CLOCK_50,clockout=>slowclk);
obj2: fsm port map(clk=>slowclk, Rst=>not(sw(17)), LeFT=>sw(1), RiGHT=>sw(0),FLICK=>NOT(KEY(3)) , LA=>l1,LB=>l2,LC=>l3, RA=>r1,RB=>r2,RC=>r3);

ledr(11 downto 9)<=l1&l1&l1;
ledr(14 downto 12)<=l2&l2&l2;
ledr(17 downto 15)<=l3&l3&l3;
ledr(8 DOWNTO 6)<=r1&r1&r1;
LEDR(5 DOWNTO 3)<=r2&r2&r2;
LEDR(2 DOWNTO 0)<=r3&r3&r3;
end architecture logic;
