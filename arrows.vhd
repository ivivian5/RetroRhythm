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
signal counter: unsigned(18 downto 0) := (others => '0');

signal my_arrows_spawned : std_logic_vector(3 downto 0);
signal my_left_arr_ypos : std_logic_vector(9 downto 0);
signal my_top_arr_ypos : std_logic_vector(9 downto 0);
signal my_right_arr_ypos : std_logic_vector(9 downto 0);
signal my_down_arr_ypos : std_logic_vector(9 downto 0);

constant fallspeed: integer := 2;
constant bottom_edge: integer := 480;

signal interval : unsigned(10 downto 0) := (others => '0');
signal seed : unsigned(13 downto 0) := to_unsigned(5234, 14);
signal spawnNext : unsigned(3 downto 0) := (others => '1');

begin
	process (arrows_clk) begin
        if rising_edge(arrows_clk) then
            
            -- temp1 = seed xor (seed shr 1)
            -- temp2 = temp1 xor (temp1 shl 1)
            -- next = temp2 xor (temp1 shl 2)
            -- next mod 4
            interval <= interval + 1;
            if interval = 0 then 
                spawnNext <= ((((seed xor (seed srl 1)) xor ((seed xor (seed srl 1)) sll 1)) xor ((seed xor (seed srl 1)) sll 2)) mod 4);
                seed <= (((seed xor (seed srl 1)) xor ((seed xor (seed srl 1)) sll 1)) xor ((seed xor (seed srl 1)) sll 2));
            end if;

            if spawnNext < 4 then
                my_arrows_spawned(to_integer(spawnNext)) <= '1';
                spawnNext <= "1111";
            end if;
            
            counter <= counter + 1;
			if counter = 0 then -- Counter just rolled over
                if my_arrows_spawned(3) = '1' then -- left arrow move down 
                    my_left_arr_ypos <= std_logic_vector(unsigned(my_left_arr_ypos) + fallspeed);
                    if unsigned(my_left_arr_ypos) + fallspeed = bottom_edge then
                        my_arrows_spawned(3) <= '0';
                        left_arr_ypos <= (others => '0');
                    end if;
                end if;
                if my_arrows_spawned(2) = '1' then -- top arrow move down 
                    my_top_arr_ypos <= std_logic_vector(unsigned(my_top_arr_ypos) + fallspeed);
                    if unsigned(my_top_arr_ypos) + fallspeed = bottom_edge then
                        my_arrows_spawned(2) <= '0';
                        top_arr_ypos <= (others => '0');-- 220
                    end if;
                end if;
                if my_arrows_spawned(1) = '1' then -- right arrow move down 
                    my_right_arr_ypos <= std_logic_vector(unsigned(my_right_arr_ypos) + fallspeed);
                    if unsigned(my_right_arr_ypos) + fallspeed = bottom_edge then
                        my_arrows_spawned(1) <= '0';
                        right_arr_ypos <= (others => '0');-- 340
                    end if;
                end if;
                if my_arrows_spawned(0) = '1' then -- down arrow move down 
                    my_down_arr_ypos <= std_logic_vector(unsigned(my_down_arr_ypos) + fallspeed);
                    if unsigned(my_down_arr_ypos) + fallspeed = bottom_edge then
                        my_arrows_spawned(0) <= '0';
                        down_arr_ypos <= (others => '0');--460
                    end if;
                end if;
            end if;
		end if;
	end process;

    arrows_spawned <= my_arrows_spawned;
    left_arr_ypos <= my_left_arr_ypos;
    top_arr_ypos <= my_top_arr_ypos;
    right_arr_ypos <= my_right_arr_ypos;
    down_arr_ypos <= my_down_arr_ypos;
end;
			    
--my_arrows_spawned(to_integer(((((seed xor (seed srl 1)) xor ((seed xor (seed srl 1)) sll 1)) xor ((seed xor (seed srl 1)) sll 2)) mod 4))) <= '1';


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

