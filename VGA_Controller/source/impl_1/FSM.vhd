library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FSM is
    port(
        endgame         : in std_logic;
        restart         : in std_logic;
        start           : in std_logic;
        controller1     : in std_logic_vector(3 downto 0);
        controller2     : in std_logic_vector(3 downto 0);
        outglobal_o     : in std_logic;
        flag            : out std_logic_vector(1 downto 0);
		music_on		: out std_logic
    );
end FSM;

architecture synth of FSM is
    type State is (START_SCREEN, PLAY_GAME, END_SCREEN);
    signal s: State := START_SCREEN;
begin
    process(outglobal_o)
    begin
        --flag <= "00"; 
        if rising_edge(outglobal_o) then
            case s is
                when START_SCREEN =>
					music_on <= '0';
                    flag <= "00";
                    if start = '1' then  
                        s <= PLAY_GAME;
                    else
                        s <= START_SCREEN;
                    end if;
                when PLAY_GAME =>
					music_on <= '1';
                    flag <= "01";
                    if restart = '1' then  
                        s <= START_SCREEN;
                    elsif endgame = '1' then
                        s <= END_SCREEN;
                    else
                        s <= PLAY_GAME;
                    end if;
                when END_SCREEN =>
					music_on <= '0';
                    flag <= "10";
                    if restart = '1' then
                        s <= START_SCREEN;
                    else
                        s <= END_SCREEN;
                    end if;
            end case;
        end if;	
    end process;
end synth;