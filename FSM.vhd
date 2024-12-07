library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FSM is
    port(
		restart: in std_logic;
		start : in std_logic;
        controller1      : in std_logic_vector(3 downto 0);
        controller2    	: in std_logic_vector(3 downto 0);
        outglobal_o      : in std_logic;
        flag             : out std_logic
    );
end FSM;

architecture synth of FSM is
    type State is (START_SCREEN, PLAY_GAME);
    signal s: State := START_SCREEN;

begin
    process(controller1, controller2, outglobal_o)
    begin
        if rising_edge(outglobal_o) then 
            case s is
                when START_SCREEN =>
					flag <= '1';
                    if start = '1' then  
                        s <= PLAY_GAME; 
					else
						s <= START_SCREEN;
					end if;
                when PLAY_GAME =>
					flag <= '0';
					if restart = '1' then  
                        s <= START_SCREEN; 
					else 
						s <= PLAY_GAME;
					end if;
            end case;
        end if;
    end process; 
end synth;


			