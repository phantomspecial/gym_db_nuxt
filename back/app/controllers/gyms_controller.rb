class GymsController < ApplicationController
  def index; end

  def show
    gbi = GymBasicInfo.find(params[:id])
    render json: { gym_detail: format_detail(gbi) }, status: :ok
  end

  def search
    pref_id = params[:pref]
    keyword = params[:keyword]

    gym_list = GymBasicInfo.all.includes(:master_gym, :master_prefecture)
    gym_list = gym_list.where(master_prefecture_id: pref_id.to_i) if pref_id.present?
    gym_list = gym_list.freeword_search(keyword) if keyword.present?

    render json: { gym_list: format_list(gym_list) }, status: :ok
  end

  private

  def format_detail(gym_detail)
    {
        id: gym_detail.id,
        master_gym_name: gym_detail.master_gym.gym_name,
        master_pref_name: gym_detail.master_prefecture.name,
        shop_name: gym_detail.shop_name,
        post_address: gym_detail.post_address,
        tel_no: gym_detail.tel_no,
        address: gym_detail.address,
        access: gym_detail.access,
        opening_hours: gym_detail.opening_hours,
        parking: gym_detail.parking,
        facility: gym_detail.facility,
        other_info1: gym_detail.other_info1,
        url: gym_detail.url
    }
  end

  def format_list(gym_list)
    gym_list.map do |gym|
      {
          id: gym.id,
          master_gym_name: gym.master_gym.gym_name,
          master_pref_name: gym.master_prefecture.name,
          shop_name: gym.shop_name,
          post_address: gym.post_address,
          tel_no: gym.tel_no,
          address: gym.address,
          url: gym.url
      }
    end
  end
end
