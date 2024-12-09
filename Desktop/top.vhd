library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is
    port(
        ref_clk_i : in std_logic; 
        rgb       : out std_logic_vector(5 downto 0); 
        HSYNC     : out std_logic; 
        VSYNC     : out std_logic; 
        ref_clk_i : in std_logic;
        data1     : in std_logic;
        data2     : in std_logic;
        nesClk    : out std_logic;
        latch     : out std_logic;
        pll       : out std_logic 
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

    component NES is
        port (
            clk         : in  std_logic;
            data1       : in  std_logic;
            data2       : in  std_logic;
            clock       : out std_logic;
            latch       : out std_logic;
            controller1 : out std_logic_vector(3 downto 0);
            controller2 : out std_logic_vector(3 downto 0);
            start 	    : out std_logic
        );
    end component;

    component vga is
        port(
            outglobal_o: in std_logic;
            HSYNC: out std_logic;
            VSYNC: out std_logic;
            row: out std_logic_vector(9 downto 0);
            column: out std_logic_vector(9 downto 0);
            valid: out std_logic
        );
    end component;

    component pattern_gen is
        port(
            row: in std_logic_vector(9 downto 0);
            column: in std_logic_vector(9 downto 0);
            valid: in std_logic;
            rgb: out std_logic_vector(5 downto 0)
        );
    end component;

    signal outglobal_o: std_logic;
    signal valid: std_logic;
    signal row: std_logic_vector(9 downto 0);
    signal column: std_logic_vector(9 downto 0);
    signal outcore_o: std_logic;
    signal rst_n: std_logic := '1';
    
    signal c1Arrows : std_logic_vector(3 downto 0) := (others => '1');
    signal c2Arrows : std_logic_vector(3 downto 0) := (others => '1');
    signal startHit : std_logic := '0';

begin
    pll_inst : mypll
        port map(
            ref_clk_i => ref_clk_i,    
            rst_n_i => rst_n,         
            outcore_o => outcore_o,    
            outglobal_o => outglobal_o 
        );
    
    NESControllers : NES
        port map(
            clk         => outglobal_o,
            data1       => data1,
            data2       => data2,
            clock       => nesClk,
            latch       => latch,
            controller1 => c1Arrows,
            controller2 => c2Arrows,
            start 	    => startHit
        );

    vga_inst : vga
        port map(
            outglobal_o => outglobal_o, 
            HSYNC => HSYNC,             
            VSYNC => VSYNC,            
            valid => valid,             
            row => row,                 
            column => column            
        );

    pattern_inst : pattern_gen
        port map(
            row => row,                 
            column => column,           
            valid => valid,             
            rgb => rgb                  
        );

    pll <= outcore_o;

end synth;
