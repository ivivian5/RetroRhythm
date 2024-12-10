library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity vga is
    port (
        outglobal_o : in std_logic;
        HSYNC       : out std_logic;
        VSYNC       : out std_logic;
        pixel_x     : out std_logic_vector(9 downto 0);
        pixel_y     : out std_logic_vector(9 downto 0);
        valid     : out std_logic
    );
end vga;

architecture synth of vga is
    signal columns : unsigned(9 downto 0) := (others => '0');
    signal rows   : unsigned(9 downto 0) := (others => '0');

    constant H_TOTAL        : integer := 800; 
    constant H_SYNC_START   : integer := 656; 
    constant H_SYNC_END     : integer := 752; 
    constant H_VISIBLE      : integer := 640;

    constant V_TOTAL        : integer := 525; 
    constant V_SYNC_START   : integer := 490; 
    constant V_SYNC_END     : integer := 492; 
    constant V_VISIBLE      : integer := 480; 
begin
    process(outglobal_o)
    begin
        if rising_edge(outglobal_o) then
            columns <= columns + 1;
            if columns = H_TOTAL - 1 then
                columns <= (others => '0'); 
                rows <= rows + 1;
            end if;

            if rows = V_TOTAL - 1 then
                rows <= (others => '0'); 
            end if;

            if (columns < H_VISIBLE) and (rows < V_VISIBLE) then
                valid <= '1';
            else
                valid <= '0';
            end if;

            if columns >= H_SYNC_START and columns < H_SYNC_END then
                HSYNC <= '0';
            else
                HSYNC <= '1';
            end if;

            if rows >= V_SYNC_START and rows < V_SYNC_END then
                VSYNC <= '0';
            else
                VSYNC <= '1';
            end if;

            pixel_x <= std_logic_vector(rows); 
            pixel_y <= std_logic_vector(columns);

        end if;
    end process;
end synth;

