include gdrive-sheets
import data-source as DS
include lists

id = "1ktbdU_ZftTvXBpcT0y8mttosLrApziHtDUP2BLLD-Mc"

#my-table =
#  load-table: input :: Number, inp :: Number
#    source: load-spreadsheet(id).sheet-by-name("day01", false)
#    sanitize input using DS.string-sanitizer
#    sanitize inp using DS.string-sanitizer
#  end

#my-table
#i-data = extract input from my-table end
#my-data = map(string-to-number, i-data)
#my-data

#ssid = "1DKngiBfI2cGTVEazFEyXf7H4mhl8IU5yv2TfZWv6Rc8"
#event-data =
#  load-table: name, email, tickcount, discount, delivery
#    source: load-spreadsheet(ssid).sheet-by-name("Data", true)
#  end

#event-data

#fun conv(l :: List, a :: List):
#  cases (List) l:
#    | empty => a
#    | link(f,r) =>
#      if f == none:
#        link(a, conv(r, a))
#      else:
#        conv(l, a)
#      end
#  end
#end

fun convert(l :: List, a :: List):
  cases (List) l:
    | empty => a
    | link(f,r) =>
      if f == none:
        block:
          print("f none")
          print(f)
          print(r)
          print(a)
          print("===")
          convert(r, a.append([list:[list: ]]))
        end
      else:
        block:
          print("f else")
          print(f)
          print(r)
          print(a)
          print("===")
          if is-empty(a.last()):
            #a.append([list: [list: ]])
            block:
            print("if")
            print( a.last().append([list: [list: f]]))
              print(link(a.first, a.last().append([list:[list:f]])))
              #convert(r, a.last().append([list: [list: f]]))
              convert(r, link(a.first, a.last().append([list:[list:f]])))
            end
          else:
            #a.first.append(l.first)
            block:
            print("else")
              #print(a.last().append([list:[list: f]]))
              #print(a.last().append([list: f]))
              print([list: a.last().append([list: f])])
              convert(r, [list: a.last().append([list: f])])
            end
          end
          #convert(l.rest, c)
        end
      end
  end
where:
  convert([list: 1,2,none,5,6,none,7], [list: [list: ]]) is [list: [list: 1,2],[list: 5,6],[list: 7]]
end


#fun convert-l-l(l :: List):
  #  a = [list: ]
  #conv(l, a)
#  ...
#where:
#  convert-l-l([list: 1,2,none,5]) is [list: 3,5]
#end

#a = [list: [list: 1,2],[list: 5,6],[list: 7]]
#a
a = [list: 1,2,none,5,6,none,7]



include gdrive-sheets
import data-source as DS
include lists
import lists as L
include math

id = "1ktbdU_ZftTvXBpcT0y8mttosLrApziHtDUP2BLLD-Mc"

my-table =
  load-table: input :: Number, inp :: Number
    source: load-spreadsheet(id).sheet-by-name("day01", false)
      sanitize input using DS.string-sanitizer
      sanitize inp using DS.string-sanitizer
  end

fun conv(l,a):
    cases (List) l:
      | empty => a
      | link(f,r) =>
      if (L.is-empty(r)):
          a.append(link(f, empty))
      else if (r.first == none) and (r.rest.first == none):
        a.append(link(f, empty))
        else if (r.first == none):
          conv(r.rest, a.append(link(f, empty)))
        else:
          conv(link(f + r.first, r.rest), a)
        end
    end
where:
  conv([list: 1,2,none,5,6,none,7], [list: ]) is [list: 3, 11, 7]
  conv([list: 1,2,none,5,6,none,7,none,none,none,none], [list: ]) is [list: 3, 11, 7]
end


i1-data = extract input from my-table end
my1-data = map(string-to-number, i1-data)
my11-data = map(lam(x): if is-some(x): x.value else: none end end, my1-data)

i2-data = extract inp from my-table end
my2-data = map(string-to-number, i2-data)
my22-data = map(lam(x): if is-some(x): x.value else: none end end, my2-data)


fun maxi-n(ll, a, n, iter):
    if n == iter:
      a
    else:
      maxi-n(
        ll.sort().reverse().drop(1),
        a.push(ll.sort().last()),
        n,
        iter + 1)
    end
  end


fun max-3(l):
      maxi-n(l, [list: ], 3, 0)
where:
  max-3([list: 1,2,3,4]) is [list: 2,3,4]
end

fun part-a(d):
  max(conv(d, [list: ]))
end

fun part-b(d):
  sum(max-3(conv(d, [list: ])))
end

part-a(my11-data)
part-b(my11-data)

part-a(my22-data)
#part-b(my22-data)



