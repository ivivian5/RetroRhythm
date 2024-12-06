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
            if to_integer(unsigned(row)) > left_arr_xpos - 1 and to_integer(unsigned(row)) < left_arr_xpos + 60 and to_integer(unsigned(column)) > left_arr_ypos - 1 and to_integer(unsigned(column)) > left_arr_ypos + 60 and arrows_spawned(0) = '1' then
                rgb <= left_arr_rom_data;  
            elsif to_integer(unsigned(row)) > top_arr_xpos - 1 and to_integer(unsigned(row)) < top_arr_xpos + 60 and to_integer(unsigned(column)) > top_arr_ypos - 1 and to_integer(unsigned(column)) > top_arr_ypos + 60 and arrows_spawned(0) = '1' then
                rgb <= top_arr_rom_data;
            elsif to_integer(unsigned(row)) > right_arr_xpos - 1 and to_integer(unsigned(row)) < right_arr_xpos + 60 and to_integer(unsigned(column)) > right_arr_ypos - 1 and to_integer(unsigned(column)) > right_arr_ypos + 60 and arrows_spawned(0) = '1' then
                rgb <= right_arr_rom_data;
            elsif to_integer(unsigned(row)) > down_arr_xpos - 1 and to_integer(unsigned(row)) < down_arr_xpos + 60 and to_integer(unsigned(column)) > down_arr_ypos - 1 and to_integer(unsigned(column)) > down_arr_ypos + 60 and arrows_spawned(0) = '1'  then
                rgb <= down_arr_rom_data;
            else
                rgb <= "000000"; 
            end if;
        else
            rgb <= "000000";
        end if;
    end process;
end synth;
