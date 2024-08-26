# wdio-typescript-service

> WDIO TypeScript service

Attention: The best practice is known to use a special option of your testing framework. So, this service is an alternative to do something like:

```js
{
	framework: 'mocha'

	mochaOpts: {
		'compilers': ['ts-node/register']
	}
}
```

### Installation

```
npm install wdio-typescript-service --save
```

####  package.json

Make sure you already have the following dependencies: 

```json
{
	"typescript": "^2.1.5",
}
```

### Usage

#### wdio.config.js

```js
{
	services: [
		'typescript'
	]
};
```

#### Options

```js
{
	typescriptOptions: { }
}
```

A full list of options see [here](https://github.com/TypeStrong/ts-node).


#### Example

```typescript
import Page from './page';

interface Test {};

describe('Suite', () => {
	let page: Test = new Page;
})
```
