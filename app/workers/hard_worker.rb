require 'sidekiq'

class HardWorker
  include Sidekiq::Worker

  def perform(id)
    Item.find_by(cart_id: id).update(cart_id: nil)
  end
end
