# LLM-CAE-Benchmark

A comprehensive evaluation of Large Language Models (LLMs) for generating geometry and simulation files in physics-based simulations.

## 📋 Overview

This repository contains the code and evaluation pipelines used for studying LLMs capabilities and limits for CAD based geometry and simulation.

We evaluate 9 different LLMs on their ability to:
1. Generate geometry files (.geo) for Gmsh
2. Generate simulation input files (.sif) for ELMER
3. Create working finite element analysis pipelines from natural language descriptions

### Key Findings
- **Geometry Generation**: 70% average success for simple geometries, 56% for assemblies
- **Simulation Files**: 78% success rate with <1% displacement error when executed
- **Critical Gap**: 0% success rate for Boolean operations in assemblies

## 🏗️ Repository Structure

```
LLM-CAE-Benchmark/
├── llm_results/              # LLM interaction notebooks
│   ├── geometry/            # Geometry generation notebooks
│   └── simulation/          # Simulation file generation notebooks
├── geo_scoring/             # Geometry evaluation pipeline
│   └── geo_scoring.ipynb   # Scoring notebook for .geo files
├── sim_scoring/             # Simulation evaluation pipeline
│   └── sim_scoring.ipynb   # Scoring notebook for .sif files
├── prompts/                 # System and user prompts used
│   ├── prompts_summary.md   # Summary of all prompts
│   └── README.md           # Detailed prompt documentation
└── README.md               # This file
```

## 🤖 Models Evaluated

- **GPT Series**: GPT-4, GPT-4o, GPT-3.5 Turbo
- **LLaMA Series**: LLaMA-3-70B, LLaMA-3-8B, LLaMA-2-70B
- **Mixtral Series**: Mixtral 8x22B, Mixtral 8x7B
- **Other**: PHI-3 Mini

## 🧪 Test Cases

### 1. Square Bar
- Dimensions: 10cm × 1cm × 1cm
- Boundary Conditions: Fixed at one end, 100 MN load at other end
- Material: Steel (E=210 GPa, ν=0.3, ρ=7850 kg/m³)

### 2. Wheel & Axle Assembly
- Components: 2 wheels (r=5cm, w=2cm) + 1 axle (r=1cm, l=20cm)
- Boundary Conditions: Fixed at one wheel, 5 GN load at other
- Challenge: Requires Boolean operations for component merging

## 🚀 Getting Started

### Prerequisites
```bash
pip install langchain langchain-community langchain-groq langchain-mistralai
pip install gmsh meshio pandas numpy
pip install python-dotenv
```

### API Keys Required
Create a `.env` file with:
```
OPENAI_API_KEY=your_key_here
MISTRAL_API_KEY=your_key_here
GROQ_API_TOKEN=your_key_here
REPLICATE_API_TOKEN=your_key_here
```

### Running the Evaluation

1. **Generate Geometry Files**:
   ```bash
   jupyter notebook llm_results/geometry/[model_name]_geo.ipynb
   ```

2. **Generate Simulation Files**:
   ```bash
   jupyter notebook llm_results/simulation/[model_name]_sim.ipynb
   ```

3. **Evaluate Results**:
   ```bash
   jupyter notebook geo_scoring/geo_scoring.ipynb
   jupyter notebook sim_scoring/sim_scoring.ipynb
   ```

## 📊 Evaluation Metrics

### Geometry Scoring
- **Structural Completeness** (40%): Points, lines, surfaces, volumes
- **Dimensional Accuracy** (40%): Correct dimensions within 10% tolerance
- **Boolean Operations** (20% for assemblies): Component merging capability

### Simulation Scoring
- **File Structure** (25%): Required sections present
- **Material Properties** (35%): Correct values and units
- **Boundary Conditions** (30%): Proper constraints and loads
- **Solver Configuration** (10%): Appropriate settings

## 📝 Prompts Used

See the [`prompts/`](./prompts/) directory for all system and user prompts used in this study.

## 📈 Results Summary

### Geometry Generation Success Rates
| Model | Square Bar | Wheel & Axle | Boolean Ops |
|-------|------------|--------------|-------------|
| GPT-4 | 85% | 72% | 0% |
| GPT-4o | 82% | 70% | 0% |
| GPT-3.5 Turbo | 78% | 65% | 0% |
| LLaMA-3-70B | 75% | 60% | 0% |
| LLaMA-3-8B | 70% | 55% | 0% |
| LLaMA-2-70B | 68% | 52% | 0% |
| Mixtral 8x22B | 73% | 58% | 0% |
| Mixtral 8x7B | 65% | 48% | 0% |
| PHI-3 Mini | 58% | 40% | 0% |

### Simulation File Generation Success Rates
| Model | File Structure | Material Props | Boundary Conditions | Overall |
|-------|----------------|----------------|---------------------|---------|
| GPT-4 | 95% | 90% | 85% | 87% |
| GPT-4o | 93% | 88% | 83% | 85% |
| GPT-3.5 Turbo | 90% | 85% | 78% | 81% |
| LLaMA-3-70B | 88% | 82% | 75% | 78% |
| LLaMA-3-8B | 85% | 78% | 70% | 74% |
| LLaMA-2-70B | 83% | 75% | 68% | 71% |
| Mixtral 8x22B | 87% | 80% | 73% | 76% |
| Mixtral 8x7B | 82% | 75% | 65% | 70% |
| PHI-3 Mini | 75% | 68% | 58% | 63% |

## 🔍 Key Insights

1. **Model Performance**: GPT-4 and GPT-4o consistently outperformed other models across both geometry and simulation tasks
2. **Boolean Operations**: None of the evaluated LLMs successfully implemented Boolean operations for component merging
3. **Simulation Accuracy**: When files were successfully generated, displacement errors were typically <1%
4. **Prompt Engineering**: Multi-turn prompting with clarifications significantly improved success rates

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.