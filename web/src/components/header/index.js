import { Component, h } from 'preact';

import { Link } from 'preact-router/match';
import style from './style';

export default class Navigation extends Component {
	render() {
		return (
			<header class={style.header}>
				<h1>Avexis MC</h1>
				<nav>
					<Link activeClassName={style.active} href="/">Home</Link>
					<Link activeClassName={style.active} href="/settings">Settings</Link>
				</nav>
			</header>
		);
	}
}
