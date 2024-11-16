class DiceController < ApplicationController
  def roll
    render json: rand(1..12).to_s
  end
end
