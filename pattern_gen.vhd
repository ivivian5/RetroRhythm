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
            if to_integer(unsigned(column)) < 320 then
                rgb <= "111111";  
            else
                rgb <= "000000"; 
            end if;
        else
            rgb <= "000000";
        end if;
    end process;
end synth;
