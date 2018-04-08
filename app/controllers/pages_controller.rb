# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @notifications = Notification.last(5)
  end
end
