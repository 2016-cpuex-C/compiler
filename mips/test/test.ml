
let rec f x = x in
let test = Array.create 1 f in
print_int (test.(0) 100)
