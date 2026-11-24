<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:7F5AF0,100:2CB67D&height=180&section=header&text=QuestBoard&fontSize=60&fontColor=ffffff&animation=fadeIn" alt="QuestBoard" />

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=22&pause=1000&color=7F5AF0&center=true&vCenter=true&width=520&lines=Aceite+miss%C3%B5es+%E2%9A%94%EF%B8%8F;Complete+desafios+%F0%9F%8F%86;Ganhe+XP+e+recompensas+%E2%AD%90" alt="Typing SVG" />

![Salesforce](https://img.shields.io/badge/Salesforce-00A1E0?style=for-the-badge&logo=salesforce&logoColor=white)
![Apex](https://img.shields.io/badge/Apex-1798C1?style=for-the-badge&logo=salesforce&logoColor=white)
![VS Code](https://img.shields.io/badge/VS_Code-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white)
![Status](https://img.shields.io/badge/status-em_desenvolvimento-yellow?style=for-the-badge)

</div>

---

## 🎮 O que é?

Um quadro de missões estilo RPG feito no **Salesforce**. O jogador escolhe uma missão, define a dificuldade e, ao concluir, o XP vai direto para o perfil dele.

## ⚡ XP por dificuldade

| Dificuldade | XP |
|:-----------:|:--:|
| 🟢 Easy | 250 |
| 🟡 Medium | 1000 |
| 🟠 Hard | 1500 |
| 🔴 Super Hard | 2000 |

---

<details>
<summary><b>🗂️ Objetos</b> (clique para abrir)</summary>
<br>

- **`Player__c`**: o jogador e seu XP total
- **`Mission__c`**: a missão disponível
- **`MissionPlayer__c`**: liga jogador e missão (dificuldade, status e XP)
- **`Reward__c`**: recompensa conquistada

</details>

<details>
<summary><b>🧠 Como funciona</b> (clique para abrir)</summary>
<br>

1. Ao escolher a dificuldade, `ServiceXP` preenche o XP da missão.
2. Ao marcar a missão como `Completed`, `ServiceMissionStatus` soma o XP ao jogador.
3. Quando o jogador sobe de nível, um Batch sorteia um Pokémon como recompensa via **PokéAPI**.

</details>

<details>
<summary><b>🚀 Como rodar</b> (clique para abrir)</summary>
<br>

```bash
git clone https://github.com/SEU-USUARIO/QuestBoard.git
cd QuestBoard
sf org login web --alias questboard
sf project deploy start --source-dir force-app --target-org questboard
```

</details>

---

## 🗺️ Roadmap

- [x] XP por dificuldade
- [x] XP somado ao jogador
- [ ] Recompensas com PokéAPI
- [ ] Testes unitários
- [ ] Ranking de jogadores

---

<div align="center">

Feito por **[@ccamysz](https://github.com/ccamysz)**, **[@CarolineEvelyn](https://github.com/CarolineEvelyn)** e **[@bielflas](https://github.com/bielflas)** 💜

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:7F5AF0,100:2CB67D&height=100&section=footer" alt="" />

</div>
