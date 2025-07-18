# LLM-CAE-Benchmark

A comprehensive evaluation of Large Language Models (LLMs) for generating geometry and simulation files in physics-based simulations.

## 📋 Overview

This repository contains the code and evaluation pipelines used in the paper "Evaluating the Performance of Large Language Models for Geometry and Simulation File Generation in Physics-Based Simulations" by Shafiq et al.

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

**Notation**: ✓ = correct/successful, ✗ = incorrect/failed, ⚠ = attempted but failed

### Geometry Generation Results

#### Table 1: Square Bar Geometry Evaluation
| Model | Structure | Dimensions | Quality | Score |
|-------|-----------|------------|---------|-------|
| PHI-3 Mini | 65% | ✗ | Poor | 26% |
| Mixtral 8X22B | 100% | ✓ | Excellent | 100% |
| Mixtral 8X7B | 100% | ✗ | Fair | 60% |
| LLaMA-3-70B | 100% | ✓ | Excellent | 100% |
| LLaMA-3-8B | 100% | ✗ | Poor | 40% |
| LLaMA-2-70B | 57% | ✗ | Poor | 23% |
| GPT-4o | 100% | ✓ | Excellent | 100% |
| GPT-4 | 100% | ✓ | Excellent | 100% |
| GPT-3.5 | 62% | ✓ | Good | 85% |

#### Table 2: Wheel & Axle Assembly Evaluation
| Model | Components | Boolean Ops | Quality | Score |
|-------|------------|-------------|---------|-------|
| PHI-3 Mini | 60% | ✗ | Fair | 50% |
| Mixtral 8X22B | 60% | ✗ | Fair | 50% |
| Mixtral 8X7B | 100% | ✗ | Good* | 70% |
| LLaMA-3-70B | 100% | ✗ | Good* | 60% |
| LLaMA-3-8B | 30% | ✗ | Poor | 35% |
| LLaMA-2-70B | 30% | ✗ | Poor | 35% |
| GPT-4o | 100% | ⚠ | Fair* | 80% |
| GPT-4 | 100% | ✗ | Good* | 60% |
| GPT-3.5 | 100% | ✗ | Good* | 60% |

*Asterisk indicates geometries that are structurally sound but lack Boolean operations for unified mesh

### Simulation File Generation Results

#### Table 3: Square Bar Simulation Evaluation
| Model | File Quality | Status | Score | Accuracy |
|-------|--------------|--------|-------|----------|
| PHI-3 Mini | Poor | Not ready | 0% | Did not run |
| Mixtral 8X22B | Excellent | Ready | 100% | Excellent |
| Mixtral 8X7B | Excellent | Ready | 100% | Excellent |
| LLaMA-3-70B | Excellent | Ready | 100% | Excellent |
| LLaMA-3-8B | Excellent | Ready | 100% | Excellent |
| LLaMA-2-70B | Poor | Not ready | 5% | Did not run |
| GPT-4o | Excellent | Ready | 100% | Excellent |
| GPT-4 | Excellent | Ready | 100% | Excellent |
| GPT-3.5 | Excellent | Ready | 100% | Excellent |

#### Table 4: Wheel & Axle Simulation Evaluation
| Model | File Quality | Status | Score | Accuracy |
|-------|--------------|--------|-------|----------|
| PHI-3 Mini | Excellent | Ready | 97% | Did not run |
| Mixtral 8X22B | Excellent | Ready | 100% | Excellent |
| Mixtral 8X7B | Excellent | Ready | 100% | Excellent |
| LLaMA-3-70B | Excellent | Ready | 100% | Excellent |
| LLaMA-3-8B | Good | Ready* | 83% | Did not run |
| LLaMA-2-70B | Poor | Not ready | 10% | Did not run |
| GPT-4o | Excellent | Ready | 100% | Excellent |
| GPT-4 | Excellent | Ready | 100% | Excellent |
| GPT-3.5 | Excellent | Ready | 100% | Excellent |

*Ready with minor fixes beneficial

## 🔍 Key Insights

1. **Stark Performance Divide**: Geometry generation averaged 70% for simple shapes but only 56% for assemblies
2. **Boolean Operations - Critical Gap**: 0% success rate across all models (GPT-4o attempted but failed with volume reuse errors)
3. **Simulation Excellence**: 78% of models achieved perfect scores for simulation files, with <1% displacement error when executed
4. **Model Size Paradox**: PHI-3 Mini showed extreme variability (0% to 97% between similar tasks) despite consistent prompting
5. **Clear Winners**: GPT-4, GPT-4o, and Mixtral 8X22B achieved 100% on both geometry and simulation for simple cases

## 📝 Citation

If you use this benchmark in your research, please cite:
```bibtex
@article{shafiq2024evaluating,
  title={Evaluating the Performance of Large Language Models for Geometry and 
         Simulation File Generation in Physics-Based Simulations},
  author={Shafiq, Ossama and Alexiadis, Alessio and Ghiassi, Bahman},
  journal={},
  year={2024}
}
```

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. Areas of particular interest:
- Additional test cases and geometries
- Support for other CAE software
- Improved evaluation metrics
- Prompt optimisation strategies

## 👥 Authors

- **Ossama Shafiq** - *Initial work and development of sotware/code* - School of Engineering, University of Birmingham
- **Alessio Alexiadis** - *Supervision* - School of Chemical Engineering, University of Birmingham  
- **Bahman Ghiassi** - *Supervision* - School of Engineering, University of Birmingham


## 📊 Data Availability

All data supporting the results of this study are available in this repository.