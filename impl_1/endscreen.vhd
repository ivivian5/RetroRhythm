library IEEE;
                use IEEE.std_logic_1164.all;
                use IEEE.numeric_std.all;

entity endscreen is 
 	port(
		outglobal_o : in std_logic;
		addr_x : in std_logic_vector(6 downto 0);
		addr_y : in std_logic_vector(6 downto 0);
		data : out std_logic_vector(5 downto 0) -- 6-bit words, RRGGBB
	);
end;

architecture sim of endscreen is
signal addr : std_logic_vector(13 downto 0);

begin
	addr (13 downto 7) <= addr_y;
	addr (6 downto 0) <= addr_x;
	process(outglobal_o) begin
		if rising_edge(outglobal_o) then
			case addr is
				when "00001010011110" => data <= "111111";
				when "00001010011111" => data <= "111111";
				when "00001010100000" => data <= "111111";
				when "00001010100001" => data <= "111111";
				when "00001010100010" => data <= "111111";
				when "00001010100111" => data <= "111111";
				when "00001010101011" => data <= "111111";
				when "00001010110000" => data <= "111111";
				when "00001010110001" => data <= "111111";
				when "00001010110010" => data <= "111111";
				when "00001010110011" => data <= "111111";
				when "00001010110100" => data <= "111111";
				when "00001100011101" => data <= "111111";
				when "00001100011110" => data <= "010011";
				when "00001100011111" => data <= "010011";
				when "00001100100000" => data <= "010011";
				when "00001100100001" => data <= "010011";
				when "00001100100010" => data <= "010011";
				when "00001100100011" => data <= "111111";
				when "00001100100110" => data <= "111111";
				when "00001100100111" => data <= "010011";
				when "00001100101000" => data <= "111111";
				when "00001100101010" => data <= "111111";
				when "00001100101011" => data <= "010011";
				when "00001100101100" => data <= "111111";
				when "00001100101111" => data <= "111111";
				when "00001100110000" => data <= "010011";
				when "00001100110001" => data <= "010011";
				when "00001100110010" => data <= "010011";
				when "00001100110011" => data <= "010011";
				when "00001100110100" => data <= "010011";
				when "00001100110101" => data <= "111111";
				when "00001110011110" => data <= "111111";
				when "00001110011111" => data <= "111111";
				when "00001110100000" => data <= "010011";
				when "00001110100001" => data <= "111111";
				when "00001110100010" => data <= "111111";
				when "00001110100110" => data <= "111111";
				when "00001110100111" => data <= "010011";
				when "00001110101000" => data <= "111111";
				when "00001110101010" => data <= "111111";
				when "00001110101011" => data <= "010011";
				when "00001110101100" => data <= "111111";
				when "00001110101111" => data <= "111111";
				when "00001110110000" => data <= "010011";
				when "00001110110001" => data <= "111111";
				when "00001110110010" => data <= "111111";
				when "00001110110011" => data <= "111111";
				when "00001110110100" => data <= "111111";
				when "00010000011111" => data <= "111111";
				when "00010000100000" => data <= "010010";
				when "00010000100001" => data <= "111111";
				when "00010000100110" => data <= "111111";
				when "00010000100111" => data <= "010010";
				when "00010000101000" => data <= "111111";
				when "00010000101001" => data <= "111111";
				when "00010000101010" => data <= "111111";
				when "00010000101011" => data <= "010010";
				when "00010000101100" => data <= "111111";
				when "00010000101111" => data <= "111111";
				when "00010000110000" => data <= "010010";
				when "00010000110001" => data <= "111111";
				when "00010000110010" => data <= "111111";
				when "00010010011111" => data <= "111111";
				when "00010010100000" => data <= "010010";
				when "00010010100001" => data <= "111111";
				when "00010010100110" => data <= "111111";
				when "00010010100111" => data <= "010010";
				when "00010010101000" => data <= "010010";
				when "00010010101001" => data <= "010010";
				when "00010010101010" => data <= "010010";
				when "00010010101011" => data <= "010010";
				when "00010010101100" => data <= "111111";
				when "00010010101111" => data <= "111111";
				when "00010010110000" => data <= "010010";
				when "00010010110001" => data <= "010010";
				when "00010010110010" => data <= "010010";
				when "00010010110011" => data <= "111111";
				when "00010100011111" => data <= "111111";
				when "00010100100000" => data <= "100010";
				when "00010100100001" => data <= "111111";
				when "00010100100110" => data <= "111111";
				when "00010100100111" => data <= "100010";
				when "00010100101000" => data <= "111111";
				when "00010100101001" => data <= "111111";
				when "00010100101010" => data <= "111111";
				when "00010100101011" => data <= "100010";
				when "00010100101100" => data <= "111111";
				when "00010100101111" => data <= "111111";
				when "00010100110000" => data <= "100010";
				when "00010100110001" => data <= "111111";
				when "00010100110010" => data <= "111111";
				when "00010110011111" => data <= "111111";
				when "00010110100000" => data <= "100010";
				when "00010110100001" => data <= "111111";
				when "00010110100110" => data <= "111111";
				when "00010110100111" => data <= "100010";
				when "00010110101000" => data <= "111111";
				when "00010110101010" => data <= "111111";
				when "00010110101011" => data <= "100010";
				when "00010110101100" => data <= "111111";
				when "00010110101111" => data <= "111111";
				when "00010110110000" => data <= "100010";
				when "00010110110001" => data <= "111111";
				when "00011000011111" => data <= "111111";
				when "00011000100000" => data <= "110010";
				when "00011000100001" => data <= "111111";
				when "00011000100110" => data <= "111111";
				when "00011000100111" => data <= "110010";
				when "00011000101000" => data <= "111111";
				when "00011000101010" => data <= "111111";
				when "00011000101011" => data <= "110010";
				when "00011000101100" => data <= "111111";
				when "00011000101111" => data <= "111111";
				when "00011000110000" => data <= "110010";
				when "00011000110001" => data <= "111111";
				when "00011000110010" => data <= "111111";
				when "00011000110011" => data <= "111111";
				when "00011000110100" => data <= "111111";
				when "00011010011111" => data <= "111111";
				when "00011010100000" => data <= "110010";
				when "00011010100001" => data <= "111111";
				when "00011010100110" => data <= "111111";
				when "00011010100111" => data <= "110010";
				when "00011010101000" => data <= "111111";
				when "00011010101010" => data <= "111111";
				when "00011010101011" => data <= "110010";
				when "00011010101100" => data <= "111111";
				when "00011010101111" => data <= "111111";
				when "00011010110000" => data <= "110010";
				when "00011010110001" => data <= "110010";
				when "00011010110010" => data <= "110010";
				when "00011010110011" => data <= "110010";
				when "00011010110100" => data <= "110010";
				when "00011010110101" => data <= "111111";
				when "00011100100000" => data <= "111111";
				when "00011100100111" => data <= "111111";
				when "00011100101011" => data <= "111111";
				when "00011100110000" => data <= "111111";
				when "00011100110001" => data <= "111111";
				when "00011100110010" => data <= "111111";
				when "00011100110011" => data <= "111111";
				when "00011100110100" => data <= "111111";
				when "00100100011110" => data <= "111111";
				when "00100100011111" => data <= "111111";
				when "00100100100000" => data <= "111111";
				when "00100100100001" => data <= "111111";
				when "00100100100010" => data <= "111111";
				when "00100100100111" => data <= "111111";
				when "00100100101011" => data <= "111111";
				when "00100100110000" => data <= "111111";
				when "00100100110001" => data <= "111111";
				when "00100100110010" => data <= "111111";
				when "00100100110011" => data <= "111111";
				when "00100110011101" => data <= "111111";
				when "00100110011110" => data <= "010011";
				when "00100110011111" => data <= "010011";
				when "00100110100000" => data <= "010011";
				when "00100110100001" => data <= "010011";
				when "00100110100010" => data <= "010011";
				when "00100110100011" => data <= "111111";
				when "00100110100110" => data <= "111111";
				when "00100110100111" => data <= "010011";
				when "00100110101000" => data <= "111111";
				when "00100110101010" => data <= "111111";
				when "00100110101011" => data <= "010011";
				when "00100110101100" => data <= "111111";
				when "00100110101111" => data <= "111111";
				when "00100110110000" => data <= "010011";
				when "00100110110001" => data <= "010011";
				when "00100110110010" => data <= "010011";
				when "00100110110011" => data <= "010011";
				when "00100110110100" => data <= "111111";
				when "00101000011101" => data <= "111111";
				when "00101000011110" => data <= "010011";
				when "00101000011111" => data <= "111111";
				when "00101000100000" => data <= "111111";
				when "00101000100001" => data <= "111111";
				when "00101000100010" => data <= "111111";
				when "00101000100110" => data <= "111111";
				when "00101000100111" => data <= "010011";
				when "00101000101000" => data <= "010011";
				when "00101000101001" => data <= "111111";
				when "00101000101010" => data <= "111111";
				when "00101000101011" => data <= "010011";
				when "00101000101100" => data <= "111111";
				when "00101000101111" => data <= "111111";
				when "00101000110000" => data <= "010011";
				when "00101000110001" => data <= "111111";
				when "00101000110010" => data <= "111111";
				when "00101000110011" => data <= "010011";
				when "00101000110100" => data <= "010011";
				when "00101000110101" => data <= "111111";
				when "00101010011101" => data <= "111111";
				when "00101010011110" => data <= "010010";
				when "00101010011111" => data <= "111111";
				when "00101010100000" => data <= "111111";
				when "00101010100110" => data <= "111111";
				when "00101010100111" => data <= "010010";
				when "00101010101000" => data <= "010010";
				when "00101010101001" => data <= "111111";
				when "00101010101010" => data <= "111111";
				when "00101010101011" => data <= "010010";
				when "00101010101100" => data <= "111111";
				when "00101010101111" => data <= "111111";
				when "00101010110000" => data <= "010010";
				when "00101010110001" => data <= "111111";
				when "00101010110011" => data <= "111111";
				when "00101010110100" => data <= "010010";
				when "00101010110101" => data <= "111111";
				when "00101100011101" => data <= "111111";
				when "00101100011110" => data <= "010010";
				when "00101100011111" => data <= "010010";
				when "00101100100000" => data <= "010010";
				when "00101100100001" => data <= "111111";
				when "00101100100110" => data <= "111111";
				when "00101100100111" => data <= "010010";
				when "00101100101000" => data <= "010010";
				when "00101100101001" => data <= "010010";
				when "00101100101010" => data <= "111111";
				when "00101100101011" => data <= "010010";
				when "00101100101100" => data <= "111111";
				when "00101100101111" => data <= "111111";
				when "00101100110000" => data <= "010010";
				when "00101100110001" => data <= "111111";
				when "00101100110011" => data <= "111111";
				when "00101100110100" => data <= "010010";
				when "00101100110101" => data <= "111111";
				when "00101110011101" => data <= "111111";
				when "00101110011110" => data <= "100010";
				when "00101110011111" => data <= "111111";
				when "00101110100000" => data <= "111111";
				when "00101110100110" => data <= "111111";
				when "00101110100111" => data <= "100010";
				when "00101110101000" => data <= "111111";
				when "00101110101001" => data <= "100010";
				when "00101110101010" => data <= "100010";
				when "00101110101011" => data <= "100010";
				when "00101110101100" => data <= "111111";
				when "00101110101111" => data <= "111111";
				when "00101110110000" => data <= "100010";
				when "00101110110001" => data <= "111111";
				when "00101110110011" => data <= "111111";
				when "00101110110100" => data <= "100010";
				when "00101110110101" => data <= "111111";
				when "00110000011101" => data <= "111111";
				when "00110000011110" => data <= "100010";
				when "00110000011111" => data <= "111111";
				when "00110000100110" => data <= "111111";
				when "00110000100111" => data <= "100010";
				when "00110000101000" => data <= "111111";
				when "00110000101001" => data <= "111111";
				when "00110000101010" => data <= "100010";
				when "00110000101011" => data <= "100010";
				when "00110000101100" => data <= "111111";
				when "00110000101111" => data <= "111111";
				when "00110000110000" => data <= "100010";
				when "00110000110001" => data <= "111111";
				when "00110000110011" => data <= "111111";
				when "00110000110100" => data <= "100010";
				when "00110000110101" => data <= "111111";
				when "00110010011101" => data <= "111111";
				when "00110010011110" => data <= "110010";
				when "00110010011111" => data <= "111111";
				when "00110010100000" => data <= "111111";
				when "00110010100001" => data <= "111111";
				when "00110010100010" => data <= "111111";
				when "00110010100110" => data <= "111111";
				when "00110010100111" => data <= "110010";
				when "00110010101000" => data <= "111111";
				when "00110010101001" => data <= "111111";
				when "00110010101010" => data <= "110010";
				when "00110010101011" => data <= "110010";
				when "00110010101100" => data <= "111111";
				when "00110010101111" => data <= "111111";
				when "00110010110000" => data <= "110010";
				when "00110010110001" => data <= "111111";
				when "00110010110010" => data <= "111111";
				when "00110010110011" => data <= "110010";
				when "00110010110100" => data <= "110010";
				when "00110010110101" => data <= "111111";
				when "00110100011101" => data <= "111111";
				when "00110100011110" => data <= "110010";
				when "00110100011111" => data <= "110010";
				when "00110100100000" => data <= "110010";
				when "00110100100001" => data <= "110010";
				when "00110100100010" => data <= "110010";
				when "00110100100011" => data <= "111111";
				when "00110100100110" => data <= "111111";
				when "00110100100111" => data <= "110010";
				when "00110100101000" => data <= "111111";
				when "00110100101010" => data <= "111111";
				when "00110100101011" => data <= "110010";
				when "00110100101100" => data <= "111111";
				when "00110100101111" => data <= "111111";
				when "00110100110000" => data <= "110010";
				when "00110100110001" => data <= "110010";
				when "00110100110010" => data <= "110010";
				when "00110100110011" => data <= "110010";
				when "00110100110100" => data <= "111111";
				when "00110110011110" => data <= "111111";
				when "00110110011111" => data <= "111111";
				when "00110110100000" => data <= "111111";
				when "00110110100001" => data <= "111111";
				when "00110110100010" => data <= "111111";
				when "00110110100111" => data <= "111111";
				when "00110110101011" => data <= "111111";
				when "00110110110000" => data <= "111111";
				when "00110110110001" => data <= "111111";
				when "00110110110010" => data <= "111111";
				when "00110110110011" => data <= "111111";
				when "00111100011111" => data <= "010011";
				when "00111100100000" => data <= "010011";
				when "00111100110011" => data <= "010011";
				when "00111110011111" => data <= "010011";
				when "00111110100001" => data <= "010011";
				when "00111110100111" => data <= "010011";
				when "00111110101000" => data <= "010011";
				when "00111110101001" => data <= "010011";
				when "00111110101010" => data <= "010011";
				when "00111110101011" => data <= "010011";
				when "00111110110011" => data <= "010011";
				when "01000000011111" => data <= "010011";
				when "01000000100001" => data <= "010011";
				when "01000000100010" => data <= "010011";
				when "01000000100111" => data <= "010011";
				when "01000000101011" => data <= "010011";
				when "01000000110011" => data <= "010011";
				when "01000010011111" => data <= "010011";
				when "01000010100111" => data <= "010011";
				when "01000010101011" => data <= "010011";
				when "01000010110011" => data <= "010011";
				when "01000100011111" => data <= "010011";
				when "01000100100111" => data <= "010011";
				when "01000100101011" => data <= "010011";
				when "01000100110011" => data <= "010011";
				when "01000110011101" => data <= "010011";
				when "01000110011110" => data <= "010011";
				when "01000110011111" => data <= "010011";
				when "01000110100101" => data <= "010011";
				when "01000110100110" => data <= "010011";
				when "01000110100111" => data <= "010011";
				when "01000110101010" => data <= "010011";
				when "01000110101011" => data <= "010011";
				when "01000110110001" => data <= "010011";
				when "01000110110010" => data <= "010011";
				when "01000110110011" => data <= "010011";
				when "01001000011100" => data <= "110010";
				when "01001000011101" => data <= "111111";
				when "01001000011110" => data <= "010011";
				when "01001000011111" => data <= "110010";
				when "01001000100100" => data <= "010011";
				when "01001000100101" => data <= "111111";
				when "01001000100110" => data <= "010011";
				when "01001000100111" => data <= "010011";
				when "01001000101001" => data <= "111111";
				when "01001000101010" => data <= "010011";
				when "01001000101011" => data <= "010011";
				when "01001000110000" => data <= "110010";
				when "01001000110001" => data <= "111111";
				when "01001000110010" => data <= "010011";
				when "01001000110011" => data <= "110010";
				when "01001010011100" => data <= "100010";
				when "01001010011101" => data <= "110010";
				when "01001010011110" => data <= "110010";
				when "01001010011111" => data <= "100010";
				when "01001010100100" => data <= "100010";
				when "01001010100101" => data <= "110010";
				when "01001010100110" => data <= "110010";
				when "01001010100111" => data <= "100010";
				when "01001010101001" => data <= "100010";
				when "01001010101010" => data <= "110010";
				when "01001010101011" => data <= "100010";
				when "01001010110000" => data <= "100010";
				when "01001010110001" => data <= "110010";
				when "01001010110010" => data <= "110010";
				when "01001010110011" => data <= "100010";
				when "01001100011101" => data <= "100010";
				when "01001100011110" => data <= "100010";
				when "01001100100101" => data <= "100010";
				when "01001100100110" => data <= "100010";
				when "01001100101010" => data <= "100010";
				when "01001100110001" => data <= "100010";
				when "01001100110010" => data <= "100010";
				when "01011010001111" => data <= "111111";
				when "01011010010000" => data <= "111111";
				when "01011010010001" => data <= "111111";
				when "01011010010100" => data <= "111111";
				when "01011010010101" => data <= "111111";
				when "01011010010110" => data <= "111111";
				when "01011010011001" => data <= "111111";
				when "01011010011010" => data <= "111111";
				when "01011010011011" => data <= "111111";
				when "01011010011101" => data <= "111111";
				when "01011010011110" => data <= "111111";
				when "01011010011111" => data <= "111111";
				when "01011010100000" => data <= "111111";
				when "01011010100010" => data <= "111111";
				when "01011010100011" => data <= "111111";
				when "01011010100100" => data <= "111111";
				when "01011010100101" => data <= "111111";
				when "01011010101011" => data <= "111111";
				when "01011010101100" => data <= "111111";
				when "01011010101101" => data <= "111111";
				when "01011010101110" => data <= "111111";
				when "01011010110000" => data <= "111111";
				when "01011010110001" => data <= "111111";
				when "01011010110010" => data <= "111111";
				when "01011010110100" => data <= "111111";
				when "01011010111000" => data <= "111111";
				when "01011010111001" => data <= "111111";
				when "01011010111010" => data <= "111111";
				when "01011010111100" => data <= "111111";
				when "01011010111101" => data <= "111111";
				when "01011010111110" => data <= "111111";
				when "01011011000000" => data <= "111111";
				when "01011011000001" => data <= "111111";
				when "01011011000010" => data <= "111111";
				when "01011100001111" => data <= "111111";
				when "01011100010010" => data <= "111111";
				when "01011100010100" => data <= "111111";
				when "01011100010111" => data <= "111111";
				when "01011100011001" => data <= "111111";
				when "01011100011101" => data <= "111111";
				when "01011100100010" => data <= "111111";
				when "01011100101011" => data <= "111111";
				when "01011100110000" => data <= "111111";
				when "01011100110100" => data <= "111111";
				when "01011100111000" => data <= "111111";
				when "01011100111100" => data <= "111111";
				when "01011101000001" => data <= "111111";
				when "01011110001111" => data <= "111111";
				when "01011110010010" => data <= "111111";
				when "01011110010100" => data <= "111111";
				when "01011110010111" => data <= "111111";
				when "01011110011001" => data <= "111111";
				when "01011110011010" => data <= "111111";
				when "01011110011101" => data <= "111111";
				when "01011110011110" => data <= "111111";
				when "01011110011111" => data <= "111111";
				when "01011110100000" => data <= "111111";
				when "01011110100010" => data <= "111111";
				when "01011110100011" => data <= "111111";
				when "01011110100100" => data <= "111111";
				when "01011110100101" => data <= "111111";
				when "01011110101011" => data <= "111111";
				when "01011110101100" => data <= "111111";
				when "01011110101101" => data <= "111111";
				when "01011110101110" => data <= "111111";
				when "01011110110000" => data <= "111111";
				when "01011110110001" => data <= "111111";
				when "01011110110100" => data <= "111111";
				when "01011110111000" => data <= "111111";
				when "01011110111001" => data <= "111111";
				when "01011110111100" => data <= "111111";
				when "01011111000001" => data <= "111111";
				when "01100000001111" => data <= "111111";
				when "01100000010000" => data <= "111111";
				when "01100000010001" => data <= "111111";
				when "01100000010100" => data <= "111111";
				when "01100000010101" => data <= "111111";
				when "01100000010110" => data <= "111111";
				when "01100000011001" => data <= "111111";
				when "01100000100000" => data <= "111111";
				when "01100000100101" => data <= "111111";
				when "01100000101110" => data <= "111111";
				when "01100000110000" => data <= "111111";
				when "01100000110100" => data <= "111111";
				when "01100000111000" => data <= "111111";
				when "01100000111100" => data <= "111111";
				when "01100001000001" => data <= "111111";
				when "01100010001111" => data <= "111111";
				when "01100010010100" => data <= "111111";
				when "01100010010111" => data <= "111111";
				when "01100010011001" => data <= "111111";
				when "01100010100000" => data <= "111111";
				when "01100010100101" => data <= "111111";
				when "01100010101110" => data <= "111111";
				when "01100010110000" => data <= "111111";
				when "01100010110100" => data <= "111111";
				when "01100010111000" => data <= "111111";
				when "01100010111100" => data <= "111111";
				when "01100011000001" => data <= "111111";
				when "01100100001111" => data <= "111111";
				when "01100100010100" => data <= "111111";
				when "01100100010111" => data <= "111111";
				when "01100100011001" => data <= "111111";
				when "01100100011010" => data <= "111111";
				when "01100100011011" => data <= "111111";
				when "01100100011101" => data <= "111111";
				when "01100100011110" => data <= "111111";
				when "01100100011111" => data <= "111111";
				when "01100100100000" => data <= "111111";
				when "01100100100010" => data <= "111111";
				when "01100100100011" => data <= "111111";
				when "01100100100100" => data <= "111111";
				when "01100100100101" => data <= "111111";
				when "01100100101011" => data <= "111111";
				when "01100100101100" => data <= "111111";
				when "01100100101101" => data <= "111111";
				when "01100100101110" => data <= "111111";
				when "01100100110000" => data <= "111111";
				when "01100100110001" => data <= "111111";
				when "01100100110010" => data <= "111111";
				when "01100100110100" => data <= "111111";
				when "01100100110101" => data <= "111111";
				when "01100100110110" => data <= "111111";
				when "01100100111000" => data <= "111111";
				when "01100100111001" => data <= "111111";
				when "01100100111010" => data <= "111111";
				when "01100100111100" => data <= "111111";
				when "01100100111101" => data <= "111111";
				when "01100100111110" => data <= "111111";
				when "01100101000001" => data <= "111111";
				when "01101000010110" => data <= "111111";
				when "01101000010111" => data <= "111111";
				when "01101000011000" => data <= "111111";
				when "01101000011010" => data <= "111111";
				when "01101000011011" => data <= "111111";
				when "01101000011100" => data <= "111111";
				when "01101000100001" => data <= "111111";
				when "01101000100010" => data <= "111111";
				when "01101000100011" => data <= "111111";
				when "01101000100101" => data <= "111111";
				when "01101000100110" => data <= "111111";
				when "01101000100111" => data <= "111111";
				when "01101000101101" => data <= "111111";
				when "01101000110000" => data <= "111111";
				when "01101000110001" => data <= "111111";
				when "01101000110010" => data <= "111111";
				when "01101000110101" => data <= "111111";
				when "01101000111000" => data <= "111111";
				when "01101000111010" => data <= "111111";
				when "01101000111101" => data <= "111111";
				when "01101010010111" => data <= "111111";
				when "01101010011010" => data <= "111111";
				when "01101010011100" => data <= "111111";
				when "01101010100001" => data <= "111111";
				when "01101010100101" => data <= "111111";
				when "01101010100111" => data <= "111111";
				when "01101010101100" => data <= "111111";
				when "01101010101110" => data <= "111111";
				when "01101010110000" => data <= "111111";
				when "01101010110100" => data <= "111111";
				when "01101010110110" => data <= "111111";
				when "01101010111000" => data <= "111111";
				when "01101010111010" => data <= "111111";
				when "01101010111011" => data <= "111111";
				when "01101010111101" => data <= "111111";
				when "01101100010111" => data <= "111111";
				when "01101100011010" => data <= "111111";
				when "01101100011100" => data <= "111111";
				when "01101100100001" => data <= "111111";
				when "01101100100011" => data <= "111111";
				when "01101100100101" => data <= "111111";
				when "01101100100111" => data <= "111111";
				when "01101100101100" => data <= "111111";
				when "01101100101101" => data <= "111111";
				when "01101100101110" => data <= "111111";
				when "01101100110000" => data <= "111111";
				when "01101100110010" => data <= "111111";
				when "01101100110100" => data <= "111111";
				when "01101100110101" => data <= "111111";
				when "01101100110110" => data <= "111111";
				when "01101100111000" => data <= "111111";
				when "01101100111010" => data <= "111111";
				when "01101100111100" => data <= "111111";
				when "01101100111101" => data <= "111111";
				when "01101110010111" => data <= "111111";
				when "01101110011010" => data <= "111111";
				when "01101110011100" => data <= "111111";
				when "01101110100001" => data <= "111111";
				when "01101110100011" => data <= "111111";
				when "01101110100101" => data <= "111111";
				when "01101110100111" => data <= "111111";
				when "01101110101100" => data <= "111111";
				when "01101110101110" => data <= "111111";
				when "01101110110000" => data <= "111111";
				when "01101110110010" => data <= "111111";
				when "01101110110100" => data <= "111111";
				when "01101110110110" => data <= "111111";
				when "01101110111000" => data <= "111111";
				when "01101110111010" => data <= "111111";
				when "01101110111100" => data <= "111111";
				when "01101110111101" => data <= "111111";
				when "01110000010111" => data <= "111111";
				when "01110000011010" => data <= "111111";
				when "01110000011011" => data <= "111111";
				when "01110000011100" => data <= "111111";
				when "01110000100001" => data <= "111111";
				when "01110000100010" => data <= "111111";
				when "01110000100011" => data <= "111111";
				when "01110000100101" => data <= "111111";
				when "01110000100110" => data <= "111111";
				when "01110000100111" => data <= "111111";
				when "01110000101100" => data <= "111111";
				when "01110000101110" => data <= "111111";
				when "01110000110000" => data <= "111111";
				when "01110000110001" => data <= "111111";
				when "01110000110010" => data <= "111111";
				when "01110000110100" => data <= "111111";
				when "01110000110110" => data <= "111111";
				when "01110000111000" => data <= "111111";
				when "01110000111010" => data <= "111111";
				when "01110000111101" => data <= "111111";
				when others => data <= "000001";
			end case;
		end if; 
	end process; 
end;