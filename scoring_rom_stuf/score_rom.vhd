library IEEE;
    use IEEE.std_logic_1164.all;
    use IEEE.numeric_std.all;

entity score_rom is 
    port(
    	outglobal_o : in std_logic;
        p1_score_digs : in unsigned(19 downto 0);
		p2_score_digs : in unsigned(19 downto 0);
        addr_x : in std_logic_vector(7 downto 0);
    	addr_y : in std_logic_vector(7 downto 0);
    	data : out std_logic_vector(5 downto 0) -- 6-bit words, RRGGBB
    );
    end;

architecture sim of score_rom is
    signal addr : std_logic_vector(15 downto 0);
    signal u_addr_x : unsigned(7 downto 0);
    signal u_addr_y : unsigned(7 downto 0);

    constant p1_player_xpos: integer := 16;
    constant p1_num_xpos:    integer := 36;
    constant p1_score_xpos:  integer := 56;
    constant p1_dig1_xpos:   integer := 180;
    constant p1_dig2_xpos:   integer := 200;
    constant p1_dig3_xpos:   integer := 220;
    constant p1_dig4_xpos:   integer := 240;
    constant p1_dig5_xpos:   integer := 260;

    constant top_scoreline: integer := 4;
    constant bot_scoreline: integer := 37; -- (non inclusive)

    constant p2_player_xpos: integer := 364;
    constant p2_num_xpos:    integer := 384;
    constant p2_score_xpos:  integer := 404;
    constant p2_dig1_xpos:   integer := 528;
    constant p2_dig2_xpos:   integer := 548;
    constant p2_dig3_xpos:   integer := 568;
    constant p2_dig4_xpos:   integer := 588;
    constant p2_dig5_xpos:   integer := 608;

    signal mapped_xpos: std_logic_vector(9 downto 0);
    signal mapped_ypos: std_logic_vector(9 downto 0);

    signal player_disp_out: std_logic_vector(5 downto 0);
    signal score_disp_out: std_logic_vector(5 downto 0);
    signal num0_disp_out: std_logic_vector(5 downto 0);
    signal num1_disp_out: std_logic_vector(5 downto 0);
    signal num2_disp_out: std_logic_vector(5 downto 0);
    signal num3_disp_out: std_logic_vector(5 downto 0);
    signal num4_disp_out: std_logic_vector(5 downto 0);
    signal num5_disp_out: std_logic_vector(5 downto 0);
    signal num6_disp_out: std_logic_vector(5 downto 0);
    signal num7_disp_out: std_logic_vector(5 downto 0);
    signal num8_disp_out: std_logic_vector(5 downto 0);
    signal num9_disp_out: std_logic_vector(5 downto 0);

    component player_disp is port(
    		outglobal_o : in std_logic;
    		addr_x : in std_logic_vector(7 downto 0);
    		addr_y : in std_logic_vector(7 downto 0);
    		data : out std_logic_vector(5 downto 0));
    end component;

    component score_disp is port(
    		outglobal_o : in std_logic;
    		addr_x : in std_logic_vector(7 downto 0);
    		addr_y : in std_logic_vector(7 downto 0);
    		data : out std_logic_vector(5 downto 0));
    end component;

    component num0_disp is port(
    		outglobal_o : in std_logic;
    		addr_x : in std_logic_vector(7 downto 0);
    		addr_y : in std_logic_vector(7 downto 0);
    		data : out std_logic_vector(5 downto 0));
    end component;

    component num1_disp is port(
    		outglobal_o : in std_logic;
    		addr_x : in std_logic_vector(7 downto 0);
    		addr_y : in std_logic_vector(7 downto 0);
    		data : out std_logic_vector(5 downto 0));
    end component;

    component num2_disp is port(
    		outglobal_o : in std_logic;
    		addr_x : in std_logic_vector(7 downto 0);
    		addr_y : in std_logic_vector(7 downto 0);
    		data : out std_logic_vector(5 downto 0));
    end component;

    component num3_disp is port(
    		outglobal_o : in std_logic;
    		addr_x : in std_logic_vector(7 downto 0);
    		addr_y : in std_logic_vector(7 downto 0);
    		data : out std_logic_vector(5 downto 0));
    end component;

    component num4_disp is port(
    		outglobal_o : in std_logic;
    		addr_x : in std_logic_vector(7 downto 0);
    		addr_y : in std_logic_vector(7 downto 0);
    		data : out std_logic_vector(5 downto 0));
    end component;

    component num5_disp is port(
    		outglobal_o : in std_logic;
    		addr_x : in std_logic_vector(7 downto 0);
    		addr_y : in std_logic_vector(7 downto 0);
    		data : out std_logic_vector(5 downto 0));
    end component;

    component num6_disp is port(
    		outglobal_o : in std_logic;
    		addr_x : in std_logic_vector(7 downto 0);
    		addr_y : in std_logic_vector(7 downto 0);
    		data : out std_logic_vector(5 downto 0));
    end component;

    component num7_disp is port(
    		outglobal_o : in std_logic;
    		addr_x : in std_logic_vector(7 downto 0);
    		addr_y : in std_logic_vector(7 downto 0);
    		data : out std_logic_vector(5 downto 0));
    end component;

    component num8_disp is port(
    		outglobal_o : in std_logic;
    		addr_x : in std_logic_vector(7 downto 0);
    		addr_y : in std_logic_vector(7 downto 0);
    		data : out std_logic_vector(5 downto 0));
    end component;

    component num9_disp is port(
    		outglobal_o : in std_logic;
    		addr_x : in std_logic_vector(7 downto 0);
    		addr_y : in std_logic_vector(7 downto 0);
    		data : out std_logic_vector(5 downto 0));
    end component;

