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
signal leftarr_data: std_logic_vector(5 downto 0);
signal downarr_data: std_logic_vector(5 downto 0);
signal rightarr_data: std_logic_vector(5 downto 0);
signal uparr_data: std_logic_vector(5 downto 0);
signal rom_top_out: std_logic_vector(5 downto 0);
signal rom_left_out: std_logic_vector(5 downto 0);
signal rom_right_out: std_logic_vector(5 downto 0);
signal rom_down_out: std_logic_vector(5 downto 0);
signal score_data: std_logic_vector(5 downto 0);

signal draw_leftx: std_logic_vector(9 downto 0);
signal draw_upx: std_logic_vector(9 downto 0);
signal draw_rightx: std_logic_vector(9 downto 0);
signal draw_downx: std_logic_vector(9 downto 0);
signal draw_upy: std_logic_vector(9 downto 0);
signal draw_lefty: std_logic_vector(9 downto 0);
signal draw_righty: std_logic_vector(9 downto 0);
signal draw_downy: std_logic_vector(9 downto 0);

signal drawtopx: std_logic_vector(9 downto 0);
signal drawleftx: std_logic_vector(9 downto 0);
signal drawrightx: std_logic_vector(9 downto 0);
signal drawdownx: std_logic_vector(9 downto 0);
signal drawtopy: std_logic_vector(9 downto 0);
signal drawlefty: std_logic_vector(9 downto 0);
signal drawrighty: std_logic_vector(9 downto 0);
signal drawdowny: std_logic_vector(9 downto 0);

constant left_arr_xpos      : integer := 100;
constant top_arr_xpos        : integer := 220; 
constant right_arr_xpos   : integer := 340; 
constant down_arr_xpos   : integer := 460;

constant out_ypos : integer := 420;

constant score_y1_pos: integer := 4;
constant score_y2_pos: integer := 480;

constant H_SYNC_START   : integer := 656; 

component arrow_rom is 
   port(
		outglobal_o : in std_logic;
		addr_x : in std_logic_vector(4 downto 0);
		addr_y : in std_logic_vector(4 downto 0);
		data : out std_logic_vector(5 downto 0)
		);
	end component;
	
component outline_rom is 
   port(
		outglobal_o : in std_logic;
		addr_x : in std_logic_vector(4 downto 0);
		addr_y : in std_logic_vector(4 downto 0);
		data : out std_logic_vector(5 downto 0)
		);
	end component;
	
component rom is
	port(
			outglobal_o : in std_logic;
			addr_x : in std_logic_vector(6 downto 0);
			addr_y : in std_logic_vector(6 downto 0);
			data : out std_logic_vector(5 downto 0) 
       	);
       end component;

