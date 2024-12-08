---
---
In December 2017 I began working with the existing Senior Storage Administrator in FEPS to support the faculties extensive Storage systems.

- OnStor Bobcat - SAN > Network gateways
- Quantum DotHill
- QLogic SAN Switchs

Quantum StorNext Image goes here!!!!!

The Quantum StorNext infrastructure.

The Quantum StorNext provides high-performance and high-capacity  storage to Research Computing services within FEPS. Notable users of this system are CVSSP (Centre for Vision Speech and Signal Processing) and Physics.
The front-end storage of Quantum StorNext is provided by QXS trays.  Data storage is presented to the larger network by the StorNext SAN Clients, and managed by the StorNext Metadata Controllers. 

As Quantum StorNext seperates the Object and Metadata into two separate areas, giving an improved performance by providing direct SAN Access to block storage for all clients simultaneously. This is known as a Parallel File System. The platform offers Unstructured storage (files) and is not used for Structures Storage (block level storage for iSCSI, VMWare, Database, etc). The platform is utilised by the Research Computing Services Condor cluster for HTC (High Throughput Computing). Condor processing nodes are all SAN Clients giving them high-speed simultaneous access to the SAN without the overhead of CIFS of NFS. 

The Quantum StorNext protection layer system is split into two areas - FlexSync (Unmanaged) and Storage Manager (Managed).

## Unmanaged Storage

Unmanaged is divided into two areas: Protected and Unprotected. All data is stored on Quantum QXS Trays (consisting of a storage tray with controller nodes, and JBOD controller trays). QXS trays provide the StorNext file systems. The protection layer is then provided atop this.

### Protected

Protected areas are asynchronously mirror using FlexSync (similar to RSync) from any Quantum StorNext array to all other Quantum StorNext arrays. This provides three simultaneous copies of all data split between three physical locations. FlexSync exploit the metadata database to replicate only files that have been changed since the last run. This provides an efficient replication method for frequently changed data-sets without continuous re-scanning of the file system. 
FlexSync is not efficient as storing large numbers of small files however as it has no object count limit, it potentially store an exhaustive number. However, the efficiency of this is a bottleneck due to FlexSync needing to keep that number of files in sync.
Versioning is provided for (up to) 84 days from original file creation date.
Our FlexSync areas area used to store CVSSP Project Spaces

### Unprotected

Unprotected areas were used exclusively by CVSSP to provide ultra fast unprotected 'scratch' areas for high-speed data processing. Data stored here was not synced to other Quantum StorNext Filesystems, and this vulnerable to major hardware failure. CVSSP Scratch areas are designed to be reliable and performant without being resilient, as all data stored on them is considered replaceable. 

## Managed Storage

Similar to the Unmanaged Storage side, the Managed Storage side front-end is provided by Quantum QXS trays. The Quantum Storage Manager then provides a protection layer to replicate the data between sites (targets) using different policies (profiles)
The Front-end QXS trays for Lattus are provided in both data centres. Each data centre also has a Lattus stack, consisting of a controller and Lattus Storage Trays. Each Lattus Stack is presented to the Storage Manager as a target. A further target is presented to Storage Manager in the form of a Dell ML6000 Tape Library in a third location for additional redundancy.
Data written to the QXS Trays in the Managed Storage environment is protected under profiles, which specify to back up the data ever hour, or every 24 hours, to either both Lattus platforms or to both Lattus platforms and to Tape.

| Profile | Minimum Storag Time | Number of Copies | Replication Destinations   |
| ------- | ------------------- | ---------------- | -------------------------- |
| 1       | 1 hour              | 2                | Lattus AP, Lattus MP       |
| 2       | 1 hour              | 3                | Lattus AP, Lattus MP, Tape |
| 3       | 1 day               | 2                | Lattus AP, Lattus MP       |
| 4       | 1 day               | 3                | Lattus AP, Lattus MP, Tape |
| 5       | 1 day               | 1                | Tape                       |
| Scratch | none                | none             | None                       |

### Lattus Object Storage

**Lattus Protection:** 422TB* (est.) (compressed) Used of 640TB total usable (1280TB RAW)

MP Lattus: 422TB used (compressed) out of 640TB capacity (12-Feb-2019)
AP Lattus: 396TB used (compressed) out of 640TB capacity (12-Feb-2019)

Not user accessible - this is an automated layer but the data is still accessible and presented as though still on QXS trays (via AP/MP-SNFS)
* This is live data, including versions and truncated data

#### Onboard protection (similar to RAID)

Files larger than 128KB are split into 16 parts and stored across the lattus storage nodes. it is a 16x4 split so we can loose up to four parts and still rebuild the file.
Everything less than 128KB is coped 4 times instead of being broken down into 16

#### Versioning and Snapshots
StorNext file system does not create versions or snapshots. Storage manger creates versions on Lattus object storage.
3.7% of data are versioned more than once (13-Feb-2019)

#### Truncation
This is enabled on Lattus protected stornext filesytems (AP-SNFS / MP-SNFS). All files are truncation candates onces they are backed up on Lattus stacks (I.e: AP + MP + Tape).
Select files will only be truncated once the entire file system reaches 75% full.
Historically we only had 80TB of available space. This meant only 60TB of data could be held on stornext.
Anything beyond that would be truncated and stored only on Lattus and the bulk of this data is still truncated and could not be fully restored due to lack of capacity on Lattus-Backed QXS trays.

### Limits
Quantum Lattus is not optimised for handling large quantities of small file due to its object count limits.

### Dell FluidFS

### OnStor Bobcat