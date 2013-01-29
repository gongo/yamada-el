;;; yamada.el --- Dancing yamada

;; Copyright (C) 2013 by Wataru MIYAGUNI

;; Author: Wataru MIYAGUNI (gonngo _at_ gmail.com)
;; Version: 0.0.1

;; MAHALO License (based on MIT License)
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; 1. The above copyright notice and this permission notice shall be included in
;;    all copies or substantial portions of the Software.
;; 2. Shall be grateful for something (including, but not limited this software).
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.

;;; Commentary:

;; Run this program, Yamada dance.
;; For "Yamada", see http://ja.wikipedia.org/wiki/WORKING!!

;;; Usage:

;;
;; (require 'yamada)
;;
;; (global-set-key (kbd "C-c C-c C-y") 'yamada-dancing)
;;
;; (yamada-dancing 1) ;; or C-c C-c C-y (M-x yamada-dancing)
;; (yamada-dancing 5) ;; or C-u 5 C-c C-c C-y
;;

;;; Code:

(defconst yamada-frames '("\
                                  JIhSZEEEE3 3I|EEEEEEhi!IEIEEEXEEE22
                                  t2EEEE33E | t!FEEEEEEt|!I! EXXEESII
                                  IEEXXEtr3c<i(</FFFFfF i; ;/IEXXEEI1
                                  IXXXXEr ^^icJJ:::::::!/i ^!I hXXXZZ
                                  IXXXXXr!|:!I3 ::::::::t3C:|! EXVVVV
                                  I#K##X1::::'':::::::::'^::::CXX2
                                  CXOK##4|:::::::::::::::::::|SXXS
                                  tXO$K##J:::::::::;;;~::::::/Z##Xt
                                   EOD$KKX;:::::/rrirrC ::::;(XKKK2
                                   I#DB$OKk<:::::/iiri/|::~=k$O#OOXt
                                    5O%B$OKIr/;::::|||:;veb8D%D$##O21
                                  rr?FFTTT#Xi'!///|;<|!?FPP9HD%$KhVXX
                               r!|:``-::::^V[;:r|//ir||/||:''^TPOKCff
                            rr|-`::``-::`|`'F[;!///rr|||:::```|:^VZ/:
                          rr!:```::```::`|`-'74;|iir!:`:::|``-:-`|3(c
                         rr'`````::``-::`:```:?Xokkov+~::-|``::```'C3
                       rr^:``````::``-:--|~--:{K#V31?TV[|-|`::`````''
                     rr!'````````::-`:<<ci|i;i35?3 I{;:!:`|-::```````
                   rr!:``````````::;cIIS3CtttJ7/|3 !7Ev::-|::````````
                  r^|:--````````:; I {SI?!!^ttti!t4i:'Fn~:!:`````````
                 ^:::::|~--````-|{It(3Ir::::rt?  i34<-:7hsz~-``-`````
               r|:::::::/!|;:---(SSS3Sr:::::| i:tr!?Vz~-'I8G<-`````--
             r!:::::::~iri<<i<;cSSSSSC:::::::rJ;Jr|::?!`;K%D$o;--:~<i
            r!::::::;irrr      S333SS!:::::::/tJt ||---:(H%DO5?;||:||
           r!:::::::::!rrr    II?!?CI::::::::/ttt ^|---|F^*T?!!|:::::
            i;::::::::::!rrrr r|::||^;:::::::/ttt |:-`:iri~::|:::::::
            r i<;:::::::::|^r!:::::| |:::::::rtttr::--| rr /:::''':::
               r ri<;;::::::::::::|/ir::::::| t1t /:-: rrrrrri;:-----
                    rrri<;;:::::;c j{J::::::/t|  ||:-|! r
                       rrrrr'':: SIISI|::::|Jr|t!::`::|rrr
                        r^!'````:tC IS1|:::itcJr;|`````:!rr
                        |```````-: {2SS2c<Jtt !/'````````:^rr
                     rr!:```````-::^7IICCCtt |:````````````:!r
                    rr'-``````-::~++=cJir!:::```````-:::::```|rr
                  r !`````````:::iC rCt^':``````````::```|-```:^r
                  r!:``````````|::^!^:r:::```````````|---::`````!r
                  r:````````````::-:--:::-```````````/::::```````|"
                       "\
                              JJ(({{{{((JJ
                           ({[4ZEEXXEEEEEZ4[{J
                        J{4XXXXXXXXXXXXXXXXXXE[{(J
                      ([XXXXXXXXXXXXXXXXXXXXXXXXXh2(
                    ([XXXX#XXXX#XXXXXX#XXXXXXXXXKXXX4{J
                   13XX#X###X#####K#X###X##5#####OKK#5S1
                  {4K##K#####5#3F######XCVXrFX####OO#K2Ct
                 tXKK##K#57#3 Vt!5######1/3i|C5##K#OOKZt
                 2KOOOOO#t|3C!t | ######E!:|:!^F#K#OO#Xt
                 hOOOOOOOJ:/ ;|/;iIFT?^!!|;+=c;:5OK5Ft
                 3OOO8DOO[:r?^i{Ir:::::::i 1/!!;XOOK1
                 IOODB%DOK|:::?II!:::::::^C?:::^VOOO4J
                 t#ODBBD$Ok:::::::::::::::::::|i F#OO4
                  3ODBBBDOOc::::::::::::::::::|rrrtVHO4J
                  tVFYFPHOOXi::::::;;;<<=~::::|:::'!tF#41
                 ^':::``|!T#4i::::/iiiir?::::|:`````:r F3I({nvsj1CFFF
              rr'````::`::-^VXz<;:::!^!|:;|/:::``````:rr    r'':::|//
    J/|i r  rr^:````````-:`:|^VXnr/||||i/||||::--:-```:rrrrr|-----:|i
 Jtt?'::::::'!:```````---|`::-:'TV[ i/ir|||'::::-:````:!^rr!:-:::::!!
It !:::```````::``````-::|`-:-```:^?F{jjc|:-::-:-:`````````::::-`:|||
 t!::```````````:-````-:|:--::``---:ikk4XXkn |::::````````-|::---:||!
Ir::-```````````-:-`--::::``::```-;nK#?F(/'!|:--|```````-:|;:---:|||/
 |::`````````````::---:`::```::--;4OFI |?Vkxv==-|--``---|:|!|:--:!rrr
 :::`````````````:||||:-:-``````:^T7:!E |:'^??^:{<---::|i/i|::::-:|/i
 ::-`````-:-`````-|ir|-::`````````````!Vn;--`--:3Fi::;////r;|:::|--::
 ::-```````:``````|rri-::````````````-:'??```--| rrrri|!!!/r//||:----
 :::``````````````|rrr/:-````````````::```````-irr   r|:::|!!|:|;:---
I/::`````````````-|rrr/-`````````````-```````-|rr     r<:::::iiirriii
t ;:-````````````:/rrr|-`````````````````````:irr       ri<ir r    rr
r i::-``````````-:rrrr|-````````````````````:!rrr
IJti;|-`````````:irrr''````````````````````::::!rr
 tttJ|::--````-:irrr|-``---------`````````:::-``:'^rr
   ttti;|~:-:;<rrrr!:```-::::-::::-````````````````:!r
       r^r   rrrrr:`````::;++c   /:----:````---:::-```|rr
              rr!:-`````::;C  tt?!|::::`````::```::````:!r
              r!--``````:::''!:/|::`````````-:---::``````'^rr
             rr:``````````::::-:::``````````-::`|``````````|r"
                       "\
                            J({[4ZEEEEZZ[{{JJ
                         J{4EEEEXXEXXXEEEEEE4[(
                       J{ZXXXXXXXXXXXXXXXXXXXXE2J
                      14XXXXXXXXXXXXXXXXXXXXXXESICJ
                     JSEEXXXXXXXXXXXXXXXXXXXXXXX4Z2J
                     2[XXXKX############X#X######XX2
                    JXK########3E########X?V5V5####Xt
                    I#########V/EIXK###5VF;tI E#####t
                    hOKOOO#57F!| ^E###V7 /:| <I7####C
                   JXOKOOO#?i 7?IIt^:::::/rFt^ |X#XVt
                   CKOOOO#7:!|:1SI/::::::!33r:::X#Vt
                   S55#OOVr::::'??::::::::'!:::|XI
                  ?/::EO5?;|:::::::::::::::::::iE!:!
                 :-:|;3#I:|::::::::::::;;::::::{7:-: r
               rr----|3#t:-::::::::/rirrC!:::<nV:--:
               r/--``-t#r|-::`:|;~::!//!|::|kK5^---: r
              rr|````-/XJ/-::`-:/ Ji<+=<|::kK#?:-`-:rr
               ::-````:I i-::-|35#5FV#FF?:n#5 |:``--:rr
             rr:::-```:r /-`:::;4?!||5 :- K5Fi:``````: r
             rr:-`::-``:t|``::|X ;iri F||h#?||```````:rr
             rr-````````!i-``-JXJICJtt;i/EF:::```--`-irr
             rr:```-````:^;``:IX[SCttt :/E!-::-----:/rr
             r ;~--``````:::``::I3ItttJi|I|:i<~--:::irr
               rrr|::-```::```--I2CCt!  :riir r|::::rr
                rr|:::|:;::```--CS2Ct|/t/|Crrr/:::::rr
                 r|::::::|````-: S3It/|ti:/rrri::::: rr
                  /::::::|-`-::::|! ttJtJ:|Jr!:::::: rr
                 rr:::::::::;|::~;;/ttttt|'r|::::::| r
                 r |:::::::::|:::::|ttttt/-i|:::~;ir
                  r /::::::::|/:;;vnIttttr;r;<irr
                rr|:::--````:'|!!^ISSt/| r:!'/r
                rr:-`-::::-------:tIIt/| r-|-:rrr
              rr!:--:::--:::::---:rSIti/ /|:``::'^rr
             rr:-`-:::i  ICI^:|;::/I3tttt|;:------:!r
            r!:````::; Crt^t':::::|tIttt !|::``::```'rr
           r!-``````::::!:|!:::````'? ^^''::---`:````-!rr
           /-````````::::::|:```````-:::``-|::|::-````-|rr"
                       "\
                             1SEEEEEEEEEXEEEZEhEXEEEEhhSIC
                            tSZEXXEEXXEXE3EXEEEEVEVVEEEEhS{
                           JSXXXXXXXXE3II XXXXXE 3rtEVEXXEZJ
                           2XXXXXXXEXF^C (XXXXXI/C^ 3?3XXXXC
                          1XXXXXXXI I|/r|CV33FF!/r;it|CXXXXI
                         J4X####XI^C?? tI?^:::::!ttI^^3VXXVC
                         [######Xt|^::333|:::::::t3I:|? XXIt
                        IK#####5 |::|:|?^:::::::::^:::|1E3
                       JXOOOOK#[;:::::::::::::::::::::|SC
                      J4OOO$OOODboc:::::::;;;;<+;:::::iI
                      {KOO#H###95Fri;::::: rrrrt!::::;{t
                     JEF?^::3V|-:::'!|~:::!////!:::<nXF?
                     7!:--|:I |--:--`:|/|;;::::;i||[#F|:|r
                   r!----`:|C/|--:-`--::|/// /||^i(#F:|:-/r
                 rr!`-`-```/C/:--::---::|!//i|:::2V?!::--: r
                rr|`:--```-|I|:--::`-;=sk43[k=:: 3!::|````^ r
              r !:``::`````: :|--::-:7?CX?:3VVko3!`:|:`----! r
              r'`````::--`-:||::;:;--:jV ::S !3F|:`||--`````|rrr
             ^:-``````::--|:i{ cic|||kV!:|!51it':``|:````````|rr
           r!:-`````-``::::<23Ittti/25^::|rEt^:````|:``````-:/rr
            i<;;~~:---``:/|2C Ittt |r'---|:3 :`````:-`````-:!rrr
              r::::|||;-|/{ItJ2tCCt//---:|`''`````-;:----~|:::r
             r|::::::i//iJS3SSSC!^t||:-::````````-:::||!r|:::::;
            r|:~;:::irrr^?F3SSIt:/t/|:::````````:|||||:::|;::::::
           r|:::::|i ^|:;::rCICt<it!!:`````````-|i/|;||;:::!::::|:
           |::::::::!::::::| CttCt :|-```````--irri| ir /|:::::::::
           i;:::::::|::::::| Cttttr||-``````-:irrr       ii|:::::::-
             rri<<<<<i|<=vvj{Ctttt|::``````-;irr            riiiii|:
                       tSSSS3C tt |:-`````-;rrr                 rrri
                      ^rSCF3I |itr::```````:!
                   rr::/I  SCr|t :::````````::'rr
                 rr!:-:/I1JItJJt^|:-```````````:rr
               rr!:-:|:i2SItttt^:|:---``````````:!rr
              rr!```|:;tIICtttr||::|;:::::```----`:!rr
             rr:````:||'!r^rr||:````::``````::::::-`:rr
            rr:```````::::::::-````````````-::``-::``:!rr
           rr:```````````::::-`````````````-:```-::```-|rrr  "
                       "\
                                                ({[ZEEEEEEEEEEEE4[(JJ
                                             J{4EEXXXEXXXXXXXXXXXEEZZ
                                           12EXXXXXXXXXXXXXXXXXXXXXXX
                                         {324ZXXXXXXXEXXXXXXXXX5XXXXX
                                       {4XXXXXXXXXXXXF3VVXXXXXX VXVEX
                                     J4X#########55V?|I^IX###XX|r3rCV
                                    {X#####K$###XII?|r |2X###X3||C| C
                                  J[K5XKKO$8D###Vr |:|:|t33VFF^::!:/r
                                 J[KV4OO$8B%OO##?/ ^ rtt^::::::;<<cii
                                 2K#UOODBBBDOO#F::|:r33 ::::::::jjt|:
                                JXOKOODBBBBDOOV::::::^^:::::::::77!::
                                t#OOOO%BBB%OOK(;;::::::::::::::::::::
                                t#O#VT*??T#OO$Dbk;:::::::~~::::::::::
                                 V7'`---|iO# !!''/:::::|rrrr C/::::||
                              r ^'```---i4#?|:|--|/;::::/irri!:::~<r
                             r^'--```--:JV^|:-|-`::|//;~:|!!|~;|'|^
                          rrr|:--````--iC|-|`-|-----:'i//ii!!|::-::''
                         r^|:~|;--:---;t|`|:`::----:::!//r|||!::::---
                       Jr::<ttJtr:!!;;!::::``::-:24kxxz c !'::::|:~+=
                        ii1tttt?:|:`'|;:::```::--:''rSVV54z;||r?r?7??
                         ttttt :|:```:!::`````:~:~=CT?|1r^^:|-:------
                       !|J^:it||:````-|:`````-;sF?^::|rS|--::::```---
                     r|:it|| r:|``````:-``````''```-|r2F!''`-|:````--
                    ^::| ttcti;:``````::``````````-:|i3!``--:i;```--:
                  r!:::rtttt :|-``-```::`````````-::`````--:ir ;~;|!|
                  /::::/ttttr:|--:|;:`::````````-::`````--;rr
                   i;::ittttr:|-``::`-:-```````-:``````--;
                     r<iC?tt/::``````-:```````````````-~ir
                       Cr: ti::``````::`````````````-~irr
                       t : tr::``````|```````````--;irr
                       tt Jti::-````::-`````````-|rrr
                     r!:rttt ||-```:|:``````````::!^^
                  r^!:``| ttJ/|:--;i:/:--````````-:`: r
                rr'`-```-''!r i/</|--|:':::----:':--:^
              r ^:`````````:|::!'||:;:`````::````::::|!r
             rr|-````````````::::::':```````````-::``:::rr
            rr:`````````````````````````````````-:``:|--:rr      "
                       "\

                                                       J({{[[[[{{(J
                                                   J{[4EXXXXXXXXXXE44
                                                1{4XXXXXXXXXXXXXXXXXX
                                             J12EXXXXXXXXXXX#XXXXXXXX
                                           J[444XX#XX5#XXX#######X###
                                        J{kX##K#K####K##V355#KK##KV5X
                                      J{UKKKKO$$DKKK##XF/h?I######C??
                                     (455KOO$8BBOOOO##I|cC: ######t::
                                    {53[KOO8BBB%OOOO5V!:!!|tVVVVVV?||
                                   2Vt[OOD8BBBBDDOO#tCriicc/|:::::;||
                                  1XC[OOD%BBBB%ODOOV!r:| vC:::::::|^?
                                 J4#2$ODDBBBBB%OOO5!::::7F!:::::::|CI
                                 tXOKOH5PPFPP9DOO# ::::::::::::::::'!
                                 tXO5T'':--:|!XO#?'|:::::::::::::::::
                                  F?'-```--:|J#V^|-`/::::::i/|<<<;:::
                               rrr'```````-:iZF:-::`||~:::: irir !:::
                             r !:--```````-<C^|--::``||/;;:|!!!!|::::
                          JtC ^||'':-----:c7:::`-::```:|////;;;|/:::|
                        Jttt !|:````::-:|!::-::`-:--++;;|///r|||!|:::
                         7t ||:``````:|:::|-::``-:`'?YVXkncii|!!:/!;~
                       r|rt!::````````::|:`-::``-:----:cIF##Xt|-|:`::
                      Ji/  :::````````:|:`-::```-:|+=(f?|!Xr||:::````
                      Cttt/;:`````````-:::'`````|7?^'':''iX!:`-i:````
                      Cttt|::````-````-::``````````````-;[F:--;ri-```
                    ^|tttt:::```;:;-``-::`````````````:|rf'--;rrri<;;
                    ||tttt!::````:'```-:-```````````-::````:|rr rr ii
                     Jt  t|::`````````::```````````-`````-;ir     r
                      t|rti~:-````````::```````````````-;i r
                      ti| t:::```````-|``````````````-;irr
                       CJtti;:-``````;:```````````-:;i r
                      r? ttJ/::`````~ ;:-```````-::/ rr
                   r^!'`'rttJ;/~-`-;t?|::-````````::::!
                rr^:``````'^^^^;iir!t:-:|':------:':--:rr
               rr'```````````:|:-:::!:::````:::````::::r
             rr!````````````````':::':````````````-::-:|rr
            rr:```````````````````````````````````::`|:::rr  "
                       "\
                                               ({[[ZEEEEEEEEZ[[{J
                                            ({4EEXXXEXXEXXXEEEEEE4{J
                                          J[EXXXXXXXXXXXXXXXXXXXXXX44
                                         J3XXXXXXXXXXXXXXXXXXXXXXXXXE
                                        JIhEXXXXXXXXXXXXXXXXXXXXXXXXX
                                        I4X########XV#X5#####E3XXXX##
                                       Jh#######XV#V!X3tX##### 7X3FX#
                                       CXKK#KK##IrEt|CS/3#####2!7trE#
                                       2KOOKOOO#r/ti;/I| 5VFT7 |/i<IV
                                      tXOO$DOOOXt??rtI?|:::::| 7t?r??
                                      [OODB%OOOK||: 3I!::::::: 3 ::::
                                     {OO$BBBDOOOi:::'':::::::::':::||
                                    1KOHHR%BDOOO[::::::::::::::::::/i
                                   JVT^''||?F#OOKi::::::;;;;;~:::::rt
                                   ^'``-`-|-:^VOO[;::::/rrrrt/:::;i
                                rr:`-`````|`-:|VOKCi;~::!/r/!::::!/ r
                               r/:````````|`-::?5#C|!i//<<;|i:``::| r
                              rr:`````````|`-::|^#4||//r /||/:--|-|rr
                               :```````-`-|`::`|:FX/:!c r!'|::-|`-| r
                           rr|:-```````--|:-::`::!XnoU#Xks;|::::`:/rr
                           r:-``-``````-|!`::``|:r##VF2CCt !!|:```!rr
                           r;:-````````:/:-|```::/I3(13ICCti:::``-`/r
                            r  ;~--```-::-|```--: S3S3C^ i: i|;----|/
                            r !:|||;:`::::``````/SSS33 :rt|/r:|:;<ir
                            r ::::::||;::``````-1ICI3I/:|t iJ||!trr
                            rr::::::::|````````:2C CSI::: ttt!|| r
                             r::::::::````````-/2t ISt::: ttt|:|
                            r!:::::::|```````-:iS22SS ::: ttt/:/r
                           r||::::::::``````-::?7FFISr::: ttti|/r
                          r!:|:::::::::::---::::;;|^7 ::| r|t/:|/
                         r ::|::::::::::::::|:::::||JJ::/J/|t|||i
                        rr^'`::::::::::::::::|:::|it2C::it|/ |i
                      rr|`````::|:::::::||:::'::;i{SSI|| tcJ i
                     rr/:`````-|:;=<ccci|:``````: SC SJitttt|/
                     r/:``````-|: C rC?r:|---```:!7IJS3Ctttr<r
                   r ^:````````::'^!i!/|::``````:`:'?F?!r?::!rrr
                   r/-``````````:;:-:-:::```````||::|||/:````:rr"
                       ))

;;;###autoload
(defun yamada-dancing (count)
  "Yamada dance COUNT times."
  (interactive "p")
  (let ((olay (make-overlay (window-start) (point-max))))
    (unwind-protect
        (progn (overlay-put olay 'invisible t)
               (dotimes (n count)
                 (dolist (frame yamada-frames)
                   (setq frame (propertize frame 'face 'highlight))
                   (overlay-put olay 'after-string frame)
                   (redisplay)
                   (sleep-for 0.05)
                   (discard-input))))
      (delete-overlay olay))))

(provide 'yamada)

;;; yamada.el ends here
