
# 💎 CommitMint — Commitment-Based ETH Staking Smart Contract

**CommitMint** is a decentralized smart contract system that allows users to lock ETH as a self-improvement commitment. A trusted referee verifies whether the user achieves their goal within a specified time. If they succeed, they reclaim their ETH. If they fail, the ETH is sent to a charity.

---

## 🌟 Features

- 💰 Stake ETH as a commitment
- ✅ Goal verified by a referee (friend, trainer, etc.)
- ⏳ Deadline-based enforcement
- 🧾 Automatic ETH refund on success
- 🎁 ETH sent to charity on failure
- 🔒 No third-party control — fully decentralized

---

## 🛠️ How It Works

1. **Commit**
   - User stakes ETH and provides:
     - A personal goal (as a string)
     - A referee address
     - A deadline duration

2. **Confirm**
   - The referee calls `confirm()` to verify the goal is achieved before the deadline.

3. **Claim**
   - If confirmed, the user calls `claim()` to retrieve their staked ETH.

4. **Forfeit**
   - If not confirmed by the deadline, the user (or anyone) calls `forfeit()` to donate the ETH to a predefined charity address.

---

## 🔐 Smart Contract Overview

### Functions

| Function         | Description                                                |
|------------------|------------------------------------------------------------|
| `commit()`       | Stake ETH with a goal, referee, and deadline.              |
| `confirm()`      | Called by referee to confirm goal completion.              |
| `claim()`        | Called by user to reclaim ETH after successful confirmation. |
| `forfeit()`      | Called to send ETH to charity if deadline passed without confirmation. |
| `getTimeLeft()`  | View function to get remaining time before deadline.       |

### Struct

```solidity
struct Commitment {
    uint256 amount;
    string goal;
    address referee;
    uint256 deadline;
    bool confirmed;
    bool claimed;
}
