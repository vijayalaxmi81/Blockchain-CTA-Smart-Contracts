
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CertificateRegistry {

    address public owner;

    struct Certificate {
        string studentName;
        string courseName;
        bool issued;
        bool revoked;
    }

    mapping(bytes32 => Certificate) private certificates;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    // Issue a new certificate
    function issueCertificate(
        string calldata certificateId,
        string calldata studentName,
        string calldata courseName
    ) external onlyOwner {

        bytes32 id = keccak256(bytes(certificateId));

        require(!certificates[id].issued, "Certificate already exists");

        certificates[id] = Certificate({
            studentName: studentName,
            courseName: courseName,
            issued: true,
            revoked: false
        });
    }

    // Revoke an existing certificate
    function revokeCertificate(
        string calldata certificateId
    ) external onlyOwner {

        bytes32 id = keccak256(bytes(certificateId));

        require(certificates[id].issued, "Certificate not found");
        require(!certificates[id].revoked, "Already revoked");

        certificates[id].revoked = true;
    }

    // Verify a certificate
    function verifyCertificate(
        string calldata certificateId
    )
        external
        view
        returns (
            bool isValid,
            string memory studentName,
            string memory courseName
        )
    {
        bytes32 id = keccak256(bytes(certificateId));

        Certificate storage cert = certificates[id];

        if (!cert.issued || cert.revoked) {
            return (false, "", "");
        }

        return (true, cert.studentName, cert.courseName);
    }
}
