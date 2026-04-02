# dbt + Databricks Project

This repository contains a **dbt** project for Databricks.

## Prerequisites

- Python 3.9+
- Databricks SQL Warehouse (or all-purpose cluster)
- Databricks token
- `dbt-core` and `dbt-databricks`

Install dependencies:

`pip install dbt-core dbt-databricks`

---

## Project Setup

1. Install Python dependencies.
2. Configure your dbt profile in:

`C:\Users\<your-user>\.dbt\profiles.yml`

3. Install project packages:

`dbt deps`

4. Validate connection:

`dbt debug`

---

## Common dbt Workflow

1. `dbt deps`
2. `dbt seed`
3. `dbt run`
4. `dbt test`
5. `dbt docs generate`
6. `dbt docs serve`

Or run everything in one step:

`dbt build`

---

## dbt Commands Reference

### Project / Environment
- `dbt init <project_name>` – Create a new dbt project.
- `dbt deps` – Install packages from `packages.yml`.
- `dbt clean` – Remove files from `clean-targets`.
- `dbt debug` – Validate profile and database connection.
- `dbt parse` – Parse project files without executing SQL.

### Build / Transform
- `dbt run` – Run models.
- `dbt build` – Run models, tests, snapshots, and seeds in DAG order.
- `dbt compile` – Compile SQL without running.
- `dbt show --select <model>` – Compile and preview model SQL/results (adapter support may vary).
- `dbt run-operation <macro_name>` – Run a macro from command line.

### Tests / Data Quality
- `dbt test` – Run schema + data tests.
- `dbt source freshness` – Check freshness of source tables.

### Data Loading
- `dbt seed` – Load CSV seed files.
- `dbt snapshot` – Run snapshot logic.

### Discovery / Metadata
- `dbt ls` (or `dbt list`) – List project resources.
- `dbt docs generate` – Generate docs artifacts.
- `dbt docs serve` – Serve docs locally.

### State / Advanced
- `dbt retry` – Retry failed nodes from the previous run.
- `dbt clone --select <resource>` – Clone relations in supported adapters/environments.

---

## High-Value Command Options

Use these options with many commands:

- `--select` / `-s` – Select specific nodes  
  Example: `dbt run --select marts.finance+`
- `--exclude` – Exclude selected nodes  
  Example: `dbt build --exclude tag:deprecated`
- `--target <name>` – Use a specific target from profile  
  Example: `dbt run --target prod`
- `--vars '{key: value}'` – Pass variables
- `--full-refresh` – Rebuild incremental models from scratch
- `--threads <n>` – Control parallelism
- `--fail-fast` – Stop on first error
- `--state <path>` + `--defer` – State-aware/deferred builds
- `--select state:modified+` – Run only changed nodes and dependents

---

## Useful Databricks Examples

- Run only one model:

`dbt run --select dim_customers`

- Run model and downstream dependents:

`dbt run --select dim_customers+`

- Full refresh incrementals:

`dbt run --full-refresh --select tag:incremental`

- Run only modified models (CI style):

`dbt build --select state:modified+ --state .\artifacts`

---

## Typical Folder Structure

- `models/` – SQL models + schema YAML
- `seeds/` – CSV seed files
- `snapshots/` – Snapshot definitions
- `macros/` – Reusable Jinja macros
- `tests/` – Generic/singular tests
- `dbt_project.yml` – Project config
- `packages.yml` – Package dependencies

---

## Troubleshooting

- Run `dbt debug` first for connectivity/profile issues.
- Use `dbt compile` to inspect compiled SQL for syntax problems.
- Use `dbt ls --select <pattern>` to confirm node selection.
- Check logs in `target/` and `logs/`.

---

## Quick Start (Windows PowerShell)

- Create and activate venv (optional):
  - `python -m venv .venv`
  - `.\.venv\Scripts\Activate.ps1`
- Install:
  - `pip install dbt-core dbt-databricks`
- Run:
  - `dbt deps`
  - `dbt debug`
  - `dbt build`
  - `dbt docs generate`
  - `dbt docs serve`