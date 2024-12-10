library IEEE;
                use IEEE.std_logic_1164.all;
                use IEEE.numeric_std.all;

entity num4_disp is 
 	port(
		outglobal_o : in std_logic;
		addr_x : in std_logic_vector(2 downto 0);
		addr_y : in std_logic_vector(1 downto 0);
		data : out std_logic_vector(5 downto 0) -- 6-bit words, RRGGBB
	);
end;

architecture sim of num4_disp is
signal addr : std_logic_vector(4 downto 0);

begin
	addr (4 downto 2) <= addr_x;
	addr (1 downto 0) <= addr_y;
	process(outglobal_o) begin
		if rising_edge(outglobal_o) then
			case addr is
				when "00000" => data <= "111111";
				when "00011" => data <= "111111";
				when "00100" => data <= "111111";
				when "00111" => data <= "111111";
				when "01000" => data <= "111111";
				when "01011" => data <= "111111";
				when "01100" => data <= "111111";
				when "01101" => data <= "111111";
				when "01110" => data <= "111111";
				when "01111" => data <= "111111";
				when "10011" => data <= "111111";
				when "10111" => data <= "111111";
				when "11011" => data <= "111111";
				when "11111" => data <= "111111";
				when others => data <= "000001";
			end case;
		end if; 
	end process; 
end;