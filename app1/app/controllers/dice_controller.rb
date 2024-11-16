class DiceController < ApplicationController
  def roll
    current_span = OpenTelemetry::Trace.current_span
    # current_span.set_attribute("animals", ["elephant", "tiger"])

    render json: rand(1..6).to_s
  end

  def roll2
    MyAppTracer.in_span('child') do |span|
      span.set_attribute("animals", ["elephant", "tiger"])

      Net::HTTP.get('app2', '/rolldice12', 3001)

      rolled_dice = rand(1..6).to_s

      render json: rolled_dice
    end
  end
end
