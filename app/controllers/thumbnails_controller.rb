require 'options_parser'

class ThumbnailsController < ApplicationController

  def new
    @thumbnail = ::LinkThumbnailer.generate(params[:url], options)

    render json: @thumbnail, callback: params[:callback]
  end

  private

  def options
    ::OptionsParser.new(params.fetch(:options, {})).call
  end

  def permitted_params
    params.require(:url)
    params.permit(options: [])
  end

end
