library IEEE;
                use IEEE.std_logic_1164.all;
                use IEEE.numeric_std.all;

entity score_disp is 
 	port(
		outglobal_o : in std_logic;
		addr_x : in std_logic_vector(5 downto 0);
		addr_y : in std_logic_vector(2 downto 0);
		data : out std_logic_vector(5 downto 0) -- 6-bit words, RRGGBB
	);
end;

architecture sim of score_disp is
signal addr : std_logic_vector(8 downto 0);

begin
	addr (8 downto 6) <= addr_y;
	addr (5 downto 0) <= addr_x;
	process(outglobal_o) begin
		if rising_edge(outglobal_o) then
			case addr is
				when "000000001" => data <= "111111";
				when "000000010" => data <= "111111";
				when "000000011" => data <= "111111";
				when "000000100" => data <= "111111";
				when "000000110" => data <= "111111";
				when "000000111" => data <= "111111";
				when "000001000" => data <= "111111";
				when "000001001" => data <= "111111";
				when "000001011" => data <= "111111";
				when "000001100" => data <= "111111";
				when "000001101" => data <= "111111";
				when "000001110" => data <= "111111";
				when "000001111" => data <= "111111";
				when "000010001" => data <= "111111";
				when "000010010" => data <= "111111";
				when "000010011" => data <= "111111";
				when "000010100" => data <= "111111";
				when "000010111" => data <= "111111";
				when "000011000" => data <= "111111";
				when "000011001" => data <= "111111";
				when "000011010" => data <= "111111";
				when "001000001" => data <= "111111";
				when "001000110" => data <= "111111";
				when "001001011" => data <= "111111";
				when "001001111" => data <= "111111";
				when "001010001" => data <= "111111";
				when "001010101" => data <= "111111";
				when "001010111" => data <= "111111";
				when "010000001" => data <= "111111";
				when "010000110" => data <= "111111";
				when "010001011" => data <= "111111";
				when "010001111" => data <= "111111";
				when "010010001" => data <= "111111";
				when "010010101" => data <= "111111";
				when "010010111" => data <= "111111";
				when "010011100" => data <= "111111";
				when "011000001" => data <= "111111";
				when "011000010" => data <= "111111";
				when "011000011" => data <= "111111";
				when "011000100" => data <= "111111";
				when "011000110" => data <= "111111";
				when "011001011" => data <= "111111";
				when "011001111" => data <= "111111";
				when "011010001" => data <= "111111";
				when "011010101" => data <= "111111";
				when "011010111" => data <= "111111";
				when "011011000" => data <= "111111";
				when "011011001" => data <= "111111";
				when "100000100" => data <= "111111";
				when "100000110" => data <= "111111";
				when "100001011" => data <= "111111";
				when "100001111" => data <= "111111";
				when "100010001" => data <= "111111";
				when "100010010" => data <= "111111";
				when "100010011" => data <= "111111";
				when "100010100" => data <= "111111";
				when "100010111" => data <= "111111";
				when "101000100" => data <= "111111";
				when "101000110" => data <= "111111";
				when "101001011" => data <= "111111";
				when "101001111" => data <= "111111";
				when "101010001" => data <= "111111";
				when "101010101" => data <= "111111";
				when "101010111" => data <= "111111";
				when "101011100" => data <= "111111";
				when "110000100" => data <= "111111";
				when "110000110" => data <= "111111";
				when "110001011" => data <= "111111";
				when "110001111" => data <= "111111";
				when "110010001" => data <= "111111";
				when "110010101" => data <= "111111";
				when "110010111" => data <= "111111";
				when "111000001" => data <= "111111";
				when "111000010" => data <= "111111";
				when "111000011" => data <= "111111";
				when "111000100" => data <= "111111";
				when "111000110" => data <= "111111";
				when "111000111" => data <= "111111";
				when "111001000" => data <= "111111";
				when "111001001" => data <= "111111";
				when "111001011" => data <= "111111";
				when "111001100" => data <= "111111";
				when "111001101" => data <= "111111";
				when "111001110" => data <= "111111";
				when "111001111" => data <= "111111";
				when "111010001" => data <= "111111";
				when "111010101" => data <= "111111";
				when "111010111" => data <= "111111";
				when "111011000" => data <= "111111";
				when "111011001" => data <= "111111";
				when "111011010" => data <= "111111";
				when others => data <= "000001";
			end case;
		end if; 
	end process; 
end;