package carmenSanDiego;

import org.apache.wicket.protocol.http.WebApplication;
import org.apache.wicket.util.time.Duration

/**
 * Application object for your web application. If you want to run this application without deploying, run the Start class.
 * 
 * @see carmenSanDiego.Start#main(String[])
 */
/**
 * Wicket application
 */
class WicketApplication extends WebApplication {
	
	override getHomePage() {
		HomePage
	}
	
	override init() {
		getResourceSettings().setResourcePollFrequency(Duration.minutes(1));
	}
}
	