begin

    player_disp_inst: player_disp port map(
		outglobal_o => outglobal_o, 
		addr_x => mapped_xpos(9 downto 2), 
		addr_y => mapped_ypos(9 downto 2), 
		data => player_disp_out);

    score_disp_inst: score_disp port map(
		outglobal_o => outglobal_o, 
		addr_x => mapped_xpos(9 downto 2), 
		addr_y => mapped_ypos(9 downto 2), 
		data => score_disp_out);

    num0_disp_inst: num0_disp port map(
		outglobal_o => outglobal_o, 
		addr_x => mapped_xpos(9 downto 2), 
		addr_y => mapped_ypos(9 downto 2), 
		data => num0_disp_out);

    num1_disp_inst: num1_disp port map(
		outglobal_o => outglobal_o, 
		addr_x => mapped_xpos(9 downto 2), 
		addr_y => mapped_ypos(9 downto 2), 
		data => num1_disp_out);

    num2_disp_inst: num2_disp port map(
		outglobal_o => outglobal_o, 
		addr_x => mapped_xpos(9 downto 2), 
		addr_y => mapped_ypos(9 downto 2), 
		data => num2_disp_out);

    num3_disp_inst: num3_disp port map(
		outglobal_o => outglobal_o, 
		addr_x => mapped_xpos(9 downto 2), 
		addr_y => mapped_ypos(9 downto 2), 
		data => num3_disp_out);

    num4_disp_inst: num4_disp port map(
		outglobal_o => outglobal_o, 
		addr_x => mapped_xpos(9 downto 2), 
		addr_y => mapped_ypos(9 downto 2), 
		data => num4_disp_out);

    num5_disp_inst: num5_disp port map(
		outglobal_o => outglobal_o, 
		addr_x => mapped_xpos(9 downto 2), 
		addr_y => mapped_ypos(9 downto 2), 
		data => num5_disp_out);

    num6_disp_inst: num6_disp port map(
		outglobal_o => outglobal_o, 
		addr_x => mapped_xpos(9 downto 2), 
		addr_y => mapped_ypos(9 downto 2), 
		data => num6_disp_out);

    num7_disp_inst: num7_disp port map(
		outglobal_o => outglobal_o, 
		addr_x => mapped_xpos(9 downto 2), 
		addr_y => mapped_ypos(9 downto 2), 
		data => num7_disp_out);

    num8_disp_inst: num8_disp port map(
		outglobal_o => outglobal_o, 
		addr_x => mapped_xpos(9 downto 2), 
		addr_y => mapped_ypos(9 downto 2), 
		data => num8_disp_out);

    num9_disp_inst: num9_disp port map(
		outglobal_o => outglobal_o, 
		addr_x => mapped_xpos(9 downto 2), 
		addr_y => mapped_ypos(9 downto 2), 
		data => num9_disp_out);

	process(outglobal_o) begin
		if rising_edge(outglobal_o) then
            u_addr_x <= unsigned(addr_x);
            u_addr_y <= unsigned(addr_y);
            mapped_ypos <= std_logic_vector(u_addr_y - 4);

			if (u_addr_x > top_scoreline and u_addr_x < bot_scoreline) then
                if (u_addr_x > p1_player_xpos and u_addr_x < p1_player_xpos + 4) then
                    mapped_xpos <= std_logic_vector(u_addr_x - p1_player_xpos);
                    data <= player_disp_out;
                elsif (u_addr_x > p1_num_xpos and u_addr_x < p1_num_xpos + 4) then
                    mapped_xpos <= std_logic_vector(u_addr_x - p1_num_xpos);
                    data <= num1_disp_out;
                elsif (u_addr_x > p1_score_xpos and u_addr_x < p1_score_xpos + 4) then
                    mapped_xpos <= std_logic_vector(u_addr_x - p1_score_xpos);
                    data <= num1_disp_out;
                
                elsif (u_addr_x > p1_dig1_xpos and u_addr_x < p1_dig1_xpos + 4) then
                    mapped_xpos <= std_logic_vector(u_addr_x - p1_dig1_xpos);
                    case p1_score_digs(19 downto 16) is
                        when "0000" => data <= num0_disp_out;
                        when "0001" => data <= num1_disp_out;
                        when "0010" => data <= num2_disp_out;
                        when "0011" => data <= num3_disp_out;
                        when "0100" => data <= num4_disp_out;
                        when "0101" => data <= num5_disp_out;
                        when "0110" => data <= num6_disp_out;
                        when "0111" => data <= num7_disp_out;
                        when "1000" => data <= num8_disp_out;
                        when "1001" => data <= num9_disp_out;
                        when others => data <= "000000";
                    end case;
                elsif (u_addr_x > p1_dig2_xpos and u_addr_x < p1_dig2_xpos + 4) then
                    mapped_xpos <= std_logic_vector(u_addr_x - p1_dig2_xpos);
                    case p1_score_digs(15 downto 12) is
                        when "0000" => data <= num0_disp_out;
                        when "0001" => data <= num1_disp_out;
                        when "0010" => data <= num2_disp_out;
                        when "0011" => data <= num3_disp_out;
                        when "0100" => data <= num4_disp_out;
                        when "0101" => data <= num5_disp_out;
                        when "0110" => data <= num6_disp_out;
                        when "0111" => data <= num7_disp_out;
                        when "1000" => data <= num8_disp_out;
                        when "1001" => data <= num9_disp_out;
                        when others => data <= "000000";
                    end case;
                elsif (u_addr_x > p1_dig3_xpos and u_addr_x < p1_dig3_xpos + 4) then
                    mapped_xpos <= std_logic_vector(u_addr_x - p1_dig3_xpos);
                    case p1_score_digs(11 downto 8) is
                        when "0000" => data <= num0_disp_out;
                        when "0001" => data <= num1_disp_out;
                        when "0010" => data <= num2_disp_out;
                        when "0011" => data <= num3_disp_out;
                        when "0100" => data <= num4_disp_out;
                        when "0101" => data <= num5_disp_out;
                        when "0110" => data <= num6_disp_out;
                        when "0111" => data <= num7_disp_out;
                        when "1000" => data <= num8_disp_out;
                        when "1001" => data <= num9_disp_out;
                        when others => data <= "000000";
                    end case;
                elsif (u_addr_x > p1_dig4_xpos and u_addr_x < p1_dig4_xpos + 4) then
                    mapped_xpos <= std_logic_vector(u_addr_x - p1_dig4_xpos);
                    case p1_score_digs(7 downto 4) is
                        when "0000" => data <= num0_disp_out;
                        when "0001" => data <= num1_disp_out;
                        when "0010" => data <= num2_disp_out;
                        when "0011" => data <= num3_disp_out;
                        when "0100" => data <= num4_disp_out;
                        when "0101" => data <= num5_disp_out;
                        when "0110" => data <= num6_disp_out;
                        when "0111" => data <= num7_disp_out;
                        when "1000" => data <= num8_disp_out;
                        when "1001" => data <= num9_disp_out;
                        when others => data <= "000000";
                    end case;
                elsif (u_addr_x > p1_dig5_xpos and u_addr_x < p1_dig5_xpos + 4) then
                    mapped_xpos <= std_logic_vector(u_addr_x - p1_dig5_xpos);
                    case p1_score_digs(3 downto 0) is
                        when "0000" => data <= num0_disp_out;
                        when "0001" => data <= num1_disp_out;
                        when "0010" => data <= num2_disp_out;
                        when "0011" => data <= num3_disp_out;
                        when "0100" => data <= num4_disp_out;
                        when "0101" => data <= num5_disp_out;
                        when "0110" => data <= num6_disp_out;
                        when "0111" => data <= num7_disp_out;
                        when "1000" => data <= num8_disp_out;
                        when "1001" => data <= num9_disp_out;
                        when others => data <= "000000";
                    end case;
                -- -- player 2
                elsif (u_addr_x > p2_player_xpos and u_addr_x < p2_player_xpos + 4) then
                    mapped_xpos <= std_logic_vector(u_addr_x - p2_player_xpos);
                    data <= player_disp_out;
                elsif (u_addr_x > p2_num_xpos and u_addr_x < p2_num_xpos + 4) then
                    mapped_xpos <= std_logic_vector(u_addr_x - p2_num_xpos);
                    data <= num1_disp_out;
                elsif (u_addr_x > p2_score_xpos and u_addr_x < p2_score_xpos + 4) then
                    mapped_xpos <= std_logic_vector(u_addr_x - p2_score_xpos);
                    data <= num1_disp_out;
                
                elsif (u_addr_x > p2_dig1_xpos and u_addr_x < p2_dig1_xpos + 4) then
                    mapped_xpos <= std_logic_vector(u_addr_x - p2_dig1_xpos);
                    case p2_score_digs(19 downto 16) is
                        when "0000" => data <= num0_disp_out;
                        when "0001" => data <= num1_disp_out;
                        when "0010" => data <= num2_disp_out;
                        when "0011" => data <= num3_disp_out;
                        when "0100" => data <= num4_disp_out;
                        when "0101" => data <= num5_disp_out;
                        when "0110" => data <= num6_disp_out;
                        when "0111" => data <= num7_disp_out;
                        when "1000" => data <= num8_disp_out;
                        when "1001" => data <= num9_disp_out;
                        when others => data <= "000000";
                    end case;
                elsif (u_addr_x > p2_dig2_xpos and u_addr_x < p2_dig2_xpos + 4) then
                    mapped_xpos <= std_logic_vector(u_addr_x - p2_dig2_xpos);
                    case p2_score_digs(15 downto 12) is
                        when "0000" => data <= num0_disp_out;
                        when "0001" => data <= num1_disp_out;
                        when "0010" => data <= num2_disp_out;
                        when "0011" => data <= num3_disp_out;
                        when "0100" => data <= num4_disp_out;
                        when "0101" => data <= num5_disp_out;
                        when "0110" => data <= num6_disp_out;
                        when "0111" => data <= num7_disp_out;
                        when "1000" => data <= num8_disp_out;
                        when "1001" => data <= num9_disp_out;
                        when others => data <= "000000";
                    end case;
                elsif (u_addr_x > p2_dig3_xpos and u_addr_x < p2_dig3_xpos + 4) then
                    mapped_xpos <= std_logic_vector(u_addr_x - p2_dig3_xpos);
                    case p2_score_digs(11 downto 8) is
                        when "0000" => data <= num0_disp_out;
                        when "0001" => data <= num1_disp_out;
                        when "0010" => data <= num2_disp_out;
                        when "0011" => data <= num3_disp_out;
                        when "0100" => data <= num4_disp_out;
                        when "0101" => data <= num5_disp_out;
                        when "0110" => data <= num6_disp_out;
                        when "0111" => data <= num7_disp_out;
                        when "1000" => data <= num8_disp_out;
                        when "1001" => data <= num9_disp_out;
                        when others => data <= "000000";
                    end case;
                elsif (u_addr_x > p2_dig4_xpos and u_addr_x < p2_dig4_xpos + 4) then
                    mapped_xpos <= std_logic_vector(u_addr_x - p2_dig4_xpos);
                    case p2_score_digs(7 downto 4) is
                        when "0000" => data <= num0_disp_out;
                        when "0001" => data <= num1_disp_out;
                        when "0010" => data <= num2_disp_out;
                        when "0011" => data <= num3_disp_out;
                        when "0100" => data <= num4_disp_out;
                        when "0101" => data <= num5_disp_out;
                        when "0110" => data <= num6_disp_out;
                        when "0111" => data <= num7_disp_out;
                        when "1000" => data <= num8_disp_out;
                        when "1001" => data <= num9_disp_out;
                        when others => data <= "000000";
                    end case;
                elsif (u_addr_x > p2_dig5_xpos and u_addr_x < p2_dig5_xpos + 4) then
                    mapped_xpos <= std_logic_vector(u_addr_x - p2_dig5_xpos);
                    case p2_score_digs(3 downto 0) is
                        when "0000" => data <= num0_disp_out;
                        when "0001" => data <= num1_disp_out;
                        when "0010" => data <= num2_disp_out;
                        when "0011" => data <= num3_disp_out;
                        when "0100" => data <= num4_disp_out;
                        when "0101" => data <= num5_disp_out;
                        when "0110" => data <= num6_disp_out;
                        when "0111" => data <= num7_disp_out;
                        when "1000" => data <= num8_disp_out;
                        when "1001" => data <= num9_disp_out;
                        when others => data <= "010001";
                    end case;
                else data <= "010001"
                end if;
            else data <= "010001";
            end if;
        end if; 
    end process; 
end;