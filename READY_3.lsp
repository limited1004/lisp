;Задача 1
;;; Определите макрос, который возвращает свой вызов
(defmacro свой-вызов (&whole форма &rest args) 
    `(quote, форма))


(write-line "")
(write-line "Задача 1 Test 1")
(print (macroexpand '(свой-вызов (a b c 3 4))))
(print (свой-вызов (a b c)))
(write-line "")
(write-line "")
(write-line "Задача 1 Test 2")
(print (macroexpand '(свой-вызов (3 4 5 ))))
(print (свой-вызов (a b c)))
(write-line "")
(write-line "")
(write-line "Задача 1 Test 3")
(print (macroexpand '(свой-вызов)))
(print (свой-вызов (a b c)))
(write-line "")

;
;------------------------------------------------------------------------------
;

;
;------------------------------------------------------------------------------
;
;Задача 2
 ; Определите макрос (POP стек), который читает из стека верхний элемент и меняет значение переменной стека. 
 (defmacro somepop (stack)
  `(let ((first (car ,stack)))(setq ,stack (cdr ,stack))first))

(setq stack1 (list 1 2 3 4))
;(print (macroexpand '(popp stack1)))
(print stack1)

(write-line "")
(write-line "Задача 2 Test 1")
(print (somepop stack1))
(write-line "")
(write-line "")
(write-line "Задача 2 Test 2")
(print (somepop stack1))
(write-line "")
(write-line "")
(write-line "Задача 2 Test 3")
(print (somepop stack1))
(write-line "")

;
;------------------------------------------------------------------------------
;



;Задача 3
;;; Определите лисповскую форму (IF условие p q) в виде макроса.
(defmacro if-cond (условие p q)
  `(cond (,условие ,p)
     (t, q)))


(write-line "")
(write-line "Задача 3 Test 1")
(print (if-cond (= 1 1) 'yes 'no))
(write-line "")
(write-line "")
(write-line "Задача 3 Test 2")
(print (if-cond (> 5 1) 'more 'less))
(write-line "")
(write-line "")
(write-line "Задача 3 Test 3")
(print (if-cond (eq 'try 'try) 'same 'different))
(write-line "")

;
;------------------------------------------------------------------------------
;

; 4. Определите ввиде макроса форму (FIF тест отр нуль полож).

(defmacro FIF (тест отр нуль полож)
  `(cond
     ((> ,тест 0) ,полож)
     ((< ,тест 0) ,отр)
     (T ,нуль)))




(write-line "")
(write-line "Задача 4 Test 1")
(print (FIF 0 'отр 0 'полож))
(write-line "")
(write-line "")
(write-line "Задача 4 Test 2")


(print (FIF (- 0 10) 'отр 0 'полож))
(write-line "")
(write-line "")
(write-line "Задача 4 Test 3")
(print (FIF (+ 0 10) 'отр 0 'полож))
(write-line "")



