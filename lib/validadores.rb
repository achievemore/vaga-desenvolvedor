class Validadores
  def self.match_periodo(periodo)
    case periodo
    when /(^(19|20)\d{2})((0[1-9])|(1[0-2])$)/ # YYYYMM
      format_str = '%Y%m'
    when /(^(19|20)\d{2})[\-]((0?[1-9]|1[012]){1}$)/ # YYYY-mm
      format_str = '%Y-%m'
    when /(^((0?[1-9]|1?[0-9]|2?[0-9]|3?[0-1])[\/]((0?[1-9]|1[012]){1})[\/]((19|20)\d{2}))$)/ # DD/mm/YYYY
      format_str = '%d/%m/%Y'
    when /(^((19|20)\d{2}))[\-]((0?[1-9]|1?[0-9]|2?[0-9]|3?[0-1])[\-]((0?[1-9]|1[012]){1})$)/ # YYYY-DD-mm
      format_str = '%Y-%d-%m'
    end
    Date.strptime(periodo, format_str)
  end

  def self.data(data)
    match_year = "(19|20)\d{2}"
    match_month = "0?[1-9]|1[0-2]"
    match_day = "0?[1-9]|1?[0-9]|2?[0-9]|3?[0-1]"

    /^(#{match_year}\-#{match_month}\-#{match_day})|(#{match_day}\/#{match_month}\/#{match_year})|(#{match_year}\-#{match_month})$/.match?(data)

  end

  def self.valor(valor)
    /([+-]?((\d+|\d{1,3}(\.\d{3})+)(\,\d*)?|\,\d+))/.match?(valor)
  end

  def self.email(email)
    /([A-Za-z0-9]*((_*[\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,}))/.match?(email)
  end
end
