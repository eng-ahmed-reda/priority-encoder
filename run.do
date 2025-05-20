vlib work
vlog priority_enc.v priority_enc_tb.sv  +cover -covercells
vsim -voptargs=+acc work.priority_enc_tb -cover
add wave *
coverage save priority_enc_tb.ucdb -onexit
run -all
coverage exclude -du priority_enc -togglenode {D[0]}
coverage exclude -du priority_enc -togglenode valid
coverage exclude -src priority_enc.v -line 13 -code b
vcover report priority_enc_tb.ucdb -details -annotate -all -output coverage_rpt.txt