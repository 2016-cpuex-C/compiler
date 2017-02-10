
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

(*****************************
 *** ここから下 精度関わる ***
 *****************************)

(*
(*{{{ あれ*)
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

let rec float_of_int i =
   let rec search_top i =
     if i = 1 then
       0
     else
       (search_top (i lsr 1)) + 1
   in
   if i = 0 then
     i2f(0)
   else
     let sign = if i > 0 then 0 else 1 in
     let i = if i > 0 then i else -i in
     let top = search_top i in
     if top > 23 then
       i2f((sign lsl 31) + ((top + 127) lsl 23) + ((i lxor (1 lsl top)) lsr (top - 23)))
     else
       i2f((sign lsl 31) + ((top + 127) lsl 23) + ((i lxor (1 lsl top)) lsl (23 - top)))
in

let rec truncate i = int_of_float i
in

let rec floor i =
   let rec floor_sub i =
     float_of_int(int_of_float i)
   in
   if i >= 0.0 then
     floor_sub i
   else
     floor_sub (i -. 1.0)
in

(*
let rec sqrt x =
  let x2 = x *. 0.5 in
  let y = x in
  let i = f2i y in
  let i = 1597463007 - (i / 2) in
  let y = i2f i in
  let y = y *. (1.5 -. (x2 *. y *. y)) in
  let y = y *. (1.5 -. (x2 *. y *. y)) in
  let y = y *. (1.5 -. (x2 *. y *. y)) in
  let y = y *. (1.5 -. (x2 *. y *. y)) in
  let y = 1.0 /. y in
  y
in
*)

let rec kernel_sin a =
   let a2 = a *. a in
   let a3 = a *. a2 in
   let a5 = a3 *. a2 in
   let a7 = a5 *. a2 in
   a -. 0.16666668 *. a3 +. 0.008332824 *. a5 -. 0.00019587841 *. a7
in

let rec kernel_cos a =
   let a2 = a *. a in
   let a4 = a2 *. a2 in
   let a6 = a2 *. a4 in
   1.0 -. 0.5 *. a2 +. 0.04166368 *. a4 -. 0.0013695068 *. a6
in

(* 最適化 *)
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
       sin (a -. 6.28318548202514)
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

let rec kernel_atan a =
   let a2 = a *. a in
   let a3 = a *. a2 in
   let a5 = a3 *. a2 in
   let a7 = a5 *. a2 in
   let a9 = a7 *. a2 in
   let a11 = a9 *. a2 in
   let a13 = a11 *. a2 in
   a -. 0.3333333 *. a3 +. 0.2 *. a5 -. 0.142857142 *. a7 +. 0.111111104 *. a9 -. 0.08976446 *. a11 +. 0.060035485 *. a13
in

let rec atan a =
   if a > 0.0 then
     if a < 0.4375 then
       kernel_atan a
     else
       if a < 2.4375 then
         0.78539818 +. kernel_atan ((a -. 1.0) /. (a +. 1.0))
       else
         1.57079637 -. kernel_atan (1.0 /. a)
   else
    let b = 0.0 -. a in
     if b < 0.4375 then
       0.0 -. (kernel_atan b)
     else
       if b < 2.4375 then
         0.0 -. (0.78539818 +. kernel_atan ((b -. 1.0) /. (b +. 1.0)))
       else
         0.0 -. (1.57079637 -. kernel_atan (1.0 /. b))
in
(*}}}*)
*)

