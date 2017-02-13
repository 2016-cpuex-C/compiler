
let rec fhalf x =
   x *. 0.5
in

let rec fsqr x =
   x *. x
in

let rec fabs f =
  if f < 0.0 then -.f else f
in

let rec fneg f =
   0.0 -. f
in

let rec and x y =
  if x then
    if y then true
         else false
  else
    false
in

let rec or x y =
  if x then
    true
  else
    if y then true
         else false
in

let rec xor x y =
  if x then
    if y then false
         else true
  else
    if y then true
         else false
in

let rec print_int a =
  let rec print_int_sub a =
    if a < 10 then
      print_char (a + 48)
    else
      (print_int_sub (a / 10);
       print_char (a - ((a / 10) * 10) + 48))
  in
  if a < 0 then
     (print_char 45;
      print_int_sub (-a))
   else
     print_int_sub a
in

let rec print_bool b =
  if b
    then print_int 1
    else print_int 0
in

let rec print_newline _ = print_char 10
in

(*****************************************************************************
 * んほおお
 *****************************************************************************)

(*************
 * sin / cos *
 *************)
let rec kernel_sin x =
  let x2 = x *. x in
  let x3 = x *. x2 in
  let x5 = x2 *. x3 in
  let x7 = x2 *. x5 in
  x -. (0.16666625976 *. x3) +. (0.008333557129 *. x5) -. (0.000198896484 *. x7)
in
let rec kernel_cos x =
   let x2 = x*.x in
   let x4 = x2*.x2 in
   let x6 = x2*.x4 in
   1.0 -. (0.499998521812 *. x2) +. (0.041668949132*.x4) -. (0.001386642456*.x6)
in

let rec sin a =
   if a >= 0.0 then
     if a > 6.28318548202514 then
       sin (a -. 6.28318548202514)
     else
       if a < 3.1415927410 then
         if a < 1.5707963705 then
           if a < 0.785398185 then
             kernel_sin a
           else
             kernel_cos (1.5707963705 -. a)
         else
           if a < 2.35619455 then
             kernel_cos (a -. 1.5707963705)
           else
             kernel_sin (3.1415927410 -. a)
       else
        let b = a -. 3.1415927410 in
         if b < 1.5707963705 then
           if b < 0.785398185 then
             0.0 -. kernel_sin b
           else
             0.0 -. kernel_cos (1.5707963705 -. b)
         else
           if b < 2.35619455 then
             0.0 -. kernel_cos (b -. 1.5707963705)
           else
             0.0 -. kernel_sin (3.1415927410 -. b)
    else
      0.0 -. sin (0.0 -. a)
in

let rec cos a =
   if a >= 0.0 then
     if a > 6.28318548202514 then
       cos (a -. 6.28318548202514)
     else
       if a < 3.1415927410 then
         if a < 1.5707963705 then
           if a < 0.785398185 then
             kernel_cos a
           else
             kernel_sin (1.5707963705 -. a)
         else
           if a < 2.35619455 then
             0.0 -. kernel_sin (a -. 1.5707963705)
           else
             0.0 -. kernel_cos (3.1415927410 -. a)
       else
        let b = a -. 3.1415927410 in
         if b < 1.5707963705 then
           if b < 0.785398185 then
             0.0 -. kernel_sin b
           else
             0.0 -. kernel_cos (1.5707963705 -. b)
         else
           if b < 2.35619455 then
             kernel_cos (b -. 1.5707963705)
           else
             kernel_sin (3.1415927410 -. b)
    else
      cos (0.0 -. a)
in

(********
 * atan *
 ********)
let rec kernel_atan x =
  let x2 = x *. x in
  let x3 = x *. x2 in
  let x5 = x2 *. x3 in
  let x7 = x2 *. x5 in
  let x9 = x2 *. x7 in
  let x11 = x2 *. x9 in
  let x13 = x2 *. x11 in
  x -. (0.333333 *. x3) +. (0.2 *. x5) -. (0.142857142 *. x7) +. (0.111111104 *. x9) -. (0.08976446 *. x11) +. (0.060035485 *. x13)
in

let rec atan x =
   if and (x >= -0.4375) (x <= 0.4375) then
     kernel_atan x
   else
     let ax = if x < 0.0 then -.x else x in
     if x < 0.0 then
       if ax <= 2.4375 then
         -.((3.141592 /. 4.0) +. kernel_atan ((ax-.1.0) /. (ax +. 1.0)))
       else
         -.((3.141592 /. 2.0) +. kernel_atan (1.0/.ax))
     else
       if ax <= 2.4375 then
         (3.141592 /. 4.0) +. kernel_atan ((ax-.1.0) /. (ax +. 1.0))
       else
         (3.141592 /. 2.0) +. kernel_atan (1.0/.ax)
in


(****************
 * int_of_float *
 ****************)
(*
let rec int_of_float f =
   let exp = ((f2i(f) lsr 23) land 255) - 127 in
   let fraction = ((f2i(f) lor 8388608) land 16777215)
   in
   let rval =
     if (23 - exp) > 0 then
       (fraction lsr (23 - exp))
     else
       (fraction lsl (exp - 23))
   in
   let rval = rval land 2147483647 in
   if f >= 0.0 then
     rval
   else
     -rval
in
*)
let rec iaf_mul x n =
   (*int * float -> float を足し算でやる、nは最大256 *)
  if n=1 then
    x
  else
    iaf_mul (x+.8388608.0) (n-1)
in

let rec sub_ftoi ax m =
   (* 最高256回　再帰される *)
   if ax < 8388608.0 then
     m
   else
     sub_ftoi (ax -. 8388608.0) (m+1)
in

let rec int_of_float x =
   let ax = if x < 0.0 then -.x else x in
   if ax >= 2147483648.0 then
     2147483647
   else

     if ax < 8388608.0 then
       let xx = ax +. 8388608.0 in
     if x < 0.0 then
       -(f2i xx) + 1258291200
     else
       (f2i xx) - 1258291200
     else
       let m = sub_ftoi ax 0 in
       if x < 0.0 then
         -(m*8388608 + int_of_float(ax -. (iaf_mul 8388608.0 m))) (* よくない *)
       else
         m*8388608 + int_of_float(ax -. (iaf_mul 8388608.0 m))
in

(****************
 * float_of_int *
 ****************)
let rec sub1_mod m x =
     if x >= m then
       sub1_mod (2*m) x
     else
       m
in

let rec sub2_mod p m x =
   if x >= m then
     if x >= p then
       sub2_mod (p/2) m (x-p)
     else
       sub2_mod (p/2) m  x
   else
     x
in

let rec modulo m x =
   let p = sub1_mod m x in
   sub2_mod p m x
in

let rec float_of_int i =
   let ai = if i < 0 then -i else i in
   if ai < 8388608 then
     let fi = i2f (ai + 1258291200) in
     let ans = fi -. 8388608.0 in
     if i < 0 then
       -.ans
     else
       ans

   else
     let n = (ai / 8388608) in
     let m = (modulo 8388608 ai) in
     let ans = (iaf_mul 8388608.0 n) +. float_of_int (m) in
     if i < 0 then
       -.ans
     else
       ans
in


(*********
 * floor *
 *********)
let rec floor x =
   let ax = if x < 0.0 then -.x else x in
   if ax >= 8388608.0 then
     x
   else
     let xadded = ax +. 8388608.0 in
     let xsubed = xadded -. 8388608.0 in
     let xx = if x < 0.0 then -.xsubed else xsubed in
     if x < xx then
       xx-.1.0
     else
       xx
in



(*}}}*)

