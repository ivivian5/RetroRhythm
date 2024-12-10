 --this spawns the arrows, keeps track of and updates the position

--library IEEE;
--use IEEE.std_logic_1164.all;
--use IEEE.numeric_std.all;

--entity arrows is
	--port(
		--arrows_clk : in std_logic;
		--arrows_spawned : out std_logic_vector(3 downto 0);
		--left_arr_ypos : out std_logic_vector(9 downto 0);
		--top_arr_ypos : out std_logic_vector(9 downto 0);
		--right_arr_ypos : out std_logic_vector(9 downto 0);
		--down_arr_ypos : out std_logic_vector(9 downto 0)
	--);
--end arrows;

--architecture synth of arrows is
--signal counter: std_logic_vector(18 downto 0) := (others => '0');

--signal my_arrows_spawned : std_logic_vector(3 downto 0) := (others => '1');
--signal my_left_arr_ypos : std_logic_vector(9 downto 0);
--signal my_top_arr_ypos : std_logic_vector(9 downto 0);
--signal my_right_arr_ypos : std_logic_vector(9 downto 0);
--signal my_down_arr_ypos : std_logic_vector(9 downto 0);

--constant fallspeed: integer := 2;
--constant bottom_edge: integer := 480;

--signal interval : unsigned(15 downto 0) := (others => '0');
--signal seed : unsigned(13 downto 0) := to_unsigned(5234, 14);

--begin
	--process (arrows_clk) begin
        --if rising_edge(arrows_clk) then
            
            ---- temp1 = seed xor (seed shr 1)
            ---- temp2 = temp1 xor (temp1 shl 1)
            ---- next = temp2 xor (temp1 shl 2)
           ----  next mod 4
            --interval <= interval + 1;
            --if interval = 0 then 
                --my_arrows_spawned(to_integer(((((seed xor (seed srl 1)) xor ((seed xor (seed srl 1)) sll 1)) xor ((seed xor (seed srl 1)) sll 2)) mod 4))) <= '1';
                --seed <= (((seed xor (seed srl 1)) xor ((seed xor (seed srl 1)) sll 1)) xor ((seed xor (seed srl 1)) sll 2));
            --end if;

            --if spawnNext < 4 then
                --my_arrows_spawned(to_integer(spawnNext)) <= '1';
                --spawnNext <= "1111";
            --end if;
            
            --counter <= std_logic_vector(unsigned (counter) + 1);
			--if counter = "000000000000000" then -- Counter just rolled over
                --if my_arrows_spawned(3) = '1' then -- left arrow move down 
                    --my_left_arr_ypos <= std_logic_vector(unsigned(my_left_arr_ypos) + fallspeed);
                    --if unsigned(my_left_arr_ypos) = bottom_edge then
                        --my_arrows_spawned(3) <= '0';
                        --my_left_arr_ypos <= (others => '0');
                    --end if;
                --end if;
                --if my_arrows_spawned(2) = '1' then -- top arrow move down 
                    --my_top_arr_ypos <= std_logic_vector(unsigned(my_top_arr_ypos) + fallspeed);
                    --if unsigned(my_top_arr_ypos) = bottom_edge then
                        --my_arrows_spawned(2) <= '0';
                        --my_top_arr_ypos <= (others => '0');-- 220
                    --end if;
                --end if;
                --if my_arrows_spawned(1) = '1' then -- right arrow move down 
                    --my_right_arr_ypos <= std_logic_vector(unsigned(my_right_arr_ypos) + fallspeed);
                    --if unsigned(my_right_arr_ypos) = bottom_edge then
                        --my_arrows_spawned(1) <= '0';
                        --my_right_arr_ypos <= (others => '0');-- 340
                    --end if;
                --end if;
                --if my_arrows_spawned(0) = '1' then -- down arrow move down 
                    --my_down_arr_ypos <= std_logic_vector(unsigned(my_down_arr_ypos) + fallspeed);
                    --if unsigned(my_down_arr_ypos) = bottom_edge then
                        --my_arrows_spawned(0) <= '0';
                        --my_down_arr_ypos <= (others => '0');--460
                    --end if;
                --end if;
            --end if;
			--arrows_spawned <= my_arrows_spawned;
			--left_arr_ypos <= my_left_arr_ypos;
			--top_arr_ypos <= my_top_arr_ypos;
			--right_arr_ypos <= my_right_arr_ypos;
			--down_arr_ypos <= my_down_arr_ypos;
		--end if;
	--end process;
	
    
--end;

-- this spawns the arrows, keeps track of and updates the position

--library IEEE;
--use IEEE.std_logic_1164.all;
--use IEEE.numeric_std.all;

