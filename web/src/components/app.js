import { Component, h } from 'preact';

import Footer from './footer';
import Header from './header';
// import Home from '../routes/home';
import Home from 'async!../routes/home';
import { Router } from 'preact-router';

export default class App extends Component {
	/** Gets fired when the route changes.
	 *	@param {Object} event		"change" event from [preact-router](http://git.io/preact-router)
	 *	@param {string} event.url	The newly routed URL
	 */
	handleRoute = e => {
		this.currentUrl = e.url;
	};

	render() {
		return (
			<div id="app">
				<Header />
				<main>
					<Router onChange={this.handleRoute}>
						<Home path="/" />
					</Router>
				</main>
				<Footer />
			</div>
		);
	}
}
