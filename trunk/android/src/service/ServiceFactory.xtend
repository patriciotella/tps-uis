package service

import retrofit.RestAdapter

class ServiceFactory {
	
	def static createService() {
		val SERVER_IP = "192.168.1.36"
		val API_URL = "http://" + SERVER_IP + ":9000"

		val restAdapter = new RestAdapter.Builder().setEndpoint(API_URL).build
		val CarmenService carmenService = restAdapter.create(CarmenService)
		carmenService
	}
}