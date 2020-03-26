# LISP

Лисп (LISP, от англ. LISt Processing — «обработка списков») — семейство языков программирования, основанных на представлении программы системой линейных списков символов, которые притом являются основной структурой данных языка. Лисп считается вторым после Fortran старейшим высокоуровневым языком программирования.

- [Задача 14](#Задача-14)
- [Задача 8](#Задача-8)
- [Задача 11](#Задача-11)
- [Задача 13](#Задача-13)
- [Задача 30](#Задача-30)
- [Задача 33](#Задача-33)
- [Задача 34](#Задача-34)


# Задача 14

Определите функцию, осуществляющую перестановку двух элементов списка
с заданными номерами.






# Задача 8

Определите функцию, которая разделит исходный список из целых чисел на два списка: список положительных чисел и список отрицательных чисел.

``` LISP
(defun task (lst &optional (p nil) (n nil))
  ((lambda (x) (and(setq first (car x))(setq last (cdr x)))) lst)
      (cond ((null first) (list p n))
            ((> first 0) (task last (cons first p) n))
            ((< first 0) (task last p (cons first n)))
            ((= first 0) (task last p n))
      )
) 
```

# Задача 11

Определите функцию, осуществляющую разделение исходного списка на два
подсписка. В первый из них должно попасть указанное количество элементов
с начала списка, во второй — оставшиеся элементы.

``` LISP
(defun separate-after-n (input-list n)
  (if input-list
      (if (zerop n)
          (cons nil (cons input-list nil))
          ((lambda (elem result) (cons (cons elem (car result)) (cdr result)))
           (car input-list) (separate-after-n (cdr input-list) (1- n))))))
```
    
# Задача 13

Определите функцию, удаляющие в исходном списке все повторные вхождения элементов.

Код:
``` LISP
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


    
# Задача 30

Определите функцию, вычисляющую скалярное произведение векторов, заданных списками целых чисел.

``` LISP
(defun scpr (x y)
  (if (or (null x)(null y)) 0 (+ (* (car x) (car y)) (scpr (cdr x) (cdr y))))
)
```

    
# Задача 33

Определите функцию, удаляющую из списка первое вхождение данного элемента на верхнем уровне.

``` LISP
(defun udal (lst a)
    ((lambda (x) (and(setq first (car x))(setq last (cdr x)))) lst)
        (cond ((null first) lst)
              ((= first a) last)
              (t (cons first (udal (cdr lst) a))))
        )

(print(udal '(2 1 3 2 3 4) 2))
```


# Задача 34

Определите функцию, удаляющую из списка каждый четный элемент.

``` LISP
(defun chet (lst &optional (n nil))
    ((lambda (x) (and(setq first (car x))(setq last (cdr x)))) lst)
        (cond ((null first) (list n))
              ((/= (rem first 2) 0) (chet last (cons first n)))
              (t (chet last n))
        )
 )
```





    
