class FortunesController < ApplicationController
  # GET /fortunes
  def index
    @fortunes = Fortune.page(params[:page]).per(5)
    
  end

  # GET /fortunes/1
  def show
  @fortune = Fortune.find(params[:id])
  end

  # GET /fortunes/new
  def new
    @fortune = Fortune.new
  end

  # GET /fortunes/1/edit
  def edit
    @fortune = Fortune.find(params[:id])
  end

  # POST /fortunes
  def create
    @fortune = Fortune.new(params[:fortune])

    if @fortune.save
      redirect_to @fortune, notice: 'Fortune was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /fortunes/1
  def update
    @fortune = Fortune.find(params[:id])

    if @fortune.update_attributes(params[:fortune])
      redirect_to @fortune, notice: 'Fortune was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /fortunes/1
  def destroy
    @fortune = Fortune.find(params[:id])
    @fortune.destroy
    redirect_to fortunes_url
  end
end
