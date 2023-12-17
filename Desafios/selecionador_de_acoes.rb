# frozen_string_literal: true

def verificador_de_acoes(valores)
  resultado = valores.each_with_index.to_a.combination(2).max_by {  |compra, venda|  venda[0]-compra[0]}.map{  |valor, indice| indice}
  p resultado
end

input = [17, 3, 6, 9, 15, 8, 6, 1, 10]

verificador_de_acoes(input)
