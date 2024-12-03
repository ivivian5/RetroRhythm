-- this spawns the arrows, keeps track of and updates the position

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity arrows is
	port(
		arrows_clk : in std_logic;
		arrows_spawned : out std_logic_vector(3 downto 0);
		left_arr_xpos : out std_logic_vector(9 downto 0);
		left_arr_ypos : out std_logic_vector(9 downto 0);
		top_arr_xpos : out std_logic_vector(9 downto 0);
		top_arr_ypos : out std_logic_vector(9 downto 0);
		right_arr_xpos : out std_logic_vector(9 downto 0);
		right_arr_ypos : out std_logic_vector(9 downto 0);
		down_arr_xpos : out std_logic_vector(9 downto 0);
		down_arr_ypos : out std_logic_vector(9 downto 0);
	);
end vga;

architecture synth of arrows is
signal counter: std_logic_vector(18 downto 0) := (others => '0');
constant fallspeed: integer := 1;
constant bottom_edge: integer := 480;

begin
	left_arr_xpos <= ;--100
	top_arr_xpos <= ;-- 220
	right_arr_xpos <= ;-- 340
	down_arr_xpos <= ;--460
	process (arrows_clk) begin
        if rising_edge(arrows_clk) then
			counter <= std_logic_vector(unsigned(counter) + 1);
			if counter = 19d"0" then -- Counter just rolled over
				if arrows_spawned = "0000" then --reset arrows on the top
					left_arr_ypos <= (others => '0');--100
					top_arr_ypos <= (others => '0');-- 220
					right_arr_ypos <= (others => '0');-- 340
					down_arr_ypos <= (others => '0');--460
				else
					if arrows_spawned(3) = '1' then -- left arrow move down 
						left_arr_ypos <= std_logic_vector(unsigned(left_arr_ypos)) + fallspeed;
						arrows_spawned(3) <= '0' when left_arr_ypos = bottom_edge else '1';
					end if;
					if arrows_spawned(2) = '1' then -- top arrow move down 
						top_arr_ypos <= std_logic_vector(unsigned(top_arr_ypos)) + fallspeed;
						arrows_spawned(2) <= '0' when top_arr_ypos = bottom_edge else '1';
					end if;
					if arrows_spawned(1) = '1' then -- right arrow move down 
						right_arr_ypos <= std_logic_vector(unsigned(right_arr_ypos)) + fallspeed;
						arrows_spawned(1) <= '0' when right_arr_ypos = bottom_edge else '1';
					end if;
					if arrows_spawned(0) = '1' then -- down arrow move down 
						down_arr_ypos <= std_logic_vector(unsigned(down_arr_ypos)) + fallspeed;
						arrows_spawned(0) <= '0' when down_arr_ypos = bottom_edge else '1';
					end if;
				end if;
			elsif counter = 5d"0" then -- Counter just rolled over, spawn another arrow (always in the same pattern)
				arrows_spawned <= "0001" when arrows_spawned = "0000" else 
								  "0011" when arrows_spawned = "0001" else
								  "0111" when arrows_spawned = "0011" else
								  "1111" when arrows_spawned = "0111" else
								  "1111" when arrows_spawned = "1111" else -- all arrows already spawned
								  "0000";
			end if;
		end if;
	end process;
end;