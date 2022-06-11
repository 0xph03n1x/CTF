00000000  C28950            ret 0x5089
00000003  4E                dec esi
00000004  47                inc edi
00000005  0D0A1A0A00        or eax,0xa1a0a
0000000A  0000              add [eax],al
0000000C  0D49484452        or eax,0x52444849
00000011  0000              add [eax],al
00000013  006F00            add [edi+0x0],ch
00000016  0000              add [eax],al
00000018  6F                outsd
00000019  0103              add [ebx],eax
0000001B  0000              add [eax],al
0000001D  00C3              add bl,al
0000001F  98                cwde
00000020  0B0C23            or ecx,[ebx]
00000023  0000              add [eax],al
00000025  0006              add [esi],al
00000027  50                push eax
00000028  4C                dec esp
00000029  54                push esp
0000002A  45                inc ebp
0000002B  0000              add [eax],al
0000002D  00C3              add bl,al
0000002F  BFC3BFC3BF        mov edi,0xbfc3bfc3
00000034  C2A5C3            ret 0xc3a5
00000037  99                cdq
00000038  C29FC3            ret 0xc39f
0000003B  9D                popf
0000003C  0000              add [eax],al
0000003E  0002              add [edx],al
00000040  7452              jz 0x94
00000042  4E                dec esi
00000043  53                push ebx
00000044  C3                ret
00000045  BFC3BFC388        mov edi,0x88c3bfc3
0000004A  C2B5C3            ret 0xc3b5
0000004D  9F                lahf
0000004E  C3                ret
0000004F  8700              xchg eax,[eax]
00000051  0000              add [eax],al
00000053  097048            or [eax+0x48],esi
00000056  59                pop ecx
00000057  7300              jnc 0x59
00000059  000B              add [ebx],cl
0000005B  1200              adc al,[eax]
0000005D  000B              add [ebx],cl
0000005F  1201              adc al,[ecx]
00000061  C3                ret
00000062  92                xchg eax,edx
00000063  C3                ret
00000064  9D                popf
00000065  7EC3              jng 0x2a
00000067  BC00000125        mov esp,0x25010000
0000006C  49                dec ecx
0000006D  44                inc esp
0000006E  41                inc ecx
0000006F  54                push esp
00000070  38C2              cmp dl,al
00000072  8D                db 0x8d
00000073  C3                ret
00000074  95                xchg eax,ebp
00000075  C3                ret
00000076  94                xchg eax,esp
00000077  31C2              xor edx,eax
00000079  8EC3              mov es,ebx
0000007B  832010            and dword [eax],byte +0x10
0000007E  05C390C2B1        add eax,0xb1c290c3
00000083  5C                pop esp
00000084  C3                ret
00000085  90                nop
00000086  251740C29A        and eax,0x9ac24017
0000008B  6BC390            imul eax,ebx,byte -0x70
0000008E  7125              jno 0xb5
00000090  C3                ret
00000091  BB02C2B6C3        mov ebx,0xc3b6c202
00000096  B702              mov bh,0x2
00000098  C3                ret
00000099  8EC2              mov es,edx
0000009B  95                xchg eax,ebp
0000009C  C3                ret
0000009D  A8C2              test al,0xc2
0000009F  B806C2922F        mov eax,0x2f92c206
000000A4  40                inc eax
000000A5  3A0A              cmp cl,[edx]
000000A7  C294C3            ret 0xc394
000000AA  99                cdq
000000AB  C28F23            ret 0x238f
000000AE  45                inc ebp
000000AF  C2BBC3            ret 0xc3bb
000000B2  856668            test [esi+0x68],esp
000000B5  52                push edx
000000B6  2CC2              sub al,0xc2
000000B8  A2C3A02121        mov [0x2121a0c3],al
000000BD  C3                ret
000000BE  8F                db 0x8f
000000BF  0CC2              or al,0xc2
000000C1  83497E0D          or dword [ecx+0x7e],byte +0xd
000000C5  C3                ret
000000C6  BA1FC38C44        mov edx,0x448cc31f
000000CB  C28BC2            ret 0xc28b
000000CE  AF                scasd
000000CF  6BC2B0            imul eax,edx,byte -0x50
000000D2  44                inc esp
000000D3  C2ACC3            ret 0xc3ac
000000D6  B22E              mov dl,0x2e
000000D8  7572              jnz 0x14c
000000DA  C3                ret
000000DB  A366C3AA2A        mov [0x2aaac366],eax
000000E0  1D0C76C381        sbb eax,0x81c3760c
000000E5  C3                ret
000000E6  A7                cmpsd
000000E7  C282C2            ret 0xc282
000000EA  9D                popf
000000EB  4C                dec esp
000000EC  17                pop ss
000000ED  27                daa
000000EE  C297C3            ret 0xc397
000000F1  88C3              mov bl,al
000000F3  94                xchg eax,esp
000000F4  4E                dec esi
000000F5  C2AEC2            ret 0xc2ae
000000F8  91                xchg eax,ecx
000000F9  C3                ret
000000FA  96                xchg eax,esi
000000FB  62                db 0x62
000000FC  C2BB28            ret 0x28bb
000000FF  75C2              jnz 0xc3
00000101  8EC3              mov es,ebx
00000103  B51A              mov ch,0x1a
00000105  C3                ret
00000106  AD                lodsd
00000107  2BC3              sub eax,ebx
00000109  8837              mov [edi],dh
0000010B  44                inc esp
0000010C  C2BE73            ret 0x73be
0000010F  C2B4C2            ret 0xc2b4
00000112  98                cwde
00000113  C2AFC3            ret 0xc3af
00000116  B4C3              mov ah,0xc3
00000118  9F                lahf
00000119  C3                ret
0000011A  B01C              mov al,0x1c
0000011C  C3                ret
0000011D  B65A              mov dh,0x5a
0000011F  7E16              jng 0x137
00000121  C3                ret
00000122  B64F              mov dh,0x4f
00000124  66C2B264          retnw 0x64b2
00000128  78C3              js 0xed
0000012A  B3C3              mov bl,0xc3
0000012C  87C3              xchg eax,ebx
0000012E  AE                scasb
0000012F  3AC3              cmp al,bl
00000131  A80F              test al,0xf
00000133  C2AC25            ret 0x25ac
00000136  1039              adc [ecx],bh
00000138  56                push esi
00000139  792F              jns 0x16a
0000013B  7471              jz 0x1ae
0000013D  C3                ret
0000013E  A357C294C2        mov [0xc294c257],eax
00000143  8711              xchg edx,[ecx]
00000145  C29DC3            ret 0xc39d
00000148  B1C3              mov cl,0xc3
0000014A  98                cwde
0000014B  5B                pop ebx
0000014C  6C                insb
0000014D  3479              xor al,0x79
0000014F  C29D0F            ret 0xf9d
00000152  C28FC2            ret 0xc28f
00000155  B3C2              mov bl,0xc2
00000157  B2C3              mov dl,0xc3
00000159  BB7353C2A5        mov ebx,0xa5c25373
0000015E  3B36              cmp esi,[esi]
00000160  33C2              xor eax,edx
00000162  A2C3B87360        mov [0x6073b8c3],al
00000167  C29552            ret 0x5295
0000016A  C3                ret
0000016B  AA                stosb
0000016C  10C3              adc bl,al
0000016E  93                xchg eax,ebx
0000016F  C3                ret
00000170  85C3              test ebx,eax
00000172  B07E              mov al,0x7e
00000174  46                inc esi
00000175  C3                ret
00000176  B5C2              mov ch,0xc2
00000178  9E                sahf
00000179  7719              ja 0x194
0000017B  6F                outsd
0000017C  6D                insd
0000017D  4A                dec edx
0000017E  763A              jna 0x1ba
00000180  25C2A049C3        and eax,0xc349a0c2
00000185  9A05C39D22C2AB    call 0xabc2:0x229dc305
0000018C  44                inc esp
0000018D  C2BE38            ret 0x38be
00000190  2825C38DC2A5      sub [dword 0xa5c28dc3],ah
00000196  C283C2            ret 0xc283
00000199  92                xchg eax,edx
0000019A  C286C2            ret 0xc286
0000019D  82                db 0x82
0000019E  C2900E            ret 0xe90
000001A1  1453              adc al,0x53
000001A3  6744              inc esp
000001A5  1F                pop ds
000001A6  C3                ret
000001A7  96                xchg eax,esi
000001A8  39C2              cmp edx,eax
000001AA  A0C3BEC2AC        mov al,[0xacc2bec3]
000001AF  C2B3C2            ret 0xc2b3
000001B2  9D                popf
000001B3  C295C3            ret 0xc395
000001B6  9D                popf
000001B7  1019              adc [ecx],bl
000001B9  51                push ecx
000001BA  C289C2            ret 0xc289
000001BD  91                xchg eax,ecx
000001BE  3D21C2A4C3        cmp eax,0xc3a4c221
000001C3  AC                lodsb
000001C4  58                pop eax
000001C5  253A76C3B2        and eax,0xb2c3763a
000001CA  6968C2AF4C54C3    imul ebp,[eax-0x3e],dword 0xc3544caf
000001D1  A22D2C1EC2        mov [0xc21e2c2d],al
000001D6  95                xchg eax,ebp
000001D7  C3                ret
000001D8  A4                movsb
000001D9  C3                ret
000001DA  AC                lodsb
000001DB  59                pop ecx
000001DC  27                daa
000001DD  C2AE52            ret 0x52ae
000001E0  C3                ret
000001E1  90                nop
000001E2  C2B434            ret 0x34b4
000001E5  3CC3              cmp al,0xc3
000001E7  B355              mov bl,0x55
000001E9  C289C2            ret 0xc289
000001EC  85C3              test ebx,eax
000001EE  B0C3              mov al,0xc3
000001F0  8371170B          xor dword [ecx+0x17],byte +0xb
000001F4  C3                ret
000001F5  9F                lahf
000001F6  42                inc edx
000001F7  2227              and ah,[edi]
000001F9  3AC3              cmp al,bl
000001FB  B17E              mov cl,0x7e
000001FD  C3                ret
000001FE  91                xchg eax,ecx
000001FF  2D68C2AAC2        sub eax,0xc2aac268
00000204  A2C2B3C3A5        mov [0xa5c3b3c2],al
00000209  C3                ret
0000020A  9B3A56C2          wait cmp dl,[esi-0x3e]
0000020E  B2C3              mov dl,0xc3
00000210  91                xchg eax,ecx
00000211  C3                ret
00000212  B9C2B95FC3        mov ecx,0xc35fb9c2
00000217  AE                scasb
00000218  C2A7C3            ret 0xc3a7
0000021B  B80D69C3B5        mov eax,0xb5c3690d
00000220  37                aaa
00000221  776E              ja 0x291
00000223  C3                ret
00000224  B809C29700        mov eax,0x97c209
00000229  0000              add [eax],al
0000022B  004945            add [ecx+0x45],cl
0000022E  4E                dec esi
0000022F  44                inc esp
00000230  C2AE42            ret 0x42ae
00000233  60                pusha
00000234  C2820A            ret 0xa82
