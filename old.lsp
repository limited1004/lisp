;
;------------------------------------------------------------------------------
;
;Задача 2
;Определите функицонал (MAPLIST fn список) для одного списочного аргумента

(defun maplist1 (fn l)

          (cond ((null l) nil)
            (t(cons (funcall fn l)   
                    (maplist1 fn (cdr l))))
          )
)

;
;------------------------------------------------------------------------------
;
(write-line "")
(write-line "Задача 2 Test 1")
(print (maplist1 'REVERSE '(1 2 3)))
(write-line "")
(write-line "Задача 2 Test 2")
(print (maplist1 'list '(1 2 3)))
;
;------------------------------------------------------------------------------
;
;Задача 4
;Определите функциональный предикат (КАЖДЫй пред список), который истинен в том и только в том случае, когда, 
;являющейся функциональным аргументом предикат пред истинен для всех элементов списка список

(defun каждый (p l)
    (cond ((null l) t)
        ((funcall p (car l))
             (каждый p (cdr l)))
         (t nil)))

;
;------------------------------------------------------------------------------
;
(write-line "")
(write-line "Задача 4 Test 1")
(print (каждый 'evenp '(8 10  12)))
(write-line "")
(write-line "Задача 4 Test 2")
(print (каждый 'evenp '(8 10 11 12)))
(write-line "")
(write-line "Задача 4 Test 3")
(print (каждый 'numberp '(8 10 11  12)))
(write-line "")
(write-line "Задача 4 Test 4")
(print (каждый 'numberp '(8 10 a  12)))
(write-line "")
(write-line "Задача 4 Test 5")
(print (каждый 'atom '(8 10 a  12)))

  
;
;------------------------------------------------------------------------------
;
;Задача 6
;Определите фильтр (УДАЛйЬ-ЕСЛИ пред список), удаляющий из списка список
;все элементы, которые обладают свойством, наличие которого проверяет предикат пред.

(defun удалить-если (pred l)
    (mapcan (function (lambda (x)
                              (if (funcall pred x) nil (list x) )))
            l))
;
;------------------------------------------------------------------------------
;
(write-line "")
(write-line "Задача 6 Test 1")
(print(удалить-если 'evenp '( 1 2 3 4 5 )))
(write-line "")
(write-line "Задача 6 Test 2")
(print(удалить-если 'numberp '( a 1 b 2 c 3)))
(write-line "")
(write-line "Задача 6 Test 3")
(print (удалить-если (lambda (x) (> x 2)) '(3 1 2)))

;
;------------------------------------------------------------------------------
;
;Задача 8
;Напишите генератор натуральных чисел: 0, 1, 2, 3, 4, 5, ...
(defun natgen (n)
    (function
     (lambda ()
             (setq n (+ n 1))
             n)))

;
;------------------------------------------------------------------------------
;
(write-line "")
(write-line "Задача 8 Test 1")
(setq nat (natgen 0))
(print (funcall nat))
(print (funcall nat))
(print (funcall nat))
(print (funcall nat))
(print (funcall nat))
(print (funcall nat))
(print (funcall nat))
(print (funcall nat))

;
;------------------------------------------------------------------------------
;
;Задача 10
;Напишите генератор, порождающий последовательность (A), (B A), (A B A),
;(B A B A), ...

(defun order-gen (значение)
    (function (lambda ()
              (if (eq (car значение) 'a)
                  (setq значение (cons 'b значение))
                  (setq значение
                        (cons 'a значение))))))

;
;------------------------------------------------------------------------------
;
(write-line "")
(write-line "Задача 10 Test 1")
(setq ab (order-gen nil))
(print (funcall ab))
(print (funcall ab))
(print (funcall ab))
;
;------------------------------------------------------------------------------
;
(write-line "")
(write-line "Задача 10 Test 2")
(setq ab (order-gen '(a b)))
(print (funcall ab))
(print (funcall ab))

;
;------------------------------------------------------------------------------
;

;Задача 12
;Определите функцию, которая возвращает в качестве значения свой вызов.
(defun свой-вызов (&rest args)
    (list 'apply 'свой-вызов args))

;
;------------------------------------------------------------------------------
;
(write-line "")
(write-line "Задача 12 Test 1")
(print (свой-вызов 1 2)) 
(write-line "")
(write-line "Задача 12 Test 2")
(print (свой-вызов 'l 1 2))
(write-line "")
(write-line "Задача 12 Test 3")
(print (свой-вызов '(l r t)))

;
;------------------------------------------------------------------------------
;

;Задача 14
;Определите функцию, которая возвращает в качестве значения форму своего
;определения (DEFUN).

(defun сама nil
    ((lambda (x)
             (list 'defun 'сама nil
                   (list x (list 'quote x))))
     '(lambda (x)
              (list 'defun 'сама nil
                    (list x (list 'quote x))))))

;
;------------------------------------------------------------------------------
;
(write-line "")
(write-line "Задача 14 Test 1")
(print(сама))

