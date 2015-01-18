require 'marsys'
require 'sinatra/base'
require 'json'
require 'slim'

load "population.rb"
load "core.rb"
load "blue_people.rb"
load "red_people.rb"

class App < Sinatra::Base
	use Rack::Session::Pool
	set :public_folder, File.dirname(__FILE__) + '/../static'

	get '/' do
		slim :index
	end

	get '/init/:size/:population/:red_population/:blue_population/:red_expectation/:blue_expectation/:red_expectation' do
		options = {		
	dimensions: params[:size].to_i,
	population:  params[:population].to_i,
	red_population: params[:red_population].to_i,
	blue_population: params[:blue_population].to_i,
	red_expectation: params[:red_expectation].to_i,
	blue_expectation: params[:blue_expectation].to_i					
		}
		session[:instance] = Core.new options
    content_type :json
		session[:instance].environment.to_json
	end

	get '/turn' do
		begin
	    session[:instance].environment.turn
	  rescue => error
	  	puts error.inspect
	  end

    content_type :json
    session[:instance].environment.to_json
	end

	get '/param/:id' do
		user_id = params[:id]
	end

	run! if app_file == $0 # run Sinatra
end