signal interval : unsigned(10 downto 0) := (others => '0');
signal seed : unsigned(13 downto 0) := to_unsigned(5234, 14);

begin
	process (arrows_clk) begin
        if rising_edge(arrows_clk) then
			counter <= std_logic_vector(unsigned(counter) + 1);
			
			arrows_spawned <= my_arrows_spawned;
			left_arr_ypos <= my_left_arr_ypos;
			top_arr_ypos <= my_top_arr_ypos;
			right_arr_ypos <= my_right_arr_ypos;
			down_arr_ypos <= my_down_arr_ypos;

            -- temp1 = seed xor (seed shr 1)
            -- temp2 = temp1 xor (temp1 shl 1)
            -- next = temp2 xor (temp1 shl 2)
            -- next mod 4
            interval <= interval + 1;
            if interval = 0 then 
                my_arrows_spawned(to_integer(((((seed xor (seed srl 1)) xor ((seed xor (seed srl 1)) sll 1)) xor ((seed xor (seed srl 1)) sll 2)) mod 4))) <= '1';
                seed <= (((seed xor (seed srl 1)) xor ((seed xor (seed srl 1)) sll 1)) xor ((seed xor (seed srl 1)) sll 2));
            end if;

			if counter = "0000000000000000000" then -- Counter just rolled over
                if my_arrows_spawned(3) = '1' then -- left arrow move down 
                    my_left_arr_ypos <= std_logic_vector(unsigned(my_left_arr_ypos) + fallspeed);
                    if unsigned(my_left_arr_ypos) = bottom_edge then
                        left_arr_ypos <= (others => '0');
                        arrows_spawned(3) <= '0';
                    else
                        arrows_spawned(3) <= '1';
                    end if;
                    --arrows_spawned(3) <= '0' when unsigned(my_left_arr_ypos) = bottom_edge else '1';
                end if;
                if my_arrows_spawned(2) = '1' then -- top arrow move down 
                    my_top_arr_ypos <= std_logic_vector(unsigned(my_top_arr_ypos) + fallspeed);
                    if unsigned(my_left_arr_ypos) = bottom_edge then
                        top_arr_ypos <= (others => '0');-- 220
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
                        right_arr_ypos <= (others => '0');-- 340
                    else
                        arrows_spawned(1) <= '1';
                    end if;
                    --my_arrows_spawned(1) <= '0' when unsigned(my_right_arr_ypos) = bottom_edge else '1';
                end if;
                if my_arrows_spawned(0) = '1' then -- down arrow move down 
                    my_down_arr_ypos <= std_logic_vector(unsigned(my_down_arr_ypos) + fallspeed);
                    if unsigned(my_left_arr_ypos) = bottom_edge then
                        arrows_spawned(0) <= '0';
                        down_arr_ypos <= (others => '0');--460
                    else
                        arrows_spawned(0) <= '1';
                    end if;
                    --my_arrows_spawned(0) <= '0' when unsigned(my_down_arr_ypos) = bottom_edge else '1';
                end if;
			end if;
		end if;
	end process;
end;




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
signal counter: unsigned(18 downto 0) := (others => '0');

signal my_arrows_spawned : std_logic_vector(3 downto 0);
signal my_left_arr_ypos : std_logic_vector(9 downto 0);
signal my_top_arr_ypos : std_logic_vector(9 downto 0);
signal my_right_arr_ypos : std_logic_vector(9 downto 0);
signal my_down_arr_ypos : std_logic_vector(9 downto 0);

constant fallspeed: integer := 2;
constant bottom_edge: integer := 480;

signal interval : unsigned(10 downto 0) := (others => '0');
signal seed : unsigned(13 downto 0) := to_unsigned(5234, 14);

