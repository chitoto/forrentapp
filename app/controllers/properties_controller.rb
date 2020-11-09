class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def show
    @stations = @property.stations
  end

  def new
    if params[:back]
      @property.stations.build(property_params)
    else
      @property = Property.new
      2.times { @property.stations.build }
    end
  end

  def edit
    @property.stations.build
  end

  def create
    @property = Property.new(property_params)
    if params[:back]
      render :new
    else
      if @property.save
        redirect_to properties_path, notice: "物件を登録しました"
      else
        flash.now[:notice] = '作成に失敗しました'
        render :new
      end
    end
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice: "物件を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
      redirect_to properties_path, notice: '物件を削除しました'
  end

  private
    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(:property_name, :rent, :address, :age, :remarks,
        stations_attributes:
        [:route_name, :station_name, :minutes_on_foot, :property_id, :id, :_destroy])
    end
end
