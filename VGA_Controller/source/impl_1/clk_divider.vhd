library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity clk_divider is
port (
	clk_in : in std_logic;
	div_num : in integer;
	reset : in std_logic;
	clk_out : out std_logic
	);
end clk_divider;
	
architecture synth of clk_divider is 

	signal count : integer := 1;
	signal tmp : std_logic := '0';

begin 
	process(clk_in, reset)
	begin
		if(reset = '1') then 
			count <= 1;
			tmp <= '0';
		elsif rising_edge(clk_in) then 
			count <= count + 1;
			if count = div_num then 
				tmp <= not tmp;
				count <= 1;
			end if;
		end if;
	
	clk_out <= tmp;
	end process;
end;
	