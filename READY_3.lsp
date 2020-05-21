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
(write-line "Задача 12 Test 2")
(print (macroexpand '(свой-вызов (3 4 5 ))))
(print (свой-вызов (a b c)))
(write-line "")
(write-line "")
(write-line "Задача 12 Test 3")
(print (macroexpand '(свой-вызов)))
(print (свой-вызов (a b c)))
(write-line "")

;
;------------------------------------------------------------------------------
;
