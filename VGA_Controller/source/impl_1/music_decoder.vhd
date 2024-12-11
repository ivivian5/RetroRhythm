library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity music_decoder is
	port (
		note_code : in std_logic_vector(3 downto 0);
		note_out : out integer
	);
end music_decoder;

architecture synth of music_decoder is


begin
	
	process(note_code) is
	begin
		case note_code is
			when "0001" => 
				note_out <= 36180;
			when "0010" =>
				note_out <= 32232;
			when "0011" =>
				note_out <= 28716;
			when "0100" =>
				note_out <= 24147;
			when "0101" =>
				note_out <= 21513;
			when "0110" =>
				note_out <= 19166;
			when "0111" => 
				note_out <= 18090;
			when "1000" =>
				note_out <= 16116;
			when "1001" =>
				note_out <= 14358;
			when "1010" =>
				note_out <= 48293;
			when "1011" =>
				note_out <= 43026;
			when "1100" =>
				note_out <= 27104;
			when "1101" => 
				note_out <= 38331;
			when others =>
				note_out <= 1;
		end case;
	end process;
	

end;


