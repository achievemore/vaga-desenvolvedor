
require 'importa_arquivos'

namespace :import do
  desc "Importa arquivos"
  task :arquivo_resultado, [:file] => :environment do |_, args|
    puts "Arquivo: #{args[:file]}"

    abort("Arquivo não encontrado") unless File.exist?(args[:file])

    puts "Iniciando task arquivo_resultado..."

    ImportaArquivos.importa_arquivo(args[:file])

    puts "Finalizando task arquivo_resultado..."
  end
end