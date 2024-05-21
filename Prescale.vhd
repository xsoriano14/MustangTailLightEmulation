library ieee;
Use ieee.numeric_std.all;
Use ieee.std_logic_1164.all;

entity Prescale is
	port( clockin : in std_logic;
			clockout: out std_logic);
end  entity prescale;

architecture logic of prescale is 
		signal fb: unsigned(23 downto 0):="000000000000000000000000";
		begin
		fb<= fb+ 1 when Rising_Edge(clockin);
		clockout<=fb(23);
	
end architecture logic;
