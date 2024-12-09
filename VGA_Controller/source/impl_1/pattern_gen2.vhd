library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pattern_gen is
    port(
		p1_score_digs: unsigned(19 downto 0);
		p2_score_digs: unsigned(19 downto 0); 
		flag: in std_logic_vector(1 downto 0);
		outglobal_o: in std_logic;
        pixel_x: in std_logic_vector(9 downto 0);  
        pixel_y: in std_logic_vector(9 downto 0);
		
		arrows_spawned: in std_logic_vector(3 downto 0);
		left_arr_ypos: in std_logic_vector(9 downto 0);
		right_arr_ypos: in std_logic_vector(9 downto 0);
		top_arr_ypos: in std_logic_vector(9 downto 0);
		down_arr_ypos: in std_logic_vector(9 downto 0);
		
        valid: in std_logic;  
        rgb: out std_logic_vector(5 downto 0)  
    );
end pattern_gen;

architecture synth of pattern_gen is
signal rom_data: std_logic_vector(5 downto 0);
signal end_screen: std_logic_vector(5 downto 0);
signal rom_arrow_1: std_logic_vector(5 downto 0);
signal rom_arrow_2: std_logic_vector(5 downto 0);
signal rom_arrow_3: std_logic_vector(5 downto 0);
signal rom_arrow_4: std_logic_vector(5 downto 0);
signal rom_top_out: std_logic_vector(5 downto 0);
signal rom_left_out: std_logic_vector(5 downto 0);
signal rom_right_out: std_logic_vector(5 downto 0);
signal rom_down_out: std_logic_vector(5 downto 0);
signal score_data: std_logic_vector(5 downto 0);

signal drawa1x: std_logic_vector(9 downto 0);
signal drawa2x: std_logic_vector(9 downto 0);
signal drawa3x: std_logic_vector(9 downto 0);
signal drawa4x: std_logic_vector(9 downto 0);
signal drawa1y: std_logic_vector(9 downto 0);
signal drawa2y: std_logic_vector(9 downto 0);
signal drawa3y: std_logic_vector(9 downto 0);
signal drawa4y: std_logic_vector(9 downto 0);

signal drawtopx: std_logic_vector(9 downto 0);
signal drawleftx: std_logic_vector(9 downto 0);
signal drawrightx: std_logic_vector(9 downto 0);
signal drawdownx: std_logic_vector(9 downto 0);
signal drawtopy: std_logic_vector(9 downto 0);
signal drawlefty: std_logic_vector(9 downto 0);
signal drawrighty: std_logic_vector(9 downto 0);
signal drawdowny: std_logic_vector(9 downto 0);

constant left_arr_xpos      : integer := 100;
constant right_arr_xpos        : integer := 220; 
constant top_arr_xpos   : integer := 340; 
constant down_arr_xpos   : integer := 460;

constant top_out_xpos : integer := 340;
constant left_out_xpos : integer := 100;
constant right_out_xpos : integer := 220;
constant down_out_xpos : integer := 460;

constant top_out_ypos : integer := 420;
constant left_out_ypos : integer := 420;
constant right_out_ypos : integer := 420;
constant down_out_ypos : integer := 420;

constant score_y1_pos: integer := 4;
constant score_y2_pos: integer := 480;

constant H_SYNC_START   : integer := 656; 

component arrow1 is 
   port(
		outglobal_o : in std_logic;
		addr_x : in std_logic_vector(7 downto 0);
		addr_y : in std_logic_vector(7 downto 0);
		data : out std_logic_vector(5 downto 0)
		);
	end component;
	
	component arrow2 is 
   port(
		outglobal_o : in std_logic;
		addr_x : in std_logic_vector(7 downto 0);
		addr_y : in std_logic_vector(7 downto 0);
		data : out std_logic_vector(5 downto 0)
		);
	end component;
	
	component arrow3 is 
   port(
		outglobal_o : in std_logic;
		addr_x : in std_logic_vector(7 downto 0);
		addr_y : in std_logic_vector(7 downto 0);
		data : out std_logic_vector(5 downto 0)
		);
	end component;
	
	component arrow4 is 
   port(
		outglobal_o : in std_logic;
		addr_x : in std_logic_vector(7 downto 0);
		addr_y : in std_logic_vector(7 downto 0);
		data : out std_logic_vector(5 downto 0)
		);
	end component;
	
component rom is
	port(
			outglobal_o : in std_logic;
			addr_x : in std_logic_vector(7 downto 0);
			addr_y : in std_logic_vector(7 downto 0);
			data : out std_logic_vector(5 downto 0) 
       	);
       end component;

