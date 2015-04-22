require 'open-uri'
class CouponParser
	COUPONKEY = "2832c631a4c2e7f66e00dc39b2da1cf9b22c05580a48716e355bb63765bf677af09779aadac31f0fff1ca3bad5092ffb"
	CONN = ActiveRecord::Base.connection
	def populate_travels
		 deals_json = JSON.parse(RestClient.get("http://api.8coupons.com/v1/getrealtimetraveleals?limit=1000&key=#{COUPONKEY}")) 
		 puts "pull #{deals_json.length} from api"
		 mass_insert_query("travel_deals", create_deals_array(deals_json))
	end

	def create_deals_array(json)
		json.map do |deal_hash|
			"(\"#{deal_hash['URL']}\", 
				\"#{deal_hash['ID']}\", 
				\"#{deal_hash['dealTitle']}\", 
				\"#{deal_hash['showImageStandardBig']}\", 
				\"#{deal_hash['dealPrice']}\", 
				\"#{deal_hash['expirationDate']}\")"
		end
	end

	def mass_insert_query(table, deals_array)
		while !deals_array.empty? 
			array = deals_array.shift(100)
			sql = "insert into #{table} (url, deal_id, title, img, price, exp_date) values #{array.join(",")}"
			result = CONN.execute sql	
			puts "inserted #{result} into #{table}"
		end
	end
end