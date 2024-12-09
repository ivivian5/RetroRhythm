-- this spawns the arrows, keeps track of and updates the position

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity arrows is
	port(
		arrows_clk : in std_logic;
		arrows_spawned : out std_logic_vector(3 downto 0);
		left_arr_ypos : out std_logic_vector(9 downto 0);
		top_arr_ypos : out std_logic_vector(9 downto 0);
		right_arr_ypos : out std_logic_vector(9 downto 0);
		down_arr_ypos : out std_logic_vector(9 downto 0)
	);
end arrows;

architecture synth of arrows is
signal counter: std_logic_vector(18 downto 0) := (others => '0');

signal my_arrows_spawned : std_logic_vector(3 downto 0);
signal my_left_arr_ypos : std_logic_vector(9 downto 0);
signal my_top_arr_ypos : std_logic_vector(9 downto 0);
signal my_right_arr_ypos : std_logic_vector(9 downto 0);
signal my_down_arr_ypos : std_logic_vector(9 downto 0);

constant fallspeed: integer := 2;
constant bottom_edge: integer := 480;

begin
	process (arrows_clk) begin
        if rising_edge(arrows_clk) then
			counter <= std_logic_vector(unsigned(counter) + 1);
			
			arrows_spawned <= my_arrows_spawned;
			left_arr_ypos <= my_left_arr_ypos;
			top_arr_ypos <= my_top_arr_ypos;
			right_arr_ypos <= my_right_arr_ypos;
			down_arr_ypos <= my_down_arr_ypos;
			
			if counter = "0000000000000000000" then -- Counter just rolled over
				if my_arrows_spawned = "0000" then --reset arrows on the top
					left_arr_ypos <= (others => '0');--100
					top_arr_ypos <= (others => '0');-- 220
					right_arr_ypos <= (others => '0');-- 340
					down_arr_ypos <= (others => '0');--460
				else
					if my_arrows_spawned(3) = '1' then -- left arrow move down 
						my_left_arr_ypos <= std_logic_vector(unsigned(my_left_arr_ypos) + fallspeed);
						if unsigned(my_left_arr_ypos) = bottom_edge then
							arrows_spawned(3) <= '0';
						else
							arrows_spawned(3) <= '1';
						end if;
						--arrows_spawned(3) <= '0' when unsigned(my_left_arr_ypos) = bottom_edge else '1';
					end if;
					if my_arrows_spawned(2) = '1' then -- top arrow move down 
						my_top_arr_ypos <= std_logic_vector(unsigned(my_top_arr_ypos) + fallspeed);
						if unsigned(my_left_arr_ypos) = bottom_edge then
							arrows_spawned(2) <= '0';
						else
							arrows_spawned(2) <= '1';
						end if;
						--my_arrows_spawned(2) <= '0' when unsigned(my_top_arr_ypos) = bottom_edge else '1';
					end if;
					if my_arrows_spawned(1) = '1' then -- right arrow move down 
						my_right_arr_ypos <= std_logic_vector(unsigned(my_right_arr_ypos) + fallspeed);
						if unsigned(my_left_arr_ypos) = bottom_edge then
							arrows_spawned(1) <= '0';
						else
							arrows_spawned(1) <= '1';
						end if;
						--my_arrows_spawned(1) <= '0' when unsigned(my_right_arr_ypos) = bottom_edge else '1';
					end if;
					if my_arrows_spawned(0) = '1' then -- down arrow move down 
						my_down_arr_ypos <= std_logic_vector(unsigned(my_down_arr_ypos) + fallspeed);
						if unsigned(my_left_arr_ypos) = bottom_edge then
							arrows_spawned(0) <= '0';
						else
							arrows_spawned(0) <= '1';
						end if;
						--my_arrows_spawned(0) <= '0' when unsigned(my_down_arr_ypos) = bottom_edge else '1';
					end if;
				end if;
			--elsif counter = 5d"0" then -- Counter just rolled over, spawn another arrow (always in the same pattern)
				--arrows_spawned <= "0001" when arrows_spawned = "0000" else 
								  --"0011" when arrows_spawned = "0001" else
								  --"0111" when arrows_spawned = "0011" else
								  --"1111" when arrows_spawned = "0111" else
								  --"1111" when arrows_spawned = "1111" else -- all arrows already spawned
								  --"0000";
			else
				my_arrows_spawned <= "1111";
			end if;
		end if;
	end process;
end;