component endscreen is
	port(
			outglobal_o : in std_logic;
			addr_x : in std_logic_vector(7 downto 0);
			addr_y : in std_logic_vector(7 downto 0);
			data : out std_logic_vector(5 downto 0) 
       	);
       end component;

	component top_outline is 
   port(
		outglobal_o : in std_logic;
		addr_x : in std_logic_vector(7 downto 0);
		addr_y : in std_logic_vector(7 downto 0);
		data : out std_logic_vector(5 downto 0)
		);
	end component;
	
	component left_outline is 
   port(
		outglobal_o : in std_logic;
		addr_x : in std_logic_vector(7 downto 0);
		addr_y : in std_logic_vector(7 downto 0);
		data : out std_logic_vector(5 downto 0)
		);
	end component;
	
	component right_outline is 
   port(
		outglobal_o : in std_logic;
		addr_x : in std_logic_vector(7 downto 0);
		addr_y : in std_logic_vector(7 downto 0);
		data : out std_logic_vector(5 downto 0)
		);
	end component;
	
	component down_outline is 
   port(
		outglobal_o : in std_logic;
		addr_x : in std_logic_vector(7 downto 0);
		addr_y : in std_logic_vector(7 downto 0);
		data : out std_logic_vector(5 downto 0)
		);
	end component;
	
	component score_rom is 
    port(
    	outglobal_o : in std_logic;
        p1_score_digs : in unsigned(19 downto 0);
		p2_score_digs : in unsigned(19 downto 0);
        addr_x : in std_logic_vector(9 downto 0);
    	addr_y : in std_logic_vector(9 downto 0);
    	data : out std_logic_vector(5 downto 0) -- 6-bit words, RRGGBB
    );
    end component;
