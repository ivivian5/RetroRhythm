library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is
    port(
        ref_clk_i: in std_logic; 
        rgb: out std_logic_vector(5 downto 0); 
        HSYNC: out std_logic; 
        VSYNC: out std_logic; 
        pll: out std_logic 
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



