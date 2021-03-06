class PortfoliosController < ApplicationController

  def index
    @portfolio_items = Portfolio.all 
  end

  def new 
   @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio items was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end	
  
  def update
    respond_to do |format|
      @portfolio_item = Portfolio.find(params[:id])		
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @portfolios_pathoS.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def show
    @portfolio_item = Portfolio.find(params[:id])		
  end

  def destroy
  	#perform look up
    @portfolio_item = Portfolio.find(params[:id])		

    #destroy item
    @portfolio_item.destroy
    
    #redirect
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully destroyed.' }
    end
  end

end
 