;; Batch 1: Initial Setup and Data Structures
;; Legal Contract Management System
;; Description: Smart contract system for managing legal agreements on Stacks blockchain

;; Error Codes
(define-constant ERR_NOT_AUTHORIZED (err u100))
(define-constant ERR_INVALID_INPUT (err u101))
(define-constant ERR_CONTRACT_NOT_FOUND (err u102))
(define-constant ERR_MAX_SIGNATURES_REACHED (err u103))
(define-constant ERR_INVALID_STATE (err u104))
(define-constant ERR_VERSION_NOT_FOUND (err u105))
(define-constant ERR_EVENT_FAILED (err u106))

;; Constants
(define-constant CONTRACT_ACTIVE u0)
(define-constant CONTRACT_ARCHIVED u1)
(define-constant MAX_SIGNATURES u8)
(define-constant ACCESS_LEVEL_READ u0)
(define-constant ACCESS_LEVEL_WRITE u1)
(define-constant ACCESS_LEVEL_ADMIN u2)
(define-constant INITIAL_VERSION "Initial version")

;; Data Maps
(define-map legal-contracts
    { contract-id: uint }
    {
        title: (string-ascii 256),
        description: (string-ascii 1024),
        status: uint,
        created-by: principal,
        created-at: uint,
        updated-at: uint,
        required-signatures: uint
    }
)

(define-map contract-versions
    { contract-id: uint, version: uint }
    {
        content-hash: (buff 32),
        created-by: principal,
        created-at: uint,
        metadata: (string-ascii 256)
    }
)

(define-map contract-signatures
    { contract-id: uint, signer: principal }
    {
        signed-at: uint,
        signature-hash: (buff 64),
        version: uint
    }
)

(define-map contract-access
    { contract-id: uint, user: principal }
    { access-level: uint }
)

(define-map contract-events
    { contract-id: uint, event-id: uint }
    {
        event-type: (string-ascii 64),
        created-at: uint,
        created-by: principal,
        metadata: (string-ascii 256),
        related-principal: (optional principal),
        related-uint: (optional uint)
    }
)

;; Data Variables
(define-data-var contract-nonce uint u0)
(define-data-var event-nonce uint u0)
