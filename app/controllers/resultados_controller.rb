class ResultadosController < ApplicationController
  before_action :set_resultado, only: [:show, :edit, :update, :destroy]

  # GET /resultados
  # GET /resultados.json
  def index
    @resultados = Resultado.all
  end

  # GET /resultados/1
  # GET /resultados/1.json
  def show
  end

  # GET /resultados/new
  def new
    @resultado = Resultado.new
  end

  # GET /resultados/1/edit
  def edit
  end

  # POST /resultados
  # POST /resultados.json
  def create
    @resultado = Resultado.new(resultado_params)

    respond_to do |format|
      if @resultado.save
        format.html { redirect_to @resultado, notice: 'Resultado was successfully created.' }
        format.json { render :show, status: :created, location: @resultado }
      else
        format.html { render :new }
        format.json { render json: @resultado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resultados/1
  # PATCH/PUT /resultados/1.json
  def update
    respond_to do |format|
      if @resultado.update(resultado_params)
        format.html { redirect_to @resultado, notice: 'Resultado was successfully updated.' }
        format.json { render :show, status: :ok, location: @resultado }
      else
        format.html { render :edit }
        format.json { render json: @resultado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resultados/1
  # DELETE /resultados/1.json
  def destroy
    @resultado.destroy
    respond_to do |format|
      format.html { redirect_to resultados_url, notice: 'Resultado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resultado
      @resultado = Resultado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resultado_params
      params.require(:resultado).permit(:periodo, :valor_meta, :valor_realizado)
    end
end
