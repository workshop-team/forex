# frozen_string_literal: true

class StrategiesController < ApplicationController
  authorize_resource
  before_action :set_strategy, only: %i[show edit update destroy]

  def index
    @strategies = Strategy.includes(:instrument, :strategy_logic)
  end

  def new
    @strategy = Strategy.new
  end

  def create
    @strategy = Strategy.new(strategy_params)

    if @strategy.save
      Command.create(name: 'add_strategy', params: @strategy)
      redirect_to @strategy, notice: t('message_of_addition')
    else
      render :new
    end
  end

  def update
    if @strategy.update(strategy_params)
      Command.create(name: 'edit_strategy', params: @strategy)
      redirect_to @strategy, notice: t('message_of_modification')
    else
      render :edit
    end
  end

  def destroy
    @strategy.destroy
    Command.create(name: 'destroy_strategy', params: @strategy)
    redirect_to strategies_url, notice: t('message_of_deletion')
  end

  private

  def set_strategy
    @strategy = Strategy.find(params[:id])
  end

  def strategy_params
    params.require(:strategy).permit(:name, :time_range, :instrument_id, :strategy_logic_id)
  end
end