component endscreen is
	port(
			outglobal_o : in std_logic;
			addr_x : in std_logic_vector(6 downto 0);
			addr_y : in std_logic_vector(6 downto 0);
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
		addr_x => pixel_x(9 downto 3), 
		addr_y => pixel_y(9 downto 3), 
		data => rom_data);
		
		myend: endscreen port map(
		outglobal_o => outglobal_o, 
		addr_x => pixel_x(9 downto 3), 
		addr_y => pixel_y(9 downto 3), 
		data => end_screen);

		leftarr_inst: arrow_rom port map(
		outglobal_o => outglobal_o, 
		addr_x => draw_leftx(6 downto 2), 
		addr_y => draw_lefty(6 downto 2), 
		data => leftarr_data);

		uparr_inst: arrow_rom port map(
		outglobal_o => outglobal_o, 
		addr_x => draw_upx(6 downto 2), 
		addr_y => draw_upy(6 downto 2), 
		data => uparr_data);

		rightarr_inst: arrow_rom port map(
		outglobal_o => outglobal_o, 
		addr_x => draw_rightx(6 downto 2), 
		addr_y => draw_righty(6 downto 2), 
		data => rightarr_data);

		downarr_inst: arrow_rom port map(
		outglobal_o => outglobal_o, 
		addr_x => draw_downx(6 downto 2), 
		addr_y => draw_downy(6 downto 2), 
		data => downarr_data);
		
		mytopout: outline_rom port map(
		outglobal_o => outglobal_o, 
		addr_x => drawtopx(6 downto 2),
		addr_y => drawtopy(6 downto 2),
		data => rom_top_out);

		mydownout: outline_rom port map(
		outglobal_o => outglobal_o, 
		addr_x => drawdownx(6 downto 2), 
		addr_y => drawdowny(6 downto 2), 
		data => rom_down_out);

		myrightout: outline_rom port map(
		outglobal_o => outglobal_o, 
		addr_x => drawrightx(6 downto 2), 
		addr_y => drawrighty(6 downto 2), 
		data => rom_right_out);

		myleftout: outline_rom port map(
		outglobal_o => outglobal_o, 
		addr_x => drawleftx(6 downto 2), 
		addr_y => drawlefty(6 downto 2), 
		data => rom_left_out);
		
		myscore: score_rom port map(
    	outglobal_o => outglobal_o,
        p1_score_digs => p1_score_digs,
		p2_score_digs => p2_score_digs,
        addr_x => pixel_x, 
		addr_y => pixel_y,
    	data => score_data);
	
	draw_leftx <= std_logic_vector(unsigned(pixel_x) - left_arr_xpos);
	draw_lefty <= std_logic_vector(unsigned(pixel_y) - unsigned(left_arr_ypos));
	draw_upx <= std_logic_vector(unsigned(pixel_y) - unsigned(top_arr_ypos));
	draw_upy <= std_logic_vector(unsigned(pixel_x) - top_arr_xpos);
	draw_rightx <= std_logic_vector(60 - (unsigned(pixel_x) - right_arr_xpos));
	draw_righty <= std_logic_vector(unsigned(pixel_y) - unsigned(right_arr_ypos));
	draw_downx <= std_logic_vector(60 - (unsigned(pixel_y) - unsigned(down_arr_ypos)));
	draw_downy <= std_logic_vector(unsigned(pixel_x) - down_arr_xpos);
	
	drawtopx <= std_logic_vector(unsigned(pixel_y) - out_ypos);
	drawtopy <= std_logic_vector(unsigned(pixel_x) - top_arr_xpos);
	drawleftx <= std_logic_vector(unsigned(pixel_x) - left_arr_xpos);
	drawlefty <= std_logic_vector(unsigned(pixel_y) - out_ypos);
	drawrightx <= std_logic_vector(60 - (unsigned(pixel_x) - right_arr_xpos));
	drawrighty <= std_logic_vector(unsigned(pixel_y) - out_ypos);
	drawdownx <= std_logic_vector(60 - (unsigned(pixel_y) - out_ypos));
	drawdowny <= std_logic_vector(unsigned(pixel_x) - down_arr_xpos);
	
	process(valid, pixel_x, pixel_y, outglobal_o) begin
	if rising_edge(outglobal_o) then
		if valid = '1' then
			if flag = "00" then
				rgb <= rom_data;
			elsif flag = "01" then
				if to_integer(unsigned(pixel_x)) > top_arr_xpos - 1 and to_integer(unsigned(pixel_x)) < top_arr_xpos + 60 
								and to_integer(unsigned(pixel_y)) > out_ypos - 1 and to_integer(unsigned(pixel_y)) < out_ypos + 60 
								and not(rom_top_out = "000001") then
					rgb <= rom_top_out;  
				elsif to_integer(unsigned(pixel_x)) > left_arr_xpos - 1 and to_integer(unsigned(pixel_x)) < left_arr_xpos + 60 
								and to_integer(unsigned(pixel_y)) > out_ypos - 1 and to_integer(unsigned(pixel_y)) < out_ypos + 60
								and not(rom_left_out = "000001") then
					rgb <= rom_left_out;
				elsif to_integer(unsigned(pixel_x)) > down_arr_xpos - 1 and to_integer(unsigned(pixel_x)) < down_arr_xpos + 60 
								and to_integer(unsigned(pixel_y)) > out_ypos - 1 and to_integer(unsigned(pixel_y)) < out_ypos + 60 
								and not(rom_down_out = "000001") then
					rgb <= rom_down_out;
				elsif to_integer(unsigned(pixel_x)) > right_arr_xpos - 1 and to_integer(unsigned(pixel_x)) < right_arr_xpos + 60 
								and to_integer(unsigned(pixel_y)) > out_ypos - 1 and to_integer(unsigned(pixel_y)) < out_ypos + 60
								and not(rom_right_out = "000001") then
					rgb <= rom_right_out;
				elsif to_integer(unsigned(pixel_x)) > left_arr_xpos - 1 and to_integer(unsigned(pixel_x)) < left_arr_xpos + 60 
								and to_integer(unsigned(pixel_y)) > to_integer(unsigned(left_arr_ypos)) - 1 
								and to_integer(unsigned(pixel_y)) < to_integer(unsigned(left_arr_ypos)) + 60 
								and arrows_spawned(0) = '1' and not(leftarr_data = "000001") then
					rgb <= leftarr_data;  
				elsif to_integer(unsigned(pixel_x)) > top_arr_xpos - 1 and to_integer(unsigned(pixel_x)) < top_arr_xpos + 60 
								and to_integer(unsigned(pixel_y)) > to_integer(unsigned(top_arr_ypos)) - 1 
								and to_integer(unsigned(pixel_y)) < to_integer(unsigned(top_arr_ypos)) + 60 
								and arrows_spawned(1) = '1' and not(uparr_data = "000001") then
					rgb <= uparr_data;
				elsif to_integer(unsigned(pixel_x)) > right_arr_xpos - 1 and to_integer(unsigned(pixel_x)) < right_arr_xpos + 60 
								and to_integer(unsigned(pixel_y)) > to_integer(unsigned(right_arr_ypos)) - 1 
								and to_integer(unsigned(pixel_y)) < to_integer(unsigned(right_arr_ypos)) + 60 
								and arrows_spawned(2) = '1' and not(rightarr_data = "000001") then
					rgb <= rightarr_data;
				elsif to_integer(unsigned(pixel_x)) > down_arr_xpos - 1 and to_integer(unsigned(pixel_x)) < down_arr_xpos + 60 
								and to_integer(unsigned(pixel_y)) > to_integer(unsigned(down_arr_ypos)) - 1 
								and to_integer(unsigned(pixel_y)) < to_integer(unsigned(down_arr_ypos)) + 60 
								and arrows_spawned(3) = '1' and not(downarr_data = "000001") then
					rgb <= downarr_data;
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