(*
(* E班の {{{ *)
let rec fflag a =
  if (a >= 0.0) then 1
  else -1 in

let rec countn a b c =
  if (a < b) then
    c
  else
    countn (a-b) b (c+1) in

let rec countn a b c =
  if (a < b) then
    c
  else
    countn (a-b) b (c+1) in

let rec int_of_float a =
  let rec ftoi_ret a =
    let rec div2like a =
      let rec div2like_sub a b =
        if (a < 2.0) then
          b
        else
          div2like_sub (a -. 2.0) (b +. 1.0) in
      div2like_sub a 0.0 in
    let rec ftoi_ret_sub a b c =
      if (a < 1.0) then
        b
      else
        if ((a -. (div2like a) *. 2.0) < 1.0) then
          ftoi_ret_sub (div2like a) b (c + c)
        else
          ftoi_ret_sub (div2like a) (b + c) (c + c) in
      ftoi_ret_sub a 0 1 in
    let rec ftoi_big a b =
      if ((a -. 8388608.0) < 8388608.0) then
        (b + 8388608) + (ftoi_ret (a -. 8388608.0))
      else
        ftoi_big (a -. 8388608.0) (b + 8388608) in
  if ((fflag a) = 1) then
    if ((fabs a) > 8388608.0) then
      ftoi_big (fabs a) 0
    else
      ftoi_ret (fabs a)
  else
    if ((fabs a) > 8388608.0) then
      - (ftoi_big (fabs a) 0)
    else
      - (ftoi_ret (fabs a)) in

(* int -> float *)
let rec float_of_int a =
  let rec abs a = if (a > 0) then a else (-a) in
  let rec flag a = if (a > 0) then 1 else 0 in
  let rec itof_ret a =
    let rec itof_ret_sub a b c =
      if (a = 0) then
        b
      else
        if ((a - (a / 2 + a / 2)) > 0) then
          itof_ret_sub (a / 2) (b +. c) (c *. 2.0)
        else
          itof_ret_sub (a / 2) b (c *. 2.0) in
    itof_ret_sub a 0.0 1.0 in
  let rec itof_big a b =
    if ((a - 8388608) < 8388608) then
      (b +. 8388608.0) +. (itof_ret (a - 8388608))
    else
      itof_big (a - 8388608) (b +. 8388608.0) in
  if ((flag a) = 1) then
    if ((abs a) > 8388608) then
      itof_big (abs a) 0.0
    else
      itof_ret (abs a)
  else if ((abs a) > 8388608) then
    -. (itof_big (abs a) 0.0)
  else
    -. (itof_ret (abs a)) in

(* floor *)
let rec floor a =
  let rec floor_pos_ker a =
    a -. 1. in
  let rec floor_pos_small a =
    if  (a < ((a +. 8388608.) -. 8388608.)) then
      floor_pos_ker ((a +. 8388608.) -. 8388608.)
    else
      ((a +. 8388608.) -. 8388608.) in
  let rec floor_pos a =
    if (a > 8388608.) then
      floor_pos_ker a
    else
      floor_pos_small a in
  let rec floor_neg_ker a =
    a +. 1. in
  let rec floor_neg_small a =
    if (((a +. 8388608.) -. 8388608.) < a) then
      -. (floor_neg_ker ((a +. 8388608.) -. 8388608.))
    else
      -. ((a +. 8388608.) -. 8388608.) in
  let rec floor_neg a =
    if (a > 8388608.) then
      -. (floor_neg_ker a)
    else
      floor_neg_small a in
  if (a > 0.) then
    floor_pos (fabs a)
  else
    floor_neg (fabs a) in

(*三角関数*)

(*aを2πで割った余りを求める*)
let rec reduction_pi2 a =
  if (a <= 6.28318531) then a
  else reduction_pi2 (a -. 6.28318531) in

(*cに符号を加える*)
let rec addflag c flag =
  if(flag = 1) then
    c
  else
    -. c in

(*sin(a) (0 <= a <= (pi / 4)) を求める*)
let rec sin_kernel a =
  let a3 = a *. a *. a in
  let a5 = a3 *. a *. a in
  let a7 = a5 *. a *. a in
  a -. (0.16666668 *. a3) +. (0.008332824 *. a5) -. (0.00019587841 *. a7) in
let rec cos_kernel a =
  let a2 = a *. a in
  let a4 = a2 *. a *. a in
  let a6 = a4 *. a *. a in
  1.0 -. (0.5 *. a2) +. (0.04166368 *. a4) -. (0.0013695068 *. a6) in

(*sin(a) を求める*)
let rec sin a =
  let rec sin3 a flag =
    if(a <= 0.7853981634) then
      addflag (sin_kernel a) flag
    else
      addflag (cos_kernel (1.570796326 -. a)) flag in

  let rec sin2 a flag =
    if(a >= 1.570796326) then
      sin3 (3.14159265 -. a) flag
    else
      sin3 a flag in

    if ((reduction_pi2 (fabs a)) >= 3.14159265) then
      sin2 ((reduction_pi2 (fabs a)) -. 3.14159265) (- (fflag a))
    else
      sin2 (reduction_pi2 (fabs a)) (fflag a) in

let rec cos a =
  let rec cos3 a flag =
    if(a <= 0.7853981634) then
      addflag (cos_kernel a) flag
    else
      addflag (sin_kernel (1.570796326 -. a)) flag in

  let rec cos2 a flag =
    if(a >= 1.570796326) then
      cos3 (3.14159265 -. a) (- flag)
    else
      cos3 a flag in

  if((reduction_pi2 (fabs a)) >= 3.14159265) then
    cos2 ((reduction_pi2 (fabs a)) -. 3.14159265) (-1)
  else
    cos2 (reduction_pi2 (fabs a)) 1 in

let rec atan a =
  let rec atan_kernel a =
    let a1 = 0.060035485 *. a *. a -. 0.08976446 in
    let a2 = 0.111111104 +. a1 *. a *. a in
    let a3 = a2 *. a *. a -. 0.142857142 in
    let a4 = a3 *. a *. a +. 0.2 in
    let a5 = a4 *. a *. a -. 0.3333333 in
    a*. (1.0 +. a5 *. a *. a) in
    if ((fabs a) < 0.4375) then
      addflag (atan_kernel (fabs a)) (fflag a)
    else if ((fabs a) < 1.0) then
      addflag (0.7853981634 -. (atan_kernel ((1.0 -. (fabs a)) /. ((fabs a) +. 1.0)))) (fflag a)
    else if ((fabs a) < 2.4375) then
      addflag (0.7853981634 -. (atan_kernel ((1.0 -. (fabs a)) /. ((fabs a) +. 1.0)))) (fflag a)
    else
      addflag (1.570796326 -. (atan_kernel (1.0 /. (fabs a)))) (fflag a) in
(*}}}*)
*)

