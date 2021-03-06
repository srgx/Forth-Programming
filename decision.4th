
( Decision)

( ---------------------------------------------------)

( Equal)
: ?FULL   12 = IF  ." It's full "  THEN ;

( Compare numbers)
: EQNUMBERS   - IF  ." Numbers are different "  ELSE  ." Numbers are equal "  THEN ;

( Greater)
: ?TOO-HOT   220 > IF  ." Danger -- reduce heat "  THEN ;

( Reverse condition)
: ?LE50   50 > INVERT IF  ." Less than or equal 50 "  THEN ;

( Branching)
: ?DAY   32 < IF  ." Looks good "  ELSE  ." No way "  THEN ;

( True if number is less than 1 OR greater than 31)
: ?DAY2  DUP 1 < SWAP 31 > + IF  ." No way " ELSE  ." Looks good "  THEN ;

( Safe division)
: /CHECK   DUP 0= IF  ." Invalid " DROP  ELSE  /  THEN ;

( Zero means false)
: /CHECK2   DUP IF  /  ELSE  ." Invalid " DROP  THEN ;

( Duplicate only non-zero value)
: /CHECK3   ?DUP IF  /  ELSE  ." Invalid "  THEN ;

( Clear stack if value is not 0)
: /CHECK4   DUP 0= ABORT" zero denominator " / ;

( Stop execution of external procedure)
: ENVELOPE   /CHECK4 ." The answer is " . ;

( Nested conditional statement)
: EGGSIZE
   DUP 18 < IF  ." reject "      ELSE
     DUP 21 < IF  ." small "       ELSE
       DUP 24 < IF  ." medium "      ELSE
         DUP 27 < IF  ." large "       ELSE
           DUP 30 < IF  ." extra large " ELSE
             ." error "
           THEN
         THEN
       THEN
     THEN
   THEN
 DROP ;
 
( Boolean test)
: TEST   IF  ." non-"  THEN  ." zero " ;

( Remainder)
: MULTIPLE10   10 MOD IF  ." Non-multiple "  ELSE  ." Multiple "  THEN ;

( ---------------------------------------------------)

( Definition tests)
5 ?FULL 12 ?FULL CR
150 ?TOO-HOT 250 ?TOO-HOT CR
55 ?LE50 50 ?LE50 CR 45 ?LE50 CR CR

( Day of month)
14 ?DAY CR 35 ?DAY CR
25 ?DAY2 CR -7 ?DAY2 CR CR

( Division)
10 5 /CHECK . CR 8 0 /CHECK . CR
80 2 /CHECK2 . CR 1 0 /CHECK2 . CR
40 2 /CHECK3 . CR 2 0 /CHECK3 . CR
20 2 /CHECK4 . CR CR
16 2 ENVELOPE CR CR

( Zero denominator errors)
( 4 0 /CHECK4)
( 5 0 ENVELOPE CR)

( Egg size)
15 EGGSIZE 24 EGGSIZE 35 EGGSIZE CR

( Any non-zero value is true)
5 TEST -2 TEST 0 TEST CR

( Multiple of 10)
24 MULTIPLE10 50 MULTIPLE10 CR CR

( Number comparison)
5 2 EQNUMBERS 8 8 EQNUMBERS CR CR

( ---------------------------------------------------)

( Negative OR divisible by 10)
: VEGETABLE   DUP 0< SWAP 10 MOD 0= + IF  ." ARTICHOKE "  THEN ;

5 VEGETABLE -2 VEGETABLE 20 VEGETABLE -30 VEGETABLE CR CR

( Check box dimensions - [length width height -- ])
: BOXTEST   6 >  ROT 22 >  ROT 19 >  AND AND IF  ." Big enough "  THEN ;

( Dimensions: width > 22, length > 19, height > 6)
22 19 6 BOXTEST 24 21 8 BOXTEST CR CR

( ---------------------------------------------------)

( Problem 1)
( -1 -> 0 -> -1)
( 0 -> -1 -> 0)
( 200 -> 0 -> -1)

