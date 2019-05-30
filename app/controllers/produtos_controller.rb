class ProdutosController < ApplicationController

	before_action :set_produto, only: [:edit, :update, :destroy]

	def index
		@produtos_por_id = Produto.all.order(:id).limit 10
		@produtos_por_preco = Produto.all.order(:preco).limit 10
	end
	def new
		@produto = Produto.new
		@departamentos = Departamento.all
	end
	def busca
		nome = "%#{params[:nome]}%"
		@produtos = Produto.where "nome like ?", nome
	end
	def create
		@produto = Produto.new produto_params
		if @produto.save	
			flash[:notice] = "Produto salvo com sucesso!"
		redirect_to root_url
	else	
		renderiza_new
	end
	end

	def edit
		@departamentos = Departamento.all
		render :new
	end

	def update
		
		if @produto.update produto_params
			flash[:notice] = "Produto atualizado com sucesso!"
			redirect_to root_url
		else 
			renderiza_new
		end
	end

	def destroy 
	@produto.destroy
	redirect_to root_url
	end

	private
	def renderiza_new
			@departamentos = Departamento.all
			render :new
	end
	def set_produto
		id = params[:id]
		@produto = Produto.find(id)
	end
	def produto_params
		params.require(:produto).permit :nome, :preco, :descricao, :quantidade, :departamento_id
	end
end