(*
*)
(*{{{ 進藤君*)
let rec sub1_red2pi p x =
     if x >= p then
       sub1_red2pi (2.0*.p) x
     else
       p
in

let rec sub2_red2pi p x =
   if x >= 2.0*.3.141592 then
     if x >= p then
       sub2_red2pi (p/.2.0) (x-.p)
     else
       sub2_red2pi (p/.2.0) x
   else
     x
in

let rec reduction_to_2pi x =
   let p = 2.0*.3.14159265 in
   let pp = sub1_red2pi p x in
   sub2_red2pi pp x
in


let rec kernel_cos x =
   let x2 = x*.x in
   let x4 = x2*.x2 in
   let x6 = x2*.x4 in

   1.0 -. (0.499998521812 *. x2) +. (0.041668949132*.x4) -. (0.001386642456*.x6)
in

let rec kernel_sin x =
  let x2 = x *. x in
  let x3 = x *. x2 in
  let x5 = x2 *. x3 in
  let x7 = x2 *. x5 in
  x -. (0.16666625976 *. x3) +. (0.008333557129 *. x5) -. (0.000198896484 *. x7)
in

let rec reduction_to_quopi x cs =
   (* cs=true then sin , cs=false then cos *)

   if x >= 3.14159265 then
     -. reduction_to_quopi (x -. 3.14159265) cs
   else
     if x >= (3.141592 /. 2.0) then
       if cs then
         reduction_to_quopi (3.141592 -. x) cs
       else
         -. reduction_to_quopi (3.141592-.x) cs
     else
       if x > (3.14159265 /. 4.0) then
         if cs then
           kernel_cos  ((3.14159265 /. 2.0) -. x)
         else
           kernel_sin  ((3.14159265 /. 2.0) -. x)
       else
         if cs then
           kernel_sin x
         else
           kernel_cos x
in

let rec cos x =
   if x < 0.0 then
     let x_red2pi = reduction_to_2pi (-.x) in
     reduction_to_quopi x_red2pi false
   else
     let x_red2pi = reduction_to_2pi x in
     reduction_to_quopi x_red2pi false
in

let rec sin x =
   if x < 0.0 then
     let x_red2pi = reduction_to_2pi (-.x) in
     -. reduction_to_quopi x_red2pi true
   else
     let x_red2pi = reduction_to_2pi x in
     reduction_to_quopi x_red2pi true
in


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

let rec truncate x = int_of_float x
in
(*}}}*)

