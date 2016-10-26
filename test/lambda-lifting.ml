
let a = 5 in
let rec const x f = x in
let rec f x =
  let rec g y = const y f in
    g (x+a) in
print_int (f 10)

(* fとgがliftされる. gのbodyではfのClosureが作られる(不可避)が他では作られない. *)

