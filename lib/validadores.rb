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
    regex_yyyy_mm_dd = /\A\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])\z/
    regex_dd_mm_yyyy = /\A(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[0-2])\/\d{4}\z/
    regex_yyyy_mm = /\A\d{4}-(0[1-9]|1[0-2])\z/

    if data.match?(regex_yyyy_mm_dd)
      partes = data.split('-')
      ano = partes[0].to_i
      mes = partes[1].to_i
      dia = partes[2].to_i

      valida_dia(ano,mes,dia)
    elsif data.match?(regex_yyyy_mm)
      return true
    elsif data.match?(regex_dd_mm_yyyy)
      partes = data.split('/')
      ano = partes[2].to_i
      mes = partes[1].to_i
      dia = partes[0].to_i

      valida_dia(ano,mes,dia)
    else
      return false
    end
  end

  def self.valor(valor)
    regex_inteiro = /^-?\d+$/
    regex_decimal = /^-?\d+(\.\d+)?$/
    regex_percentual = /^-?\d+(\.\d+)?%$/

    return valor.match?(regex_inteiro) || valor.match?(regex_decimal) || valor.match?(regex_percentual)
  end

  def self.email(email)
    regex_email = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    return email.match?(regex_email)
  end

  private
    def self.valida_dia(ano,mes,dia)
      if (mes == 4 || mes == 6 || mes == 9 || mes == 11) && dia > 30
        false
      elsif mes == 2
        if (ano % 4 == 0 && ano % 100 != 0) || (ano % 400 == 0)
          return dia <= 29
        else
          return dia <= 28
        end
      else
        true
      end
    end
end
