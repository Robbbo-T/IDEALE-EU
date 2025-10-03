#!/usr/bin/env python3
import argparse, json, subprocess, sys, yaml
from pathlib import Path

def load_specs(path):
    with open(path, "r", encoding="utf-8") as f:
        return yaml.safe_load(f)

def list_tree(root, exclude, max_depth=6):
    root = Path(root)
    nodes, edges = [], []
    def walk(p, depth):
        if depth > max_depth: return
        rel = str(p)
        nodes.append(rel)
        if p.is_dir():
            for child in sorted(p.iterdir(), key=lambda x: (not x.is_dir(), x.name.lower())):
                if child.name in exclude:
                    continue
                edges.append((rel, str(child)))
                walk(child, depth+1)
    if root.exists():
        walk(root, 0)
    return nodes, edges

def sanitize(s):
    return s.replace("-", "_").replace(".", "_").replace("/", "_")

def render_dot(specs, clusters):
    cfg = {
        "rankdir": specs.get("rankdir","LR"),
        "nodesep": specs.get("nodesep",0.25),
        "ranksep": specs.get("ranksep",0.35),
        "fontname": specs.get("fontname","Inter"),
    }
    lines = [
        'digraph G {',
        f'rankdir={cfg["rankdir"]};',
        f'node [shape=box,fontsize=9,fontname="{cfg["fontname"]}"];',
        f'graph [fontsize=12,fontname="{cfg["fontname"]}"];',
        f'edge  [fontsize=8,fontname="{cfg["fontname"]}"];',
        f'nodesep={cfg["nodesep"]}; ranksep={cfg["ranksep"]};'
    ]
    for c in clusters:
        cid = sanitize(c["label"])
        lines.append(f'subgraph cluster_{cid} {{ label="{c["label"]}"; style=rounded; color=gray50;')
        for n in c["nodes"]:
            lines.append(f'"{n}";')
        for a,b in c["edges"]:
            lines.append(f'"{a}" -> "{b}";')
        lines.append('}')
    lines.append('}')
    return "\n".join(lines)

def main():
    ap = argparse.ArgumentParser(description="Generate carpet trees DOT/PDF")
    ap.add_argument("--spec", default="print/specs/carpet_trees.yaml")
    ap.add_argument("--out-dot", default="cache/carpet_trees.dot")
    ap.add_argument("--out-pdf", default="cache/carpet_trees.pdf")
    ap.add_argument("--render", action="store_true", help="call dot to render PDF")
    args = ap.parse_args()

    specs = load_specs(args.spec)
    exclude = specs.get("exclude", [])
    max_depth = specs.get("max_depth", 6)

    clusters = []
    for c in specs.get("clusters", []):
        nodes, edges = list_tree(c["root"], exclude, max_depth)
        clusters.append({"label": c["label"], "nodes": nodes, "edges": edges})

    Path("cache").mkdir(parents=True, exist_ok=True)
    dot = render_dot(specs, clusters)
    Path(args.out_dot).write_text(dot, encoding="utf-8")

    if args.render:
        try:
            subprocess.run(
                ["dot", "-Tpdf", args.out_dot, "-o", args.out_pdf],
                check=True,
                capture_output=True,
                text=True
            )
        except subprocess.CalledProcessError as e:
            print("Graphviz 'dot' failed. Install graphviz or run without --render.", file=sys.stderr)
            if e.stderr:
                print(f"Error: {e.stderr}", file=sys.stderr)
            sys.exit(1)
        except FileNotFoundError:
            print("Graphviz 'dot' command not found. Install graphviz or run without --render.", file=sys.stderr)
            sys.exit(1)

if __name__ == "__main__":
    main()
