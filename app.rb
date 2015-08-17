require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'restfulmlb')

# get '/' do
# 	new_player = { :name => 'Barry Bonds', :number => 24, :weight => 230, :age => 37,:throws => 'R', :bats => 'R', :batting_average => 0.310, :rbi => 122, :home_runs => 48, :steals => 6, :on_base_percentage => 0.411, :walks => 140, :position => 'LF' }
# 	Player.create(new_player).to_json
# end

get '/api/players' do
	Player.all.to_json
end

get '/api/players/:id' do
	Player.find(params[:id]).to_json
end

post '/api/players/:id' do
	player_params = { :name => params[:name], :number => params[:number], :weight => params[:weight], :age => params[:age], :throws => params[:throws], :bats => params[:bats], :batting_average => params[:batting_average], :rbi => params[:rbi], :home_runs => params[:home_runs], :steals => params[:steals], :on_base_percentage => params[:on_base_percentage], :walks => params[:walks], :position => params[:position] }
	Player.create(player_params).to_json
end

patch '/api/players/:id' do
	# allow the user to update with any or multiple or all available params
	safe_params = ['name', 'number', 'weight', 'age', 'throws', 'bats', 'batting_average', 'rbi', 'home_runs', 'steals', 'on_base_percentage', 'walks', 'position']
	player_params = {}
	params.keys.each do |param|
		puts safe_params.include?(param)
		player_params.merge!(param => params[param]) if safe_params.include?(param)
		puts '------player_params-------'
		puts player_params
		puts '--------------------------'
	end
	@player = Player.find(params[:id]).update(player_params)
	@player.to_json
end

delete '/api/players/:id' do
	Player.find(params[:id]).destroy.to_json
end









#name, number, weight, age throws, bats, batting_average, rbi, home_runs, steals, on_base_percentage, walks, position;