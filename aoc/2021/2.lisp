;; Parte 1
(defun divide-por-espacio (cadena)
  "Devuelve una lista de subcadenas de CADENA
divididas por un espacio cada una.
Nota: Dos espacios consecutivos serán vistos
como una cadena vacía."
  (loop for i = 0 then (1+ j)
        as j = (position #\Space cadena :start i)
        collect (subseq cadena i j)
        while j))

(divide-por-espacio "forward 5")

(with-open-file (archivo "2.input")
  (format t "~& P | H ")
  (ignore-errors
   (do* ((posicion-horizontal 0)
         (profundidad 0)
         (linea (divide-por-espacio (read-line archivo nil nil))
                (divide-por-espacio (read-line archivo nil nil)))
         (comando (first linea) (first linea))
         (x (parse-integer (second linea))
            (parse-integer (second linea))))
        ((when (null linea)
           (return (* profundidad posicion-horizontal))))
     (cond ((equal comando "forward")
            (setf posicion-horizontal (+ posicion-horizontal x)))
           ((equal comando "up")
            (setf profundidad (- profundidad x)))
           ((equal comando "down")
            (setf profundidad (+ profundidad x))))
     (format t "~& ~S | ~S " profundidad posicion-horizontal)))) ; (* 702 2034)