--entity arrows is
	--port(
		--arrows_clk : in std_logic;
		--arrows_spawned : out std_logic_vector(3 downto 0);
		--left_arr_ypos : out std_logic_vector(9 downto 0);
		--top_arr_ypos : out std_logic_vector(9 downto 0);
		--right_arr_ypos : out std_logic_vector(9 downto 0);
		--down_arr_ypos : out std_logic_vector(9 downto 0)
	--);
--end arrows;

--architecture synth of arrows is
--signal counter: std_logic_vector(18 downto 0) := (others => '0');

--signal my_arrows_spawned : std_logic_vector(3 downto 0);
--signal my_left_arr_ypos : std_logic_vector(9 downto 0);
--signal my_top_arr_ypos : std_logic_vector(9 downto 0);
--signal my_right_arr_ypos : std_logic_vector(9 downto 0);
--signal my_down_arr_ypos : std_logic_vector(9 downto 0);

--constant fallspeed: integer := 2;
--constant bottom_edge: integer := 480;

--signal interval : unsigned(10 downto 0) := (others => '0');
--signal seed : unsigned(13 downto 0) := to_unsigned(5234, 14);

--begin
	--process (arrows_clk) begin
        --if rising_edge(arrows_clk) then
			--counter <= std_logic_vector(unsigned(counter) + 1);
			
			--arrows_spawned <= my_arrows_spawned;
			--left_arr_ypos <= my_left_arr_ypos;
			--top_arr_ypos <= my_top_arr_ypos;
			--right_arr_ypos <= my_right_arr_ypos;
			--down_arr_ypos <= my_down_arr_ypos;

          --   temp1 = seed xor (seed shr 1)
          --   temp2 = temp1 xor (temp1 shl 1)
          --   next = temp2 xor (temp1 shl 2)
          --   next mod 4
            --interval <= interval + 1;
            --if interval = 0 then 
                --my_arrows_spawned(to_integer(((((seed xor (seed srl 1)) xor ((seed xor (seed srl 1)) sll 1)) xor ((seed xor (seed srl 1)) sll 2)) mod 4))) <= '1';
                --seed <= (((seed xor (seed srl 1)) xor ((seed xor (seed srl 1)) sll 1)) xor ((seed xor (seed srl 1)) sll 2));
            --end if;

			--if counter = "0000000000000000000" then -- Counter just rolled over
                --if my_arrows_spawned(3) = '1' then -- left arrow move down 
                    --my_left_arr_ypos <= std_logic_vector(unsigned(my_left_arr_ypos) + fallspeed);
                    --if unsigned(my_left_arr_ypos) = bottom_edge then
                        --left_arr_ypos <= (others => '0');
                        --arrows_spawned(3) <= '0';
                    --else
                        --arrows_spawned(3) <= '1';
                    --end if;
                 --   arrows_spawned(3) <= '0' when unsigned(my_left_arr_ypos) = bottom_edge else '1';
                --end if;
                --if my_arrows_spawned(2) = '1' then -- top arrow move down 
                    --my_top_arr_ypos <= std_logic_vector(unsigned(my_top_arr_ypos) + fallspeed);
                    --if unsigned(my_left_arr_ypos) = bottom_edge then
                        --top_arr_ypos <= (others => '0');-- 220
                        --arrows_spawned(2) <= '0';
                    --else
                        --arrows_spawned(2) <= '1';
                    --end if;
                 --   my_arrows_spawned(2) <= '0' when unsigned(my_top_arr_ypos) = bottom_edge else '1';
                --end if;
                --if my_arrows_spawned(1) = '1' then -- right arrow move down 
                    --my_right_arr_ypos <= std_logic_vector(unsigned(my_right_arr_ypos) + fallspeed);
                    --if unsigned(my_left_arr_ypos) = bottom_edge then
                        --arrows_spawned(1) <= '0';
                        --right_arr_ypos <= (others => '0');-- 340
                    --else
                        --arrows_spawned(1) <= '1';
                    --end if;
                  --  my_arrows_spawned(1) <= '0' when unsigned(my_right_arr_ypos) = bottom_edge else '1';
                --end if;
                --if my_arrows_spawned(0) = '1' then -- down arrow move down 
                    --my_down_arr_ypos <= std_logic_vector(unsigned(my_down_arr_ypos) + fallspeed);
                    --if unsigned(my_left_arr_ypos) = bottom_edge then
                        --arrows_spawned(0) <= '0';
                        --down_arr_ypos <= (others => '0');--460
                    --else
                        --arrows_spawned(0) <= '1';
                    --end if;
                   -- my_arrows_spawned(0) <= '0' when unsigned(my_down_arr_ypos) = bottom_edge else '1';
                --end if;
			--end if;
		--end if;
	--end process;
--end;

-- this spawns the arrows, keeps track of and updates the position

--library IEEE;
--use IEEE.std_logic_1164.all;
--use IEEE.numeric_std.all;

