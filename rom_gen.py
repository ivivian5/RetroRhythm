from PIL import Image

im = Image.open('startscreen.png', 'r')
im = im.convert("RGB")
width, height = im.size
pixel_vals = list(im.getdata())
pixel_values = list(map(lambda pix: (bin(int(round(pix[0] / 85, 0)))[2:],
                                     bin(int(round(pix[1] / 85, 0)))[2:],
                                     bin(int(round(pix[2] / 85, 0)))[2:]), 
                    pixel_vals))

incl_lead_zero = lambda rgb_val: "00" if rgb_val == "0" else "01" if rgb_val == "1" else rgb_val

pixel_values = list(map(lambda pix: (incl_lead_zero(pix[0])+
                                     incl_lead_zero(pix[1])+
                                     incl_lead_zero(pix[2])), 
                    pixel_values))

################## MAKING DUMP FILE ########################################
# output = open("dump-startscreen.txt", "w") 

# for i in range(height):
#     for j in range(width):
#         output.write(str(i) + "," + str(j) + "," + pixel_values[(i*width + j)] + "\n")

# output.close()

################## MAKING VHDL FILE ########################################

output = open("start_rom.vhd", "w") 

output.write(  "library IEEE;\n\
                use IEEE.std_logic_1164.all;\n\
                use IEEE.numeric_std.all;\n\n")

output.write(  "entity rom is\n\
                \tport(\n\
                \t\tclk : in std_logic;\n\
                \t\taddr : in std_logic_vector(3 downto 0); -- 16 words total\n\
                \t\tdata : out std_logic_vector(5 downto 0) -- 6-bit words, RRGGBB\n\
                \t);\n\
                end;\n\n\
                architecture sim of rom is\n\
                begin\n\
                \tprocess(clk) begin\n\
                \t\tif rising_edge(clk) then\n\
                \t\t\tcase addr is\n")

for i in range(width * height):
    output.write(("\t\t\t\twhen \"" + format(i,'012b') + "\" => data <= \"" +
                  str(pixel_values[i]) + "\";\n"))

output.write("\t\t\t\twhen others => data <= \"000000\";\n")
output.write("\t\t\tend case;\n\
              \t\tend if; \n\
              \tend process; \n\
              end;")


output.close()