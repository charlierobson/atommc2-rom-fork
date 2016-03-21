;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~;~~
;
; *HELP
;
; Shows some info
;
star_help:

   ldy   #(version_long - version)
   jsr   print_version

   jsr   STROUT
   .byte 10, 13, "INTERFACE F/W VERSION "
   nop

   FASTCMDI CMD_GET_FW_VER
   jsr   ndotn

   jsr   STROUT
   .byte 10, 13, "BOOTLOADER VERSION "
   nop

   FASTCMDI CMD_GET_BL_VER
   jsr   ndotn

   ; read and display card type
   ;
   jsr   STROUT
   .byte 10, 13, "CARD TYPE: "
   nop
   SLOWCMDI CMD_GET_CARD_TYPE

   jsr   bittoindex
   ldy   #4

@sctloop:
   lda   cardtypes,x
   cmp   #$20
   beq   @skipwhite
   jsr   OSWRCH
@skipwhite:
   inx
   dey
   bne   @sctloop

   jmp   OSCRLF

ndotn:
   pha
   lsr   a
   lsr   a
   lsr   a
   lsr   a
   jsr   $f80b                  ; print major version
   lda   #'.'
   jsr   OSWRCH
   pla
   jmp   $f80b                  ; print minor version
