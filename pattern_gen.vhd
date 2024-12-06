library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pattern_gen is
    port(
        row: in std_logic_vector(9 downto 0);  
        column: in std_logic_vector(9 downto 0);  
        valid: in std_logic;  
        rgb: out std_logic_vector(5 downto 0)  
    );
end pattern_gen;

architecture synth of pattern_gen is
begin
    process(valid, row, column)
    begin
        if valid = '1' then
            if to_integer(unsigned(row)) > to_integer(unsigned(left_arr_xpos)) - 1 and to_integer(unsigned(row)) < to_integer(unsigned(left_arr_xpos)) + 60 and to_integer(unsigned(column)) > to_integer(unsigned(left_arr_xpos)) - 1 and to_integer(unsigned(column)) > to_integer(unsigned(left_arr_xpos)) + 60 and arrows_spawned(0) = '1' then
                rgb <= rom_arrow_1;  
            elsif to_integer(unsigned(row)) > to_integer(unsigned(top_arr_xpos)) - 1 and to_integer(unsigned(row)) < to_integer(unsigned(top_arr_xpos)) + 60 and to_integer(unsigned(column)) > to_integer(unsigned(top_arr_ypos)) - 1 and to_integer(unsigned(column)) > to_integer(unsigned(top_arr_ypos)) + 60 and arrows_spawned(0) = '1' then
                rgb <= rom_arrow_2;
            elsif to_integer(unsigned(row)) > to_integer(unsigned(right_arr_xpos)) - 1 and to_integer(unsigned(row)) < to_integer(unsigned(right_arr_xpos)) + 60 and to_integer(unsigned(column)) > to_integer(unsigned(right_arr_ypos)) - 1 and to_integer(unsigned(column)) > to_integer(unsigned(right_arr_ypos)) + 60 and arrows_spawned(0) = '1' then
                rgb <= rom_arrow_3;
            elsif to_integer(unsigned(row)) > to_integer(unsigned(down_arr_xpos)) - 1 and to_integer(unsigned(row)) < to_integer(unsigned(down_arr_xpos)) + 60 and to_integer(unsigned(column)) > to_integer(unsigned(down_arr_ypos)) - 1 and to_integer(unsigned(column)) > to_integer(unsigned(down_arr_ypos)) + 60 and arrows_spawned(0) = '1'  then
                rgb <= rom_arrow_4;
            else
                rgb <= "000000"; 
            end if;
        else
            rgb <= "000000";
        end if;
    end process;
end synth;
