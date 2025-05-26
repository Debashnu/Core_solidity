# CommitMint — Commitment Staking Smart Contract on Core DAO

**CommitMint** is a decentralized commitment staking contract built for the **Core DAO** ecosystem. Users stake ETH (or tCORE on Core DAO) as a pledge to achieve a personal goal within a set deadline. A trusted referee confirms goal completion. If confirmed, users reclaim their stake; if not, their staked funds are donated to a predefined charity address. This contract fosters accountability, social impact, and community trust on the Core DAO blockchain.

---

## Transaction & Deployment

- **Transaction Hash:** [`0xc4f4cf6170e0a6ec25435c357423b80c7404acd33749cd98cdc04eccb7ea8e4d`](https://explorer.coredao.org/tx/0xc4f4cf6170e0a6ec25435c357423b80c7404acd33749cd98cdc04eccb7ea8e4d)  
- **Network:** Core DAO (Mainnet/Testnet)  
- **Deployed via:** Remix IDE connected to Core DAO network

---

## Contract Overview

CommitMint enables users on Core DAO to put their money where their mouth is by staking ETH/tCORE toward a personal commitment:

- **Stake ETH/tCORE** with a goal description, a referee, and a deadline.
- **Referee verifies** if the goal was achieved before the deadline.
- If confirmed, the **user reclaims** their staked funds.
- If not confirmed before deadline, the stake is **forfeited and sent to charity**.

---

## Features

- **Commit with a goal:** Lock your stake with a string describing your goal.
- **Trusted referee system:** Only the designated referee can confirm success.
- **Deadline enforcement:** Deadlines are timestamp-based on Core DAO blockchain.
- **Claim or Forfeit:** Withdraw your stake if confirmed, or forfeit it to charity if not.
- **Transparent and immutable:** Charity address is set at deployment and cannot be changed.
- **Events for transparency:** Emitted events track commitments, confirmations, claims, and forfeits.

---

## Key Contract Functions

| Function        | Description                                                           |
|-----------------|-----------------------------------------------------------------------|
| `commit()`      | Stake ETH/tCORE with a goal, referee, and deadline duration.         |
| `confirm()`     | Referee confirms goal success before deadline.                        |
| `claim()`       | User claims back their stake after confirmation.                      |
| `forfeit()`     | User forfeits stake to charity after deadline if unconfirmed.        |
| `getTimeLeft()` | Returns seconds left until deadline for a user’s commitment.          |

---

## How to Use on Core DAO

1. Deploy the contract with the **charity address** on Core DAO via Remix IDE.
2. Call `commit()` with:
   - Your **goal description** (string).
   - The **referee’s address** (trusted individual).
   - The **duration** of commitment (seconds).
   - Send the stake amount in ETH/tCORE.
3. The referee calls `confirm()` if you achieve your goal before the deadline.
4. After confirmation, call `claim()` to retrieve your stake.
5. If the deadline passes without confirmation, call `forfeit()` to send the stake to charity.

---

## Security & Limitations

- Only the **assigned referee** can confirm completion.
- User can only commit once at a time (no overlapping commitments).
- Once forfeited or claimed, the commitment data is cleared.
- Charity address is **immutable** for trust and transparency.
- Use with care—stake ETH/tCORE you are willing to risk.

---

## Future Enhancements

- Add multi-commitment support per user.
- Integrate with Core DAO governance for referee nomination.
- Develop a front-end dApp for easier interaction.
- Support ERC20 tokens besides ETH/tCORE.

---

## About Core DAO

**Core DAO** is a high-performance blockchain ecosystem designed for decentralized applications with fast finality, low fees, and strong security. CommitMint leverages Core DAO’s timestamping and native token capabilities (tCORE) to incentivize personal accountability and community charity.

---

## Useful Links

- Core DAO Explorer Tx: [`0xc4f4cf6170e0a6ec25435c357423b80c7404acd33749cd98cdc04eccb7ea8e4d`](https://explorer.coredao.org/tx/0xc4f4cf6170e0a6ec25435c357423b80c7404acd33749cd98cdc04eccb7ea8e4d)  
- Core DAO Official Website: [https://coredao.org](https://coredao.org)  
- Remix IDE: [https://remix.ethereum.org](https://remix.ethereum.org) (Configure RPC for Core DAO)

---

## License

MIT License © 2025 CommitMint on Core DAO

---

*Commit to your goals, stake your trust, and empower community impact — all on Core DAO.*

