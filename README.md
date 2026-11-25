# Blockchain-CTA-Smart-Contracts

## Project Overview
This project is developed as part of the Blockchain Continuous Teaching Assessment (CTA) practical. It demonstrates the implementation and testing of smart contracts using Solidity in the Remix IDE.

## Technologies Used
- Solidity
- Remix IDE
- Ethereum Virtual Machine (EVM)
- Remix VM (Osaka)

## Smart Contracts Implemented

### 1. Certificate Verification Registry
A smart contract that allows the owner to issue, verify, and revoke certificates.

**Functions:**
- `issueCertificate()` – Issues a certificate to a student.
- `verifyCertificate()` – Checks whether a certificate is valid.
- `revokeCertificate()` – Revokes an issued certificate.

### 2. Simple Voting System
A smart contract that allows users to vote for candidates while preventing duplicate voting.

**Functions:**
- `vote()` – Allows an account to vote for a candidate.
- `candidateCount()` – Returns the total number of candidates.
- `getCandidate()` – Displays candidate details and vote count.
- `hasVoted()` – Checks whether an account has already voted.

### 3. Supply Chain Tracking
A smart contract that tracks a product through different stages of the supply chain.

**Product Tracking Stages:**
1. Registered
2. Packed
3. Shipped
4. Delivered

**Functions:**
- `registerProduct()` – Registers a new product.
- `advanceStatus()` – Updates the product's status.
- `getProduct()` – Displays product details and current status.

## Testing Environment
All three smart contracts were compiled, deployed, and tested using Remix IDE with the Remix VM (Osaka) environment.

## Repository Structure
```text
Blockchain-CTA-Smart-Contracts/
│
├── contracts/
│   ├── CertificateRegistry.sol
│   ├── SimpleVoting.sol
│   └── SupplyChainTracker.sol
│
└── README.md
```

## Conclusion
This project demonstrates the implementation of Solidity smart contracts for certificate verification, electronic voting, and supply chain tracking. It provides practical experience in writing, compiling, deploying, and testing smart contracts using Remix IDE.
