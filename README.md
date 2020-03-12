# LISP
### Задача 13
Определите функцию, удаляющую в исходном списке все повторные вхожде-ния элементов

Код:
```
defun drop-duplicates (w)
  (cond ((null w) nil)
        ((member (car w) (cdr w)) (drop-duplicates (cdr w)))
        ((cons (car w) (drop-duplicates (cdr w))))))
```
Тесты:
```
(drop-duplicates '(a b 2 3 3 b 4 d c 2))
(drop-duplicates '(2 3 3 4 2 1 5 6 ))
(drop-duplicates '(b b 2 f  2 3 f 3 4 d f c 2))
```
