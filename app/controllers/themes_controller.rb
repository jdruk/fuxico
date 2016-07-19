class ThemesController < ApplicationController
  before_action :set_theme, only: [:show, :edit, :update, :destroy]

  def index
    @themes = Theme.where(father: nil)
  end

  def show
    @room = Room.new(theme: @theme)
  end

  def new
    @theme = Theme.new
  end

  def edit
  end

  def create
    @theme = Theme.new(theme_params)

    respond_to do |format|
      if @theme.save
        format.html { redirect_to @theme }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @theme.update(theme_params)
        format.html { redirect_to @theme }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    father = @theme.father
    @theme.destroy

    respond_to do |format|
      if father
        format.html { redirect_to theme_path(father) }
      else
        format.html { redirect_to themes_url }
      end
    end
  end

  private
    def set_theme
      @theme = Theme.find(params[:id])
    end

    def theme_params
      params.require(:theme).permit(:name, :father)
    end
end
