# encoding: utf-8
class SinatraApp < Sinatra::Application
  get "/" do
    haml :main
  end

  get "/emi.json" do
    content_type :json
    { payment: Amortizer::Loan.new(params[:p], params[:r], params[:t]).payment }.to_json
  end
end
