"""Benchmark stub — replace with real benchmark logic."""
import argparse
import json
import time


def run_benchmarks() -> dict:
    results = {}
    start = time.perf_counter()
    # TODO: add real benchmark cases
    results["placeholder_ms"] = round((time.perf_counter() - start) * 1000, 3)
    return results


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", required=True, help="Output JSON path")
    args = parser.parse_args()

    data = run_benchmarks()
    with open(args.output, "w") as f:
        json.dump(data, f, indent=2)
    print(f"Bench results written to {args.output}")
