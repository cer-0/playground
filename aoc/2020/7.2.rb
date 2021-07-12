#!/usr/bin/env ruby

def parsea_nombre_maleta(regla)
  # Devuelve una cadena con el nombre de la maleta
  return regla.split(' contain ')[0]
end

def parsea_contenidos(regla)
  # Devuelve un mapa hash de los contenidos de una maleta en caso de contener
  # al menos una maleta, devuelve 0 en otro caso.
  return 0 if regla.split(' contain ')[1].match?(/no other$/)
  contenidos = Hash.new()

  contenido = regla.split(' contain ')[1].split(', ')
  contenido.each do |sub_regla|
    sub_regla.gsub!(/(\d)\s/, '\1,')
    contenidos.store(sub_regla.split(',')[1], sub_regla.split(',')[0])
  end
  return contenidos
end

def parsea_regla(regla, maletas)
  # Crea el mapa hash 'maletas' que tiene como llave el nombre de la
  # maleta y valor igual a un nuevo mapa hash con los nombres de las
  # maletas contenidas, donde llave es el nombre y el número su valor.
  # 
  # { m1 : { mA : N, mB : M, ...},
  #   m2 : { mC : P, ... },
  #   ... }
  regla.gsub!(/\sbags?\.?\n?/, '') # elimina 'bag' y 'bags.\n' de una regla
  maletas.store(parsea_nombre_maleta(regla),
                parsea_contenidos(regla)) # parsea y almacena regla en hash
end

def parte_2(maleta, maletas)
  if maletas[maleta] == 0 # si la maleta no contiene más maletas devuelve 0
    return 0
  else # si la maleta no está vacía
    contador = 0
    maletas[maleta].each do |llave, valor|
      # almacena el numero de maletas por el número de maletas dentro
      # es decir, esto hace toda la magia, es la llamada recursiva.
      contador += (valor.to_i * (1 + parte_2(llave, maletas)))
    end
    return contador
  end
end

maletas = Hash.new()
File.foreach("7.input") do |regla|
  # iteramos en el archivo de entrada, parseamos y almacenamos en mapa hash
  parsea_regla(regla, maletas)
end

p parte_2('shiny gold', maletas)
