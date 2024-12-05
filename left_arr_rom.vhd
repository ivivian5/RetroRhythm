library IEEE;
                use IEEE.std_logic_1164.all;
                use IEEE.numeric_std.all;

entity rom is 
                 	port(
                		outglobal_o : in std_logic;
                		addr_x : in std_logic_vector(7 downto 0);
                		addr_y : in std_logic_vector(7 downto 0);
                		data : out std_logic_vector(5 downto 0) -- 6-bit words, RRGGBB
                	);
                end;

                architecture sim of rom is
                signal addr : std_logic_vector(15 downto 0);

                begin
                	addr (15 downto 8) <= addr_x;
                	addr (7 downto 0) <= addr_y;
                	process(outglobal_o) begin
                		if rising_edge(outglobal_o) then
                			case addr is
				when "0000000000000111" => data <= "110011";
				when "0000000100000110" => data <= "110011";
				when "0000000100000111" => data <= "110011";
				when "0000000100001000" => data <= "110011";
				when "0000001000000110" => data <= "110011";
				when "0000001000000111" => data <= "111111";
				when "0000001000001000" => data <= "110011";
				when "0000001000001001" => data <= "110011";
				when "0000001100000110" => data <= "110011";
				when "0000001100000111" => data <= "110011";
				when "0000001100001000" => data <= "111111";
				when "0000001100001001" => data <= "110011";
				when "0000001100001010" => data <= "110011";
				when "0000010000000110" => data <= "110011";
				when "0000010000000111" => data <= "110011";
				when "0000010000001000" => data <= "110011";
				when "0000010000001001" => data <= "111111";
				when "0000010000001010" => data <= "110011";
				when "0000010000001011" => data <= "110011";
				when "0000010100000001" => data <= "110011";
				when "0000010100000010" => data <= "110011";
				when "0000010100000011" => data <= "110011";
				when "0000010100000100" => data <= "110011";
				when "0000010100000101" => data <= "110011";
				when "0000010100000110" => data <= "110011";
				when "0000010100000111" => data <= "110011";
				when "0000010100001000" => data <= "110011";
				when "0000010100001001" => data <= "110011";
				when "0000010100001010" => data <= "111111";
				when "0000010100001011" => data <= "110011";
				when "0000010100001100" => data <= "110011";
				when "0000011000000000" => data <= "110011";
				when "0000011000000001" => data <= "110011";
				when "0000011000000010" => data <= "110011";
				when "0000011000000011" => data <= "110011";
				when "0000011000000100" => data <= "110011";
				when "0000011000000101" => data <= "110011";
				when "0000011000000110" => data <= "110011";
				when "0000011000000111" => data <= "110011";
				when "0000011000001000" => data <= "110011";
				when "0000011000001001" => data <= "110011";
				when "0000011000001010" => data <= "110011";
				when "0000011000001011" => data <= "111111";
				when "0000011000001100" => data <= "110011";
				when "0000011000001101" => data <= "110011";
				when "0000011100000000" => data <= "110011";
				when "0000011100000001" => data <= "110011";
				when "0000011100000010" => data <= "110011";
				when "0000011100000011" => data <= "110011";
				when "0000011100000100" => data <= "110011";
				when "0000011100000101" => data <= "110011";
				when "0000011100000110" => data <= "110011";
				when "0000011100000111" => data <= "110011";
				when "0000011100001000" => data <= "110011";
				when "0000011100001001" => data <= "110011";
				when "0000011100001010" => data <= "110011";
				when "0000011100001011" => data <= "110011";
				when "0000011100001100" => data <= "111111";
				when "0000011100001101" => data <= "110011";
				when "0000011100001110" => data <= "110011";
				when "0000100000000000" => data <= "110011";
				when "0000100000000001" => data <= "110011";
				when "0000100000000010" => data <= "110011";
				when "0000100000000011" => data <= "110011";
				when "0000100000000100" => data <= "110011";
				when "0000100000000101" => data <= "110011";
				when "0000100000000110" => data <= "110011";
				when "0000100000000111" => data <= "110011";
				when "0000100000001000" => data <= "110011";
				when "0000100000001001" => data <= "110011";
				when "0000100000001010" => data <= "110011";
				when "0000100000001011" => data <= "110011";
				when "0000100000001100" => data <= "110011";
				when "0000100000001101" => data <= "110011";
				when "0000100100000001" => data <= "110011";
				when "0000100100000010" => data <= "110011";
				when "0000100100000011" => data <= "110011";
				when "0000100100000100" => data <= "110011";
				when "0000100100000101" => data <= "110011";
				when "0000100100000110" => data <= "110011";
				when "0000100100000111" => data <= "110011";
				when "0000100100001000" => data <= "110011";
				when "0000100100001001" => data <= "110011";
				when "0000100100001010" => data <= "110011";
				when "0000100100001011" => data <= "110011";
				when "0000100100001100" => data <= "110011";
				when "0000101000000110" => data <= "110011";
				when "0000101000000111" => data <= "110011";
				when "0000101000001000" => data <= "110011";
				when "0000101000001001" => data <= "110011";
				when "0000101000001010" => data <= "110011";
				when "0000101000001011" => data <= "110011";
				when "0000101100000110" => data <= "110011";
				when "0000101100000111" => data <= "110011";
				when "0000101100001000" => data <= "110011";
				when "0000101100001001" => data <= "110011";
				when "0000101100001010" => data <= "110011";
				when "0000110000000110" => data <= "110011";
				when "0000110000000111" => data <= "110011";
				when "0000110000001000" => data <= "110011";
				when "0000110000001001" => data <= "110011";
				when "0000110100000110" => data <= "110011";
				when "0000110100000111" => data <= "110011";
				when "0000110100001000" => data <= "110011";
				when "0000111000000111" => data <= "110011";
				when others => data <= "000000";
			end case;
              		end if; 
              	end process; 
              end;