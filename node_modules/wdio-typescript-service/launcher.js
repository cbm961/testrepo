'use strict';

let ts = require('ts-node');

module.exports = {
	onPrepare ({ typescriptOptions = {} }) {
		ts.register(typescriptOptions);
	},

	onComplete () {
		if (this.process) {
			this.process.kill();
		}
	}
};