--entity arrows is
	--port(
		--arrows_clk : in std_logic;
		--hit : in std_logic_vector(3 downto 0);
		--arrows_spawned : out std_logic_vector(3 downto 0);
		--left_arr_ypos : out std_logic_vector(9 downto 0);
		--top_arr_ypos : out std_logic_vector(9 downto 0);
		--right_arr_ypos : out std_logic_vector(9 downto 0);
		--down_arr_ypos : out std_logic_vector(9 downto 0)
	--);
--end arrows;

--architecture synth of arrows is
--signal counter: std_logic_vector(18 downto 0) := (others => '0');

--signal my_arrows_spawned : std_logic_vector(3 downto 0);
--signal my_left_arr_ypos : std_logic_vector(9 downto 0);
--signal my_top_arr_ypos : std_logic_vector(9 downto 0);
--signal my_right_arr_ypos : std_logic_vector(9 downto 0);
--signal my_down_arr_ypos : std_logic_vector(9 downto 0);

--constant fallspeed: integer := 2;
--constant bottom_edge: integer := 120;

--begin

	--process (arrows_clk) begin
        --if rising_edge(arrows_clk) then
			--counter <= std_logic_vector(unsigned(counter) + 1);
			
			--arrows_spawned <= my_arrows_spawned;
			--left_arr_ypos <= my_left_arr_ypos;
			--top_arr_ypos <= my_top_arr_ypos;
			--right_arr_ypos <= my_right_arr_ypos;
			--down_arr_ypos <= my_down_arr_ypos;
			
			--if counter = "0000000000000000000" then -- Counter just rolled over
				--if my_arrows_spawned = "0000" then --reset arrows on the top
					--left_arr_ypos <= (others => '0');--100
					--top_arr_ypos <= (others => '0');-- 220
					--right_arr_ypos <= (others => '0');-- 340
					--down_arr_ypos <= (others => '0');--460
				--else
					--if my_arrows_spawned(3) = '1' then -- left arrow move down 
						--my_left_arr_ypos <= std_logic_vector(unsigned(my_left_arr_ypos) + fallspeed);
						--if unsigned(my_left_arr_ypos) > bottom_edge or hit(3) = '0' then
							--my_arrows_spawned(3) <= '0';
						--end if;
						--arrows_spawned(3) <= '0' when unsigned(my_left_arr_ypos) = bottom_edge else '1';
					--end if;
					--if my_arrows_spawned(2) = '1' then -- top arrow move down 
						--my_top_arr_ypos <= std_logic_vector(unsigned(my_top_arr_ypos) + fallspeed);
						--if unsigned(my_top_arr_ypos) > bottom_edge or hit(2) = '0' then
							--my_arrows_spawned(2) <= '0';
						--else
							--my_arrows_spawned(2) <= '1';
						--end if;
						--my_arrows_spawned(2) <= '0' when unsigned(my_top_arr_ypos) = bottom_edge else '1';
					--end if;
					--if my_arrows_spawned(1) = '1' then -- right arrow move down 
						--my_right_arr_ypos <= std_logic_vector(unsigned(my_right_arr_ypos) + fallspeed);
						--if unsigned(my_right_arr_ypos) > bottom_edge or hit(1) = '0' then
							--my_arrows_spawned(1) <= '0';
						--end if;
						--my_arrows_spawned(1) <= '0' when unsigned(my_right_arr_ypos) = bottom_edge else '1';
					--end if;
					--if my_arrows_spawned(0) = '1' then -- down arrow move down 
						--my_down_arr_ypos <= std_logic_vector(unsigned(my_down_arr_ypos) + fallspeed);
						--if unsigned(my_down_arr_ypos) > bottom_edge or hit(0) = '0' then
							--my_arrows_spawned(0) <= '0';
						--end if;
						--my_arrows_spawned(0) <= '0' when unsigned(my_down_arr_ypos) = bottom_edge else '1';
					--end if;
				--end if;
			--elsif counter = 5d"0" then -- Counter just rolled over, spawn another arrow (always in the same pattern)
				--arrows_spawned <= "0001" when arrows_spawned = "0000" else 
								  --"0011" when arrows_spawned = "0001" else
								  --"0111" when arrows_spawned = "0011" else
								  --"1111" when arrows_spawned = "0111" else
								  --"1111" when arrows_spawned = "1111" else -- all arrows already spawned
								  --"0000";
			--else
				--my_arrows_spawned <= "1111";
			--end if;
		--end if;
	--end process;
--end;



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

signal my_arrows_spawned : std_logic_vector(3 downto 0) := (others => '0');
signal my_left_arr_ypos : std_logic_vector(9 downto 0) := (others => '0');
signal my_top_arr_ypos : std_logic_vector(9 downto 0):= (others => '0');
signal my_right_arr_ypos : std_logic_vector(9 downto 0):= (others => '0');
signal my_down_arr_ypos : std_logic_vector(9 downto 0):= (others => '0');

