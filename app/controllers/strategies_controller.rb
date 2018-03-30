# frozen_string_literal: true

class StrategiesController < ApplicationController
  before_action :set_strategy, only: %i[show edit update destroy]

  def index
    @strategies = Strategy.all
  end

  def new
    @strategy = Strategy.new
  end

  def create
    @strategy = Strategy.new(strategy_params)

    if @strategy.save
      redirect_to @strategy, notice: 'Strategy was successfully created.'
    else
      render :new
    end
  end

  def update
    if @strategy.update(strategy_params)
      redirect_to @strategy, notice: 'Strategy was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @strategy.destroy
    redirect_to strategies_url, notice: 'Strategy was successfully destroyed.'
  end

  private

  def set_strategy
    @strategy = Strategy.find(params[:id])
  end

  def strategy_params
    params.require(:strategy).permit(:name, :time_range, :instrument_id, :strategy_logic_id)
  end
end
