library IEEE;
                use IEEE.std_logic_1164.all;
                use IEEE.numeric_std.all;

entity outline_rom is 
 	port(
		outglobal_o : in std_logic;
		addr_x : in std_logic_vector(4 downto 0);
		addr_y : in std_logic_vector(4 downto 0);
		data : out std_logic_vector(5 downto 0) -- 6-bit words, RRGGBB
	);
end;

architecture sim of outline_rom is
signal addr : std_logic_vector(9 downto 0);

begin
	addr (9 downto 5) <= addr_y;
	addr (4 downto 0) <= addr_x;
	process(outglobal_o) begin
		if rising_edge(outglobal_o) then
			case addr is
				when "0000000111" => data <= "001100";
				when "0000100110" => data <= "001100";
				when "0000101000" => data <= "001100";
				when "0001000101" => data <= "001100";
				when "0001001000" => data <= "001100";
				when "0001100100" => data <= "001100";
				when "0001101000" => data <= "001100";
				when "0010000011" => data <= "001100";
				when "0010001000" => data <= "001100";
				when "0010100010" => data <= "001100";
				when "0010101001" => data <= "001100";
				when "0010101010" => data <= "001100";
				when "0010101011" => data <= "001100";
				when "0010101100" => data <= "001100";
				when "0010101101" => data <= "001100";
				when "0011000001" => data <= "001100";
				when "0011001110" => data <= "001100";
				when "0011100000" => data <= "001100";
				when "0011101110" => data <= "001100";
				when "0100000001" => data <= "001100";
				when "0100001110" => data <= "001100";
				when "0100100010" => data <= "001100";
				when "0100101001" => data <= "001100";
				when "0100101010" => data <= "001100";
				when "0100101011" => data <= "001100";
				when "0100101100" => data <= "001100";
				when "0100101101" => data <= "001100";
				when "0101000011" => data <= "001100";
				when "0101001000" => data <= "001100";
				when "0101100100" => data <= "001100";
				when "0101101000" => data <= "001100";
				when "0110000101" => data <= "001100";
				when "0110001000" => data <= "001100";
				when "0110100110" => data <= "001100";
				when "0110101000" => data <= "001100";
				when "0111000111" => data <= "001100";
				when others => data <= "000001";
			end case;
		end if; 
	end process; 
end;