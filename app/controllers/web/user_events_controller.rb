class Web::UserEventsController < Web::ApplicationController

  def index
    conditions = params || { s: "created_at desc" }
    @search = UserEvent.ransack conditions
    @events = @search.result.voted.with_active_speaker.by_created_at

  end

end

