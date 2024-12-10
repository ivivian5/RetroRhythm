library IEEE;
                use IEEE.std_logic_1164.all;
                use IEEE.numeric_std.all;

entity right_outline is 
                 	port(
                		outglobal_o : in std_logic;
                		addr_x : in std_logic_vector(7 downto 0);
                		addr_y : in std_logic_vector(7 downto 0);
                		data : out std_logic_vector(5 downto 0) -- 6-bit words, RRGGBB
                	);
                end;

                architecture sim of right_outline is
                signal addr : std_logic_vector(15 downto 0);

                begin
                	addr (15 downto 8) <= addr_x;
                	addr (7 downto 0) <= addr_y;
                	process(outglobal_o) begin
                		if rising_edge(outglobal_o) then
                			case addr is
				when "0000000000000111" => data <= "011100";
				when "0000000100000110" => data <= "011100";
				when "0000000100001000" => data <= "011100";
				when "0000001000000110" => data <= "011100";
				when "0000001000001001" => data <= "011100";
				when "0000001100000110" => data <= "011100";
				when "0000001100001010" => data <= "011100";
				when "0000010000000110" => data <= "011100";
				when "0000010000001011" => data <= "011100";
				when "0000010100000001" => data <= "011100";
				when "0000010100000010" => data <= "011100";
				when "0000010100000011" => data <= "011100";
				when "0000010100000100" => data <= "011100";
				when "0000010100000101" => data <= "011100";
				when "0000010100001100" => data <= "011100";
				when "0000011000000000" => data <= "011100";
				when "0000011000001101" => data <= "011100";
				when "0000011100000000" => data <= "011100";
				when "0000011100001110" => data <= "011100";
				when "0000100000000000" => data <= "011100";
				when "0000100000001101" => data <= "011100";
				when "0000100100000001" => data <= "011100";
				when "0000100100000010" => data <= "011100";
				when "0000100100000011" => data <= "011100";
				when "0000100100000100" => data <= "011100";
				when "0000100100000101" => data <= "011100";
				when "0000100100001100" => data <= "011100";
				when "0000101000000110" => data <= "011100";
				when "0000101000001011" => data <= "011100";
				when "0000101100000110" => data <= "011100";
				when "0000101100001010" => data <= "011100";
				when "0000110000000110" => data <= "011100";
				when "0000110000001001" => data <= "011100";
				when "0000110100000110" => data <= "011100";
				when "0000110100001000" => data <= "011100";
				when "0000111000000111" => data <= "011100";
				when others => data <= "000000";
			end case;
              		end if; 
              	end process; 
              end;