
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

// This is class that describes you smart contract.
contract tasks {
    // Contract can have an instance variables.
    // In this example instance variable `timestamp` is used to store the time of `constructor` or `touch`
    // function call
    uint32 public timestamp;

    // Contract can have a `constructor` – function that will be called when contract will be deployed to the blockchain.
    // In this example constructor adds current time to the instance variable.
    // All contracts need call tvm.accept(); for succeeded deploy
    constructor() public {
        // Check that contract's public key is set
        require(tvm.pubkey() != 0, 101);
        // Check that message has signature (msg.pubkey() is not zero) and
        // message is signed with the owner's private key
        require(msg.pubkey() == tvm.pubkey(), 102);
        // The current smart contract agrees to buy some gas to finish the
        // current transaction. This actions required to process external
        // messages, which bring no value (henceno gas) with themselves.
        tvm.accept();

        timestamp = now;
    }
    struct task {
        string taskName;
        uint32 time;
        bool complete;
    }


    uint8 id = 0;

    mapping (uint8 => task) public Tasks;

    function createTask(string name) public {
        id++;

        task newTask;
        newTask.taskName = name;
        newTask.time = now;
        newTask.complete = false;
    
        Tasks[id] = newTask;
        tvm.accept();

    }

    function returnNumber() public view returns(uint8) {
        return id;
        
    }

    function returnTasks() public view returns(string) {
        for (uint8 i = 1; i < id; i++) {
        return Tasks[i].taskName;
        }
    }

     function getTask(uint8 key) public view returns(string ) {
        return Tasks[key].taskName;
        tvm.accept();
        
    }

     function deleteTask(uint8 key) public {
        delete Tasks[key];
        tvm.accept();
        
    }

     function completeTask(uint8 key) public {
        Tasks[key].complete = true;
        tvm.accept();
        
    }








}
    
