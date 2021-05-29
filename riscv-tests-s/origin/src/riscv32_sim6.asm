# Test the RISC-V processor in simulation
# 已经能正确执行：addi, lui, jalr
# 待验证：beq, bne, blt, bge, bltu, bgeu
# 本测试只验证单条指令的功能，不考察转发和冒险检测的功能，所以在相关指令之间添加了足够多的nop指令

#		Assembly                Description
main:   
        lui     x7, 0xfffff             #x7 <== 0xFFFFF000
        addi    x5, x0, 1               #x5 <== 0x1
        addi    x6, x0, 1               #x6 <== 0x1
        beq     x6, x5, br1             #beq taken
br1ret: beq     x7, x0, br2ret          #beq not taken
        addi    x5, x5, 1               #x5 = 2
br2ret: bne     x7, x0, br3             #bne taken
br3ret: bne     x6, x0, br4             #bne not taken
                addi    x5, x5, 1               #x5 = 4
br4ret: blt     x7, x6, br5             #blt taken
br5ret: blt     x6, x7, br6             #blt not taken
                addi    x5, x5, 1               #x5 = 6
br6ret: bge     x6, x0, br7             #bge taken
br7ret: bge     x6, x7, br8             #bge taken
br8ret: bge     x7, x0, br9             #bge not taken
                addi    x5, x5, 1               #x5 = 9
br9ret: bltu    x6, x7, br10            #bltu taken
br10ret:bltu    x7, x6, br11            #bltu not taken
                addi    x5, x5, 1               #x5 = 0xB
br11ret:bgeu    x7, x6, br12            #bgtu taken
br12ret:bgeu    x6, x7, br13            #bgtu not taken
                addi    x5, x5, 1               #x5 = 0xD
br13ret:j       main                    #x5 should be 0xD for correct implementation
br1:    addi    x5, x5, 1               #x5 = 1
                j       br1ret
br2:    j       br2ret
br3:    addi    x5, x5, 1               #x5 = 3
                j       br3ret
br4:    j       br4ret
br5:    addi    x5, x5, 1               #x5 = 5
                j       br5ret
br6:    j       br6ret
br7:    addi    x5, x5, 1               #x5 = 7
                j       br7ret
br8:    addi    x5, x5, 1               #x5 = 8
                j       br8ret
br9:    j       br9ret
br10:   addi    x5, x5, 1               #x5 = 0xA
                j       br10ret
br11:   j       br11ret
br12:   addi    x5, x5, 1               #x5 = 0xC
                j       br12ret
br13:   j       br13ret
                                        