begin
	process (arrows_clk) begin
        if rising_edge(arrows_clk) then
            
            -- temp1 = seed xor (seed shr 1)
            -- temp2 = temp1 xor (temp1 shl 1)
            -- next = temp2 xor (temp1 shl 2)
            -- next mod 4
            interval <= interval + 1;
            if interval = 0 then 
                my_arrows_spawned(to_integer(((((seed xor (seed srl 1)) xor ((seed xor (seed srl 1)) sll 1)) xor ((seed xor (seed srl 1)) sll 2)) mod 4))) <= '1';
                seed <= (((seed xor (seed srl 1)) xor ((seed xor (seed srl 1)) sll 1)) xor ((seed xor (seed srl 1)) sll 2));
            end if;
            
            counter <= counter + 1;
			if counter = 0 then -- Counter just rolled over
                if my_arrows_spawned(3) = '1' then -- left arrow move down 
                    my_left_arr_ypos <= std_logic_vector(unsigned(my_left_arr_ypos) + fallspeed);
                    if unsigned(my_left_arr_ypos) + fallspeed = bottom_edge then
                        my_arrows_spawned(3) <= '0';
                        my_left_arr_ypos <= (others => '0');
                    end if;
                end if;
                if my_arrows_spawned(2) = '1' then -- top arrow move down 
                    my_top_arr_ypos <= std_logic_vector(unsigned(my_top_arr_ypos) + fallspeed);
                    if unsigned(my_top_arr_ypos) + fallspeed = bottom_edge then
                        my_arrows_spawned(2) <= '0';
                        my_top_arr_ypos <= (others => '0');-- 220
                    end if;
                end if;
                if my_arrows_spawned(1) = '1' then -- right arrow move down 
                    my_right_arr_ypos <= std_logic_vector(unsigned(my_right_arr_ypos) + fallspeed);
                    if unsigned(my_right_arr_ypos) + fallspeed = bottom_edge then
                        my_arrows_spawned(1) <= '0';
                        my_right_arr_ypos <= (others => '0');-- 340
                    end if;
                end if;
                if my_arrows_spawned(0) = '1' then -- down arrow move down 
                    my_down_arr_ypos <= std_logic_vector(unsigned(my_down_arr_ypos) + fallspeed);
                    if unsigned(my_down_arr_ypos) + fallspeed = bottom_edge then
                        my_arrows_spawned(0) <= '0';
                        my_down_arr_ypos <= (others => '0');--460
                    end if;
                end if;
            end if;
		end if;
	end process;

    arrows_spawned <= my_arrows_spawned;
    left_arr_ypos <= my_left_arr_ypos;
    top_arr_ypos <= my_top_arr_ypos;
    right_arr_ypos <= my_right_arr_ypos;
    down_arr_ypos <= my_down_arr_ypos;
end;




-- -- this spawns the arrows, keeps track of and updates the position

-- library IEEE;
-- use IEEE.std_logic_1164.all;
-- use IEEE.numeric_std.all;

-- entity arrows is
-- 	port(
-- 		arrows_clk : in std_logic;
-- 		arrows_spawned : out std_logic_vector(3 downto 0);
-- 		left_arr_ypos : out std_logic_vector(9 downto 0);
-- 		top_arr_ypos : out std_logic_vector(9 downto 0);
-- 		right_arr_ypos : out std_logic_vector(9 downto 0);
-- 		down_arr_ypos : out std_logic_vector(9 downto 0)
-- 	);
-- end arrows;

-- architecture synth of arrows is
-- signal counter: std_logic_vector(18 downto 0) := (others => '0');

-- signal my_arrows_spawned : std_logic_vector(3 downto 0);
-- signal my_left_arr_ypos : std_logic_vector(9 downto 0);
-- signal my_top_arr_ypos : std_logic_vector(9 downto 0);
-- signal my_right_arr_ypos : std_logic_vector(9 downto 0);
-- signal my_down_arr_ypos : std_logic_vector(9 downto 0);

-- constant fallspeed: integer := 2;
-- constant bottom_edge: integer := 480;

