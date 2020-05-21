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


