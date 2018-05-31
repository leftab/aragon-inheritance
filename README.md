# Inheritance problem

This is a simple app with 2 contracts in 2 separate files:

CounterApp.sol:

```javascript
pragma solidity ^0.4.4;

import "@aragon/os/contracts/apps/AragonApp.sol";
import "./Parent.sol";

contract CounterApp is AragonApp, Parent {  

}
```

Parent.sol:

```javascript
pragma solidity ^0.4.4;

contract Parent {
    event ParentValueChange(address indexed entity, uint value);

    uint public parentValue;

    function setNewParentValue(uint val) external {
        parentValue = val;
        ParentValueChange(msg.sender, parentValue);
    }
}
```

Nothing seems to happen when `app.setNewParentValue(2)` is called in `App.js`

**Yet if the contracts are in the same file, everything works:**

```javascript
pragma solidity ^0.4.4;

contract Parent {
    event ParentValueChange(address indexed entity, uint value);

    uint public parentValue;

    function setNewParentValue(uint val) external {
        parentValue = val;
        ParentValueChange(msg.sender, parentValue);
    }
}

contract CounterApp is AragonApp, Parent {  

}

```