-- signal interval : unsigned(10 downto 0) := (others => '0');
-- signal seed : unsigned(13 downto 0) := to_unsigned(5234, 14);

-- begin
-- 	process (arrows_clk) begin
--         if rising_edge(arrows_clk) then
-- 			counter <= std_logic_vector(unsigned(counter) + 1);
			
-- 			arrows_spawned <= my_arrows_spawned;
-- 			left_arr_ypos <= my_left_arr_ypos;
-- 			top_arr_ypos <= my_top_arr_ypos;
-- 			right_arr_ypos <= my_right_arr_ypos;
-- 			down_arr_ypos <= my_down_arr_ypos;

--             -- temp1 = seed xor (seed shr 1)
--             -- temp2 = temp1 xor (temp1 shl 1)
--             -- next = temp2 xor (temp1 shl 2)
--             -- next mod 4
--             interval <= interval + 1;
--             if interval = 0 then 
--                 my_arrows_spawned(to_integer(((((seed xor (seed srl 1)) xor ((seed xor (seed srl 1)) sll 1)) xor ((seed xor (seed srl 1)) sll 2)) mod 4))) <= '1';
--                 seed <= (((seed xor (seed srl 1)) xor ((seed xor (seed srl 1)) sll 1)) xor ((seed xor (seed srl 1)) sll 2));
--             end if;

-- 			if counter = "0000000000000000000" then -- Counter just rolled over
--                 if my_arrows_spawned(3) = '1' then -- left arrow move down 
--                     my_left_arr_ypos <= std_logic_vector(unsigned(my_left_arr_ypos) + fallspeed);
--                     if unsigned(my_left_arr_ypos) = bottom_edge then
--                         left_arr_ypos <= (others => '0');
--                         arrows_spawned(3) <= '0';
--                     else
--                         arrows_spawned(3) <= '1';
--                     end if;
--                     --arrows_spawned(3) <= '0' when unsigned(my_left_arr_ypos) = bottom_edge else '1';
--                 end if;
--                 if my_arrows_spawned(2) = '1' then -- top arrow move down 
--                     my_top_arr_ypos <= std_logic_vector(unsigned(my_top_arr_ypos) + fallspeed);
--                     if unsigned(my_left_arr_ypos) = bottom_edge then
--                         top_arr_ypos <= (others => '0');-- 220
--                         arrows_spawned(2) <= '0';
--                     else
--                         arrows_spawned(2) <= '1';
--                     end if;
--                     --my_arrows_spawned(2) <= '0' when unsigned(my_top_arr_ypos) = bottom_edge else '1';
--                 end if;
--                 if my_arrows_spawned(1) = '1' then -- right arrow move down 
--                     my_right_arr_ypos <= std_logic_vector(unsigned(my_right_arr_ypos) + fallspeed);
--                     if unsigned(my_left_arr_ypos) = bottom_edge then
--                         arrows_spawned(1) <= '0';
--                         right_arr_ypos <= (others => '0');-- 340
--                     else
--                         arrows_spawned(1) <= '1';
--                     end if;
--                     --my_arrows_spawned(1) <= '0' when unsigned(my_right_arr_ypos) = bottom_edge else '1';
--                 end if;
--                 if my_arrows_spawned(0) = '1' then -- down arrow move down 
--                     my_down_arr_ypos <= std_logic_vector(unsigned(my_down_arr_ypos) + fallspeed);
--                     if unsigned(my_left_arr_ypos) = bottom_edge then
--                         arrows_spawned(0) <= '0';
--                         down_arr_ypos <= (others => '0');--460
--                     else
--                         arrows_spawned(0) <= '1';
--                     end if;
--                     --my_arrows_spawned(0) <= '0' when unsigned(my_down_arr_ypos) = bottom_edge else '1';
--                 end if;
-- 			end if;
-- 		end if;
-- 	end process;
-- end;
