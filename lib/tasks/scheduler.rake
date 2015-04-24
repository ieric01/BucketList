

namespace :seed do 
	desc "-------drop and repop deals"


	task :repop_deals => :environment do
    TravelDeals.destroy_all
    CouponParser.new.populate_travels

	end
end

