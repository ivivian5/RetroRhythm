library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is
    port(
        ref_clk_i: in std_logic; 
        rgb: out std_logic_vector(5 downto 0); 
        HSYNC: out std_logic;     
        VSYNC: out std_logic;    
        pll: out std_logic;
        data1     : in std_logic;
        data2     : in std_logic;
        nesClk    : out std_logic;
        latch     : out std_logic		
    );
end top;


architecture synth of top is
    component mypll is
        port( 
            ref_clk_i: in std_logic; 
            rst_n_i: in std_logic; 
            outcore_o: out std_logic; 
            outglobal_o: out std_logic
        ); 
    end component;

    component vga is
        port(
            outglobal_o: in std_logic;
            HSYNC: out std_logic;
            VSYNC: out std_logic;
            pixel_x: out std_logic_vector(9 downto 0);
            pixel_y: out std_logic_vector(9 downto 0);
            valid: out std_logic;
            game_clock  : out std_logic
        );
    end component;

    component pattern_gen is
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
    end component;

    component FSM is
        port(
			endgame : in std_logic;
			restart : in std_logic;
			start : in std_logic;
			controller1      : in std_logic_vector(3 downto 0);
			controller2    	: in std_logic_vector(3 downto 0);
            outglobal_o: in std_logic;
            flag: out std_logic_vector(1 downto 0)
        );
    end component;
	
	component NES is
        port (
            clk         : in  std_logic;
            data1       : in  std_logic;
            data2       : in  std_logic;
            clock       : out std_logic;
            latch       : out std_logic;
            controller1 : out std_logic_vector(3 downto 0);
            controller2 : out std_logic_vector(3 downto 0);
            start 	    : out std_logic;
			endgame		: out std_logic;
			restart		: out std_logic
        );
    end component;
	
	component arrows is
        port(
			arrows_clk : in std_logic;
			arrows_spawned : out std_logic_vector(3 downto 0);
			left_arr_ypos : out std_logic_vector(9 downto 0);
			top_arr_ypos : out std_logic_vector(9 downto 0);
			right_arr_ypos : out std_logic_vector(9 downto 0);
			down_arr_ypos : out std_logic_vector(9 downto 0)
        );
    end component;
	
	component scoring is
	port(
		score_clk : in std_logic;
		
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
	end component;


    signal game_clock: std_logic;
    signal outglobal_o: std_logic;  
    signal valid: std_logic;  
    signal pixel_x: std_logic_vector(9 downto 0); 
    signal pixel_y: std_logic_vector(9 downto 0);  
	
	signal arrows_spawned: std_logic_vector(3 downto 0); 
	signal left_arr_ypos: std_logic_vector(9 downto 0); 
	signal top_arr_ypos: std_logic_vector(9 downto 0); 
	signal right_arr_ypos: std_logic_vector(9 downto 0); 
	signal down_arr_ypos: std_logic_vector(9 downto 0); 
	
    signal outcore_o: std_logic;   
    signal flag: std_logic_vector(1 downto 0);
	signal rst_n: std_logic := '1';
    
	signal clock: std_logic;
    signal controller1 : std_logic_vector(3 downto 0) := (others => '1');
    signal controller2 : std_logic_vector(3 downto 0) := (others => '1');
    signal start : std_logic := '0';
	signal restart : std_logic := '0';
	signal endgame : std_logic := '0';
	
	signal p1_score: unsigned(19 downto 0); 
	signal p2_score: unsigned(19 downto 0); 

begin
    pll_inst : mypll
        port map(
            ref_clk_i => ref_clk_i,    
            rst_n_i => rst_n,         
            outcore_o => outcore_o,    
            outglobal_o => outglobal_o 
        );

    vga_inst : vga
        port map(
            outglobal_o => outglobal_o,  
            HSYNC => HSYNC,             
            VSYNC => VSYNC,             
            valid => valid,             
            pixel_x => pixel_x,                 
            pixel_y => pixel_y,
            game_clock => game_clock
        );

    pattern_inst : pattern_gen
        port map(
			p1_score_digs => p1_score,
			p2_score_digs => p2_score,
			flag => flag,
			outglobal_o => game_clock,
			pixel_y => pixel_x,                  
            pixel_x => pixel_y,
			arrows_spawned => arrows_spawned,
			left_arr_ypos => left_arr_ypos,
			right_arr_ypos => right_arr_ypos,
			top_arr_ypos => top_arr_ypos,
			down_arr_ypos => down_arr_ypos,
            valid => valid,             
            rgb => rgb                  
        );
		
	NESControllers : NES
        port map(
            clk         => outglobal_o,
            data1       => data1,
            data2       => data2,
            clock       => nesClk,
            latch       => latch,
            controller1 => controller1,
            controller2 => controller2,
			restart => restart,
            start 	    => start,
			endgame  => endgame
        );
			
    fsm_inst : FSM
        port map(
			endgame => endgame,
			restart => restart,
			start => start,
            controller1 => controller1,           
            controller2 => controller2,  
            outglobal_o => game_clock,      
            flag => flag                    
        );

	arrows_inst : arrows
        port map(
            arrows_clk => outglobal_o,
			arrows_spawned => arrows_spawned,
			left_arr_ypos => left_arr_ypos,
			top_arr_ypos => top_arr_ypos,
			right_arr_ypos => right_arr_ypos,
			down_arr_ypos => down_arr_ypos       
        );
		
	scoring_inst : scoring
		port map(
			score_clk => game_clock,
			p1_keyhit => controller1,
			p2_keyhit => controller2,
			arrows_spawned => arrows_spawned,
			left_arr_ypos => left_arr_ypos,
			top_arr_ypos => left_arr_ypos,
			right_arr_ypos => left_arr_ypos,
			down_arr_ypos => left_arr_ypos,
			p1_score => p1_score,
			p2_score => p2_score
		);

    pll <= outcore_o;

end synth;