( Problem 2)
( Artichoke)

( Problem 3)
: CARD   17 > IF  ." ALCOHOLIC BEVERAGES PERMITTED "  ELSE  ." UNDER AGE "  THEN ;
15 CARD CR 20 CARD CR CR

( Problem 4)
: SIGN.TEST
   DUP 0> IF  ." POSITIVE " DROP  ELSE
     0< IF ." NEGATIVE "  ELSE
       ." ZERO "
     THEN
   THEN ;
-5 SIGN.TEST 0 SIGN.TEST 5 SIGN.TEST CR CR

( Problem 5)
: STAR   42 EMIT ;
: STARS   0 DO STAR LOOP ;
: STARS2   DUP 0> IF  STARS  ELSE  DROP  THEN ;
-7 STARS2 0 STARS2 7 STARS2 CR CR

( Problem 6)
( low-limit <= n < hi-limit)
( n lo-limit hi-limit -- flag )
: WITHIN1   ROT DUP ROT < ROT ROT <= AND ;

( WITHIN2)
(     1 5 8)

( Over)
( OVER 1 5 8 5)

( Calculate range)
( -    1 5 3)

( Push range onto return stack)
( >R   1 5 [3])

( Subtract lo-limit from number to get difference)
( -    -4 [3])

( Get range value from return stack)
( R>   -4 3)

( Compare numbers using U<)
( U<   0)
: WITHIN2   OVER -  >R  -  R> U< ;

( low-limit < n < hi-limit)
: WITHIN3   ROT DUP ROT < ROT ROT < AND ;

4 5 8 WITHIN1 . CR
5 5 8 WITHIN1 . CR
6 5 8 WITHIN1 . CR
7 5 8 WITHIN1 . CR
8 5 8 WITHIN1 . CR

15 STARS2 CR

4 5 8 WITHIN2 . CR
5 5 8 WITHIN2 . CR
6 5 8 WITHIN2 . CR
7 5 8 WITHIN2 . CR
8 5 8 WITHIN2 . CR

15 STARS2 CR

4 5 8 WITHIN3 . CR
5 5 8 WITHIN3 . CR
6 5 8 WITHIN3 . CR
7 5 8 WITHIN3 . CR
8 5 8 WITHIN3 . CR

( Problem 7)
: GUESS1
   2DUP = IF  ." CORRECT! " DROP  ELSE
     2DUP > IF  ." TOO LOW "  ELSE
       ." TOO HIGH "
     THEN
   THEN DROP ;
   
: GUESS2
   2DUP = IF  ." CORRECT! " 2DROP  ELSE
     OVER < IF  ." TOO LOW "  ELSE
       ." TOO HIGH "
     THEN
   THEN ;

( Problem 8)
: SPELLER
   DUP ABS 4 > IF  ." OUT OF RANGE "  ELSE
     DUP 0< IF ." NEGATIVE " ABS  THEN
     DUP 0= IF  ." ZERO "   ELSE
        DUP 1 = IF  ." ONE "  ELSE
          DUP 2 = IF  ." TWO "  ELSE
            DUP 3 = IF  ." THREE "  ELSE
              ." FOUR "
            THEN
          THEN
        THEN
     THEN
   THEN DROP ;

( Problem 9)
: 3DUP   DUP 2OVER ROT ;
: TRAP1
   2DUP = IF
     DROP OVER = IF  ." YOU GOT IT! " DROP  ELSE
       ." NOT BETWEEN "
     THEN
   ELSE
     3DUP WITHIN3 IF  ." BETWEEN "  ELSE
       ." NOT BETWEEN "
     THEN 2DROP
   THEN ;
   
: TRAP2
   3DUP WITHIN3 IF  ." BETWEEN " 2DROP  ELSE
     2DUP = ROT ROT = AND IF ." YOU GOT IT! " DROP  ELSE
       ." NOT BETWEEN "
     THEN
   THEN ;

( Comment out to play GUESS and TRAP games or to run SPELLER)
bye

