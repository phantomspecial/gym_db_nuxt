class PrefecturesController < ApplicationController
  def index
    prefs = MasterPrefecture.all
    render json: { prefectures: format_list(prefs) }, status: :ok
  end

  private

  def format_list(prefs)
    prefs.map do |pref|
      {
          id: pref.id,
          name: pref.name
      }
    end
  end
end
