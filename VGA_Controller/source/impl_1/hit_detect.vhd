
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity scoring is
	port(
		score_clk : in std_logic;
		reset : in std_logic;
		
		p1_keyhit : in std_logic_vector(3 downto 0);
		p2_keyhit : in std_logic_vector(3 downto 0);
		
		arrows_spawned : in std_logic_vector(3 downto 0);
		left_arr_ypos : in std_logic_vector(9 downto 0);
		top_arr_ypos : in std_logic_vector(9 downto 0);
		right_arr_ypos : in std_logic_vector(9 downto 0);
		down_arr_ypos : in std_logic_vector(9 downto 0);
		
		p1_score : out unsigned(19 downto 0);
		p2_score : out unsigned(19 downto 0)
	);
end scoring;

architecture synth of scoring is
	signal score1_1 : unsigned(3 downto 0) := (others => '0');
    signal score1_2 : unsigned(3 downto 0) := (others => '0');
    signal score1_3 : unsigned(3 downto 0) := (others => '0');
    signal score1_4 : unsigned(3 downto 0) := (others => '0');
    signal score1_5 : unsigned(3 downto 0) := (others => '0');
	signal score2_1 : unsigned(3 downto 0) := (others => '0');
    signal score2_2 : unsigned(3 downto 0) := (others => '0');
    signal score2_3 : unsigned(3 downto 0) := (others => '0');
    signal score2_4 : unsigned(3 downto 0) := (others => '0');
    signal score2_5 : unsigned(3 downto 0) := (others => '0');
	constant top_hitbox : integer := 380;
	constant bot_hitbox : integer := 460;
	
begin
	process (score_clk) begin
        if rising_edge(score_clk) then
		if reset = '1' then
			p1_score <= (others => '0');
			p2_score <= (others => '0');
			score1_1 <= (others => '0');
			score1_2 <= (others => '0');
			score1_3 <= (others => '0');
			score1_4 <= (others => '0');
			score1_5 <= (others => '0');
			score2_1 <= (others => '0');
			score2_2 <= (others => '0');
			score2_3 <= (others => '0');
			score2_4 <= (others => '0');
			score2_5 <= (others => '0');
		else
			if     (p1_keyhit(2) = '0' and 
				to_integer(unsigned(down_arr_ypos)) > top_hitbox and to_integer(unsigned(down_arr_ypos)) < bot_hitbox)
				or ( p1_keyhit(1) = '0' and 
				to_integer(unsigned(left_arr_ypos)) > top_hitbox and to_integer(unsigned(left_arr_ypos)) < bot_hitbox)
				or (p1_keyhit(3) = '0' and 
				to_integer(unsigned(top_arr_ypos)) > top_hitbox and to_integer(unsigned(top_arr_ypos)) < bot_hitbox)
				or ( p1_keyhit(0) = '0' and 
				to_integer(unsigned(right_arr_ypos)) > top_hitbox and to_integer(unsigned(right_arr_ypos)) < bot_hitbox)
				 then
			
                if (score1_2 = 10 and not (score1_1 = 10)) then
                    score1_1 <= score1_1 + 1;
				elsif (score1_1 = 10) then
					score1_1 <= "0000";
                end if;
                if (score1_3 = 10 and not (score1_2 = 10)) then
                    score1_2 <= score1_2 + 1;
				elsif (score1_2 = 10) then
					score1_2 <= "0000";
                end if;
                if (score1_4 = 10 and not (score1_3 = 10)) then
                    score1_3 <= score1_3 + 1;
				elsif (score1_3 = 10) then
					score1_3 <= "0000";
                end if;
                if (score1_5 = 10 and not (score1_4 = 10)) then
                    score1_4 <= score1_4 + 1;
				elsif (score1_4 = 10) then
					score1_4 <= "0000";
                end if;
                if score1_5 < 10 then
                    score1_5 <= score1_5 + 1;
                else 
                    score1_5 <= "0000";
                end if;
            end if;
		    if (arrows_spawned(3) = '1' and p2_keyhit(1) = '0' and 
								to_integer(unsigned(left_arr_ypos)) > top_hitbox and to_integer(unsigned(left_arr_ypos)) < bot_hitbox)
						or (arrows_spawned(3) = '1' and p2_keyhit(2) = '0' and 
								to_integer(unsigned(top_arr_ypos)) > top_hitbox and to_integer(unsigned(top_arr_ypos)) < bot_hitbox)
						or (arrows_spawned(0) = '1' and p2_keyhit(1) = '0' and 
								to_integer(unsigned(right_arr_ypos)) > top_hitbox and to_integer(unsigned(right_arr_ypos)) < bot_hitbox)
						or (arrows_spawned(2) = '1' and p2_keyhit(0) = '0' and 
								to_integer(unsigned(down_arr_ypos)) > top_hitbox and to_integer(unsigned(down_arr_ypos)) < bot_hitbox) then
			    if (score2_2 = 10 and not (score2_1 = 10)) then
                    score2_1 <= score2_1 + 1;
				elsif (score2_1 = 10) then
					score2_1 <= "0000";
                end if;
                if (score2_3 = 10 and not (score2_2 = 10)) then
                    score2_2 <= score2_2 + 1;
				elsif (score2_2 = 10) then
					score2_2 <= "0000";
                end if;
                if (score2_4 = 10 and not (score2_3 = 10)) then
                    score2_3 <= score2_3 + 1;
				elsif (score2_3 = 10) then
					score2_3 <= "0000";
                end if;
                if (score2_5 = 10 and not (score2_4 = 10)) then
                    score2_4 <= score2_4 + 1;
				elsif (score2_4 = 10) then
					score2_4 <= "0000";
                end if;
                if score2_5 < 10 then
                    score2_5 <= score2_5 + 1;
                else 
                    score2_5 <= "0000";
                end if;
		    end if;

			p1_score(19 downto 16) <= score1_1;
            p1_score(15 downto 12) <= score1_2;
            p1_score(11 downto 8) <=  score1_3;
            p1_score(7 downto 4) <=   score1_4;
            p1_score(3 downto 0) <=   score1_5;
            p2_score(19 downto 16) <= score2_1;
            p2_score(15 downto 12) <= score2_2;
            p2_score(11 downto 8) <=  score2_3;
            p2_score(7 downto 4) <=   score2_4;
            p2_score(3 downto 0) <=   score2_5;
		end if;
		end if;
	end process;
	
end;