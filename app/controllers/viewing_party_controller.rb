class ViewingPartyController < ApplicationController
  def new
    @title = params[:title]
    @movie_id = params[:movie_id]
    @duration = params[:duration]
    @party = Party.new
    @friends = current_user.friends
  end

  def create
    party = party_params
    party[:host_id] = current_user.id
    new_party = Party.new(party)
    if new_party.save
      invite_guests(new_party) if params[:friend]
      redirect_to dashboard_path
    else
      flash[:error] = 'You did something wrong'
      redirect_to new_viewing_party_path
    end
  end

  private

  def invite_guests(party)
    guests = friend_params.select { |k,v| v == '1' }
    guests.each do |k,v|
      PartyGuest.create(party_id: party.id, guest_id: k.to_i)
    end
  end

  def party_params
    params.require(:party).permit(:title, :movie_id, :duration, :date, :start_time)
  end

  def friend_params
    params.require(:friend).permit!
  end
end
