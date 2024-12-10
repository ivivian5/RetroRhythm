 library IEEE;
 use IEEE.std_logic_1164.all;
 use IEEE.numeric_std.all;

 entity NES is
   port(
 	  clk         : in  std_logic;
 	  data1       : in  std_logic;
      data2       : in  std_logic;
      clock       : out std_logic;
      latch       : out std_logic;
 	  controller1 : out std_logic_vector(3 downto 0);
      controller2 : out std_logic_vector(3 downto 0);
	  restart     : out std_logic;
 	  start 	  : out std_logic;
	  endgame	  : out std_logic
   );
 end NES;


 architecture synth of NES is
	
 	 signal ctr_clk  : std_logic;
     signal counter  : unsigned(20 downto 0) := (others => '0');
     signal NESclk   : std_logic;
     signal NEScount : unsigned(10 downto 0);
     signal reg1     : std_logic_vector(7 downto 0) := (others => '1');
     signal reg2     : std_logic_vector(7 downto 0) := (others => '1');

 begin
	
     process (clk) begin
         if rising_edge(clk) then
             counter <= counter + 1;
			 if counter = "100000000000001111000" then
				counter <= "000000000000000000000";
			 end if;
         end if;
     end process;
	
	
 	process (ctr_clk) begin
 		if rising_edge(ctr_clk) then
             reg1 <= reg1(6 downto 0) & data1;
             reg2 <= reg2(6 downto 0) & data2;
         end if;
 	end process;
	
 
    NESclk   <= counter(8);
    NEScount <= counter(19 downto 9);
 	ctr_clk  <= NESclk when NEScount < "00000001000" else '0';
	
	
 	clock       <= ctr_clk;
 	latch       <= '1'  when NEScount = "11111111111" else '0';
    controller1 <= reg1(3 downto 0) when NEScount > "00000000111" else "1111";
    controller2 <= reg2(3 downto 0) when NEScount > "00000000111" else "1111";
 	start       <= reg1(4) nand reg2(4) when NEScount > "00000000111" else '0';
    restart       <= reg1(5) nand reg2(5) when NEScount > "00000000111" else '0';
	endgame        <= reg1(6) nand reg2(6) when NEScount > "00000000111" else '0';
 end;
