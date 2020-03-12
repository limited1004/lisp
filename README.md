# LISP
### Задача 13
Определите функцию, удаляющую в исходном списке все повторные вхожде-ния элементов

```defun drop-duplicates (w)
  (cond ((null w) nil)
        ((member (car w) (cdr w)) (drop-duplicates (cdr w)))
        ((cons (car w) (drop-duplicates (cdr w))))))```
