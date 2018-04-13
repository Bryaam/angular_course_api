module Response

  def json_response(object, status = :ok)
    render json: {
            code: Rack::Utils::SYMBOL_TO_STATUS_CODE[status],
            data: object
           },
           status: status
  end
  
end
