#!/usr/bin/env ruby
#
# Parte 2, día 2

valores = Hash.new(0)

File.foreach("2.input", chomp: true) { |linea|
  comando = linea.split()[0]
  valor = linea.split()[1].to_i
  case comando
  when 'down'
    valores['aim'] += valor
  when 'up'
    valores['aim'] -= valor
  when 'forward'
    valores['horizontal'] += valor
    valores['profundidad'] += (valores['aim'] * valor)
  end
}

p valores['horizontal'] * valores['profundidad']
