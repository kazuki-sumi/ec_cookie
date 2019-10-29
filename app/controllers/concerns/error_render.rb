module ErrorRender
  def routing_error
    e = ActionController::RoutingError.new("ルーティングが見つかりませんでした #{request.url}")
    render_404(e)
  end

  private

    def render_404(e)
      logger.warn e
      render "errors/application", layout: false
    end
end
