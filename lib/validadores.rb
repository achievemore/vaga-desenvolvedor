class Validadores
  def match_periodo(periodo)
    case periodo
    when /(^(19|20)\d{2})((0[1-9])|(1[0-2])$)/ # YYYYMM
      format_str = '%Y%m'
    when /(^(19|20)\d{2})[\-]((0?[1-9]|1[012]){1}$)/ # YYYY-mm
      format_str = '%Y-%m'
    end

    Date.strptime(periodo, format_str)
  end

  def self.data(data)
    /^((([1-2][0-9]{3})[\-](0[13578]|10|12)[\-](0[1-9]|1[0-9]|2[0-9]|30|31))|(([1-2][0-9]{3})[\-](0?[469]|11)[\-](0?[1-9]|1[0-9]|2[0-9]|30))|(([1-2][0-9](0[048]|1[26]|2[048]|3[26]|4[048]|5[26]|6[048]|7[26]|8[048]|9[26]))[\-](0?[2])[\-](0?[1-9]|1[0-9]|2[0-9]))|(([1-2][0-9]{3})[\-](0?[2])[\-](0?[1-9]|1[0-9]|2[0-8])))$/.match?(data)
  end

  def self.valor(valor)
    /([+-]?((\d+|\d{1,3}(\.\d{3})+)(\,\d*)?|\,\d+))/.match?(valor)
  end

  def self.email(email)
    /([A-Za-z0-9]*((_*[\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,}))/.match?(email)
  end

  def self.
end

# self.create tipo: 'Texto', expressao: '(.+)'
# self.create tipo: 'Texto / vazio', expressao: '(.*)'
# self.create tipo: 'Inteiro', expressao: '([\-]?\d+)'
# self.create tipo: 'E-mail', expressao: '([A-Za-z0-9]*((_*[\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,}))'
# self.create tipo: 'Telefone', expressao: '([0-9\-() ]+)'
# self.create tipo: 'Valor 999.999,99', expressao: '([+-]?((\d+|\d{1,3}(\.\d{3})+)(\,\d*)?|\,\d+))'
# self.create tipo: 'Valor 999,999.99', expressao: '([+-]?((\d+|\d{1,3}(\,\d{3})+)(\.\d*)?|\.\d+))'
# self.create tipo: '0.99(%)', expressao: '^([-]?\d+?\.?\d*)$'
# self.create tipo: '0,99(%)', expressao: '^([-]?\d+?\,?\d*)$'
# self.create tipo: '99,99%', expressao: '^([-]?\d+?\,?\d*\%{1})'
# self.create tipo: 'Data YYYY-mm-dd', expressao: '^((([1-2][0-9]{3})[\-](0[13578]|10|12)[\-](0[1-9]|1[0-9]|2[0-9]|30|31))|(([1-2][0-9]{3})[\-](0?[469]|11)[\-](0?[1-9]|1[0-9]|2[0-9]|30))|(([1-2][0-9](0[048]|1[26]|2[048]|3[26]|4[048]|5[26]|6[048]|7[26]|8[048]|9[26]))[\-](0?[2])[\-](0?[1-9]|1[0-9]|2[0-9]))|(([1-2][0-9]{3})[\-](0?[2])[\-](0?[1-9]|1[0-9]|2[0-8])))$'
# self.create tipo: 'Data dd/mm/YYYY', expressao: '^(((0?[1-9]|1[0-9]|2[0-9]|30|31)[\/](0?[13578]|10|12)[\/]([1-2][0-9]{3}))|((0?[1-9]|1[0-9]|2[0-9]|30)[\/](0?[469]|11)[\/]([1-2][0-9]{3}))|((0?[1-9]|1[0-9]|2[0-9])[\/](0?[2])[\/]([1-2][0-9](0[048]|1[26]|2[048]|3[26]|4[048]|5[26]|6[048]|7[26]|8[048]|9[026])))|((0?[1-9]|1[0-9]|2[0-8])[\/](0?[2])[\/]([1-2][0-9]{3})))$'
# self.create tipo: 'Data YYYY-mm', expressao: '(^(19|20)\d{2})[\-](([0-1][1-9]){1}$)'
# self.create tipo: 'Data YYYYMM', expressao: '(^(19|20)\d{2})((0[1-9])|(1[0-2])$)'
# self.create tipo: 'Login', expressao: '([0-9A-Za-z\._-]+)'