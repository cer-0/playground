;; Problema 1 Advent of Code
(defun archivo-a-lista (archivo)
  "Procesa un archivo de numeros enteros positivos a una lista"
  (with-open-file (s archivo)
    (do* ((actual (parse-integer (read-line s nil "-1"))
                  (parse-integer (read-line s nil "-1")))
          (lista (list actual) (push actual lista)))
         ((when (< actual 0) (return (reverse (rest lista))))))))

(defun cuenta-incrementos (lista)
  "Devuelve el número de incrementos de los elementos de una lista"
  (do* ((incrementos 0)
       (copia lista (rest copia))
       (anterior (first copia) actual)
       (actual (second copia) (first copia)))
      ((when (null copia) (return incrementos)))
    (if (> actual anterior) (setf incrementos (1+ incrementos)))))

;; Parte 1
;; (defun aoc-1-1 (archivo)
;;   "Resuelve parte 1 del día 1 sin almacenar el archivo en una lista"
;;   (with-open-file (s archivo)
;;     (do ((incrementos 0)
;;           (antigua (parse-integer (read-line s nil "-1")) nueva)
;;           (nueva (parse-integer (read-line s nil "-1"))
;;                  (parse-integer (read-line s nil "-1"))))
;;          ((when (< nueva 0) (return incrementos)))
;;       (if (> nueva antigua) (setf incrementos (+ 1 incrementos))))))

(defun aoc-1-1 (archivo)
  "Resuelve parte 1 del día 1 almacenando el archivo en una lista"
  (with-open-file (s archivo)
    (cuenta-incrementos (archivo-a-lista archivo))))

(aoc-1-1 "1") ; => 1766 (11 bits, #x6E6)

;; Parte 2
(defun porcion (inicio longitud lista)
  "Devuelve la sublista de LONGITUD elementos a partir de INICIO"
  (do* ((i 0 (1+ i))
       (prelista (nthcdr inicio lista)
                     (rest prelista))
       (lista-final (list (first prelista))
                    (push (first prelista) lista-final)))
      ((when (equal i (1- longitud)) (return (reverse lista-final))))))

(defun suma-lista (lista)
  (do ((copia lista (rest copia))
       (total 0 (+ total (first copia))))
      ((when (null copia) (return total)))))

(defun suma-de-porciones-a-lista (tamano-porcion lista)
  "Devuelve una lista de la suma de todas las ventanas de TAMANO-PORCION de lista"
  (do* ((n tamano-porcion)
        (copia lista (rest copia))
        (i 0)
        (ventana (porcion i n copia)
                 (porcion i n copia))
        (copia-final (list (suma-lista ventana))
                     (push (suma-lista ventana) copia-final)))
       ((when (equal (length copia) n)
          (return (reverse (push (suma-lista ventana) copia-final)))))))

(cuenta-incrementos
 (suma-de-porciones-a-lista 3 (archivo-a-lista "1"))) ; => 1797 (11 bits, #x705)
