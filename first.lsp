;Задача 8
;Определите функцию, которая разделит исходный список из целых 
;чисел на два списка: список положительных чисел и список отрицательных чисел.

(defun task (lst &optional (p nil) (n nil))
  ((lambda (x) (and(setq first (car x))(setq last (cdr x)))) lst)
      (cond ((null first) (list p n))
            ((> first 0) (task last (cons first p) n))
            ((< first 0) (task last p (cons first n)))
            ((= first 0) (task last p n))
      )
) 


;(task '(2 3 4 -1 4 -2))
;((4 4 3 2) (-2 -1)) 
;(task '(-2 0 2 22 -3 0 -5))
;((22 2) (-5 -3 -2)) 
;(task '(-4 4 -6 -3 -2))
;((4) (-2 -3 -6 -4))

;Задача 11
;Определите функцию, осуществляющую разделение исходного списка на два подсписка. 
;В первый из них должно попасть указанное количество элементов с начала списка, во второй — оставшиеся элементы.

(defun separate-after-n (input-list n)
  (if input-list
      (if (zerop n)
          (cons nil (cons input-list nil))
          ((lambda (elem result) (cons (cons elem (car result)) (cdr result)))
           (car input-list) (separate-after-n (cdr input-list) (- n 1))))))



;(separate-after-n '(b b 2 f  2 3 f 3 4 d f c 2) 4))
;((B B 2 F) (2 3 F 3 4 D F C 2)) 
;(separate-after-n '(a 4 e 3 s 5 3 2) 0))
;(NIL (A 4 E 3 S 5 3 2)) 
;(separate-after-n '(a 4 e 3 s 5 3 2) 6))
;((A 4 E 3 S 5) (3 2)) 

;Задача 13
;Определите функцию, удаляющие в исходном списке все повторные вхождения элементов.


defun drop-duplicates (w)
  (cond ((null w) nil)
        ((member (car w) (cdr w)) (drop-duplicates (cdr w)))
        ((cons (car w) (drop-duplicates (cdr w))))))


;(drop-duplicates '(a b 2 3 3 b 4 d c 2)))
;(A 3 B 4 D C 2) 
;(drop-duplicates '(2 3 3 4 2 1 5 6 )))
;(3 4 2 1 5 6) 
;(drop-duplicates '(b b 2 f  2 3 f 3 4 d f c 2)))
;(B 3 4 D F C 2) 

