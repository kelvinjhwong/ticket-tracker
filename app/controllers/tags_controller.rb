class TagsController < ApplicationController
  before_action :set_tag, only: [:edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:notice] = 'Tag was successfully created.'
      redirect_to tags_path
    else
      render :new
    end
  end

  def update
    if @tag.update(tag_params)
      flash[:notice] = 'Tag was successfully updated.'
      redirect_to tags_path
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    flash[:notice] = 'Tag was successfully destroyed.'
    redirect_to tags_path
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