begin
		myrom: rom port map(
		outglobal_o => outglobal_o, 
		addr_x => pixel_x(9 downto 2), 
		addr_y => pixel_y(9 downto 2), 
		data => rom_data);
		
		myend: endscreen port map(
		outglobal_o => outglobal_o, 
		addr_x => pixel_x(9 downto 2), 
		addr_y => pixel_y(9 downto 2), 
		data => end_screen);

		myarrow1: arrow1 port map(
		outglobal_o => outglobal_o, 
		addr_x => drawa1x(9 downto 2), 
		addr_y => drawa1y(9 downto 2), 
		data => rom_arrow_1);

		myarrow2: arrow2 port map(
		outglobal_o => outglobal_o, 
		addr_x => drawa2x(9 downto 2), 
		addr_y => drawa2y(9 downto 2), 
		data => rom_arrow_2);

		myarrow3: arrow3 port map(
		outglobal_o => outglobal_o, 
		addr_x => drawa3x(9 downto 2), 
		addr_y => drawa3y(9 downto 2), 
		data => rom_arrow_3);

		myarrow4: arrow4 port map(
		outglobal_o => outglobal_o, 
		addr_x => drawa4x(9 downto 2), 
		addr_y => drawa4y(9 downto 2), 
		data => rom_arrow_4);
		
		mytopout: top_outline port map(
		outglobal_o => outglobal_o, 
		addr_x => drawtopx(9 downto 2), 
		addr_y => drawtopy(9 downto 2), 
		data => rom_top_out);

		mydownout: down_outline port map(
		outglobal_o => outglobal_o, 
		addr_x => drawdownx(9 downto 2), 
		addr_y => drawdowny(9 downto 2), 
		data => rom_down_out);

		myrightout: right_outline port map(
		outglobal_o => outglobal_o, 
		addr_x => drawrightx(9 downto 2), 
		addr_y => drawrighty(9 downto 2), 
		data => rom_right_out);

		myleftout: left_outline port map(
		outglobal_o => outglobal_o, 
		addr_x => drawleftx(9 downto 2), 
		addr_y => drawlefty(9 downto 2), 
		data => rom_left_out);
		
		myscore: score_rom port map(
    	outglobal_o => outglobal_o,
        p1_score_digs => p1_score_digs,
		p2_score_digs => p2_score_digs,
        addr_x => pixel_x, 
		addr_y => pixel_y,
    	data => score_data);
	
	drawa1x <= std_logic_vector(unsigned(pixel_x) - left_arr_xpos);
	drawa1y <= std_logic_vector(unsigned(pixel_y) - unsigned(left_arr_ypos));
	drawa2x <= std_logic_vector(unsigned(pixel_x) - top_arr_xpos);
	drawa2y <= std_logic_vector(unsigned(pixel_y) - unsigned(top_arr_ypos));
	drawa3x <= std_logic_vector(unsigned(pixel_x) - right_arr_xpos);
	drawa3y <= std_logic_vector(unsigned(pixel_y) - unsigned(right_arr_ypos));
	drawa4x <= std_logic_vector(unsigned(pixel_x) - down_arr_xpos);
	drawa4y <= std_logic_vector(unsigned(pixel_y) - unsigned(down_arr_ypos));
	
	drawtopx <= std_logic_vector(unsigned(pixel_x) - top_out_xpos);
	drawtopy <= std_logic_vector(unsigned(pixel_y) - top_out_ypos);
	drawleftx <= std_logic_vector(unsigned(pixel_x) - left_out_xpos);
	drawlefty <= std_logic_vector(unsigned(pixel_y) - left_out_ypos);
	drawrightx <= std_logic_vector(unsigned(pixel_x) - right_out_xpos);
	drawrighty <= std_logic_vector(unsigned(pixel_y) - right_out_ypos);
	drawdownx <= std_logic_vector(unsigned(pixel_x) - down_out_xpos);
	drawdowny <= std_logic_vector(unsigned(pixel_y) - down_out_ypos);
	
	process(valid, pixel_x, pixel_y, outglobal_o) begin
	if rising_edge(outglobal_o) then
		if valid = '1' then
			if flag = "00" then
				rgb <= rom_data;
			elsif flag = "01" then
				if to_integer(unsigned(pixel_x)) > left_arr_xpos - 1 and to_integer(unsigned(pixel_x)) < left_arr_xpos + 60 and to_integer(unsigned(pixel_y)) > to_integer(unsigned(left_arr_ypos)) - 1 and to_integer(unsigned(pixel_y)) < to_integer(unsigned(left_arr_ypos)) + 60 and arrows_spawned(0) = '1' then
					rgb <= rom_arrow_1;  
				elsif to_integer(unsigned(pixel_x)) > top_arr_xpos - 1 and to_integer(unsigned(pixel_x)) < top_arr_xpos + 60 and to_integer(unsigned(pixel_y)) > to_integer(unsigned(top_arr_ypos)) - 1 and to_integer(unsigned(pixel_y)) < to_integer(unsigned(top_arr_ypos)) + 60 and arrows_spawned(1) = '1' then
					rgb <= rom_arrow_2;
				elsif to_integer(unsigned(pixel_x)) > right_arr_xpos - 1 and to_integer(unsigned(pixel_x)) < right_arr_xpos + 60 and to_integer(unsigned(pixel_y)) > to_integer(unsigned(right_arr_ypos)) - 1 and to_integer(unsigned(pixel_y)) < to_integer(unsigned(right_arr_ypos)) + 60 and arrows_spawned(2) = '1' then
					rgb <= rom_arrow_3;
				elsif to_integer(unsigned(pixel_x)) > down_arr_xpos - 1 and to_integer(unsigned(pixel_x)) < down_arr_xpos + 60 and to_integer(unsigned(pixel_y)) > to_integer(unsigned(down_arr_ypos)) - 1 and to_integer(unsigned(pixel_y)) < to_integer(unsigned(down_arr_ypos)) + 60 and arrows_spawned(3) = '1'  then
					rgb <= rom_arrow_4;
				elsif to_integer(unsigned(pixel_x)) > top_out_xpos - 1 and to_integer(unsigned(pixel_x)) < top_out_xpos + 60 and to_integer(unsigned(pixel_y)) > top_out_ypos - 1 and to_integer(unsigned(pixel_y)) < top_out_ypos + 60 then
					rgb <= rom_top_out;  
				elsif to_integer(unsigned(pixel_x)) > left_out_xpos - 1 and to_integer(unsigned(pixel_x)) < left_out_xpos + 60 and to_integer(unsigned(pixel_y)) > left_out_ypos - 1 and to_integer(unsigned(pixel_y)) < left_out_ypos + 60 then
					rgb <= rom_left_out;
				elsif to_integer(unsigned(pixel_x)) > down_out_xpos - 1 and to_integer(unsigned(pixel_x)) < down_out_xpos + 60 and to_integer(unsigned(pixel_y)) > down_out_ypos - 1 and to_integer(unsigned(pixel_y)) < down_out_ypos + 60 then
					rgb <= rom_down_out;
				elsif to_integer(unsigned(pixel_x)) > right_out_xpos - 1 and to_integer(unsigned(pixel_x)) < right_out_xpos + 60 and to_integer(unsigned(pixel_y)) > right_out_ypos - 1 and to_integer(unsigned(pixel_y)) < right_out_ypos + 60 then
					rgb <= rom_right_out;
				elsif to_integer(unsigned(pixel_y)) > score_y1_pos - 1 and to_integer(unsigned(pixel_y)) < score_y2_pos + 1 then
					rgb <= score_data;
				else
					rgb <= "000000"; 
				end if;
			elsif flag = "10" then
				rgb <= end_screen;
			else
				rgb <= "000000";
			end if;
		else
		rgb <= "000000";
		end if;
	end if;
	end process;
end synth;
