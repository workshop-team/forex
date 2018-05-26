# frozen_string_literal: true

class StrategiesController < ApplicationController
  authorize_resource
  before_action :set_strategy, only: %i[show edit update destroy change_status]

  def index
    @strategies = Strategy.includes(:instrument, :strategy_logic, :granularity).decorate
  end

  def show
    @orders = @strategy.orders.order(created_at: :desc).page(params[:page]).decorate
  end

  def new
    @strategy = Strategy.new
  end

  def create
    @strategy = Strategy.new(strategy_params)

    if @strategy.save
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

  def change_status
    new_status = StrategiesService.change_status(params[:status])

    if @strategy.update(status: new_status)
      Command.create(name: 'update_status', params: @strategy)
      redirect_to strategies_path, notice: t('.message_of_changing_status')
    else
      redirect_to strategies_path, error: t('.message_of_changing_status_fail')
    end
  end

  private

  def set_strategy
    @strategy = Strategy.find(params[:id]).decorate
  end

  def strategy_params
    params.require(:strategy).permit(
      :name, :instrument_id, :strategy_logic_id, :granularity_id, :units, :stop_loss, :take_profit
    )
  end
end
