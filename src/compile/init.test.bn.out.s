	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0
	.globl	_.mod3.is_letter                ; -- Begin function .mod3.is_letter
	.p2align	2
_.mod3.is_letter:                       ; @.mod3.is_letter
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa_offset 16
	sxtb	w8, w0
	cmp	w8, #96                         ; =96
	cset	w9, gt
	cmp	w8, #123                        ; =123
	cset	w10, lt
	cmp	w8, #64                         ; =64
	and	w9, w9, w10
	cset	w10, gt
	cmp	w8, #91                         ; =91
	cset	w8, lt
	and	w8, w10, w8
	orr	w8, w9, w8
	strb	w0, [sp, #15]
	mov	w0, w8
	add	sp, sp, #16                     ; =16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod3.is_digit                 ; -- Begin function .mod3.is_digit
	.p2align	2
_.mod3.is_digit:                        ; @.mod3.is_digit
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa_offset 16
	sxtb	w8, w0
	cmp	w8, #47                         ; =47
	cset	w9, gt
	cmp	w8, #58                         ; =58
	cset	w8, lt
	and	w8, w9, w8
	strb	w0, [sp, #15]
	mov	w0, w8
	add	sp, sp, #16                     ; =16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod3.is_whitespace            ; -- Begin function .mod3.is_whitespace
	.p2align	2
_.mod3.is_whitespace:                   ; @.mod3.is_whitespace
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa_offset 16
	and	w8, w0, #0xff
	cmp	w8, #32                         ; =32
	cset	w9, eq
	cmp	w8, #9                          ; =9
	cset	w8, eq
	orr	w8, w9, w8
	strb	w0, [sp, #15]
	mov	w0, w8
	add	sp, sp, #16                     ; =16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod3.is_lower                 ; -- Begin function .mod3.is_lower
	.p2align	2
_.mod3.is_lower:                        ; @.mod3.is_lower
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	wzr, [x29, #-12]
	b	LBB3_2
LBB3_1:                                 ; %.if.end.37
                                        ;   in Loop: Header=BB3_2 Depth=1
	ldur	w8, [x29, #-12]
	add	w8, w8, #1                      ; =1
	stur	w8, [x29, #-12]
LBB3_2:                                 ; %.for.start.25
                                        ; =>This Inner Loop Header: Depth=1
	ldursw	x8, [x29, #-12]
	ldur	x9, [x29, #-8]
	ldrb	w8, [x9, x8]
	cbz	w8, LBB3_6
; %bb.3:                                ; %.for.continue.25
                                        ;   in Loop: Header=BB3_2 Depth=1
	ldursw	x8, [x29, #-12]
	ldur	x9, [x29, #-8]
	mov	x10, sp
	ldrb	w9, [x9, x8]
	sub	x8, x10, #16                    ; =16
	mov	sp, x8
	cmp	w9, #95                         ; =95
	sturb	w9, [x10, #-16]
	b.eq	LBB3_1
; %bb.4:                                ; %.if.false.37
                                        ;   in Loop: Header=BB3_2 Depth=1
	ldrsb	w8, [x8]
	mov	w0, wzr
	cmp	w8, #97                         ; =97
	b.lt	LBB3_7
; %bb.5:                                ; %.if.false.37
                                        ;   in Loop: Header=BB3_2 Depth=1
	cmp	w8, #123                        ; =123
	b.lt	LBB3_1
	b	LBB3_7
LBB3_6:
	mov	w0, #1
LBB3_7:                                 ; %common.ret
	mov	sp, x29
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod3.is_upper                 ; -- Begin function .mod3.is_upper
	.p2align	2
_.mod3.is_upper:                        ; @.mod3.is_upper
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	wzr, [x29, #-12]
	b	LBB4_2
LBB4_1:                                 ; %.if.end.60
                                        ;   in Loop: Header=BB4_2 Depth=1
	ldur	w8, [x29, #-12]
	add	w8, w8, #1                      ; =1
	stur	w8, [x29, #-12]
LBB4_2:                                 ; %.for.start.48
                                        ; =>This Inner Loop Header: Depth=1
	ldursw	x8, [x29, #-12]
	ldur	x9, [x29, #-8]
	ldrb	w8, [x9, x8]
	cbz	w8, LBB4_6
; %bb.3:                                ; %.for.continue.48
                                        ;   in Loop: Header=BB4_2 Depth=1
	ldursw	x8, [x29, #-12]
	ldur	x9, [x29, #-8]
	mov	x10, sp
	ldrb	w9, [x9, x8]
	sub	x8, x10, #16                    ; =16
	mov	sp, x8
	cmp	w9, #95                         ; =95
	sturb	w9, [x10, #-16]
	b.eq	LBB4_1
; %bb.4:                                ; %.if.false.60
                                        ;   in Loop: Header=BB4_2 Depth=1
	ldrsb	w8, [x8]
	mov	w0, wzr
	cmp	w8, #65                         ; =65
	b.lt	LBB4_7
; %bb.5:                                ; %.if.false.60
                                        ;   in Loop: Header=BB4_2 Depth=1
	cmp	w8, #91                         ; =91
	b.lt	LBB4_1
	b	LBB4_7
LBB4_6:
	mov	w0, #1
LBB4_7:                                 ; %common.ret
	mov	sp, x29
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1.assert                   ; -- Begin function .mod1.assert
	.p2align	2
_.mod1.assert:                          ; @.mod1.assert
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	and	w8, w0, #0x1
	sturb	w8, [x29, #-1]
	stur	x1, [x29, #-16]
	tbnz	w0, #0, LBB5_2
; %bb.1:                                ; %.if.true.74
	ldur	x0, [x29, #-16]
	bl	_strlen
	mov	x8, sp
	sub	x9, x8, #16                     ; =16
	mov	w2, w0
	mov	sp, x9
	ldur	x1, [x29, #-16]
	stur	w0, [x8, #-16]
	mov	w0, #1
	bl	_write
	mov	w0, #1
	bl	_exit
LBB5_2:                                 ; %.if.end.74
	mov	sp, x29
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1.memset                   ; -- Begin function .mod1.memset
	.p2align	2
_.mod1.memset:                          ; @.mod1.memset
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	strb	w1, [sp, #23]
	stp	wzr, w2, [sp, #12]
LBB6_1:                                 ; %.for.start.81
                                        ; =>This Inner Loop Header: Depth=1
	ldp	w8, w9, [sp, #12]
	cmp	w8, w9
	b.ge	LBB6_3
; %bb.2:                                ; %.for.continue.81
                                        ;   in Loop: Header=BB6_1 Depth=1
	ldrb	w8, [sp, #23]
	ldrsw	x9, [sp, #12]
	ldr	x10, [sp, #24]
	strb	w8, [x10, x9]
	add	w8, w9, #1                      ; =1
	str	w8, [sp, #12]
	b	LBB6_1
LBB6_3:                                 ; %.for.end.81
	ldr	x0, [sp, #24]
	add	sp, sp, #32                     ; =32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod93.read                    ; -- Begin function .mod93.read
	.p2align	2
_.mod93.read:                           ; @.mod93.read
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48                     ; =48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	ldrb	w8, [x0, #17]
	str	x0, [sp, #8]
	tbz	w8, #0, LBB7_2
; %bb.1:
	mov	w0, wzr
	b	LBB7_8
LBB7_2:                                 ; %.if.end.97
	ldr	x8, [sp, #8]
	ldrb	w8, [x8, #16]
	cmp	w8, #10                         ; =10
	b.ne	LBB7_4
; %bb.3:                                ; %.if.true.102
	ldr	x8, [sp, #8]
	ldr	w9, [x8, #8]
	add	w9, w9, #1                      ; =1
	stp	w9, wzr, [x8, #8]
LBB7_4:                                 ; %.if.end.102
	ldr	x8, [sp, #8]
	mov	w2, #1
	mov	w19, #1
	ldr	w0, [x8, #4]
	add	x1, x8, #16                     ; =16
	bl	_read
	ldr	x9, [sp, #8]
	cbz	w0, LBB7_6
; %bb.5:                                ; %.if.end.119
	ldr	x8, [sp, #8]
	ldr	w9, [x9, #12]
	ldr	w10, [x8]
	add	w9, w9, #1                      ; =1
	str	w9, [x8, #12]
	add	w9, w10, #1                     ; =1
	str	w9, [x8]
	b	LBB7_7
LBB7_6:                                 ; %.if.true.119
	ldr	x8, [sp, #8]
	strb	wzr, [x9, #16]
	strb	w19, [x8, #17]
LBB7_7:                                 ; %common.ret.sink.split
	ldrb	w0, [x8, #16]
LBB7_8:                                 ; %common.ret
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48                     ; =48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod93.seek                    ; -- Begin function .mod93.seek
	.p2align	2
_.mod93.seek:                           ; @.mod93.seek
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	w8, [x0, #4]
Lloh0:
	adrp	x9, _SEEK_SET@PAGE
Lloh1:
	ldr	w2, [x9, _SEEK_SET@PAGEOFF]
	str	x0, [sp, #8]
	mov	w0, w8
	str	w1, [sp, #4]
	bl	_lseek
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32                     ; =32
	ret
	.loh AdrpLdr	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod93.new                     ; -- Begin function .mod93.new
	.p2align	2
_.mod93.new:                            ; @.mod93.new
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh2:
	adrp	x8, _PeekerInfo_size@PAGE
Lloh3:
	ldr	w8, [x8, _PeekerInfo_size@PAGEOFF]
	str	w0, [sp, #12]
	mov	w0, w8
	bl	_malloc
	ldr	w8, [sp, #12]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	mov	w9, #1
	str	x0, [sp]
	str	x9, [x0, #8]
	stp	wzr, w8, [x0]
	strh	wzr, [x0, #16]
	add	sp, sp, #32                     ; =32
	ret
	.loh AdrpLdr	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod167.push_token             ; -- Begin function .mod167.push_token
	.p2align	2
_.mod167.push_token:                    ; @.mod167.push_token
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48                     ; =48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh4:
	adrp	x8, _Token_size@PAGE
Lloh5:
	ldr	w8, [x8, _Token_size@PAGEOFF]
	stp	x1, x0, [sp, #16]
	str	x2, [sp, #8]
	mov	w0, w8
	bl	_malloc
	ldp	x9, x8, [sp, #8]
	ldr	x10, [sp, #24]
	ldr	x11, [sp, #24]
	str	x0, [sp]
	stp	x8, x9, [x0]
	ldr	x8, [x10]
	mov	x9, x0
	str	x8, [x0, #24]
	ldr	w8, [x10, #8]
	str	w8, [x0, #16]
	ldr	w8, [x10, #12]
	str	w8, [x0, #20]
	ldr	x8, [x10, #24]
	str	x8, [x0, #40]
	str	xzr, [x9, #32]
	ldr	x8, [x11, #24]
	cbz	x8, LBB10_2
; %bb.1:                                ; %.if.true.203
	ldr	x8, [sp, #24]
	ldr	x9, [sp]
	ldr	x8, [x8, #24]
	str	x9, [x8, #32]
LBB10_2:                                ; %.if.end.203
	ldr	x8, [sp, #24]
	ldr	x9, [sp]
	ldr	x10, [x8, #16]
	str	x9, [x8, #24]
	cbnz	x10, LBB10_4
; %bb.3:                                ; %.if.true.216
	ldr	x8, [sp]
	ldr	x9, [sp, #24]
	str	x8, [x9, #16]
LBB10_4:                                ; %.if.end.216
	ldr	x0, [sp]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48                     ; =48
	ret
	.loh AdrpLdr	Lloh4, Lloh5
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod167.tokenize               ; -- Begin function .mod167.tokenize
	.p2align	2
_.mod167.tokenize:                      ; @.mod167.tokenize
	.cfi_startproc
; %bb.0:
	stp	x28, x27, [sp, #-96]!           ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80                    ; =80
	sub	sp, sp, #48                     ; =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
Lloh6:
	adrp	x8, _ParseCtx_size@PAGE
Lloh7:
	ldr	w8, [x8, _ParseCtx_size@PAGEOFF]
	stur	x0, [x29, #-88]
	and	w9, w1, #0x1
	sturb	w9, [x29, #-89]
	mov	w0, w8
	bl	_malloc
	stur	x0, [x29, #-104]
	stp	xzr, xzr, [x0, #16]
	ldur	x0, [x29, #-88]
	mov	w8, #128
	stur	w8, [x29, #-108]
	stur	xzr, [x29, #-120]
	stur	wzr, [x29, #-124]
	bl	_.mod93.read
Lloh8:
	adrp	x19, _.str0@PAGE
Lloh9:
	adrp	x20, _.str1@PAGE
Lloh10:
	adrp	x21, _.str2@PAGE
Lloh11:
	adrp	x22, _.str3@PAGE
Lloh12:
	adrp	x23, _.str4@PAGE
Lloh13:
	adrp	x24, _.str5@PAGE
Lloh14:
	adrp	x25, _.str6@PAGE
Lloh15:
	adrp	x26, _.str7@PAGE
Lloh16:
	add	x19, x19, _.str0@PAGEOFF
Lloh17:
	add	x20, x20, _.str1@PAGEOFF
Lloh18:
	add	x21, x21, _.str2@PAGEOFF
Lloh19:
	add	x22, x22, _.str3@PAGEOFF
	mov	w27, #1
Lloh20:
	add	x23, x23, _.str4@PAGEOFF
Lloh21:
	add	x24, x24, _.str5@PAGEOFF
Lloh22:
	add	x25, x25, _.str6@PAGEOFF
Lloh23:
	add	x26, x26, _.str7@PAGEOFF
	sturb	w0, [x29, #-125]
	b	LBB11_4
LBB11_1:                                ; %.if.true.410
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldur	x0, [x29, #-104]
Lloh24:
	adrp	x1, _.str9@PAGE
Lloh25:
	adrp	x2, _.str10@PAGE
Lloh26:
	add	x1, x1, _.str9@PAGEOFF
Lloh27:
	add	x2, x2, _.str10@PAGEOFF
LBB11_2:                                ; %.if.true.249
                                        ;   in Loop: Header=BB11_4 Depth=1
	bl	_.mod167.push_token
LBB11_3:                                ; %.if.true.249
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldur	x0, [x29, #-88]
	bl	_.mod93.read
	sturb	w0, [x29, #-125]
LBB11_4:                                ; %.for.start.231
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB11_33 Depth 2
                                        ;     Child Loop BB11_26 Depth 2
                                        ;     Child Loop BB11_15 Depth 2
                                        ;     Child Loop BB11_20 Depth 2
                                        ;     Child Loop BB11_8 Depth 2
	ldur	x8, [x29, #-88]
	ldrb	w8, [x8, #17]
	cbnz	w8, LBB11_44
; %bb.5:                                ; %.for.continue.231
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldur	x8, [x29, #-88]
	ldur	x9, [x29, #-104]
	ldr	w10, [x8, #8]
	str	w10, [x9, #8]
	ldr	w8, [x8, #12]
	ldurb	w10, [x29, #-125]
	str	w8, [x9, #12]
	cbz	w10, LBB11_3
; %bb.6:                                ; %.if.false.249
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldurb	w0, [x29, #-125]
	bl	_.mod3.is_digit
	tbz	w0, #0, LBB11_10
; %bb.7:                                ; %.if.true.254
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldur	w0, [x29, #-108]
	bl	_malloc
	stur	x0, [x29, #-120]
	stur	wzr, [x29, #-124]
LBB11_8:                                ; %.for.start.257
                                        ;   Parent Loop BB11_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldurb	w0, [x29, #-125]
	bl	_.mod3.is_digit
	tbz	w0, #0, LBB11_17
; %bb.9:                                ; %.for.continue.257
                                        ;   in Loop: Header=BB11_8 Depth=2
	ldurb	w8, [x29, #-125]
	ldursw	x9, [x29, #-124]
	ldur	x10, [x29, #-120]
	mov	x1, x19
	strb	w8, [x10, x9]
	ldur	w8, [x29, #-124]
	ldur	w9, [x29, #-108]
	add	w8, w8, #1                      ; =1
	cmp	w8, w9
	cset	w0, lt
	stur	w8, [x29, #-124]
	bl	_.mod1.assert
	ldur	x0, [x29, #-88]
	bl	_.mod93.read
	sturb	w0, [x29, #-125]
	b	LBB11_8
LBB11_10:                               ; %.if.false.254
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldurb	w0, [x29, #-125]
	bl	_.mod3.is_letter
	tbnz	w0, #0, LBB11_18
; %bb.11:                               ; %.if.false.254
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldurb	w8, [x29, #-125]
	cmp	w8, #95                         ; =95
	b.eq	LBB11_18
; %bb.12:                               ; %.if.false.285
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldurb	w0, [x29, #-125]
	bl	_.mod3.is_whitespace
	tbnz	w0, #0, LBB11_3
; %bb.13:                               ; %.if.false.319
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldurb	w8, [x29, #-125]
	cmp	w8, #34                         ; =34
	b.ne	LBB11_24
; %bb.14:                               ; %.if.true.324
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldur	w0, [x29, #-108]
	bl	_malloc
	ldurb	w9, [x29, #-125]
	ldur	x8, [x29, #-88]
	stur	x0, [x29, #-120]
	strb	w9, [x0]
	mov	x0, x8
	bl	_.mod93.read
	sturb	w0, [x29, #-125]
	stur	w27, [x29, #-124]
LBB11_15:                               ; %.for.start.332
                                        ;   Parent Loop BB11_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldurb	w8, [x29, #-125]
	cmp	w8, #34                         ; =34
	b.eq	LBB11_28
; %bb.16:                               ; %.for.continue.332
                                        ;   in Loop: Header=BB11_15 Depth=2
	cmp	w8, #0                          ; =0
	cset	w0, ne
	mov	x1, x23
	bl	_.mod1.assert
	ldur	w8, [x29, #-108]
	ldur	w9, [x29, #-124]
	mov	x1, x24
	sub	w8, w8, #2                      ; =2
	cmp	w9, w8
	cset	w0, lt
	bl	_.mod1.assert
	ldurb	w8, [x29, #-125]
	ldursw	x9, [x29, #-124]
	ldur	x10, [x29, #-120]
	ldur	x0, [x29, #-88]
	strb	w8, [x10, x9]
	ldur	w8, [x29, #-124]
	add	w8, w8, #1                      ; =1
	stur	w8, [x29, #-124]
	bl	_.mod93.read
	sturb	w0, [x29, #-125]
	b	LBB11_15
LBB11_17:                               ; %.for.end.257
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldursw	x8, [x29, #-124]
	ldur	x9, [x29, #-120]
	ldur	x0, [x29, #-104]
	mov	x1, x20
	strb	wzr, [x9, x8]
	ldur	x2, [x29, #-120]
	bl	_.mod167.push_token
	b	LBB11_4
LBB11_18:                               ; %.if.true.285
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldur	w0, [x29, #-108]
	bl	_malloc
	stur	x0, [x29, #-120]
	stur	wzr, [x29, #-124]
	b	LBB11_20
LBB11_19:                               ; %.for.continue.288
                                        ;   in Loop: Header=BB11_20 Depth=2
	ldurb	w8, [x29, #-125]
	ldursw	x9, [x29, #-124]
	ldur	x10, [x29, #-120]
	mov	x1, x21
	strb	w8, [x10, x9]
	ldur	w8, [x29, #-124]
	ldur	w9, [x29, #-108]
	add	w8, w8, #1                      ; =1
	cmp	w8, w9
	cset	w0, lt
	stur	w8, [x29, #-124]
	bl	_.mod1.assert
	ldur	x0, [x29, #-88]
	bl	_.mod93.read
	sturb	w0, [x29, #-125]
LBB11_20:                               ; %.for.start.288
                                        ;   Parent Loop BB11_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldurb	w0, [x29, #-125]
	bl	_.mod3.is_letter
	ldurb	w8, [x29, #-125]
	mov	w28, w0
	mov	w0, w8
	bl	_.mod3.is_digit
	tbnz	w28, #0, LBB11_19
; %bb.21:                               ; %.for.start.288
                                        ;   in Loop: Header=BB11_20 Depth=2
	tbnz	w0, #0, LBB11_19
; %bb.22:                               ; %.for.start.288
                                        ;   in Loop: Header=BB11_20 Depth=2
	ldurb	w8, [x29, #-125]
	cmp	w8, #95                         ; =95
	b.eq	LBB11_19
; %bb.23:                               ; %.for.end.288
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldursw	x8, [x29, #-124]
	ldur	x9, [x29, #-120]
	ldur	x0, [x29, #-104]
	mov	x1, x22
	strb	wzr, [x9, x8]
	ldur	x2, [x29, #-120]
	bl	_.mod167.push_token
	b	LBB11_4
LBB11_24:                               ; %.if.false.324
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldurb	w8, [x29, #-125]
	cmp	w8, #39                         ; =39
	b.ne	LBB11_29
; %bb.25:                               ; %.if.true.369
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldur	w0, [x29, #-108]
	bl	_malloc
	ldurb	w9, [x29, #-125]
	ldur	x8, [x29, #-88]
	stur	x0, [x29, #-120]
	strb	w9, [x0]
	mov	x0, x8
	bl	_.mod93.read
	sturb	w0, [x29, #-125]
	stur	w27, [x29, #-124]
LBB11_26:                               ; %.for.start.377
                                        ;   Parent Loop BB11_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldurb	w8, [x29, #-125]
	cmp	w8, #39                         ; =39
	b.eq	LBB11_36
; %bb.27:                               ; %.for.continue.377
                                        ;   in Loop: Header=BB11_26 Depth=2
	ldur	w8, [x29, #-108]
	ldur	w9, [x29, #-124]
	mov	x1, x26
	sub	w8, w8, #2                      ; =2
	cmp	w9, w8
	cset	w0, lt
	bl	_.mod1.assert
	ldurb	w8, [x29, #-125]
	ldursw	x9, [x29, #-124]
	ldur	x10, [x29, #-120]
	ldur	x0, [x29, #-88]
	strb	w8, [x10, x9]
	ldur	w8, [x29, #-124]
	add	w8, w8, #1                      ; =1
	stur	w8, [x29, #-124]
	bl	_.mod93.read
	sturb	w0, [x29, #-125]
	b	LBB11_26
LBB11_28:                               ; %.for.end.332
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldursw	x9, [x29, #-124]
	ldur	x10, [x29, #-120]
	ldur	x0, [x29, #-88]
	strb	w8, [x10, x9]
	ldur	w8, [x29, #-124]
	ldur	x9, [x29, #-120]
	add	w8, w8, #1                      ; =1
	strb	wzr, [x9, w8, sxtw]
	bl	_.mod93.read
	ldur	x8, [x29, #-104]
	ldur	x2, [x29, #-120]
	sturb	w0, [x29, #-125]
	mov	x1, x25
	mov	x0, x8
	bl	_.mod167.push_token
	b	LBB11_4
LBB11_29:                               ; %.if.false.369
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldurb	w8, [x29, #-125]
	cmp	w8, #10                         ; =10
	b.eq	LBB11_1
; %bb.30:                               ; %.if.false.410
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldurb	w8, [x29, #-125]
	cmp	w8, #45                         ; =45
	b.ne	LBB11_37
; %bb.31:                               ; %.if.true.419
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldur	x0, [x29, #-88]
	bl	_.mod93.read
	and	w8, w0, #0xff
	cmp	w8, #45                         ; =45
	sturb	w0, [x29, #-125]
	b.ne	LBB11_40
; %bb.32:                               ; %.if.true.424
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldur	w0, [x29, #-108]
	bl	_malloc
	mov	w8, #45
	stur	x0, [x29, #-120]
	strb	w8, [x0]
	stur	w27, [x29, #-124]
LBB11_33:                               ; %.for.start.429
                                        ;   Parent Loop BB11_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldurb	w8, [x29, #-125]
	cmp	w8, #10                         ; =10
	b.eq	LBB11_41
; %bb.34:                               ; %.for.start.429
                                        ;   in Loop: Header=BB11_33 Depth=2
	cbz	w8, LBB11_41
; %bb.35:                               ; %.for.continue.429
                                        ;   in Loop: Header=BB11_33 Depth=2
	ldurb	w8, [x29, #-125]
	ldursw	x9, [x29, #-124]
	ldur	x10, [x29, #-120]
	ldur	x0, [x29, #-88]
	strb	w8, [x10, x9]
	ldur	w8, [x29, #-124]
	add	w8, w8, #1                      ; =1
	stur	w8, [x29, #-124]
	bl	_.mod93.read
	sturb	w0, [x29, #-125]
	b	LBB11_33
LBB11_36:                               ; %.for.end.377
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldurb	w8, [x29, #-125]
	ldursw	x9, [x29, #-124]
	ldur	x10, [x29, #-120]
	ldur	x0, [x29, #-88]
	strb	w8, [x10, x9]
	ldur	w8, [x29, #-124]
	ldur	x9, [x29, #-120]
	add	w8, w8, #1                      ; =1
	strb	wzr, [x9, w8, sxtw]
	bl	_.mod93.read
	ldur	x8, [x29, #-104]
	ldur	x2, [x29, #-120]
Lloh28:
	adrp	x1, _.str8@PAGE
	sturb	w0, [x29, #-125]
	mov	x0, x8
Lloh29:
	add	x1, x1, _.str8@PAGEOFF
	bl	_.mod167.push_token
	b	LBB11_4
LBB11_37:                               ; %.if.false.419
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldurb	w8, [x29, #-125]
	cmp	w8, #127                        ; =127
	b.ne	LBB11_39
; %bb.38:                               ; %.if.true.461
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldur	x8, [x29, #-104]
	ldurb	w10, [x29, #-125]
	ldp	w9, w8, [x8, #8]
	sub	sp, sp, #32                     ; =32
Lloh30:
	adrp	x0, _.str14@PAGE
Lloh31:
	add	x0, x0, _.str14@PAGEOFF
	stp	x10, x10, [sp, #16]
	stp	x9, x8, [sp]
	bl	_printf
	add	sp, sp, #32                     ; =32
	mov	w0, #1
	bl	_exit
LBB11_39:                               ; %.if.end.461
                                        ;   in Loop: Header=BB11_4 Depth=1
	mov	w0, #2
	bl	_malloc
	ldurb	w8, [x29, #-125]
	stur	x0, [x29, #-120]
Lloh32:
	adrp	x1, _.str15@PAGE
Lloh33:
	add	x1, x1, _.str15@PAGEOFF
	strb	w8, [x0]
	ldur	x8, [x29, #-120]
	ldur	x0, [x29, #-104]
	strb	wzr, [x8, #1]
	ldur	x2, [x29, #-120]
	b	LBB11_2
LBB11_40:                               ; %.if.false.424
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldur	x0, [x29, #-104]
Lloh34:
	adrp	x1, _.str12@PAGE
Lloh35:
	adrp	x2, _.str13@PAGE
Lloh36:
	add	x1, x1, _.str12@PAGEOFF
Lloh37:
	add	x2, x2, _.str13@PAGEOFF
	bl	_.mod167.push_token
	b	LBB11_4
LBB11_41:                               ; %.for.end.429
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldurb	w9, [x29, #-89]
	ldursw	x8, [x29, #-124]
	ldur	x10, [x29, #-120]
	cmp	w9, #1                          ; =1
	strb	wzr, [x10, x8]
	b.ne	LBB11_43
; %bb.42:                               ; %.if.true.447
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldur	x0, [x29, #-104]
	ldur	x2, [x29, #-120]
Lloh38:
	adrp	x1, _.str11@PAGE
Lloh39:
	add	x1, x1, _.str11@PAGEOFF
	bl	_.mod167.push_token
	b	LBB11_4
LBB11_43:                               ; %.if.false.447
                                        ;   in Loop: Header=BB11_4 Depth=1
	ldur	x0, [x29, #-120]
	bl	_free
	b	LBB11_4
LBB11_44:                               ; %.for.end.231
	ldur	x0, [x29, #-104]
Lloh40:
	adrp	x1, _.str16@PAGE
Lloh41:
	adrp	x2, _.str17@PAGE
Lloh42:
	add	x1, x1, _.str16@PAGEOFF
Lloh43:
	add	x2, x2, _.str17@PAGEOFF
	bl	_.mod167.push_token
	ldur	x8, [x29, #-104]
	mov	x19, sp
	sub	x9, x19, #16                    ; =16
	ldr	x8, [x8, #16]
	mov	sp, x9
	ldur	x0, [x29, #-104]
	stur	x8, [x19, #-16]
	bl	_free
	ldur	x0, [x19, #-16]
	sub	sp, x29, #80                    ; =80
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh15, Lloh23
	.loh AdrpAdd	Lloh14, Lloh22
	.loh AdrpAdd	Lloh13, Lloh21
	.loh AdrpAdd	Lloh12, Lloh20
	.loh AdrpAdd	Lloh11, Lloh19
	.loh AdrpAdd	Lloh10, Lloh18
	.loh AdrpAdd	Lloh9, Lloh17
	.loh AdrpAdd	Lloh8, Lloh16
	.loh AdrpLdr	Lloh6, Lloh7
	.loh AdrpAdd	Lloh25, Lloh27
	.loh AdrpAdd	Lloh24, Lloh26
	.loh AdrpAdd	Lloh28, Lloh29
	.loh AdrpAdd	Lloh30, Lloh31
	.loh AdrpAdd	Lloh32, Lloh33
	.loh AdrpAdd	Lloh35, Lloh37
	.loh AdrpAdd	Lloh34, Lloh36
	.loh AdrpAdd	Lloh38, Lloh39
	.loh AdrpAdd	Lloh41, Lloh43
	.loh AdrpAdd	Lloh40, Lloh42
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod497.from                   ; -- Begin function .mod497.from
	.p2align	2
_.mod497.from:                          ; @.mod497.from
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x3, x1
	ldp	w1, w2, [x0, #16]
	stp	x3, x0, [sp]
	mov	x0, xzr
	bl	_.mod497.new
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32                     ; =32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod497.new                    ; -- Begin function .mod497.new
	.p2align	2
_.mod497.new:                           ; @.mod497.new
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48                     ; =48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh44:
	adrp	x8, _Error_size@PAGE
	str	x0, [sp, #24]
Lloh45:
	ldr	w0, [x8, _Error_size@PAGEOFF]
	stp	w2, w1, [sp, #16]
	str	x3, [sp, #8]
	bl	_malloc
	ldp	w9, w8, [sp, #16]
	ldr	x10, [sp, #8]
	ldr	x11, [sp, #24]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	str	x0, [sp]
	stp	w8, w9, [x0]
	stp	x11, x10, [x0, #8]
	add	sp, sp, #48                     ; =48
	ret
	.loh AdrpLdr	Lloh44, Lloh45
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod497.report                 ; -- Begin function .mod497.report
	.p2align	2
_.mod497.report:                        ; @.mod497.report
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48                     ; =48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x0, #16]
	ldp	w9, w10, [x0]
	stp	x8, x0, [sp, #16]
Lloh46:
	adrp	x0, _.str18@PAGE
Lloh47:
	add	x0, x0, _.str18@PAGEOFF
	stp	x9, x10, [sp]
	bl	_printf
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48                     ; =48
	ret
	.loh AdrpAdd	Lloh46, Lloh47
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod92.debug_matcher           ; -- Begin function .mod92.debug_matcher
	.p2align	2
_.mod92.debug_matcher:                  ; @.mod92.debug_matcher
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64                     ; =64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #24]
Lloh48:
	adrp	x0, _.str19@PAGE
Lloh49:
	add	x0, x0, _.str19@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #24]
Lloh50:
	adrp	x19, _.str20@PAGE
Lloh51:
	adrp	x20, _.str21@PAGE
Lloh52:
	add	x19, x19, _.str20@PAGEOFF
	ldr	x8, [x8]
Lloh53:
	add	x20, x20, _.str21@PAGEOFF
	str	x8, [sp, #16]
	b	LBB15_3
LBB15_1:                                ; %.if.false.546
                                        ;   in Loop: Header=BB15_3 Depth=1
	ldr	x8, [sp, #16]
	mov	x0, x20
LBB15_2:                                ; %.if.end.546
                                        ;   in Loop: Header=BB15_3 Depth=1
	ldr	x9, [x8, #8]
	ldrb	w8, [x8]
	stp	x8, x9, [sp]
	bl	_printf
	ldr	x8, [sp, #16]
	ldr	x8, [x8, #16]
	str	x8, [sp, #16]
LBB15_3:                                ; %.for.start.539
                                        ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #16]
	cbz	x8, LBB15_6
; %bb.4:                                ; %.for.continue.539
                                        ;   in Loop: Header=BB15_3 Depth=1
	ldr	x8, [sp, #16]
	ldrb	w8, [x8]
	cmp	w8, #118                        ; =118
	b.ne	LBB15_1
; %bb.5:                                ; %.if.true.546
                                        ;   in Loop: Header=BB15_3 Depth=1
	ldr	x8, [sp, #16]
	mov	x0, x19
	b	LBB15_2
LBB15_6:                                ; %.for.end.539
Lloh54:
	adrp	x0, _.str22@PAGE
Lloh55:
	add	x0, x0, _.str22@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #24]
	ldr	x8, [x8, #24]
	cbz	x8, LBB15_8
; %bb.7:                                ; %.if.true.572
	ldr	x8, [sp, #24]
	ldr	x0, [x8, #24]
	bl	_.mod92.debug_matcher
LBB15_8:                                ; %.if.end.572
Lloh56:
	adrp	x0, _.str23@PAGE
Lloh57:
	add	x0, x0, _.str23@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #24]
	ldr	x8, [x8, #16]
	cbz	x8, LBB15_10
; %bb.9:                                ; %.if.true.583
	ldr	x8, [sp, #24]
	ldr	x0, [x8, #16]
	bl	_.mod92.debug_matcher
LBB15_10:                               ; %.if.end.583
Lloh58:
	adrp	x0, _.str24@PAGE
Lloh59:
	add	x0, x0, _.str24@PAGEOFF
	bl	_printf
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64                     ; =64
	ret
	.loh AdrpAdd	Lloh51, Lloh53
	.loh AdrpAdd	Lloh50, Lloh52
	.loh AdrpAdd	Lloh48, Lloh49
	.loh AdrpAdd	Lloh54, Lloh55
	.loh AdrpAdd	Lloh56, Lloh57
	.loh AdrpAdd	Lloh58, Lloh59
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod92.new_context             ; -- Begin function .mod92.new_context
	.p2align	2
_.mod92.new_context:                    ; @.mod92.new_context
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64                     ; =64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh60:
	adrp	x8, _ParsingContext_size@PAGE
Lloh61:
	ldr	w8, [x8, _ParsingContext_size@PAGEOFF]
	str	x0, [sp, #40]
	mov	w0, w8
	bl	_malloc
	ldr	x8, [sp, #40]
	str	x0, [sp, #32]
	mov	x0, x8
	bl	_fileno
	str	w0, [sp, #28]
	bl	_.mod93.new
	mov	w1, wzr
	str	x0, [sp, #16]
	bl	_.mod167.tokenize
	ldr	x8, [sp, #16]
	str	x0, [sp, #8]
	mov	x0, x8
	bl	_free
	ldr	x8, [sp, #8]
	ldr	x0, [sp, #32]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	str	x8, [x0]
	add	sp, sp, #64                     ; =64
	ret
	.loh AdrpLdr	Lloh60, Lloh61
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod92.new_matcher             ; -- Begin function .mod92.new_matcher
	.p2align	2
_.mod92.new_matcher:                    ; @.mod92.new_matcher
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh62:
	adrp	x8, _Matcher_size@PAGE
Lloh63:
	ldr	w0, [x8, _Matcher_size@PAGEOFF]
	bl	_malloc
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	mov	w8, #49
	str	x0, [sp, #8]
	stp	xzr, xzr, [x0, #16]
	strb	w8, [x0, #8]
	str	xzr, [x0]
	add	sp, sp, #32                     ; =32
	ret
	.loh AdrpLdr	Lloh62, Lloh63
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod92.parse_matcher           ; -- Begin function .mod92.parse_matcher
	.p2align	2
_.mod92.parse_matcher:                  ; @.mod92.parse_matcher
	.cfi_startproc
; %bb.0:
	stp	x26, x25, [sp, #-80]!           ; 16-byte Folded Spill
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64                    ; =64
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	stur	x0, [x29, #-72]
	ldr	x8, [x0]
Lloh64:
	adrp	x1, _.str25@PAGE
Lloh65:
	add	x1, x1, _.str25@PAGEOFF
	ldr	x0, [x8, #8]
	bl	_strcmp
	ldur	x8, [x29, #-72]
	cbz	w0, LBB18_2
; %bb.1:                                ; %.if.false.627
	mov	x0, x8
	bl	_.mod92.parse_simple_matcher
	stur	x0, [x29, #-80]
	b	LBB18_21
LBB18_2:                                ; %.if.true.627
	ldr	x8, [x8]
	ldur	x9, [x29, #-72]
	ldr	x8, [x8, #32]
	str	x8, [x9]
	mov	x8, sp
	sub	x9, x8, #16                     ; =16
	mov	sp, x9
	ldur	x0, [x29, #-72]
	mov	w9, #10
	stur	w9, [x8, #-16]
	bl	_.mod92.parse_matcher
	ldur	x8, [x29, #-72]
Lloh66:
	adrp	x1, _.str26@PAGE
	stur	x0, [x29, #-80]
Lloh67:
	add	x1, x1, _.str26@PAGEOFF
	ldr	x8, [x8]
	ldr	x8, [x8, #8]
	mov	x0, x8
	bl	_strcmp
	cbz	w0, LBB18_9
LBB18_3:                                ; %.if.end.645
	ldur	x8, [x29, #-72]
Lloh68:
	adrp	x1, _.str33@PAGE
Lloh69:
	add	x1, x1, _.str33@PAGEOFF
	ldr	x8, [x8]
	ldr	x0, [x8, #8]
	bl	_strcmp
	cbz	w0, LBB18_5
; %bb.4:                                ; %.if.true.739
	ldur	x0, [x29, #-72]
Lloh70:
	adrp	x1, _.str34@PAGE
Lloh71:
	add	x1, x1, _.str34@PAGEOFF
	bl	_.mod92.parser_error
LBB18_5:                                ; %.if.end.739
	ldur	x8, [x29, #-72]
Lloh72:
	adrp	x1, _.str35@PAGE
Lloh73:
	add	x1, x1, _.str35@PAGEOFF
	ldr	x9, [x8]
	ldr	x9, [x9, #32]
	str	x9, [x8]
	ldur	x8, [x29, #-72]
	ldr	x8, [x8]
	ldr	x0, [x8, #8]
	bl	_strcmp
	ldur	x8, [x29, #-72]
	ldr	x8, [x8]
	cbz	w0, LBB18_17
; %bb.6:                                ; %.if.false.758
	ldr	x0, [x8, #8]
Lloh74:
	adrp	x1, _.str36@PAGE
Lloh75:
	add	x1, x1, _.str36@PAGEOFF
	bl	_strcmp
	ldur	x8, [x29, #-72]
	ldr	x8, [x8]
	cbz	w0, LBB18_18
; %bb.7:                                ; %.if.false.776
	ldr	x0, [x8, #8]
Lloh76:
	adrp	x1, _.str37@PAGE
Lloh77:
	add	x1, x1, _.str37@PAGEOFF
	bl	_strcmp
	cbnz	w0, LBB18_21
; %bb.8:                                ; %.if.true.794
	ldp	x10, x8, [x29, #-80]
	mov	w11, #63
	ldr	x9, [x8]
	ldr	x9, [x9, #32]
	str	x9, [x8]
	b	LBB18_20
LBB18_9:                                ; %.if.true.645
	ldp	x10, x8, [x29, #-80]
	ldr	x9, [x8]
	ldr	x9, [x9, #32]
	str	x9, [x8]
	mov	x8, sp
	sub	x26, x8, #16                    ; =16
	mov	sp, x26
Lloh78:
	adrp	x19, _.str27@PAGE
Lloh79:
	adrp	x20, _.str28@PAGE
Lloh80:
	adrp	x21, _.str29@PAGE
Lloh81:
	adrp	x22, _.str30@PAGE
Lloh82:
	adrp	x23, _.str31@PAGE
Lloh83:
	adrp	x24, _.str32@PAGE
Lloh84:
	add	x19, x19, _.str27@PAGEOFF
Lloh85:
	add	x20, x20, _.str28@PAGEOFF
Lloh86:
	add	x21, x21, _.str29@PAGEOFF
Lloh87:
	add	x22, x22, _.str30@PAGEOFF
Lloh88:
	add	x23, x23, _.str31@PAGEOFF
Lloh89:
	add	x24, x24, _.str32@PAGEOFF
	stur	x10, [x8, #-16]
LBB18_10:                               ; %.for.start.654
                                        ; =>This Inner Loop Header: Depth=1
	ldur	x8, [x29, #-72]
	mov	x1, x19
	ldr	x8, [x8]
	ldr	x0, [x8, #8]
	bl	_strcmp
	ldur	x8, [x29, #-72]
	mov	w25, w0
	mov	x1, x20
	ldr	x8, [x8]
	ldr	x8, [x8]
	mov	x0, x8
	bl	_strcmp
	cbz	w25, LBB18_3
; %bb.11:                               ; %.for.start.654
                                        ;   in Loop: Header=BB18_10 Depth=1
	cbz	w0, LBB18_3
; %bb.12:                               ; %.for.continue.654
                                        ;   in Loop: Header=BB18_10 Depth=1
	ldur	x0, [x29, #-72]
	bl	_.mod92.parse_matcher
	ldr	x8, [x26]
	str	x0, [x26]
	mov	x1, x21
	str	x0, [x8, #16]
	ldur	x8, [x29, #-72]
	ldr	x8, [x8]
	ldr	x8, [x8, #8]
	mov	x0, x8
	bl	_strcmp
	ldur	x8, [x29, #-72]
	mov	w25, w0
	mov	x1, x22
	ldr	x8, [x8]
	ldr	x8, [x8, #8]
	mov	x0, x8
	bl	_strcmp
	cbz	w25, LBB18_15
; %bb.13:                               ; %.for.continue.654
                                        ;   in Loop: Header=BB18_10 Depth=1
	cbz	w0, LBB18_15
; %bb.14:                               ; %.if.true.696
                                        ;   in Loop: Header=BB18_10 Depth=1
	ldur	x8, [x29, #-72]
	ldr	x8, [x8]
	ldr	x9, [x8, #8]
	ldp	w10, w8, [x8, #16]
	sub	sp, sp, #32                     ; =32
	mov	x0, x23
	stp	x8, x9, [sp, #8]
	str	x10, [sp]
	bl	_printf
	add	sp, sp, #32                     ; =32
	mov	w0, #1
	bl	_exit
LBB18_15:                               ; %.if.end.696
                                        ;   in Loop: Header=BB18_10 Depth=1
	ldur	x8, [x29, #-72]
	mov	x1, x24
	ldr	x8, [x8]
	ldr	x0, [x8, #8]
	bl	_strcmp
	cbnz	w0, LBB18_10
; %bb.16:                               ; %.if.true.723
                                        ;   in Loop: Header=BB18_10 Depth=1
	ldur	x8, [x29, #-72]
	ldr	x9, [x8]
	ldr	x9, [x9, #32]
	str	x9, [x8]
	b	LBB18_10
LBB18_17:                               ; %.if.true.758
	ldr	x8, [x8, #32]
	ldp	x10, x9, [x29, #-80]
	mov	w11, #43
	b	LBB18_19
LBB18_18:                               ; %.if.true.776
	ldr	x8, [x8, #32]
	ldp	x10, x9, [x29, #-80]
	mov	w11, #42
LBB18_19:                               ; %.if.end.627
	str	x8, [x9]
LBB18_20:                               ; %.if.end.627
	strb	w11, [x10, #8]
LBB18_21:                               ; %.if.end.627
	ldur	x8, [x29, #-72]
Lloh90:
	adrp	x1, _.str38@PAGE
Lloh91:
	add	x1, x1, _.str38@PAGEOFF
	ldr	x8, [x8]
	ldr	x0, [x8, #8]
	bl	_strcmp
	ldur	x8, [x29, #-72]
	mov	w19, w0
Lloh92:
	adrp	x1, _.str39@PAGE
Lloh93:
	add	x1, x1, _.str39@PAGEOFF
	ldr	x8, [x8]
	ldr	x0, [x8]
	bl	_strcmp
	cbz	w19, LBB18_23
; %bb.22:                               ; %.if.end.627
	cbnz	w0, LBB18_24
LBB18_23:                               ; %.if.true.823
	ldur	x0, [x29, #-72]
	bl	_.mod92.parse_matcher
	ldur	x8, [x29, #-80]
	str	x0, [x8, #24]
LBB18_24:                               ; %.if.end.823
	ldur	x0, [x29, #-80]
	sub	sp, x29, #64                    ; =64
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh64, Lloh65
	.loh AdrpAdd	Lloh66, Lloh67
	.loh AdrpAdd	Lloh68, Lloh69
	.loh AdrpAdd	Lloh70, Lloh71
	.loh AdrpAdd	Lloh72, Lloh73
	.loh AdrpAdd	Lloh74, Lloh75
	.loh AdrpAdd	Lloh76, Lloh77
	.loh AdrpAdd	Lloh83, Lloh89
	.loh AdrpAdd	Lloh82, Lloh88
	.loh AdrpAdd	Lloh81, Lloh87
	.loh AdrpAdd	Lloh80, Lloh86
	.loh AdrpAdd	Lloh79, Lloh85
	.loh AdrpAdd	Lloh78, Lloh84
	.loh AdrpAdd	Lloh92, Lloh93
	.loh AdrpAdd	Lloh90, Lloh91
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod92.parse_simple_matcher    ; -- Begin function .mod92.parse_simple_matcher
	.p2align	2
_.mod92.parse_simple_matcher:           ; @.mod92.parse_simple_matcher
	.cfi_startproc
; %bb.0:
	stp	x28, x27, [sp, #-96]!           ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80                    ; =80
	sub	sp, sp, #32                     ; =32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	stur	x0, [x29, #-88]
	bl	_.mod92.new_matcher
	ldur	x8, [x29, #-88]
Lloh94:
	adrp	x19, _.str40@PAGE
Lloh95:
	adrp	x20, _.str41@PAGE
Lloh96:
	add	x19, x19, _.str40@PAGEOFF
	ldr	x8, [x8]
Lloh97:
	add	x20, x20, _.str41@PAGEOFF
	stur	x0, [x29, #-96]
	stur	wzr, [x29, #-100]
	stur	x8, [x29, #-112]
	b	LBB19_2
LBB19_1:                                ; %.for.continue.833
                                        ;   in Loop: Header=BB19_2 Depth=1
	ldur	x8, [x29, #-112]
	ldur	w9, [x29, #-100]
	ldr	x8, [x8, #32]
	add	w9, w9, #1                      ; =1
	stur	w9, [x29, #-100]
	stur	x8, [x29, #-112]
LBB19_2:                                ; %.for.start.833
                                        ; =>This Inner Loop Header: Depth=1
	ldur	x8, [x29, #-112]
	mov	x1, x19
	ldr	x0, [x8]
	bl	_strcmp
	ldur	x8, [x29, #-112]
	mov	w21, w0
	mov	x1, x20
	ldr	x8, [x8]
	mov	x0, x8
	bl	_strcmp
	cbz	w21, LBB19_1
; %bb.3:                                ; %.for.start.833
                                        ;   in Loop: Header=BB19_2 Depth=1
	cbz	w0, LBB19_1
; %bb.4:                                ; %.for.end.833
Lloh98:
	adrp	x8, _Query_size@PAGE
Lloh99:
	ldr	w19, [x8, _Query_size@PAGEOFF]
	cmp	w19, #1                         ; =1
	b.lt	LBB19_6
; %bb.5:                                ; %.if.true.854
	mov	w0, w19
	bl	_malloc
	ldur	x8, [x29, #-96]
	b	LBB19_7
LBB19_6:                                ; %.if.false.854
	ldur	x8, [x29, #-96]
	mov	x0, xzr
LBB19_7:                                ; %.if.end.854
	ldur	x9, [x29, #-96]
	str	x0, [x8]
	ldr	x8, [x9]
	mov	x9, sp
	sub	x23, x9, #16                    ; =16
	mov	sp, x23
	stur	x8, [x9, #-16]
	mov	x8, sp
	sub	x24, x8, #16                    ; =16
	mov	sp, x24
Lloh100:
	adrp	x20, _.str42@PAGE
Lloh101:
	adrp	x21, _.str43@PAGE
Lloh102:
	adrp	x22, _.str44@PAGE
Lloh103:
	add	x20, x20, _.str42@PAGEOFF
	mov	w25, #118
	mov	w26, #97
	mov	w27, #116
Lloh104:
	add	x21, x21, _.str43@PAGEOFF
Lloh105:
	add	x22, x22, _.str44@PAGEOFF
	stur	wzr, [x8, #-16]
	b	LBB19_10
LBB19_8:                                ; %.if.true.888
                                        ;   in Loop: Header=BB19_10 Depth=1
	ldr	x8, [x23]
	strb	w25, [x8]
LBB19_9:                                ; %.if.end.888
                                        ;   in Loop: Header=BB19_10 Depth=1
	ldur	x8, [x29, #-88]
	ldr	x10, [x23]
	ldr	x9, [x8]
	ldr	x9, [x9, #8]
	stp	x9, xzr, [x10, #8]
	ldr	x9, [x8]
	ldr	w10, [x24]
	ldr	x9, [x9, #32]
	add	w10, w10, #1                    ; =1
	str	w10, [x24]
	str	x9, [x8]
LBB19_10:                               ; %.for.start.865
                                        ; =>This Inner Loop Header: Depth=1
	ldr	w8, [x24]
	ldur	w9, [x29, #-100]
	cmp	w8, w9
	b.ge	LBB19_19
; %bb.11:                               ; %.for.continue.865
                                        ;   in Loop: Header=BB19_10 Depth=1
	ldr	w8, [x24]
	cmp	w8, #1                          ; =1
	b.lt	LBB19_13
; %bb.12:                               ; %.if.true.871
                                        ;   in Loop: Header=BB19_10 Depth=1
	mov	w0, w19
	bl	_malloc
	ldr	x8, [x23]
	str	x0, [x23]
	str	x0, [x8, #16]
LBB19_13:                               ; %.if.end.871
                                        ;   in Loop: Header=BB19_10 Depth=1
	ldur	x8, [x29, #-88]
	mov	x1, x20
	ldr	x8, [x8]
	ldr	x0, [x8]
	bl	_strcmp
	cbz	w0, LBB19_8
; %bb.14:                               ; %.if.false.888
                                        ;   in Loop: Header=BB19_10 Depth=1
	ldur	x8, [x29, #-88]
	ldr	x8, [x8]
	ldr	x0, [x8, #8]
	bl	_.mod3.is_lower
	tbz	w0, #0, LBB19_16
; %bb.15:                               ; %.if.true.897
                                        ;   in Loop: Header=BB19_10 Depth=1
	ldr	x8, [x23]
	strb	w26, [x8]
	b	LBB19_9
LBB19_16:                               ; %.if.false.897
                                        ;   in Loop: Header=BB19_10 Depth=1
	ldur	x8, [x29, #-88]
	ldr	x8, [x8]
	ldr	x0, [x8, #8]
	bl	_.mod3.is_upper
	tbz	w0, #0, LBB19_18
; %bb.17:                               ; %.if.true.906
                                        ;   in Loop: Header=BB19_10 Depth=1
	ldr	x8, [x23]
	strb	w27, [x8]
	b	LBB19_9
LBB19_18:                               ; %.if.false.906
                                        ;   in Loop: Header=BB19_10 Depth=1
	ldur	x8, [x29, #-88]
	ldr	x8, [x8]
	ldr	x8, [x8, #8]
	str	x8, [sp, #-16]!
	mov	x0, x21
	bl	_printf
	add	sp, sp, #16                     ; =16
	ldur	x0, [x29, #-88]
	mov	x1, x22
	bl	_.mod92.parser_error
	b	LBB19_9
LBB19_19:                               ; %.for.end.865
	ldur	x0, [x29, #-96]
	sub	sp, x29, #80                    ; =80
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh95, Lloh97
	.loh AdrpAdd	Lloh94, Lloh96
	.loh AdrpLdr	Lloh98, Lloh99
	.loh AdrpAdd	Lloh102, Lloh105
	.loh AdrpAdd	Lloh101, Lloh104
	.loh AdrpAdd	Lloh100, Lloh103
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod92.parse_rule              ; -- Begin function .mod92.parse_rule
	.p2align	2
_.mod92.parse_rule:                     ; @.mod92.parse_rule
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16                    ; =16
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	ldr	x8, [x0]
Lloh106:
	adrp	x1, _.str45@PAGE
Lloh107:
	add	x1, x1, _.str45@PAGEOFF
	ldp	x8, x9, [x8]
	stp	x9, x0, [x29, #-32]
	mov	x0, x8
	bl	_strcmp
	cbz	w0, LBB20_2
; %bb.1:                                ; %.if.true.951
	ldur	x8, [x29, #-24]
Lloh108:
	adrp	x0, _.str46@PAGE
Lloh109:
	add	x0, x0, _.str46@PAGEOFF
	ldr	x8, [x8]
	ldp	x9, x8, [x8]
	stp	x9, x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16                     ; =16
	ldur	x0, [x29, #-24]
Lloh110:
	adrp	x1, _.str47@PAGE
Lloh111:
	add	x1, x1, _.str47@PAGEOFF
	bl	_.mod92.parser_error
LBB20_2:                                ; %.if.end.951
	ldur	x8, [x29, #-24]
Lloh112:
	adrp	x1, _.str48@PAGE
Lloh113:
	add	x1, x1, _.str48@PAGEOFF
	ldr	x9, [x8]
	ldr	x9, [x9, #32]
	str	x9, [x8]
	ldr	x0, [x9, #8]
	bl	_strcmp
	cbz	w0, LBB20_4
; %bb.3:                                ; %.if.true.982
	ldur	x0, [x29, #-24]
Lloh114:
	adrp	x1, _.str49@PAGE
Lloh115:
	add	x1, x1, _.str49@PAGEOFF
	bl	_.mod92.parser_error
LBB20_4:                                ; %.if.end.982
	ldur	x8, [x29, #-24]
Lloh116:
	adrp	x10, _Rule_size@PAGE
Lloh117:
	ldr	w0, [x10, _Rule_size@PAGEOFF]
	ldr	x9, [x8]
	ldr	x9, [x9, #32]
	str	x9, [x8]
	bl	_malloc
	mov	x19, sp
	sub	x8, x19, #16                    ; =16
	mov	sp, x8
	ldp	x9, x8, [x29, #-32]
	stur	x0, [x19, #-16]
	str	x9, [x0]
	mov	x0, x8
	bl	_.mod92.parse_matcher
	ldur	x8, [x19, #-16]
	str	x0, [x8, #8]
	mov	x0, x8
	sub	sp, x29, #16                    ; =16
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh106, Lloh107
	.loh AdrpAdd	Lloh110, Lloh111
	.loh AdrpAdd	Lloh108, Lloh109
	.loh AdrpAdd	Lloh112, Lloh113
	.loh AdrpAdd	Lloh114, Lloh115
	.loh AdrpLdr	Lloh116, Lloh117
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod92.parser_error            ; -- Begin function .mod92.parser_error
	.p2align	2
_.mod92.parser_error:                   ; @.mod92.parser_error
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48                     ; =48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x0]
	stp	x1, x0, [sp, #16]
	mov	x0, x8
	bl	_.mod497.from
	str	x0, [sp, #8]
	bl	_.mod497.report
	mov	w0, #1
	bl	_exit
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48                     ; =48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod92.parse_grammar           ; -- Begin function .mod92.parse_grammar
	.p2align	2
_.mod92.parse_grammar:                  ; @.mod92.parse_grammar
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64                     ; =64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
Lloh118:
	adrp	x8, _ptr_size@PAGE
Lloh119:
	ldr	w8, [x8, _ptr_size@PAGEOFF]
	str	x0, [sp, #24]
	mov	w9, #40
	str	w9, [sp, #20]
	add	w8, w8, w8, lsl #2
	lsl	w0, w8, #3
	bl	_malloc
Lloh120:
	adrp	x19, _.str50@PAGE
Lloh121:
	adrp	x20, _.str51@PAGE
Lloh122:
	add	x19, x19, _.str50@PAGEOFF
Lloh123:
	add	x20, x20, _.str51@PAGEOFF
	str	x0, [sp, #8]
	str	wzr, [sp, #4]
	b	LBB22_2
LBB22_1:                                ; %.for.end.1031
                                        ;   in Loop: Header=BB22_2 Depth=1
	ldr	w8, [sp, #4]
	add	w8, w8, #1                      ; =1
	str	w8, [sp, #4]
LBB22_2:                                ; %.for.start.1017
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB22_4 Depth 2
	ldr	x8, [sp, #24]
	mov	x1, x19
	ldr	x8, [x8]
	ldr	x0, [x8]
	bl	_strcmp
	cbz	w0, LBB22_6
; %bb.3:                                ; %.for.continue.1017
                                        ;   in Loop: Header=BB22_2 Depth=1
	ldr	x0, [sp, #24]
	bl	_.mod92.parse_rule
	ldrsw	x8, [sp, #4]
	ldr	x9, [sp, #8]
	str	x0, [x9, x8, lsl #3]
LBB22_4:                                ; %.for.start.1031
                                        ;   Parent Loop BB22_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	x8, [sp, #24]
	mov	x1, x20
	ldr	x8, [x8]
	ldr	x0, [x8, #8]
	bl	_strcmp
	cbnz	w0, LBB22_1
; %bb.5:                                ; %.for.continue.1031
                                        ;   in Loop: Header=BB22_4 Depth=2
	ldr	x8, [sp, #24]
	ldr	x9, [x8]
	ldr	x9, [x9, #32]
	str	x9, [x8]
	b	LBB22_4
LBB22_6:                                ; %.for.end.1017
	ldr	x0, [sp, #8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64                     ; =64
	ret
	.loh AdrpAdd	Lloh121, Lloh123
	.loh AdrpAdd	Lloh120, Lloh122
	.loh AdrpLdr	Lloh118, Lloh119
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod92.new_node                ; -- Begin function .mod92.new_node
	.p2align	2
_.mod92.new_node:                       ; @.mod92.new_node
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48                     ; =48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh124:
	adrp	x8, _Node_size@PAGE
Lloh125:
	ldr	w8, [x8, _Node_size@PAGEOFF]
	stp	x1, x0, [sp, #16]
	str	x2, [sp, #8]
	mov	w0, w8
	bl	_malloc
	ldp	x9, x8, [sp, #8]
	ldr	x10, [sp, #24]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	str	x0, [sp]
	stp	x8, x9, [x0]
	ldr	w8, [x10, #16]
	str	w8, [x0, #16]
	ldr	w8, [x10, #20]
	stp	xzr, xzr, [x0, #24]
	str	w8, [x0, #20]
	add	sp, sp, #48                     ; =48
	ret
	.loh AdrpLdr	Lloh124, Lloh125
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod92.child_append            ; -- Begin function .mod92.child_append
	.p2align	2
_.mod92.child_append:                   ; @.mod92.child_append
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x0, #32]
	stp	x1, x0, [x29, #-16]
	cbz	x8, LBB24_5
; %bb.1:                                ; %.if.false.1079
	ldur	x8, [x29, #-8]
	mov	x10, sp
	ldr	x9, [x8, #32]
	sub	x8, x10, #16                    ; =16
	mov	sp, x8
	stur	x9, [x10, #-16]
LBB24_2:                                ; %.for.start.1086
                                        ; =>This Inner Loop Header: Depth=1
	ldr	x9, [x8]
	ldr	x9, [x9, #40]
	cbz	x9, LBB24_4
; %bb.3:                                ; %.for.continue.1086
                                        ;   in Loop: Header=BB24_2 Depth=1
	ldr	x9, [x8]
	ldr	x9, [x9, #40]
	str	x9, [x8]
	b	LBB24_2
LBB24_4:                                ; %.for.end.1086
	ldur	x9, [x29, #-16]
	ldr	x8, [x8]
	str	x9, [x8, #40]
	b	LBB24_6
LBB24_5:                                ; %.if.true.1079
	ldp	x8, x9, [x29, #-16]
	str	x8, [x9, #32]
LBB24_6:                                ; %.if.end.1079
	ldur	x8, [x29, #-16]
	str	xzr, [x8, #40]
	mov	sp, x29
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod92.child_pop               ; -- Begin function .mod92.child_pop
	.p2align	2
_.mod92.child_pop:                      ; @.mod92.child_pop
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16                    ; =16
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	ldr	x8, [x0, #32]
	stur	x0, [x29, #-24]
	cbz	x8, LBB25_7
; %bb.1:                                ; %.if.end.1103
	ldur	x8, [x29, #-24]
	mov	x9, sp
	sub	x19, x9, #16                    ; =16
	ldr	x8, [x8, #32]
	mov	sp, x19
	ldr	x10, [x8, #40]
	stur	x8, [x9, #-16]
	cbz	x10, LBB25_5
LBB25_2:                                ; %.for.start.1117
                                        ; =>This Inner Loop Header: Depth=1
	ldr	x8, [x19]
	ldr	x0, [x8, #40]
	ldr	x8, [x0, #40]
	cbz	x8, LBB25_4
; %bb.3:                                ; %.for.continue.1117
                                        ;   in Loop: Header=BB25_2 Depth=1
	str	x0, [x19]
	b	LBB25_2
LBB25_4:                                ; %.for.end.1117
	bl	_free
	ldr	x8, [x19]
	add	x8, x8, #40                     ; =40
	b	LBB25_6
LBB25_5:                                ; %.if.true.1111
	ldr	x0, [x19]
	bl	_free
	ldur	x8, [x29, #-24]
	add	x8, x8, #32                     ; =32
LBB25_6:                                ; %common.ret.sink.split
	str	xzr, [x8]
LBB25_7:                                ; %common.ret
	sub	sp, x29, #16                    ; =16
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod92._find_rule              ; -- Begin function .mod92._find_rule
	.p2align	2
_.mod92._find_rule:                     ; @.mod92._find_rule
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16                    ; =16
	sub	sp, sp, #32                     ; =32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	stp	x1, x0, [x29, #-32]
	stur	wzr, [x29, #-36]
	cbnz	wzr, LBB26_3
LBB26_1:                                ; %.for.continue.1134
                                        ; =>This Inner Loop Header: Depth=1
	ldursw	x8, [x29, #-36]
	ldp	x1, x9, [x29, #-32]
	ldr	x8, [x9, x8, lsl #3]
	mov	x9, sp
	sub	x19, x9, #16                    ; =16
	mov	sp, x19
	ldr	x0, [x8]
	stur	x8, [x9, #-16]
	bl	_strcmp
	cbz	w0, LBB26_4
; %bb.2:                                ; %.if.end.1146
                                        ;   in Loop: Header=BB26_1 Depth=1
	ldur	w8, [x29, #-36]
	add	w8, w8, #1                      ; =1
	stur	w8, [x29, #-36]
	cbz	wzr, LBB26_1
LBB26_3:                                ; %.for.end.1134
	mov	x0, xzr
	b	LBB26_5
LBB26_4:                                ; %.if.true.1146
	ldr	x0, [x19]
LBB26_5:                                ; %common.ret
	sub	sp, x29, #16                    ; =16
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod92.parse_query             ; -- Begin function .mod92.parse_query
	.p2align	2
_.mod92.parse_query:                    ; @.mod92.parse_query
	.cfi_startproc
; %bb.0:
	stp	x28, x27, [sp, #-96]!           ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80                    ; =80
	sub	sp, sp, #64                     ; =64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	stp	x1, x0, [x29, #-96]
	ldr	x8, [x0]
	stur	xzr, [x29, #-136]
	ldr	x9, [x1]
Lloh126:
	adrp	x19, _.str52@PAGE
Lloh127:
	adrp	x25, _.str54@PAGE
Lloh128:
	adrp	x20, _.str55@PAGE
Lloh129:
	adrp	x27, _.str57@PAGE
Lloh130:
	add	x19, x19, _.str52@PAGEOFF
Lloh131:
	add	x25, x25, _.str54@PAGEOFF
Lloh132:
	add	x20, x20, _.str55@PAGEOFF
Lloh133:
	add	x27, x27, _.str57@PAGEOFF
	stur	x2, [x29, #-104]
	stur	wzr, [x29, #-124]
	stur	x8, [x29, #-120]
	stur	x9, [x29, #-144]
	b	LBB27_3
LBB27_1:                                ; %.if.false.1354
                                        ;   in Loop: Header=BB27_3 Depth=1
Lloh134:
	adrp	x1, _.str59@PAGE
	mov	w0, wzr
Lloh135:
	add	x1, x1, _.str59@PAGEOFF
	bl	_.mod1.assert
LBB27_2:                                ; %.if.end.1168
                                        ;   in Loop: Header=BB27_3 Depth=1
	ldur	x8, [x29, #-144]
	ldr	x8, [x8, #16]
	stur	x8, [x29, #-144]
LBB27_3:                                ; %.for.start.1158
                                        ; =>This Inner Loop Header: Depth=1
	ldur	x8, [x29, #-144]
	cbz	x8, LBB27_26
; %bb.4:                                ; %.for.start.1158
                                        ;   in Loop: Header=BB27_3 Depth=1
	ldur	x8, [x29, #-136]
	cbnz	x8, LBB27_26
; %bb.5:                                ; %.for.continue.1158
                                        ;   in Loop: Header=BB27_3 Depth=1
	ldur	x8, [x29, #-144]
	ldrb	w9, [x8]
	cmp	w9, #118                        ; =118
	b.ne	LBB27_9
; %bb.6:                                ; %.if.true.1168
                                        ;   in Loop: Header=BB27_3 Depth=1
	ldr	x0, [x8, #8]
	bl	_strlen
	mov	x21, sp
	sub	w8, w0, #2                      ; =2
	sub	x9, x21, #16                    ; =16
	mov	sp, x9
	sub	w0, w0, #1                      ; =1
	stur	w8, [x21, #-16]
	bl	_malloc
	mov	x23, sp
	sub	x28, x23, #16                   ; =16
	mov	sp, x28
	ldur	x8, [x29, #-144]
	stur	x0, [x23, #-16]
	ldr	x8, [x8, #8]
	str	x0, [sp, #-16]!
	mov	x0, x8
	mov	x1, x19
	bl	_sscanf
	add	sp, sp, #16                     ; =16
	ldur	x8, [x29, #-88]
	ldur	x0, [x23, #-16]
	ldur	w2, [x21, #-16]
	ldr	x8, [x8]
	ldr	x1, [x8, #8]
	bl	_strncmp
	ldur	x8, [x29, #-88]
	ldur	w21, [x21, #-16]
	mov	w23, w0
	ldr	x8, [x8]
	ldr	x8, [x8, #8]
	mov	x0, x8
	bl	_strlen
	ldur	x8, [x29, #-88]
	ldr	x8, [x8]
	cbnz	w23, LBB27_12
; %bb.7:                                ; %.if.true.1168
                                        ;   in Loop: Header=BB27_3 Depth=1
	cmp	w21, w0
	b.ne	LBB27_12
; %bb.8:                                ; %.if.true.1201
                                        ;   in Loop: Header=BB27_3 Depth=1
	ldur	x9, [x29, #-88]
	mov	x0, x8
	ldr	x9, [x9]
	ldp	x1, x2, [x9]
	bl	_.mod92.new_node
	ldur	x8, [x29, #-104]
	mov	x1, x0
	stur	x0, [x29, #-112]
	mov	x0, x8
	bl	_.mod92.child_append
	ldur	x8, [x29, #-88]
	ldur	w10, [x29, #-124]
	ldr	x9, [x8]
	add	w10, w10, #1                    ; =1
	stur	w10, [x29, #-124]
	ldr	x9, [x9, #32]
	str	x9, [x8]
	b	LBB27_15
LBB27_9:                                ; %.if.false.1168
                                        ;   in Loop: Header=BB27_3 Depth=1
	ldrb	w9, [x8]
	ldur	x8, [x29, #-144]
	cmp	w9, #116                        ; =116
	b.ne	LBB27_17
; %bb.10:                               ; %.if.true.1273
                                        ;   in Loop: Header=BB27_3 Depth=1
	ldur	x9, [x29, #-88]
	ldr	x0, [x8, #8]
	ldr	x9, [x9]
	ldr	x1, [x9]
	bl	_strcmp
	cbz	w0, LBB27_21
; %bb.11:                               ; %.if.false.1284
                                        ;   in Loop: Header=BB27_3 Depth=1
	mov	x21, sp
	sub	x8, x21, #16                    ; =16
	mov	sp, x8
Lloh136:
	adrp	x8, _.str56@PAGE
Lloh137:
	add	x8, x8, _.str56@PAGEOFF
	mov	x22, sp
	stur	x8, [x21, #-16]
	sub	x8, x22, #16                    ; =16
	mov	sp, x8
	ldur	x0, [x21, #-16]
	stur	x27, [x22, #-16]
	bl	_strlen
	ldur	x8, [x22, #-16]
	mov	w23, w0
	mov	x0, x8
	bl	_strlen
	ldur	x8, [x29, #-144]
	add	w23, w23, w0
	ldr	x8, [x8, #8]
	mov	x0, x8
	bl	_strlen
	ldur	x8, [x29, #-88]
	add	w23, w23, w0
	ldr	x8, [x8]
	ldr	x8, [x8]
	mov	x0, x8
	bl	_strlen
	add	w0, w23, w0
	mov	x23, sp
	sub	x8, x23, #16                    ; =16
	mov	sp, x8
	stur	w0, [x23, #-16]
	bl	_malloc
	mov	x24, sp
	sub	x8, x24, #16                    ; =16
	mov	sp, x8
	ldur	x8, [x29, #-88]
	ldur	x9, [x29, #-144]
	ldur	w1, [x23, #-16]
	ldur	x2, [x21, #-16]
	ldr	x8, [x8]
	ldur	x10, [x22, #-16]
	ldr	x9, [x9, #8]
	stur	x0, [x24, #-16]
	ldr	x8, [x8]
	sub	sp, sp, #32                     ; =32
	stp	x9, x8, [sp, #8]
	str	x10, [sp]
	bl	_snprintf
	add	sp, sp, #32                     ; =32
	ldur	x8, [x29, #-88]
	ldur	x1, [x24, #-16]
	ldr	x0, [x8]
	b	LBB27_23
LBB27_12:                               ; %.if.false.1201
                                        ;   in Loop: Header=BB27_3 Depth=1
	ldr	x8, [x8, #8]
	mov	x9, sp
	sub	x21, x9, #16                    ; =16
	mov	sp, x21
	stur	x8, [x9, #-16]
	cbnz	x8, LBB27_14
; %bb.13:                               ; %.if.true.1235
                                        ;   in Loop: Header=BB27_3 Depth=1
Lloh138:
	adrp	x8, _.str53@PAGE
Lloh139:
	add	x8, x8, _.str53@PAGEOFF
	str	x8, [x21]
LBB27_14:                               ; %.if.end.1235
                                        ;   in Loop: Header=BB27_3 Depth=1
	mov	x24, sp
	sub	x8, x24, #16                    ; =16
	mov	sp, x8
	mov	x22, sp
	sub	x8, x22, #16                    ; =16
	stur	x25, [x24, #-16]
	mov	sp, x8
	mov	x0, x20
	stur	x20, [x22, #-16]
	bl	_strlen
	ldr	x8, [x28]
	mov	w23, w0
	mov	x0, x8
	bl	_strlen
	ldr	x8, [x21]
	add	w23, w23, w0
	mov	x0, x8
	bl	_strlen
	ldur	x8, [x24, #-16]
	add	w23, w23, w0
	mov	x0, x8
	bl	_strlen
	add	w8, w23, w0
	mov	x23, sp
	sub	w0, w8, #5                      ; =5
	sub	x8, x23, #16                    ; =16
	mov	sp, x8
	stur	w0, [x23, #-16]
	bl	_malloc
	mov	x26, sp
	sub	x8, x26, #16                    ; =16
	mov	sp, x8
	ldur	w1, [x23, #-16]
	ldur	x2, [x24, #-16]
	ldur	x8, [x22, #-16]
	ldr	x9, [x28]
	ldr	x10, [x21]
	stur	x0, [x26, #-16]
	sub	sp, sp, #32                     ; =32
	stp	x9, x10, [sp, #8]
	str	x8, [sp]
	bl	_snprintf
	add	sp, sp, #32                     ; =32
	ldur	x8, [x29, #-88]
	ldur	x1, [x26, #-16]
	ldr	x0, [x8]
	bl	_.mod497.from
	stur	x0, [x29, #-136]
LBB27_15:                               ; %.if.end.1201
                                        ;   in Loop: Header=BB27_3 Depth=1
	ldr	x0, [x28]
LBB27_16:                               ; %.if.end.1168
                                        ;   in Loop: Header=BB27_3 Depth=1
	bl	_free
	b	LBB27_2
LBB27_17:                               ; %.if.false.1273
                                        ;   in Loop: Header=BB27_3 Depth=1
	ldrb	w8, [x8]
	cmp	w8, #97                         ; =97
	b.ne	LBB27_1
; %bb.18:                               ; %.if.true.1354
                                        ;   in Loop: Header=BB27_3 Depth=1
	ldur	x8, [x29, #-88]
	ldur	x9, [x29, #-144]
	ldr	x0, [x8, #8]
	ldr	x1, [x9, #8]
	bl	_.mod92._find_rule
	mov	x10, sp
	sub	x9, x10, #16                    ; =16
	mov	x8, x0
	mov	sp, x9
	ldur	x0, [x29, #-88]
	stur	x8, [x10, #-16]
	cbz	x8, LBB27_22
; %bb.19:                               ; %.if.false.1364
                                        ;   in Loop: Header=BB27_3 Depth=1
	ldr	x1, [x9]
	bl	_.mod92.parse_to_ast
	mov	x8, sp
	sub	x21, x8, #16                    ; =16
	mov	sp, x21
	ldr	x9, [x0]
	stur	x0, [x8, #-16]
	cbz	x9, LBB27_24
; %bb.20:                               ; %.if.true.1377
                                        ;   in Loop: Header=BB27_3 Depth=1
	ldr	x8, [x21]
	ldr	x8, [x8]
	stur	x8, [x29, #-136]
	b	LBB27_25
LBB27_21:                               ; %.if.true.1284
                                        ;   in Loop: Header=BB27_3 Depth=1
	ldur	x8, [x29, #-88]
	ldr	x0, [x8]
	ldp	x1, x2, [x0]
	bl	_.mod92.new_node
	ldur	x8, [x29, #-104]
	mov	x1, x0
	stur	x0, [x29, #-112]
	mov	x0, x8
	bl	_.mod92.child_append
	ldur	x8, [x29, #-88]
	ldur	w10, [x29, #-124]
	ldr	x9, [x8]
	add	w10, w10, #1                    ; =1
	stur	w10, [x29, #-124]
	ldr	x9, [x9, #32]
	str	x9, [x8]
	b	LBB27_2
LBB27_22:                               ; %.if.true.1364
                                        ;   in Loop: Header=BB27_3 Depth=1
	ldr	x0, [x0]
Lloh140:
	adrp	x1, _.str58@PAGE
Lloh141:
	add	x1, x1, _.str58@PAGEOFF
LBB27_23:                               ; %.if.end.1168
                                        ;   in Loop: Header=BB27_3 Depth=1
	bl	_.mod497.from
	stur	x0, [x29, #-136]
	b	LBB27_2
LBB27_24:                               ; %.if.false.1377
                                        ;   in Loop: Header=BB27_3 Depth=1
	ldr	x8, [x21]
	ldur	x0, [x29, #-104]
	ldr	x1, [x8, #8]
	bl	_.mod92.child_append
	ldur	w8, [x29, #-124]
	add	w8, w8, #1                      ; =1
	stur	w8, [x29, #-124]
LBB27_25:                               ; %.if.end.1377
                                        ;   in Loop: Header=BB27_3 Depth=1
	ldr	x0, [x21]
	b	LBB27_16
LBB27_26:                               ; %.for.end.1158
	ldur	x8, [x29, #-136]
	cbz	x8, LBB27_30
; %bb.27:                               ; %.if.true.1399
	ldur	x8, [x29, #-120]
	ldur	x9, [x29, #-88]
	str	x8, [x9]
	mov	x8, sp
	sub	x19, x8, #16                    ; =16
	mov	sp, x19
	stur	wzr, [x8, #-16]
LBB27_28:                               ; %.for.start.1403
                                        ; =>This Inner Loop Header: Depth=1
	ldr	w8, [x19]
	ldur	w9, [x29, #-124]
	cmp	w8, w9
	b.ge	LBB27_30
; %bb.29:                               ; %.for.continue.1403
                                        ;   in Loop: Header=BB27_28 Depth=1
	ldur	x0, [x29, #-104]
	bl	_.mod92.child_pop
	ldr	w8, [x19]
	add	w8, w8, #1                      ; =1
	str	w8, [x19]
	b	LBB27_28
LBB27_30:                               ; %.if.end.1399
	ldur	x8, [x29, #-96]
	ldr	x8, [x8, #16]
	cbz	x8, LBB27_35
; %bb.31:                               ; %.if.end.1399
	ldur	x8, [x29, #-136]
	cbz	x8, LBB27_35
; %bb.32:                               ; %.if.true.1418
	ldp	x8, x0, [x29, #-96]
	ldur	x2, [x29, #-104]
	ldr	x1, [x8, #16]
	bl	_.mod92.parse_query
	mov	x9, sp
	sub	x8, x9, #16                     ; =16
	mov	sp, x8
	stur	x0, [x9, #-16]
	cbz	x0, LBB27_34
; %bb.33:                               ; %.if.false.1427
	ldr	x0, [x8]
	bl	_free
	b	LBB27_35
LBB27_34:                               ; %.if.true.1427
	stur	xzr, [x29, #-136]
LBB27_35:                               ; %.if.end.1418
	ldur	x8, [x29, #-96]
	ldrb	w8, [x8, #8]
	cmp	w8, #49                         ; =49
	b.eq	LBB27_44
; %bb.36:                               ; %.if.false.1435
	ldur	x8, [x29, #-96]
	ldrb	w8, [x8, #8]
	cmp	w8, #43                         ; =43
	b.ne	LBB27_39
; %bb.37:                               ; %.if.false.1435
	ldur	x8, [x29, #-136]
	cbnz	x8, LBB27_39
; %bb.38:                               ; %.if.true.1443
	ldp	x1, x0, [x29, #-96]
	ldur	x2, [x29, #-104]
	bl	_.mod92.parse_query
	stur	x0, [x29, #-136]
	cbnz	x0, LBB27_43
	b	LBB27_48
LBB27_39:                               ; %.if.false.1443
	ldur	x8, [x29, #-96]
	ldrb	w8, [x8, #8]
	cmp	w8, #63                         ; =63
	b.ne	LBB27_41
; %bb.40:                               ; %.if.false.1443
	ldur	x8, [x29, #-136]
	cbnz	x8, LBB27_43
LBB27_41:                               ; %.if.false.1462
	ldur	x8, [x29, #-96]
	ldrb	w8, [x8, #8]
	cmp	w8, #42                         ; =42
	b.ne	LBB27_44
; %bb.42:                               ; %.if.true.1470
	ldur	x8, [x29, #-136]
	cbz	x8, LBB27_49
LBB27_43:                               ; %.if.true.1450
	ldur	x0, [x29, #-136]
	bl	_free
	stur	xzr, [x29, #-136]
LBB27_44:                               ; %.if.end.1435
	ldur	x8, [x29, #-96]
	ldr	x8, [x8, #24]
	cbz	x8, LBB27_47
; %bb.45:                               ; %.if.end.1435
	ldur	x8, [x29, #-136]
	cbnz	x8, LBB27_47
; %bb.46:                               ; %.if.true.1488
	ldp	x8, x0, [x29, #-96]
	ldur	x2, [x29, #-104]
	ldr	x1, [x8, #24]
	bl	_.mod92.parse_query
	stur	x0, [x29, #-136]
LBB27_47:                               ; %.if.end.1488
	ldur	x0, [x29, #-136]
LBB27_48:                               ; %common.ret
	sub	sp, x29, #80                    ; =80
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
	ret
LBB27_49:                               ; %.if.false.1473
	ldp	x1, x0, [x29, #-96]
	ldur	x2, [x29, #-104]
	bl	_.mod92.parse_query
	b	LBB27_48
	.loh AdrpAdd	Lloh129, Lloh133
	.loh AdrpAdd	Lloh128, Lloh132
	.loh AdrpAdd	Lloh127, Lloh131
	.loh AdrpAdd	Lloh126, Lloh130
	.loh AdrpAdd	Lloh134, Lloh135
	.loh AdrpAdd	Lloh136, Lloh137
	.loh AdrpAdd	Lloh138, Lloh139
	.loh AdrpAdd	Lloh140, Lloh141
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod92.parse_to_ast            ; -- Begin function .mod92.parse_to_ast
	.p2align	2
_.mod92.parse_to_ast:                   ; @.mod92.parse_to_ast
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48                     ; =48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh142:
	adrp	x8, _ParseResult_size@PAGE
Lloh143:
	ldr	w8, [x8, _ParseResult_size@PAGEOFF]
	stp	x1, x0, [sp, #16]
	mov	w0, w8
	bl	_malloc
	ldp	x9, x8, [sp, #16]
	str	xzr, [x0]
	str	x0, [sp, #8]
	mov	x2, xzr
	ldr	x8, [x8]
	ldr	x1, [x9]
	mov	x0, x8
	bl	_.mod92.new_node
	ldp	x9, x10, [sp, #8]
	ldr	x8, [sp, #24]
	mov	x2, x0
	str	x0, [x9, #8]
	ldr	x9, [x8]
	ldr	x1, [x10, #8]
	mov	x0, x8
	str	x9, [sp]
	bl	_.mod92.parse_query
	ldr	x8, [sp, #8]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	str	x0, [x8]
	mov	x0, x8
	add	sp, sp, #48                     ; =48
	ret
	.loh AdrpLdr	Lloh142, Lloh143
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod92.ast                     ; -- Begin function .mod92.ast
	.p2align	2
_.mod92.ast:                            ; @.mod92.ast
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80                     ; =80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 80
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stp	x1, x0, [sp, #48]
	str	x2, [sp, #40]
	bl	_.mod92._find_rule
	cmp	x0, #0                          ; =0
Lloh144:
	adrp	x1, _.str60@PAGE
	str	x0, [sp, #32]
	cset	w0, ne
Lloh145:
	add	x1, x1, _.str60@PAGEOFF
	bl	_.mod1.assert
	ldp	x1, x8, [sp, #32]
	ldr	x9, [sp, #56]
	add	x0, sp, #16                     ; =16
	stp	x8, x9, [sp, #16]
	bl	_.mod92.parse_to_ast
	ldr	x8, [sp, #16]
Lloh146:
	adrp	x1, _.str61@PAGE
	str	x0, [sp, #8]
Lloh147:
	add	x1, x1, _.str61@PAGEOFF
	ldr	x8, [x8]
	mov	x0, x8
	bl	_strcmp
	cbz	w0, LBB29_3
; %bb.1:
	ldr	x8, [sp, #8]
	ldr	x8, [x8]
	cbnz	x8, LBB29_3
; %bb.2:                                ; %.if.true.1552
	ldr	x0, [sp, #16]
Lloh148:
	adrp	x1, _.str62@PAGE
Lloh149:
	add	x1, x1, _.str62@PAGEOFF
	bl	_.mod497.from
	ldr	x8, [sp, #8]
	str	x0, [x8]
LBB29_3:                                ; %.if.end.1552
	ldr	x0, [sp, #8]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80                     ; =80
	ret
	.loh AdrpAdd	Lloh146, Lloh147
	.loh AdrpAdd	Lloh144, Lloh145
	.loh AdrpAdd	Lloh148, Lloh149
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1560.node_to_string        ; -- Begin function .mod1560.node_to_string
	.p2align	2
_.mod1560.node_to_string:               ; @.mod1560.node_to_string
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64                     ; =64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #40]
	bl	_tmpfile
	ldr	x8, [sp, #40]
	mov	x1, x0
	str	x0, [sp, #32]
	mov	w2, #1
	mov	x0, x8
	bl	_.mod1560._node_to_string
	ldr	x0, [sp, #32]
	bl	_ftell
	ldr	x8, [sp, #32]
	str	w0, [sp, #28]
	mov	x0, x8
	bl	_fileno
Lloh150:
	adrp	x8, _SEEK_SET@PAGE
Lloh151:
	ldr	w2, [x8, _SEEK_SET@PAGEOFF]
	mov	w1, wzr
	str	w0, [sp, #24]
	bl	_lseek
	ldr	w0, [sp, #28]
	bl	_malloc
	ldp	w8, w2, [sp, #24]
	mov	x1, x0
	str	x0, [sp, #16]
	mov	w0, w8
	bl	_read
	ldr	w8, [sp, #28]
	str	w0, [sp, #12]
	cmp	w0, w8
	b.eq	LBB30_2
; %bb.1:                                ; %.if.true.1581
	ldr	x0, [sp, #16]
	bl	_free
	str	xzr, [sp, #16]
LBB30_2:                                ; %.if.end.1581
	ldr	x0, [sp, #16]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64                     ; =64
	ret
	.loh AdrpLdr	Lloh150, Lloh151
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1560._print_indent         ; -- Begin function .mod1560._print_indent
	.p2align	2
_.mod1560._print_indent:                ; @.mod1560._print_indent
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48                     ; =48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	w1, [sp, #4]
Lloh152:
	adrp	x1, _.str63@PAGE
Lloh153:
	add	x1, x1, _.str63@PAGEOFF
	str	x0, [sp, #8]
	bl	_fprintf
Lloh154:
	adrp	x19, _.str64@PAGE
Lloh155:
	add	x19, x19, _.str64@PAGEOFF
	str	wzr, [sp]
LBB31_1:                                ; %.for.start.1588
                                        ; =>This Inner Loop Header: Depth=1
	ldp	w8, w9, [sp]
	cmp	w8, w9
	b.ge	LBB31_3
; %bb.2:                                ; %.for.continue.1588
                                        ;   in Loop: Header=BB31_1 Depth=1
	ldr	x0, [sp, #8]
	mov	x1, x19
	bl	_fprintf
	ldr	w8, [sp]
	add	w8, w8, #1                      ; =1
	str	w8, [sp]
	b	LBB31_1
LBB31_3:                                ; %.for.end.1588
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48                     ; =48
	ret
	.loh AdrpAdd	Lloh154, Lloh155
	.loh AdrpAdd	Lloh152, Lloh153
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1560._node_to_string       ; -- Begin function .mod1560._node_to_string
	.p2align	2
_.mod1560._node_to_string:              ; @.mod1560._node_to_string
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48                     ; =48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x8, x1
	stp	x1, x0, [sp, #16]
	str	w2, [sp, #12]
	cbz	x0, LBB32_2
; %bb.1:                                ; %.if.end.1599
Lloh156:
	adrp	x1, _.str66@PAGE
Lloh157:
	add	x1, x1, _.str66@PAGEOFF
	mov	x0, x8
	bl	_fprintf
	ldr	x0, [sp, #16]
	ldr	w1, [sp, #12]
	bl	_.mod1560._print_indent
	ldp	x0, x8, [sp, #16]
Lloh158:
	adrp	x1, _.str67@PAGE
Lloh159:
	add	x1, x1, _.str67@PAGEOFF
	ldr	x8, [x8]
	str	x8, [sp]
	bl	_fprintf
	ldr	x0, [sp, #16]
	ldr	w1, [sp, #12]
	bl	_.mod1560._print_indent
	ldp	x0, x8, [sp, #16]
Lloh160:
	adrp	x1, _.str68@PAGE
Lloh161:
	add	x1, x1, _.str68@PAGEOFF
	ldr	x8, [x8, #8]
	str	x8, [sp]
	bl	_fprintf
	ldr	x0, [sp, #16]
	ldr	w1, [sp, #12]
	bl	_.mod1560._print_indent
	ldp	x0, x8, [sp, #16]
Lloh162:
	adrp	x1, _.str69@PAGE
Lloh163:
	add	x1, x1, _.str69@PAGEOFF
	ldr	w8, [x8, #16]
	str	x8, [sp]
	bl	_fprintf
	ldr	x0, [sp, #16]
	ldr	w1, [sp, #12]
	bl	_.mod1560._print_indent
	ldp	x0, x8, [sp, #16]
Lloh164:
	adrp	x1, _.str70@PAGE
Lloh165:
	add	x1, x1, _.str70@PAGEOFF
	ldr	w8, [x8, #20]
	str	x8, [sp]
	bl	_fprintf
	ldr	x0, [sp, #16]
	ldr	w1, [sp, #12]
	bl	_.mod1560._print_indent
	ldr	x0, [sp, #16]
Lloh166:
	adrp	x1, _.str71@PAGE
Lloh167:
	add	x1, x1, _.str71@PAGEOFF
	bl	_fprintf
	ldp	x1, x8, [sp, #16]
	ldr	w9, [sp, #12]
	ldr	x0, [x8, #40]
	add	w2, w9, #1                      ; =1
	bl	_.mod1560._node_to_string
	ldr	x0, [sp, #16]
	ldr	w1, [sp, #12]
	bl	_.mod1560._print_indent
	ldr	x0, [sp, #16]
Lloh168:
	adrp	x1, _.str72@PAGE
Lloh169:
	add	x1, x1, _.str72@PAGEOFF
	bl	_fprintf
	ldp	x1, x8, [sp, #16]
	ldr	w9, [sp, #12]
	ldr	x0, [x8, #32]
	add	w2, w9, #1                      ; =1
	bl	_.mod1560._node_to_string
	ldr	w8, [sp, #12]
	ldr	x0, [sp, #16]
	sub	w1, w8, #1                      ; =1
	bl	_.mod1560._print_indent
	ldr	x0, [sp, #16]
Lloh170:
	adrp	x1, _.str73@PAGE
Lloh171:
	add	x1, x1, _.str73@PAGEOFF
	b	LBB32_3
LBB32_2:                                ; %.if.true.1599
Lloh172:
	adrp	x1, _.str65@PAGE
Lloh173:
	add	x1, x1, _.str65@PAGEOFF
	mov	x0, x8
LBB32_3:                                ; %common.ret
	bl	_fprintf
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48                     ; =48
	ret
	.loh AdrpAdd	Lloh170, Lloh171
	.loh AdrpAdd	Lloh168, Lloh169
	.loh AdrpAdd	Lloh166, Lloh167
	.loh AdrpAdd	Lloh164, Lloh165
	.loh AdrpAdd	Lloh162, Lloh163
	.loh AdrpAdd	Lloh160, Lloh161
	.loh AdrpAdd	Lloh158, Lloh159
	.loh AdrpAdd	Lloh156, Lloh157
	.loh AdrpAdd	Lloh172, Lloh173
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod0.new_context              ; -- Begin function .mod0.new_context
	.p2align	2
_.mod0.new_context:                     ; @.mod0.new_context
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh174:
	adrp	x8, _CompilerCtx_size@PAGE
Lloh175:
	ldr	w0, [x8, _CompilerCtx_size@PAGEOFF]
	bl	_malloc
	str	x0, [sp, #8]
	bl	_tmpfile
	ldr	x8, [sp, #8]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	stp	xzr, x0, [x8]
	mov	x0, x8
	add	sp, sp, #32                     ; =32
	ret
	.loh AdrpLdr	Lloh174, Lloh175
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod0.compile                  ; -- Begin function .mod0.compile
	.p2align	2
_.mod0.compile:                         ; @.mod0.compile
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x0, #8]
	stp	x1, x0, [sp]
Lloh176:
	adrp	x1, _.str74@PAGE
Lloh177:
	add	x1, x1, _.str74@PAGEOFF
	mov	x0, x8
	bl	_fprintf
	ldr	x8, [sp, #8]
Lloh178:
	adrp	x1, _.str75@PAGE
Lloh179:
	add	x1, x1, _.str75@PAGEOFF
	ldr	x0, [x8, #8]
	bl	_fprintf
	ldr	x8, [sp, #8]
Lloh180:
	adrp	x1, _.str76@PAGE
Lloh181:
	add	x1, x1, _.str76@PAGEOFF
	ldr	x0, [x8, #8]
	bl	_fprintf
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32                     ; =32
	ret
	.loh AdrpAdd	Lloh180, Lloh181
	.loh AdrpAdd	Lloh178, Lloh179
	.loh AdrpAdd	Lloh176, Lloh177
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1701.init                  ; -- Begin function .mod1701.init
	.p2align	2
_.mod1701.init:                         ; @.mod1701.init
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48                     ; =48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh182:
	adrp	x8, _T_ptr_size@PAGE
Lloh183:
	ldr	w8, [x8, _T_ptr_size@PAGEOFF]
	str	x0, [sp, #24]
	mov	w0, w8
	bl	_malloc
	ldr	x8, [sp, #24]
	str	x0, [sp, #16]
	str	x8, [x0, #8]
	mov	w0, #64
	bl	_malloc
Lloh184:
	adrp	x8, _STDERR@PAGE
	ldr	x9, [sp, #16]
Lloh185:
	ldr	w8, [x8, _STDERR@PAGEOFF]
Lloh186:
	adrp	x1, _.str77@PAGE
Lloh187:
	add	x1, x1, _.str77@PAGEOFF
	str	x0, [x9, #32]
	mov	w0, w8
	bl	_fdopen
	ldr	x8, [sp, #24]
Lloh188:
	adrp	x1, _.str78@PAGE
Lloh189:
	add	x1, x1, _.str78@PAGEOFF
	stp	x8, x0, [sp]
	bl	_fprintf
	ldr	x0, [sp, #16]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48                     ; =48
	ret
	.loh AdrpAdd	Lloh188, Lloh189
	.loh AdrpAdd	Lloh186, Lloh187
	.loh AdrpLdr	Lloh184, Lloh185
	.loh AdrpLdr	Lloh182, Lloh183
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1701.setup                 ; -- Begin function .mod1701.setup
	.p2align	2
_.mod1701.setup:                        ; @.mod1701.setup
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48                     ; =48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x0, #32]
	stp	x1, x0, [sp, #16]
	strb	wzr, [x0]
	str	x1, [x0, #16]
	mov	x0, x8
	bl	_pipe
Lloh190:
	adrp	x1, _.str79@PAGE
	mvn	w8, w0
Lloh191:
	add	x1, x1, _.str79@PAGEOFF
	lsr	w0, w8, #31
	bl	_.mod1.assert
	ldr	x8, [sp, #24]
Lloh192:
	adrp	x9, _STDOUT@PAGE
Lloh193:
	ldrsw	x9, [x9, _STDOUT@PAGEOFF]
Lloh194:
	adrp	x1, _.str80@PAGE
	ldr	x10, [x8, #32]
	str	wzr, [x8, #24]
Lloh195:
	add	x1, x1, _.str80@PAGEOFF
	ldr	w0, [x10, x9, lsl #2]
	str	x10, [sp, #8]
	bl	_fdopen
	ldr	x9, [sp, #24]
	cmp	x0, #0                          ; =0
	cset	w8, ne
Lloh196:
	adrp	x1, _.str81@PAGE
	str	x0, [x9, #40]
Lloh197:
	add	x1, x1, _.str81@PAGEOFF
	mov	w0, w8
	bl	_.mod1.assert
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48                     ; =48
	ret
	.loh AdrpAdd	Lloh196, Lloh197
	.loh AdrpAdd	Lloh194, Lloh195
	.loh AdrpLdr	Lloh192, Lloh193
	.loh AdrpAdd	Lloh190, Lloh191
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1701.run                   ; -- Begin function .mod1701.run
	.p2align	2
_.mod1701.run:                          ; @.mod1701.run
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80                     ; =80
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 80
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	ldp	x9, x8, [x0, #32]
	str	x0, [sp, #40]
	str	w1, [sp, #36]
	mov	x0, x8
	str	x9, [sp, #24]
	bl	_fflush
Lloh198:
	adrp	x8, _STDOUT@PAGE
Lloh199:
	ldrsw	x8, [x8, _STDOUT@PAGEOFF]
	ldr	x9, [sp, #24]
	ldr	w0, [x9, x8, lsl #2]
	bl	_close
Lloh200:
	adrp	x8, _STDERR@PAGE
Lloh201:
	ldr	w0, [x8, _STDERR@PAGEOFF]
Lloh202:
	adrp	x1, _.str82@PAGE
Lloh203:
	add	x1, x1, _.str82@PAGEOFF
	bl	_fdopen
	ldr	x8, [sp, #40]
	adrp	x19, _STDIN@PAGE
	str	x0, [sp, #16]
	ldrb	w8, [x8]
	cmp	w8, #1                          ; =1
	b.ne	LBB37_2
; %bb.1:                                ; %.if.true.1771
	ldr	x8, [sp, #40]
	ldr	x0, [sp, #16]
Lloh204:
	adrp	x1, _.str83@PAGE
Lloh205:
	add	x1, x1, _.str83@PAGEOFF
	ldr	x8, [x8, #16]
	str	x8, [sp]
	bl	_fprintf
	ldrsw	x8, [x19, _STDIN@PAGEOFF]
	ldr	x9, [sp, #24]
	ldr	w0, [x9, x8, lsl #2]
	bl	_.mod1701._read_all
	b	LBB37_3
LBB37_2:                                ; %.if.false.1771
	ldr	x8, [sp, #40]
	ldr	x0, [sp, #16]
Lloh206:
	adrp	x10, _.str85@PAGE
Lloh207:
	adrp	x11, _.str84@PAGE
	ldr	w9, [x8, #24]
	ldr	x8, [x8, #16]
Lloh208:
	add	x10, x10, _.str85@PAGEOFF
Lloh209:
	add	x11, x11, _.str84@PAGEOFF
	cmp	w9, #0                          ; =0
	csel	x1, x11, x10, eq
	str	x8, [sp]
	bl	_fprintf
LBB37_3:                                ; %.if.end.1771
	ldrsw	x8, [x19, _STDIN@PAGEOFF]
	ldr	x9, [sp, #24]
	ldr	w0, [x9, x8, lsl #2]
	bl	_close
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #80                     ; =80
	ret
	.loh AdrpAdd	Lloh202, Lloh203
	.loh AdrpLdr	Lloh200, Lloh201
	.loh AdrpLdr	Lloh198, Lloh199
	.loh AdrpAdd	Lloh204, Lloh205
	.loh AdrpAdd	Lloh207, Lloh209
	.loh AdrpAdd	Lloh206, Lloh208
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1701.cleanup               ; -- Begin function .mod1701.cleanup
	.p2align	2
_.mod1701.cleanup:                      ; @.mod1701.cleanup
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x0, #40]
	str	x0, [sp, #8]
	mov	x0, x8
	bl	_fclose
	ldr	x8, [sp, #8]
	ldr	x0, [x8, #32]
	bl	_free
	ldr	x0, [sp, #8]
	bl	_free
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32                     ; =32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1701._read_all             ; -- Begin function .mod1701._read_all
	.p2align	2
_.mod1701._read_all:                    ; @.mod1701._read_all
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64                     ; =64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	w8, #1024
	stp	w8, w0, [sp, #24]
	mov	w0, #1024
	bl	_malloc
	adrp	x19, _STDERR@PAGE
	mov	w20, #1
	str	x0, [sp, #16]
	str	wzr, [sp, #12]
	strb	wzr, [sp, #11]
	ldrb	w8, [sp, #11]
	cbz	w8, LBB39_2
	b	LBB39_4
LBB39_1:                                ; %.if.false.1830
                                        ;   in Loop: Header=BB39_2 Depth=1
	strb	w20, [sp, #11]
	ldrb	w8, [sp, #11]
	cbnz	w8, LBB39_4
LBB39_2:                                ; %.for.continue.1820
                                        ; =>This Inner Loop Header: Depth=1
	ldp	w2, w0, [sp, #24]
	ldr	x1, [sp, #16]
	bl	_read
	cmp	w0, #1                          ; =1
	str	w0, [sp, #12]
	b.lt	LBB39_1
; %bb.3:                                ; %.if.true.1830
                                        ;   in Loop: Header=BB39_2 Depth=1
	ldr	w0, [x19, _STDERR@PAGEOFF]
	ldr	x1, [sp, #16]
	ldr	w2, [sp, #24]
	bl	_write
	ldrb	w8, [sp, #11]
	cbz	w8, LBB39_2
LBB39_4:                                ; %.for.end.1820
	ldr	w0, [x19, _STDERR@PAGEOFF]
Lloh210:
	adrp	x1, _.str86@PAGE
Lloh211:
	add	x1, x1, _.str86@PAGEOFF
	mov	w2, #1
	bl	_write
	ldr	x0, [sp, #16]
	bl	_free
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64                     ; =64
	ret
	.loh AdrpAdd	Lloh210, Lloh211
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1701.fail                  ; -- Begin function .mod1701.fail
	.p2align	2
_.mod1701.fail:                         ; @.mod1701.fail
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x8, [x0, #40]
	ldr	w9, [x0, #24]
	mov	w10, #1
Lloh212:
	adrp	x1, _.str87@PAGE
	strb	w10, [x0]
Lloh213:
	add	x1, x1, _.str87@PAGEOFF
	stp	x9, x0, [sp]
	mov	x0, x8
	bl	_fprintf
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32                     ; =32
	ret
	.loh AdrpAdd	Lloh212, Lloh213
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1701.assert_equal_int      ; -- Begin function .mod1701.assert_equal_int
	.p2align	2
_.mod1701.assert_equal_int:             ; @.mod1701.assert_equal_int
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48                     ; =48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	w8, [x0, #24]
	cmp	w1, w2
	str	x0, [sp, #24]
	stp	w2, w1, [sp, #16]
	add	w8, w8, #1                      ; =1
	str	w8, [x0, #24]
	b.eq	LBB41_2
; %bb.1:                                ; %.if.true.1861
	ldr	x0, [sp, #24]
	bl	_.mod1701.fail
	ldr	x8, [sp, #24]
Lloh214:
	adrp	x1, _.str88@PAGE
Lloh215:
	add	x1, x1, _.str88@PAGEOFF
	ldr	x0, [x8, #40]
	ldp	w8, w9, [sp, #16]
	stp	x9, x8, [sp]
	bl	_fprintf
LBB41_2:                                ; %.if.end.1861
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48                     ; =48
	ret
	.loh AdrpAdd	Lloh214, Lloh215
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1701.assert_equal_chr      ; -- Begin function .mod1701.assert_equal_chr
	.p2align	2
_.mod1701.assert_equal_chr:             ; @.mod1701.assert_equal_chr
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64                     ; =64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	w9, [x0, #24]
	and	w8, w1, #0xff
	cmp	w8, w2, uxtb
	str	x0, [sp, #40]
	add	w9, w9, #1                      ; =1
	strb	w1, [sp, #39]
	strb	w2, [sp, #38]
	str	w9, [x0, #24]
	b.eq	LBB42_2
; %bb.1:                                ; %.if.true.1880
	ldr	x0, [sp, #40]
	bl	_.mod1701.fail
	ldr	x8, [sp, #40]
	ldrb	w9, [sp, #39]
Lloh216:
	adrp	x1, _.str89@PAGE
Lloh217:
	add	x1, x1, _.str89@PAGEOFF
	ldr	x0, [x8, #40]
	ldrb	w8, [sp, #38]
	stp	x9, x9, [sp]
	stp	x8, x8, [sp, #16]
	bl	_fprintf
LBB42_2:                                ; %.if.end.1880
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64                     ; =64
	ret
	.loh AdrpAdd	Lloh216, Lloh217
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1701.assert_true           ; -- Begin function .mod1701.assert_true
	.p2align	2
_.mod1701.assert_true:                  ; @.mod1701.assert_true
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48                     ; =48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	w9, [x0, #24]
	and	w8, w2, #0x1
	strb	w8, [sp, #15]
	stp	x1, x0, [sp, #16]
	add	w8, w9, #1                      ; =1
	str	w8, [x0, #24]
	tbnz	w2, #0, LBB43_2
; %bb.1:                                ; %.if.true.1901
	ldr	x0, [sp, #24]
	bl	_.mod1701.fail
	ldr	x8, [sp, #24]
Lloh218:
	adrp	x1, _.str90@PAGE
Lloh219:
	add	x1, x1, _.str90@PAGEOFF
	ldr	x0, [x8, #40]
	ldr	x8, [sp, #16]
	str	x8, [sp]
	bl	_fprintf
LBB43_2:                                ; %.if.end.1901
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48                     ; =48
	ret
	.loh AdrpAdd	Lloh218, Lloh219
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1701.assert_equal_str      ; -- Begin function .mod1701.assert_equal_str
	.p2align	2
_.mod1701.assert_equal_str:             ; @.mod1701.assert_equal_str
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64                     ; =64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 64
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	w8, [x0, #24]
	stp	x1, x0, [sp, #32]
	str	x2, [sp, #24]
	add	w8, w8, #1                      ; =1
	str	w8, [x0, #24]
	cbz	x2, LBB44_3
; %bb.1:                                ; %.if.false.1918
	ldp	x1, x0, [sp, #24]
	bl	_strcmp
	cbz	w0, LBB44_5
; %bb.2:                                ; %.if.true.1932
	ldr	x0, [sp, #40]
	bl	_.mod1701.fail
	ldp	x9, x8, [sp, #32]
Lloh220:
	adrp	x1, _.str92@PAGE
Lloh221:
	add	x1, x1, _.str92@PAGEOFF
	b	LBB44_4
LBB44_3:                                ; %.if.true.1918
	ldr	x0, [sp, #40]
	bl	_.mod1701.fail
	ldp	x9, x8, [sp, #32]
Lloh222:
	adrp	x1, _.str91@PAGE
Lloh223:
	add	x1, x1, _.str91@PAGEOFF
LBB44_4:                                ; %.if.end.1918
	ldr	x0, [x8, #40]
	ldr	x8, [sp, #24]
	stp	x9, x8, [sp]
	bl	_fprintf
LBB44_5:                                ; %.if.end.1918
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64                     ; =64
	ret
	.loh AdrpAdd	Lloh220, Lloh221
	.loh AdrpAdd	Lloh222, Lloh223
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1701.assert_null           ; -- Begin function .mod1701.assert_null
	.p2align	2
_.mod1701.assert_null:                  ; @.mod1701.assert_null
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48                     ; =48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	w8, [x0, #24]
	stp	x1, x0, [sp, #16]
	add	w8, w8, #1                      ; =1
	str	w8, [x0, #24]
	cbz	x1, LBB45_2
; %bb.1:                                ; %.if.true.1950
	ldr	x0, [sp, #24]
	bl	_.mod1701.fail
	ldr	x8, [sp, #24]
Lloh224:
	adrp	x1, _.str93@PAGE
Lloh225:
	add	x1, x1, _.str93@PAGEOFF
	ldr	x0, [x8, #40]
	ldr	x8, [sp, #16]
	str	x8, [sp]
	bl	_fprintf
LBB45_2:                                ; %.if.end.1950
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48                     ; =48
	ret
	.loh AdrpAdd	Lloh224, Lloh225
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1701.assert_not_null       ; -- Begin function .mod1701.assert_not_null
	.p2align	2
_.mod1701.assert_not_null:              ; @.mod1701.assert_not_null
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	w8, [x0, #24]
	stp	x1, x0, [sp]
	add	w8, w8, #1                      ; =1
	str	w8, [x0, #24]
	cbnz	x1, LBB46_2
; %bb.1:                                ; %.if.true.1967
	ldr	x0, [sp, #8]
	bl	_.mod1701.fail
	ldr	x8, [sp, #8]
Lloh226:
	adrp	x1, _.str94@PAGE
Lloh227:
	add	x1, x1, _.str94@PAGEOFF
	ldr	x0, [x8, #40]
	bl	_fprintf
LBB46_2:                                ; %.if.end.1967
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32                     ; =32
	ret
	.loh AdrpAdd	Lloh226, Lloh227
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1701.tempfile              ; -- Begin function .mod1701.tempfile
	.p2align	2
_.mod1701.tempfile:                     ; @.mod1701.tempfile
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	bl	_tmpfile
	ldr	x1, [sp, #8]
	str	x0, [sp]
	bl	_fprintf
	ldr	x0, [sp]
	bl	_rewind
	ldr	x0, [sp]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32                     ; =32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_.mod1982.readall               ; -- Begin function .mod1982.readall
	.p2align	2
_.mod1982.readall:                      ; @.mod1982.readall
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	sub	sp, sp, #48                     ; =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #1024
	stp	w8, w0, [x29, #-8]
	mov	w0, #1024
	bl	_malloc
	stur	x0, [x29, #-16]
	mov	w0, #1
	stur	wzr, [x29, #-20]
	bl	_malloc
	ldp	w2, w8, [x29, #-8]
	ldur	x1, [x29, #-16]
	stur	x0, [x29, #-32]
	mov	w0, w8
	b	LBB48_2
LBB48_1:                                ; %.for.end.1998
                                        ;   in Loop: Header=BB48_2 Depth=1
	ldur	w8, [x29, #-20]
	ldur	w9, [x29, #-36]
	ldp	w2, w0, [x29, #-8]
	ldur	x1, [x29, #-16]
	add	w8, w8, w9
	stur	w8, [x29, #-20]
LBB48_2:                                ; %.for.start.1990
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB48_4 Depth 2
	bl	_read
	mov	w8, w0
	cmp	w8, #1                          ; =1
	stur	w0, [x29, #-36]
	b.lt	LBB48_6
; %bb.3:                                ; %.for.continue.1990
                                        ;   in Loop: Header=BB48_2 Depth=1
	ldur	w8, [x29, #-20]
	ldur	w9, [x29, #-36]
	ldur	x0, [x29, #-32]
	add	w1, w8, w9
	bl	_realloc
	mov	x9, sp
	sub	x8, x9, #16                     ; =16
	stur	x0, [x29, #-32]
	mov	sp, x8
	stur	wzr, [x9, #-16]
LBB48_4:                                ; %.for.start.1998
                                        ;   Parent Loop BB48_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w9, [x8]
	ldur	w10, [x29, #-36]
	cmp	w9, w10
	b.ge	LBB48_1
; %bb.5:                                ; %.for.continue.1998
                                        ;   in Loop: Header=BB48_4 Depth=2
	ldrsw	x9, [x8]
	ldur	x10, [x29, #-16]
	ldur	w11, [x29, #-20]
	ldur	x12, [x29, #-32]
	ldrb	w10, [x10, x9]
	add	w11, w9, w11
	add	w9, w9, #1                      ; =1
	str	w9, [x8]
	strb	w10, [x12, w11, sxtw]
	b	LBB48_4
LBB48_6:                                ; %.for.end.1990
	ldursw	x8, [x29, #-20]
	ldur	x9, [x29, #-32]
	ldur	x0, [x29, #-16]
	strb	wzr, [x9, x8]
	bl	_free
	ldur	x0, [x29, #-32]
	mov	sp, x29
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__build_filename                ; -- Begin function _build_filename
	.p2align	2
__build_filename:                       ; @_build_filename
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80                     ; =80
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 80
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	stp	x1, x0, [sp, #32]
	bl	_strlen
	ldr	x8, [sp, #32]
	mov	w19, w0
	mov	x0, x8
	bl	_strlen
	add	w8, w19, w0
	add	w0, w8, #1                      ; =1
	str	w0, [sp, #28]
	bl	_malloc
	ldp	x9, x8, [sp, #32]
Lloh228:
	adrp	x1, _.str95@PAGE
Lloh229:
	add	x1, x1, _.str95@PAGEOFF
	stp	x9, x0, [sp, #8]
	str	x8, [sp]
	bl	_sprintf
	ldr	x0, [sp, #16]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #80                     ; =80
	ret
	.loh AdrpAdd	Lloh228, Lloh229
	.cfi_endproc
                                        ; -- End function
	.globl	_read_testfile                  ; -- Begin function read_testfile
	.p2align	2
_read_testfile:                         ; @read_testfile
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16                    ; =16
	sub	sp, sp, #32                     ; =32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	stp	x1, x0, [x29, #-32]
	bl	__build_filename
Lloh230:
	adrp	x1, _.str96@PAGE
Lloh231:
	add	x1, x1, _.str96@PAGEOFF
	stur	x0, [x29, #-40]
	bl	_fopen
	ldur	x8, [x29, #-40]
	mov	x19, x0
	stur	x0, [x29, #-48]
	mov	x0, x8
	bl	_free
	cbz	x19, LBB50_2
; %bb.1:                                ; %.if.end.2048
	ldur	x0, [x29, #-48]
	bl	_fileno
	mov	x8, sp
	sub	x9, x8, #16                     ; =16
	mov	sp, x9
	stur	w0, [x8, #-16]
	bl	_.mod1982.readall
	mov	x19, sp
	sub	x8, x19, #16                    ; =16
	mov	sp, x8
	ldur	x8, [x29, #-48]
	stur	x0, [x19, #-16]
	mov	x0, x8
	bl	_fclose
	ldur	x0, [x19, #-16]
	b	LBB50_3
LBB50_2:                                ; %.if.true.2048
	mov	x0, xzr
LBB50_3:                                ; %common.ret
	sub	sp, x29, #16                    ; =16
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh230, Lloh231
	.cfi_endproc
                                        ; -- End function
	.globl	_testfile                       ; -- Begin function testfile
	.p2align	2
_testfile:                              ; @testfile
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16                    ; =16
	sub	sp, sp, #64                     ; =64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	stp	x1, x0, [x29, #-32]
	bl	_.mod1701.setup
Lloh232:
	adrp	x0, _.str97@PAGE
Lloh233:
	adrp	x1, _.str98@PAGE
Lloh234:
	add	x0, x0, _.str97@PAGEOFF
Lloh235:
	add	x1, x1, _.str98@PAGEOFF
	bl	_fopen
	stur	x0, [x29, #-40]
	bl	_.mod92.new_context
	stur	x0, [x29, #-48]
	bl	_.mod92.parse_grammar
	ldur	x8, [x29, #-48]
	stur	x0, [x29, #-56]
	mov	x0, x8
	bl	_free
	ldur	x0, [x29, #-32]
Lloh236:
	adrp	x1, _.str99@PAGE
Lloh237:
	add	x1, x1, _.str99@PAGEOFF
	bl	__build_filename
Lloh238:
	adrp	x8, _O_RDONLY@PAGE
Lloh239:
	ldr	w1, [x8, _O_RDONLY@PAGEOFF]
	stur	x0, [x29, #-64]
	bl	_open
	cmp	w0, #1                          ; =1
	stur	w0, [x29, #-68]
	b.ge	LBB51_2
; %bb.1:                                ; %.if.true.2082
	ldur	x0, [x29, #-24]
	bl	_.mod1701.fail
	b	LBB51_5
LBB51_2:                                ; %.if.end.2082
	ldur	w0, [x29, #-68]
	bl	_.mod93.new
	mov	x19, sp
	sub	x8, x19, #16                    ; =16
	mov	sp, x8
	mov	w1, wzr
	stur	x0, [x19, #-16]
	bl	_.mod167.tokenize
	mov	x20, sp
	sub	x8, x20, #16                    ; =16
	mov	sp, x8
	ldur	x8, [x19, #-16]
	stur	x0, [x20, #-16]
	mov	x0, x8
	bl	_free
	ldur	x0, [x29, #-56]
	ldur	x2, [x20, #-16]
Lloh240:
	adrp	x1, _.str100@PAGE
Lloh241:
	add	x1, x1, _.str100@PAGEOFF
	bl	_.mod92.ast
	mov	x20, sp
	sub	x8, x20, #16                    ; =16
	mov	sp, x8
	stur	x0, [x20, #-16]
	bl	_.mod0.new_context
	mov	x8, sp
	sub	x19, x8, #16                    ; =16
	mov	sp, x19
	ldur	x9, [x20, #-16]
	stur	x0, [x8, #-16]
	ldr	x1, [x9, #8]
	bl	_.mod0.compile
	ldur	x0, [x29, #-32]
Lloh242:
	adrp	x1, _.str101@PAGE
Lloh243:
	add	x1, x1, _.str101@PAGEOFF
	bl	_read_testfile
	mov	x8, sp
	sub	x20, x8, #16                    ; =16
	mov	sp, x20
	stur	x0, [x8, #-16]
	cbz	x0, LBB51_4
; %bb.3:                                ; %.if.end.2108
	ldr	x8, [x19]
	ldr	x0, [x8, #8]
	bl	_rewind
	ldr	x8, [x19]
	ldr	x0, [x8, #8]
	bl	_fileno
	bl	_.mod1982.readall
	mov	x8, sp
	sub	x9, x8, #16                     ; =16
	mov	x2, x0
	mov	sp, x9
	ldur	x0, [x29, #-24]
	ldr	x1, [x20]
	stur	x2, [x8, #-16]
	bl	_.mod1701.assert_equal_str
	b	LBB51_5
LBB51_4:                                ; %.if.true.2108
	ldur	x0, [x29, #-24]
	bl	_.mod1701.fail
	ldur	x8, [x29, #-24]
Lloh244:
	adrp	x1, _.str102@PAGE
Lloh245:
	add	x1, x1, _.str102@PAGEOFF
	ldr	x0, [x8, #40]
	ldur	x8, [x29, #-32]
	str	x8, [sp, #-16]!
	bl	_fprintf
	add	sp, sp, #16                     ; =16
LBB51_5:                                ; %common.ret
	mov	w0, wzr
	sub	sp, x29, #16                    ; =16
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpLdr	Lloh238, Lloh239
	.loh AdrpAdd	Lloh236, Lloh237
	.loh AdrpAdd	Lloh233, Lloh235
	.loh AdrpAdd	Lloh232, Lloh234
	.loh AdrpAdd	Lloh242, Lloh243
	.loh AdrpAdd	Lloh240, Lloh241
	.loh AdrpAdd	Lloh244, Lloh245
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48                     ; =48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
Lloh246:
	adrp	x0, _.str103@PAGE
Lloh247:
	add	x0, x0, _.str103@PAGEOFF
	bl	_.mod1701.init
Lloh248:
	adrp	x1, _.str104@PAGE
Lloh249:
	add	x1, x1, _.str104@PAGEOFF
	mov	x19, x0
	str	x0, [sp, #8]
	bl	_testfile
	mov	w1, w0
	mov	x0, x19
	bl	_.mod1701.run
	ldr	x0, [sp, #8]
	bl	_.mod1701.cleanup
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	mov	w0, wzr
	add	sp, sp, #48                     ; =48
	ret
	.loh AdrpAdd	Lloh248, Lloh249
	.loh AdrpAdd	Lloh246, Lloh247
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
	.globl	_.str95                         ; @.str95
_.str95:
	.asciz	"%s.%s"

	.globl	_.str96                         ; @.str96
_.str96:
	.asciz	"r"

	.globl	_.str97                         ; @.str97
_.str97:
	.asciz	"./syntax.txt"

	.globl	_.str98                         ; @.str98
_.str98:
	.asciz	"r"

	.globl	_.str99                         ; @.str99
_.str99:
	.asciz	"in"

	.globl	_.str100                        ; @.str100
_.str100:
	.asciz	"start"

	.globl	_.str101                        ; @.str101
_.str101:
	.asciz	"out"

	.globl	_.str102                        ; @.str102
	.p2align	4
_.str102:
	.asciz	"Unable to open %s.out\n"

	.globl	_.str103                        ; @.str103
	.p2align	4
_.str103:
	.asciz	"compile/init.test.bn"

	.globl	_.str104                        ; @.str104
	.p2align	4
_.str104:
	.asciz	"./compile/__test__/01-empty_main"

	.globl	_.str74                         ; @.str74
	.p2align	4
_.str74:
	.asciz	"define i32 @main() {\n"

	.globl	_.str75                         ; @.str75
_.str75:
	.asciz	"ret i32 0\n"

	.globl	_.str76                         ; @.str76
_.str76:
	.asciz	"}\n"

	.globl	_STDIN                          ; @STDIN
	.p2align	2
_STDIN:
	.long	0                               ; 0x0

	.globl	_STDOUT                         ; @STDOUT
	.p2align	2
_STDOUT:
	.long	1                               ; 0x1

	.globl	_STDERR                         ; @STDERR
	.p2align	2
_STDERR:
	.long	2                               ; 0x2

	.globl	_SEEK_SET                       ; @SEEK_SET
	.p2align	2
_SEEK_SET:
	.long	0                               ; 0x0

	.globl	_SEEK_CUR                       ; @SEEK_CUR
	.p2align	2
_SEEK_CUR:
	.long	1                               ; 0x1

	.globl	_SEEK_END                       ; @SEEK_END
	.p2align	2
_SEEK_END:
	.long	2                               ; 0x2

	.globl	_O_RDONLY                       ; @O_RDONLY
	.p2align	2
_O_RDONLY:
	.long	0                               ; 0x0

	.globl	_O_WRONLY                       ; @O_WRONLY
	.p2align	2
_O_WRONLY:
	.long	1                               ; 0x1

	.globl	_O_RDWR                         ; @O_RDWR
	.p2align	2
_O_RDWR:
	.long	2                               ; 0x2

	.globl	_O_CREAT                        ; @O_CREAT
	.p2align	2
_O_CREAT:
	.long	64                              ; 0x40

	.globl	_O_TRUNC                        ; @O_TRUNC
	.p2align	2
_O_TRUNC:
	.long	512                             ; 0x200

	.globl	_ptr_size                       ; @ptr_size
	.p2align	2
_ptr_size:
	.long	8                               ; 0x8

	.globl	_.str19                         ; @.str19
_.str19:
	.asciz	"{\n\"querys\": ["

	.globl	_.str20                         ; @.str20
	.p2align	4
_.str20:
	.asciz	"\n{\"type\": \"%c\", \"value\": %s},"

	.globl	_.str21                         ; @.str21
	.p2align	4
_.str21:
	.asciz	"\n{\"type\": \"%c\", \"value\": \"%s\"},"

	.globl	_.str22                         ; @.str22
_.str22:
	.asciz	"],\n\"next\": [\n"

	.globl	_.str23                         ; @.str23
_.str23:
	.asciz	"],\n\"alt\": [\n"

	.globl	_.str24                         ; @.str24
_.str24:
	.asciz	"]\n}\n"

	.globl	_.str25                         ; @.str25
_.str25:
	.asciz	"("

	.globl	_.str26                         ; @.str26
_.str26:
	.asciz	"|"

	.globl	_.str27                         ; @.str27
_.str27:
	.asciz	")"

	.globl	_.str28                         ; @.str28
_.str28:
	.asciz	"EOF"

	.globl	_.str29                         ; @.str29
_.str29:
	.asciz	"|"

	.globl	_.str30                         ; @.str30
_.str30:
	.asciz	")"

	.globl	_.str31                         ; @.str31
	.p2align	4
_.str31:
	.asciz	"[%d:%d] malformed grammar, expected | got '%s'\n"

	.globl	_.str32                         ; @.str32
_.str32:
	.asciz	"|"

	.globl	_.str33                         ; @.str33
_.str33:
	.asciz	")"

	.globl	_.str34                         ; @.str34
	.p2align	4
_.str34:
	.asciz	"open brace not closed"

	.globl	_.str35                         ; @.str35
_.str35:
	.asciz	"+"

	.globl	_.str36                         ; @.str36
_.str36:
	.asciz	"*"

	.globl	_.str37                         ; @.str37
_.str37:
	.asciz	"?"

	.globl	_.str38                         ; @.str38
_.str38:
	.asciz	"("

	.globl	_.str39                         ; @.str39
_.str39:
	.asciz	"WORD"

	.globl	_.str40                         ; @.str40
_.str40:
	.asciz	"WORD"

	.globl	_.str41                         ; @.str41
_.str41:
	.asciz	"STRING"

	.globl	_.str42                         ; @.str42
_.str42:
	.asciz	"STRING"

	.globl	_.str43                         ; @.str43
	.p2align	4
_.str43:
	.asciz	"rule name: '%s'\n"

	.globl	_.str44                         ; @.str44
	.p2align	4
_.str44:
	.asciz	"Some characters are not allowed in this rule name"

	.globl	_.str45                         ; @.str45
_.str45:
	.asciz	"WORD"

	.globl	_.str46                         ; @.str46
	.p2align	4
_.str46:
	.asciz	"Identifier: {type: %s, value: '%s'}\n"

	.globl	_.str47                         ; @.str47
	.p2align	4
_.str47:
	.asciz	"rule identifier must be a WORD"

	.globl	_.str48                         ; @.str48
_.str48:
	.asciz	":"

	.globl	_.str49                         ; @.str49
	.p2align	4
_.str49:
	.asciz	"expected : after rule name"

	.globl	_.str50                         ; @.str50
_.str50:
	.asciz	"EOF"

	.globl	_.str51                         ; @.str51
_.str51:
	.asciz	"\n"

	.globl	_.str52                         ; @.str52
_.str52:
	.asciz	"\"%[^\"]\""

	.globl	_.str53                         ; @.str53
_.str53:
	.asciz	"(null)"

	.globl	_.str54                         ; @.str54
_.str54:
	.asciz	"%s: %s != \"%s\""

	.globl	_.str55                         ; @.str55
	.p2align	4
_.str55:
	.asciz	"unable to match token by value"

	.globl	_.str56                         ; @.str56
_.str56:
	.asciz	"%s: %s != %s"

	.globl	_.str57                         ; @.str57
	.p2align	4
_.str57:
	.asciz	"unable to match token by type"

	.globl	_.str58                         ; @.str58
	.p2align	4
_.str58:
	.asciz	"unable to retrieve alias rule"

	.globl	_.str59                         ; @.str59
	.p2align	4
_.str59:
	.asciz	"parser.bn: query matcher not implemented"

	.globl	_.str60                         ; @.str60
	.p2align	4
_.str60:
	.asciz	"Unable to find starting rule in the grammar"

	.globl	_.str61                         ; @.str61
_.str61:
	.asciz	"EOF"

	.globl	_.str62                         ; @.str62
	.p2align	4
_.str62:
	.asciz	"syntax parsing ended here"

	.globl	_PeekerInfo_size                ; @PeekerInfo_size
	.p2align	2
_PeekerInfo_size:
	.long	34                              ; 0x22

	.globl	_EOF                            ; @EOF
	.p2align	2
_EOF:
	.long	0                               ; 0x0

	.globl	_.str0                          ; @.str0
_.str0:
	.asciz	"digit too large"

	.globl	_.str1                          ; @.str1
_.str1:
	.asciz	"NUMBER"

	.globl	_.str2                          ; @.str2
_.str2:
	.asciz	"digit too large"

	.globl	_.str3                          ; @.str3
_.str3:
	.asciz	"WORD"

	.globl	_.str4                          ; @.str4
	.p2align	4
_.str4:
	.asciz	"lexer: reached end of file while scanning for 'STRING' token"

	.globl	_.str5                          ; @.str5
	.p2align	4
_.str5:
	.asciz	"string too large"

	.globl	_.str6                          ; @.str6
_.str6:
	.asciz	"STRING"

	.globl	_.str7                          ; @.str7
_.str7:
	.asciz	"char too large"

	.globl	_.str8                          ; @.str8
_.str8:
	.asciz	"CHR"

	.globl	_.str9                          ; @.str9
_.str9:
	.asciz	"NL"

	.globl	_.str10                         ; @.str10
_.str10:
	.asciz	"\n"

	.globl	_.str11                         ; @.str11
_.str11:
	.asciz	"COMMENT"

	.globl	_.str12                         ; @.str12
_.str12:
	.asciz	"OPERATOR"

	.globl	_.str13                         ; @.str13
_.str13:
	.asciz	"-"

	.globl	_.str14                         ; @.str14
	.p2align	4
_.str14:
	.asciz	"%d:%d error: found non ascii token: '%c' (%d)\n"

	.globl	_.str15                         ; @.str15
_.str15:
	.asciz	"OPERATOR"

	.globl	_.str16                         ; @.str16
_.str16:
	.asciz	"EOF"

	.globl	_.str17                         ; @.str17
_.str17:
	.space	1

	.globl	_Token_size                     ; @Token_size
	.p2align	2
_Token_size:
	.long	48                              ; 0x30

	.globl	_ParseCtx_size                  ; @ParseCtx_size
	.p2align	2
_ParseCtx_size:
	.long	160                             ; 0xa0

	.globl	_.str18                         ; @.str18
	.p2align	4
_.str18:
	.asciz	"[%d:%d] error: %s\n"

	.globl	_Error_size                     ; @Error_size
	.p2align	2
_Error_size:
	.long	24                              ; 0x18

	.globl	_Query_size                     ; @Query_size
	.p2align	2
_Query_size:
	.long	24                              ; 0x18

	.globl	_Matcher_size                   ; @Matcher_size
	.p2align	2
_Matcher_size:
	.long	32                              ; 0x20

	.globl	_Rule_size                      ; @Rule_size
	.p2align	2
_Rule_size:
	.long	16                              ; 0x10

	.globl	_ParsingContext_size            ; @ParsingContext_size
	.p2align	2
_ParsingContext_size:
	.long	8                               ; 0x8

	.globl	_Node_size                      ; @Node_size
	.p2align	2
_Node_size:
	.long	48                              ; 0x30

	.globl	_ParseResult_size               ; @ParseResult_size
	.p2align	2
_ParseResult_size:
	.long	16                              ; 0x10

	.globl	_.str63                         ; @.str63
_.str63:
	.asciz	"\n"

	.globl	_.str64                         ; @.str64
_.str64:
	.asciz	"  "

	.globl	_.str65                         ; @.str65
_.str65:
	.asciz	"(null)"

	.globl	_.str66                         ; @.str66
_.str66:
	.asciz	"{"

	.globl	_.str67                         ; @.str67
_.str67:
	.asciz	"\"type\": \"%s\""

	.globl	_.str68                         ; @.str68
_.str68:
	.asciz	"\"value\": %s"

	.globl	_.str69                         ; @.str69
_.str69:
	.asciz	"\"line\": %d"

	.globl	_.str70                         ; @.str70
	.p2align	4
_.str70:
	.asciz	"\"char_of_line\": %d"

	.globl	_.str71                         ; @.str71
_.str71:
	.asciz	"\"next\": "

	.globl	_.str72                         ; @.str72
_.str72:
	.asciz	"\"children\": "

	.globl	_.str73                         ; @.str73
_.str73:
	.asciz	"}"

	.globl	_CompilerCtx_size               ; @CompilerCtx_size
	.p2align	2
_CompilerCtx_size:
	.long	16                              ; 0x10

	.globl	_.str77                         ; @.str77
_.str77:
	.asciz	"w"

	.globl	_.str78                         ; @.str78
	.p2align	4
_.str78:
	.asciz	"Running tests in %s\n"

	.globl	_.str79                         ; @.str79
	.p2align	4
_.str79:
	.asciz	"unable to open pipe"

	.globl	_.str80                         ; @.str80
_.str80:
	.asciz	"w"

	.globl	_.str81                         ; @.str81
	.p2align	4
_.str81:
	.asciz	"unable to open stdout"

	.globl	_.str82                         ; @.str82
_.str82:
	.asciz	"w"

	.globl	_.str83                         ; @.str83
	.p2align	4
_.str83:
	.asciz	"[ \033[31mERROR\033[0m ] %s: \n"

	.globl	_.str84                         ; @.str84
	.p2align	4
_.str84:
	.asciz	"[ \033[33mWARN\033[0m  ] %s: no asserts found\n"

	.globl	_.str85                         ; @.str85
	.p2align	4
_.str85:
	.asciz	"[ \033[32mOK\033[0m    ] %s\n"

	.globl	_.str86                         ; @.str86
_.str86:
	.asciz	"\n"

	.globl	_.str87                         ; @.str87
_.str87:
	.asciz	"#%d: "

	.globl	_.str88                         ; @.str88
	.p2align	4
_.str88:
	.asciz	"expected '%d', got '%d'\n"

	.globl	_.str89                         ; @.str89
	.p2align	4
_.str89:
	.asciz	"expected '%c' (%d), got '%c' (%d)\n"

	.globl	_.str90                         ; @.str90
	.p2align	4
_.str90:
	.asciz	"value %s is not truthy\n"

	.globl	_.str91                         ; @.str91
	.p2align	4
_.str91:
	.asciz	"expected '%s', got (null)\n"

	.globl	_.str92                         ; @.str92
	.p2align	4
_.str92:
	.asciz	"expected '%s', got '%s'\n"

	.globl	_.str93                         ; @.str93
	.p2align	4
_.str93:
	.asciz	"expected null pointer, got: %p\n"

	.globl	_.str94                         ; @.str94
	.p2align	4
_.str94:
	.asciz	"expected pointer, got: (null)"

	.globl	_T_ptr_size                     ; @T_ptr_size
	.p2align	2
_T_ptr_size:
	.long	48                              ; 0x30

.subsections_via_symbols
