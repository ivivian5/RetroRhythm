library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity scoring is
	port(
		score_clk : in std_logic;
		
		p1_keyhit : in std_logic_vector(3 downto 0);
		p2_keyhit : in std_logic_vector(3 downto 0);
		
		arrows_spawned : in std_logic_vector(3 downto 0);
		left_arr_ypos : in std_logic_vector(9 downto 0);
		top_arr_ypos : in std_logic_vector(9 downto 0);
		right_arr_ypos : in std_logic_vector(9 downto 0);
		down_arr_ypos : in std_logic_vector(9 downto 0);
		
		p1_score : out std_logic_vector(9 downto 0);
		p2_score : out std_logic_vector(9 downto 0)
	);
end scoring;

architecture synth of scoring is
	signal score1 : std_logic_vector(9 downto 0);
	signal score2 : std_logic_vector(9 downto 0);
	constant top_hitbox : integer := 380;
	constant bot_hitbox : integer := 460;
	
begin
	process (score_clk) begin
        if rising_edge(score_clk) then
			score1 <= std_logic_vector(unsigned(score1) + 1) 
						when (arrows_spawned(3) = '1' and p1_keyhit(3) = '1' and 
								left_arr_ypos > top_hitbox and left_arr_ypos < bot_hitbox)
						or (arrows_spawned(2) = '1' and p1_keyhit(2) = '1' and 
								top_arr_ypos > top_hitbox and top_arr_ypos < bot_hitbox)
						or (arrows_spawned(1) = '1' and p1_keyhit(1) = '1' and 
								right_arr_ypos > top_hitbox and right_arr_ypos < bot_hitbox)
						or (arrows_spawned(0) = '1' and p1_keyhit(0) = '1' and 
								down_arr_ypos > top_hitbox and down_arr_ypos < bot_hitbox)
			score2 <= std_logic_vector(unsigned(score2) + 1) 
						when (arrows_spawned(3) = '1' and p2_keyhit(3) = '1' and 
								left_arr_ypos > top_hitbox and left_arr_ypos < bot_hitbox)
						or (arrows_spawned(2) = '1' and p2_keyhit(2) = '1' and 
								top_arr_ypos > top_hitbox and top_arr_ypos < bot_hitbox)
						or (arrows_spawned(1) = '1' and p2_keyhit(1) = '1' and 
								right_arr_ypos > top_hitbox and right_arr_ypos < bot_hitbox)
						or (arrows_spawned(0) = '1' and p2_keyhit(0) = '1' and 
								down_arr_ypos > top_hitbox and down_arr_ypos < bot_hitbox)
			p1_score <= score1;
			p2_score <= score2;
		end if;
	end process;
end;
