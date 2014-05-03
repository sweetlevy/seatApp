class SeatsController < ApplicationController

before_action :load_seat, only: [:index, :edit, :show]
	
	# def show
	# 	@seat = Seat.find params[:id]
	# end

  def index
    @seats = Seat.search_for(params[:q])
  end

  def create
    @seat = Seat.new safe_seat_params

    if @seat.save
      redirect_to @seat
    else
      render 'new'
    end
  end

  def new
    @seat = Seat.new
  end

  def show
  end

  def edit
  end

  def update
    if @seat.update(safe_seat_params)
      redirect_to @seat
    else
      render 'edit'
    end
  end

  def destory
  end

  

  private

    def load_seat
      @seat = Seat.find params[:id]
    end

    def safe_seat_params
      params.require(:seat).permit(:type, :number)
    end
end

end
