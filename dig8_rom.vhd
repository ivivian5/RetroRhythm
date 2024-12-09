library IEEE;
                use IEEE.std_logic_1164.all;
                use IEEE.numeric_std.all;

entity num8_disp is 
 	port(
		outglobal_o : in std_logic;
		addr_x : in std_logic_vector(7 downto 0);
		addr_y : in std_logic_vector(7 downto 0);
		data : out std_logic_vector(5 downto 0) -- 6-bit words, RRGGBB
	);
end;

architecture sim of num8_disp is
signal addr : std_logic_vector(15 downto 0);

begin
	addr (15 downto 8) <= addr_x;
	addr (7 downto 0) <= addr_y;
	process(outglobal_o) begin
		if rising_edge(outglobal_o) then
			case addr is
				when "0000000000000000" => data <= "111111";
				when "0000000000000001" => data <= "111111";
				when "0000000000000010" => data <= "111111";
				when "0000000000000011" => data <= "111111";
				when "0000000100000000" => data <= "111111";
				when "0000000100000001" => data <= "000001";
				when "0000000100000010" => data <= "000001";
				when "0000000100000011" => data <= "111111";
				when "0000001000000000" => data <= "111111";
				when "0000001000000001" => data <= "000001";
				when "0000001000000010" => data <= "000001";
				when "0000001000000011" => data <= "111111";
				when "0000001100000000" => data <= "111111";
				when "0000001100000001" => data <= "111111";
				when "0000001100000010" => data <= "111111";
				when "0000001100000011" => data <= "111111";
				when "0000010000000000" => data <= "111111";
				when "0000010000000001" => data <= "000001";
				when "0000010000000010" => data <= "000001";
				when "0000010000000011" => data <= "111111";
				when "0000010100000000" => data <= "111111";
				when "0000010100000001" => data <= "000001";
				when "0000010100000010" => data <= "000001";
				when "0000010100000011" => data <= "111111";
				when "0000011000000000" => data <= "111111";
				when "0000011000000001" => data <= "000001";
				when "0000011000000010" => data <= "000001";
				when "0000011000000011" => data <= "111111";
				when "0000011100000000" => data <= "111111";
				when "0000011100000001" => data <= "111111";
				when "0000011100000010" => data <= "111111";
				when "0000011100000011" => data <= "111111";
				when others => data <= "010001";
			end case;
		end if; 
	end process; 
end;