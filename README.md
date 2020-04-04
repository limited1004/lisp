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

Код:
``` LISP
(defun get-elem-by-index(lst index)
    (cond
        ((null lst)     nil)
        ((< index 1)    nil)
        ((= index 1)    (car lst))
        (t              ( get-elem-by-index (cdr lst) (1- index) ))
    )
)

(defun set-elem-by-index(lst index value)
    (cond
        ((null lst)     nil)
        ((< index 1)    lst)
        ((= index 1)    (cons 
                            value 
                            (cdr lst)
                        ))
        (t              (cons 
                            (car lst) 
                            ( set-elem-by-index (cdr lst) (1- index) value)
                        ))
    )
)

(defun swap-elements-x-y(lst x y)
    (set-elem-by-index 
        (set-elem-by-index 
            lst 
            x 
            (get-elem-by-index lst y)
        )
        y
        (get-elem-by-index lst x)
    )
)
```
Тесты:
```
(print (swap-elements-x-y '( 1 2 3 4 2 3 5 ) 1 3 ))
(print (swap-elements-x-y '( 2 4 3 6 4 7 ) 5 1 ))
(print (swap-elements-x-y '(  93 23 4 56 7 18 ) 7 2 )
```



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
Тесты:
```
>(print (task '(2 3 4 -1 4 -2)))
((4 4 3 2) (-2 -1)) 
>(print (task '(-2 0 2 22 -3 0 -5)))
((22 2) (-5 -3 -2)) 
>(print (task '(-4 4 -6 -3 -2)))
((4) (-2 -3 -6 -4)) 
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
           (car input-list) (separate-after-n (cdr input-list) (- n 1))))))
```
Тесты:
```
>(print (separate-after-n '(b b 2 f  2 3 f 3 4 d f c 2) 4))
((B B 2 F) (2 3 F 3 4 D F C 2)) 
>(print (separate-after-n '(a 4 e 3 s 5 3 2) 0))
(NIL (A 4 E 3 S 5 3 2)) 
>(print (separate-after-n '(a 4 e 3 s 5 3 2) 6))
((A 4 E 3 S 5) (3 2)) 
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
>(print (drop-duplicates '(a b 2 3 3 b 4 d c 2)))
(A 3 B 4 D C 2) 
>(print (drop-duplicates '(2 3 3 4 2 1 5 6 )))
(3 4 2 1 5 6) 
>(print (drop-duplicates '(b b 2 f  2 3 f 3 4 d f c 2)))
(B 3 4 D F C 2) 
```


    
# Задача 30

Запрограммируйте интерпретатор ВЫЧИСЛИ, который преобразует инфиксную
запись операций в префиксную и возвращает значение выражения. Пример:
```
>(ВЫЧИСЛИ ’((-2 + 4) * 3))
6
```
Код:
``` LISP
(defun prefix (lst)
   (cond ((null lst) nil)
         ((atom lst) lst)
         (t (list (prefix (cadr lst)) (prefix (car lst) ) (prefix (caddr lst)))
          )
    )
 )
```
Тесты:
```
(print  (calculate '((-4 + 7 ) *  3 )))
(print  (prefix '((-4 + 7 ) *  3 )))
(print  (calculate '((2 + -6 ) *  4 )))
(print  (prefix '((2 + -6 ) *  4 )))
```
    
# Задача 33

Определите функцию МНОЖЕСТВО, преобразующую список в множество.



# Задача 34

Определите предикат РАВЕНСТВО-МНОЖЕСТВ, проверяющий совпадение двух множеств (независимо от порядка следования элементов). Подсказка: напишите
функцию УДАЛИТЬ, удаляющую данный элемент из множества

Код:
``` LISP
(defun is-contain (list1 list2)
	(if (eq nil list1)
		T
		(and (member (car list1) list2)
			 (is-contain (cdr list1) list2)
		)
	)
)

(defun is-equal (A B)
	(and (is-contain A B) (is-contain B A))
)
```
Тесты:
```
>(print (is-equal '(2 3 1) '(3 1 2 4)))
NIL
>(print (is-equal '(2 3 1) '(3 1 2 )))
T
>(print (is-equal '(2 3 1 4) '(3 1 2)))
Nil
```

# Задача 42

Определите функцию, находящую максимальное из значений, находящихся в
вершинах дерева

Код:
``` LISP
(defun get-max-in-tree (tree)
	(if (atom tree)
		tree
		(if (null (cdr tree))
			(get-max-in-tree (car tree))
			(max
				(get-max-in-tree (car tree))
				(get-max-in-tree (cdr tree))
			)
		)
	)
)
```
Тесты:
```
>(print(get-max-in-tree '(23 (12 ) (28 ) )))
28
>(print(get-max-in-tree '(23 (12 (1 )) (28 (89))) ))
89
>(print(get-max-in-tree '(23 (12 (1 (4 (5 (9 (10)))))) (28 (8))) ))
28
```    
