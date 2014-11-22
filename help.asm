;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~
;
; *HELP
;
; Shows (very) basic usage.
;
STARHELP:

   ldx   #0

@vers:
   lda   version,x
   jsr   OSWRCH
   inx
   cpx   #48
   bne   @vers

   jsr   STROUT
   .byte "*CAT, *. ([A-Z])",$0d,$0a
   .byte "  SHOW FILES ON CARD",$0d,$0a
   .byte "LOAD, *LOAD [FN] ([S])",$0d,$0a
   .byte "  LOAD PROGRAM OR DATA",$0d,$0a
   .byte "SAVE [FN]",$0d,$0a
   .byte "*SAVE [FN] [S] [E] ([R])",$0d,$0a
   .byte "  SAVE FILE OR DATA",$0d,$0a
   .byte "*RUN [FN], *[FN]",$0d,$0a
   .byte "  LOAD AND RUN A PROGRAM",$0d,$0a
   .byte "*INFO [FN]",$0d,$0a
   .byte "  SHOW PROGRAM LOAD/EXEC/LENGTH"
   .byte $0d,$0a
   .byte "*EXEC [FN]",$0d,$0a
   .byte "  'TYPE' CONTENT OF FILE",$0d,$0a
   .byte "SEE DOCUMENTATION FOR MORE!"
   nop
   rts
