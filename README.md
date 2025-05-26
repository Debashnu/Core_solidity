# 💎 CommitMint — Commitment-Based ETH Staking Smart Contract

**CommitMint** is a decentralized smart contract designed for self-improvement and accountability. Users commit to personal goals by staking ETH and assigning a referee. If the goal is verified by the referee before the deadline, users get their ETH back. If not, the funds are sent to a predefined charity address.

---

## 🚀 Transaction Info

- **Deployment Hash**: [`0xc4f4cf6170e0a6ec25435c357423b80c7404acd33749cd98cdc04eccb7ea8e4d`](https://etherscan.io/tx/0xc4f4cf6170e0a6ec25435c357423b80c7404acd33749cd98cdc04eccb7ea8e4d)
- **Deployer**: Your wallet address (connected via Remix)
- **Network**: Ethereum / Testnet (depending on deployment)

---

## 📄 Contract Features

- ✅ **Create a Commitment**: Lock ETH with a personal goal, referee, and deadline.
- 👤 **Referee Verifies**: Trusted referee confirms whether the goal was achieved.
- ⏱ **Deadline Enforced**: Commitments must be completed within a time frame.
- 💰 **Refund on Success**: Users reclaim ETH if confirmed by referee.
- 🎁 **Donate on Failure**: Funds are sent to a predefined charity if the user fails or doesn't complete in time.

---

## 🧠 Use Cases

- 🏋️ Fitness Goals — Run 5km every day for a week.
- 📚 Study Deadlines — Complete a course module within 7 days.
- 🧘 Habit Building — Meditate every day for 30 days.
- 🧑‍💼 DAO-Driven Commitments — Contribute to an open-source repo.
- 🎁 Conditional Donations — Auto-donate if you fail.

---

## 📦 Smart Contract Overview

### Struct: Commitment

```solidity
struct Commitment {
    uint256 amount;
    string goal;
    address referee;
    uint256 deadline;
    bool confirmed;
    bool claimed;
}
