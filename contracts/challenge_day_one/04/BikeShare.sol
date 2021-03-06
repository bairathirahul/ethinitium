

pragma solidity ^0.4.21;


contract BikeShare {


    /**************************************
    * State variables
    **************************************/
    // "Type" Bike, holds the owner, whether it is rented, and
    // the amount of kilometers ridden
    struct Bike {
      address owner;
      bool isRented;
      uint256 kms;
    }

    // Array of said bikes
    Bike[] public bikes;

    // Mapping to keep track of the bikes rented
    mapping(address => uint256) public bikeRented;

    // Mapping to keep track of user's credit balances
    mapping(address => uint256) public credits;

    // Initial credit price
    uint256 internal creditPrice = 1 finney;
    // Initial cost per kilometer
    uint256 internal cpkm = 5;
    // Initial credits received for donating a bike
    uint256 internal donateCredits = 500;
    // Initial credits given for repairing a bike
    uint256 internal repairCredits = 250;

    /**************************************
    * constructor
    **************************************/
    function BikeShare() public {
      // Initialize with 5 bikes from the bikeshare owner
      for (uint8 i = 0; i < 5; i++) {
        bikes.push(Bike({ owner: msg.sender, isRented: false, kms: 0 }));
      }
    }

    /**************************************
    * Functions only accessible by the owner
    **************************************/
    function setCreditPrice() external {}
    function setCPKM() external {}
    function setDonateCredits() external {}
    function setRepairCredits() external {}

    /**************************************
    * getters not provided by compiler
    **************************************/
    function getAvailable() public view returns (bool[]) {}


   /**************************************
    * Function to get the credit balance of a user
    **************************************/
    function getCreditBalance(address _addr) public view returns (uint256) {
      return credits[_addr];
    }
    /**************************************
    * Function to purchase Credits
    **************************************/
    function purchaseCredits() private {
      // Calculate the amount of credits the user will get
      // NOTE: integer division floors the result
      uint256 amount = msg.value / creditPrice;
      // Add to the amount of credits the user has
      credits[msg.sender] += amount;
    }



    /**************************************
    * Donating function
    **************************************/
    function donateBike() external {}

    /**************************************
    * Rent a bike
    **************************************/
    function rentBike() external {}

    /**************************************
    * Ride a bike
    **************************************/
    function rideBike() external {}

    /**************************************
    * Return the bike
    **************************************/
    function returnBike() external {}

    /**************************************
    * default payable function, will call purchaseCredits
    **************************************/
    function() payable public {
      purchaseCredits();
    }
}

/*
  THIS CONTRACT IS ONLY MEANT TO BE USED FOR EDUCATIONAL PURPOSES. ANY AND ALL USES IS
  AT A USER'S OWN RISK AND THE AUTHOR HAS NO RESPONSIBILITY FOR ANY LOSS OF ANY KIND STEMMING
  THIS CODE.
 */
