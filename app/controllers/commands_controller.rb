# frozen_string_literal: true

class CommandsController < ApplicationController
  def index
    @commands = Command.order(created_at: :desc).page params[:page]
  end
end
