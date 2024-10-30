
# Legal Contract Management System

SmartSeal is a **Smart Contract** developed for managing legal agreements on the **Stacks blockchain**. It provides functionalities for contract creation, versioning, access control, and signature management. The contract includes error handling, event logging, and access management to ensure secure and reliable legal document management.


## Error Codes

The contract defines a set of error codes for error handling:

- **ERR_NOT_AUTHORIZED** (`u100`): Caller lacks required permissions.
- **ERR_INVALID_INPUT** (`u101`): Invalid input provided to a function.
- **ERR_CONTRACT_NOT_FOUND** (`u102`): Specified contract does not exist.
- **ERR_MAX_SIGNATURES_REACHED** (`u103`): Maximum number of signatures reached.
- **ERR_INVALID_STATE** (`u104`): Contract is not in a valid state for the requested operation.
- **ERR_VERSION_NOT_FOUND** (`u105`): Specified version of the contract does not exist.
- **ERR_EVENT_FAILED** (`u106`): Failed to log an event.

## Constants

- **CONTRACT_ACTIVE** (`u0`): Status indicating an active contract.
- **CONTRACT_ARCHIVED** (`u1`): Status indicating an archived contract.
- **MAX_SIGNATURES** (`u8`): Maximum allowed signatures for a contract.
- **ACCESS_LEVEL_READ** (`u0`): Read-only access level.
- **ACCESS_LEVEL_WRITE** (`u1`): Write access level.
- **ACCESS_LEVEL_ADMIN** (`u2`): Admin access level.
- **INITIAL_VERSION**: Default metadata for the initial contract version.

## Data Maps

The contract uses several data maps to store information:

- **legal-contracts**: Stores contract metadata including title, status, and signature requirements.
- **contract-versions**: Stores versions of each contract with content hash and metadata.
- **contract-signatures**: Tracks signatures added to contracts, including version and timestamp.
- **contract-access**: Manages access levels for users associated with each contract.
- **contract-events**: Logs events related to contract changes, including event type and metadata.

## Data Variables

- **contract-nonce**: Counter to assign unique IDs to each contract.
- **event-nonce**: Counter to assign unique IDs to each contract event.

## Functions

### Public Functions

1. **create-contract**: Creates a new legal contract with specified title, description, required signatures, and initial content hash.
2. **add-signature**: Adds a user’s signature to a contract, logging the event.
3. **get-contract-details**: Retrieves detailed information about a contract.
4. **create-version**: Creates a new version of a contract with specified content hash and metadata.
5. **grant-access**: Grants access to a specified user with a particular access level for a contract.

### Private Functions

1. **is-contract-admin**: Checks if the caller has admin access for a contract.
2. **increment-nonce**: Increments a nonce value for unique ID assignment.
3. **validate-contract-exists**: Ensures a contract exists before performing an operation.
4. **validate-description**: Validates contract description length.
5. **validate-content-hash**: Validates the content hash length for contract versions.
6. **validate-signature-hash**: Validates the signature hash length.
7. **validate-metadata**: Ensures metadata content is not empty.
8. **validate-user-principal**: Validates that a user principal is not the contract itself.

### Helper Functions

1. **get-latest-version**: Retrieves the latest version number for a specified contract.
2. **update-contract-timestamp**: Updates the timestamp for the contract to the current block height.

## Getting Started

To deploy and use the **SmartSeal** smart contract on the Stacks blockchain:

1. **Install Clarity**: Ensure you have the Clarity language and Stacks setup.
2. **Deploy the Contract**: Deploy the smart contract code to the Stacks network.
3. **Interact with Functions**: Use contract functions to create contracts, manage versions, add signatures, and control access.

