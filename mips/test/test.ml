let rec make_adder x =
  let rec adder y = x + y in
  adder in
let hoge = make_adder 3 in
()

