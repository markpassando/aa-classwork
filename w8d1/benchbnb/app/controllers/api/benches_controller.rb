class Api::BenchesController < ApplicationController
  def index
    if params[:filters]
      @benches = Bench.in_bounds(params[:filters])
    else
      @benches = Bench.all
    end
  end

  def create
    @bench = Bench.new(bench_params)
    if @bench.save
      render :show
    else
      render json: @bench.errors.full_messages, status: 422
    end
  end

  private
  def bench_params
    params.require(:bench).permit(:description, :lat, :long, :filters)
  end
end
