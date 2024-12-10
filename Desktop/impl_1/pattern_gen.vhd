--library IEEE;
--use IEEE.std_logic_1164.all;
--use IEEE.numeric_std.all;

--entity pattern_gen is
    --port(
		--btn: in std_logic_vector(1 downto 0);
        --pixel_x: in std_logic_vector(9 downto 0);  
        --pixel_y: in std_logic_vector(9 downto 0);  
        --valid: in std_logic;  
        --rgb: out std_logic_vector(5 downto 0)  
    --);
--end pattern_gen;

--architecture synth of pattern_gen is

	--signal pix_x, pix_y: unsigned(9 downto 0);
	--signal refr_clk: std_logic;
	
 --x, y coordinates (0,0) to (639, 479)
	--constant MAX_X: integer := 640;
	--constant MAX_Y: integer := 480;

 --arrow
	--constant ARROW_SIZE: integer := 8;
	--signal arrow_x_l, arrow_x_r: unsigned(9 downto 0);
	--signal arrow_y_t, arrow_y_b: unsigned(9 downto 0);
	--signal arrow_x_reg, arrow_y_next: unsigned(9 downto 0);
	--signal arrow_y_reg, arrow_y_next: unsigned(9 downto 0);
	
	--signal x_d_reg, x_d_next: unsigned(9 downto 0);
	--signal y_d_reg, y_d_next: unsigned(9 downto 0);
	
	--constant arrow_v_p: unsigned(9 downto 0) := to_unsigned(2, 10)
	--constant arrow_v_n: unsigned(9 downto 0) := unsigned(to_signed(-2, 10));
	
	--type rom_type is array(0 to 7) of
		--std_logic_vector(0 to 7);
	--constant ARROW_ROM: rom_type:= (
	--"00111100",
	--"01111110",
	--"11111111",
	--"11111111",
	--"11111111",
	--"11111111",
	--"01111110",
	--"00111100");
	
	--signal rom_addr, rom_col: unsigned(2 downto 0);
	--signal rom_data: std_logic_vector(7 downto 0);
	--signal rom_bit: std_logic;
	
	--signal arrow_on: std_logic;
	--signal arrow_rgb: std_logic_vector(5 downto 0);
	
	--begin
		--pix_x <= unsigned(pixel_x);
		--pix_y <= unsigned(pixel_y);
		
		--arrow_on <= '1' when (ARROW_X_L <= pix_x) and 
				--(pix_x <= ARROW_X_R) and
				--(ARROW_Y_T <= pix_y) and
				--(pix_y <= ARROW_Y_B) else '0';
		--arrow_rgb <= "100000";	
		
    --process(valid, arrow_on, arrow_rgb)
    --begin
        --if valid = '0' then
			--rgb <= "000000";
		--else
			--if (arrow_on = '1') then
				--rgb <= arrow_rgb;
			--else
                --rgb <= "111111"; 
            --end if;
		--end if;
    --end process;
--end synth;