constant fallspeed: unsigned(1 downto 0) := "10";
constant bottom_edge: unsigned(8 downto 0) := "110100100";

signal interval1 : std_logic_vector(19 downto 0) := (others => '0');
signal interval2 : std_logic_vector(25 downto 0) := (others => '0');
signal interval3 : std_logic_vector(23 downto 0) := (others => '0');
signal interval4 : std_logic_vector(21 downto 0) := (others => '0');

signal seed : unsigned(13 downto 0) := to_unsigned(5234, 14);

signal random : unsigned(3 downto 0) := "0001";

signal test : std_logic_vector(1 downto 0) := (others => '0');

begin
	process (arrows_clk) begin
        if rising_edge(arrows_clk) then
		
			--counter <= counter + 1;
			
			counter <= std_logic_vector(unsigned(counter) + 1);
            
            -- temp1 = seed xor (seed shr 1)
            -- temp2 = temp1 xor (temp1 shl 1)
            -- next = temp2 xor (temp1 shl 2)
            -- next mod 4
            --interval <= interval + 1;
			interval1 <= std_logic_vector(unsigned(interval1) + 1);
            if interval1 = "00000000000000000000" then 
                --my_arrows_spawned(to_integer(((((seed xor (seed srl 1)) xor ((seed xor (seed srl 1)) sll 1)) xor ((seed xor (seed srl 1)) sll 2)) mod 4))) <= '1';
                --seed <= (((seed xor (seed srl 1)) xor ((seed xor (seed srl 1)) sll 1)) xor ((seed xor (seed srl 1)) sll 2));
				my_arrows_spawned(0) <= '1';
				--my_arrows_spawned(1) <= '1';
				--my_arrows_spawned(2) <= '1';
				--my_arrows_spawned(3) <= '1';
				
				--random <= (random(0) & (random(3) xor random(0)) & random(2) & random(1));
				
				--my_arrows_spawned(to_integer(random(3 downto 2))) <= '1';
				--test <= std_logic_vector(unsigned(test) + 1);
			end if;
			
			interval2 <= std_logic_vector(unsigned(interval2) + 1);
            if interval2 = "00000000000000000000000000" then 
				my_arrows_spawned(1) <= '1';
			end if;
			
			interval3 <= std_logic_vector(unsigned(interval3) + 1);
            if interval3 = "000000000000000000000000" then 
				my_arrows_spawned(2) <= '1';
			end if;
			
			interval4 <= std_logic_vector(unsigned(interval4) + 1);
            if interval4 = "0000000000000000000000" then 
				my_arrows_spawned(3) <= '1';
			end if;
			
				
			if counter = "0000000000000000000"  then -- Counter just rolled over
					
				if my_arrows_spawned(3) = '1' then
					if unsigned(my_left_arr_ypos) + fallspeed = bottom_edge then
						my_arrows_spawned(3) <= '0';
						my_left_arr_ypos <= (others => '0');
					else 
						my_left_arr_ypos <= std_logic_vector(unsigned(my_left_arr_ypos) + fallspeed);
					end if;
				end if;
				
				if my_arrows_spawned(2) = '1' then
					if unsigned(my_top_arr_ypos) + fallspeed = bottom_edge then
						my_arrows_spawned(2) <= '0';
						my_top_arr_ypos <= (others => '0');
					else 
						my_top_arr_ypos <= std_logic_vector(unsigned(my_top_arr_ypos) + fallspeed);
					end if;
				end if;
				
				if my_arrows_spawned(1) = '1' then
					if unsigned(my_right_arr_ypos) + fallspeed = bottom_edge then
						my_arrows_spawned(2) <= '0';
						my_right_arr_ypos <= (others => '0');
					else 
						my_right_arr_ypos <= std_logic_vector(unsigned(my_right_arr_ypos) + fallspeed);
					end if;
				end if;
				
				if my_arrows_spawned(0) = '1' then
					if unsigned(my_down_arr_ypos) + fallspeed = bottom_edge then
						my_arrows_spawned(2) <= '0';
						my_down_arr_ypos <= (others => '0');
					else 
						my_down_arr_ypos <= std_logic_vector(unsigned(my_down_arr_ypos) + fallspeed);
					end if;
				end if;

            end if;
		end if;
		arrows_spawned <= my_arrows_spawned;
		left_arr_ypos <= my_left_arr_ypos;
		top_arr_ypos <= my_top_arr_ypos;
		right_arr_ypos <= my_right_arr_ypos;
		down_arr_ypos <= my_down_arr_ypos;
	end process;
end;
