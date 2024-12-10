if {[catch {

# define run engine funtion
source [file join {C:/lscc/radiant/2023.1} scripts tcl flow run_engine.tcl]
# define global variables
global para
set para(gui_mode) 1
set para(prj_dir) "Z:/ES4/final_proj_git/RetroRhythm/VGA_Controller"
# synthesize IPs
# synthesize VMs
# propgate constraints
file delete -force -- VGA_Controller_impl_1_cpe.ldc
run_engine_newmsg cpe -f "VGA_Controller_impl_1.cprj" "mypll.cprj" -a "iCE40UP"  -o VGA_Controller_impl_1_cpe.ldc
# synthesize top design
file delete -force -- VGA_Controller_impl_1.vm VGA_Controller_impl_1.ldc
run_engine_newmsg synthesis -f "VGA_Controller_impl_1_lattice.synproj"
run_postsyn [list -a iCE40UP -p iCE40UP5K -t SG48 -sp High-Performance_1.2V -oc Industrial -top -w -o VGA_Controller_impl_1_syn.udb VGA_Controller_impl_1.vm] "Z:/ES4/final_proj_git/RetroRhythm/VGA_Controller/impl_1/VGA_Controller_impl_1.ldc"

} out]} {
   runtime_log $out
   exit 1
}
