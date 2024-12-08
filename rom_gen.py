from PIL import Image

name = "arrow1"

im = Image.open('end_screen.jpeg', 'r')
im = im.convert("RGB")
width, height = im.size
pixel_vals = list(im.getdata())
pixel_values = list(map(lambda pix: (format(int(round((pix[0] / 255) * 3, 0)), '02b')+
                                     format(int(round((pix[1] / 255) * 3, 0)), '02b')+
                                     format(int(round((pix[2] / 255) * 3, 0)), '02b')), 
                    pixel_vals))
print(pixel_values)
################## MAKING DUMP FILE ########################################
# output = open("dump-startscreen.txt", "w") 

# for i in range(height):
#     for j in range(width):
#         output.write(str(i) + "," + str(j) + "," + pixel_values[(i*width + j)] + "\n")

# output.close()

################## MAKING VHDL FILE ########################################

output = open("endscreen.vhd", "w") 

output.write(  "library IEEE;\n\
                use IEEE.std_logic_1164.all;\n\
                use IEEE.numeric_std.all;\n\n")



output.write(  "entity endscreen is \n \
                \tport(\n\
                \t\toutglobal_o : in std_logic;\n\
                \t\taddr_x : in std_logic_vector(7 downto 0);\n\
                \t\taddr_y : in std_logic_vector(7 downto 0);\n\
                \t\tdata : out std_logic_vector(5 downto 0) -- 6-bit words, RRGGBB\n\
                \t);\n\
                end;\n\n\
                architecture sim of endscreen is\n\
                signal addr : std_logic_vector(15 downto 0);\n\n\
                begin\n\
                \taddr (15 downto 8) <= addr_x;\n\
                \taddr (7 downto 0) <= addr_y;\n\
                \tprocess(outglobal_o) begin\n\
                \t\tif rising_edge(outglobal_o) then\n\
                \t\t\tcase addr is\n")

for i in range(height):
    for j in range(width):
        if str(pixel_values[(i*width + j)]) != "000000":
            output.write(("\t\t\t\twhen \"" + format(i,'08b') + format(j,'08b')
                            + "\" => data <= \"" +
                            str(pixel_values[(i*width + j)]) + "\";\n"))

output.write("\t\t\t\twhen others => data <= \"000000\";\n")
output.write("\t\t\tend case;\n\
              \t\tend if; \n\
              \tend process; \n\
              end;")


output.close()