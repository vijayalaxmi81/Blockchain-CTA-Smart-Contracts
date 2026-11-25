
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SupplyChainTracker {

    address public owner;

    enum Status {
        Registered, //0
        Packed,     //1
        Shipped,    //2
        Delivered   //3
    }

    struct Product {
        string name;
        Status status;
        bool exists;
    }

    mapping(uint256 => Product) private products;

    uint256 public nextProductId = 1;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can update");
        _;
    }

    function registerProduct(string calldata productName)
        external
        onlyOwner
        returns (uint256)
    {
        require(bytes(productName).length > 0, "Invalid name");

        uint256 id = nextProductId++;

        products[id] = Product({
            name: productName,
            status: Status.Registered,
            exists: true
        });

        return id;
    }

    function advanceStatus(uint256 id) external onlyOwner {
        require(products[id].exists, "Product not found");
        require(
            products[id].status != Status.Delivered,
            "Already delivered"
        );

        products[id].status =
            Status(uint8(products[id].status) + 1);
    }

    function getProduct(uint256 id)
        external
        view
        returns (string memory name, Status status)
    {
        require(products[id].exists, "Product not found");

        return (products[id].name, products[id].status);
    }
}
