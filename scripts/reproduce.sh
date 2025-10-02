#!/bin/bash
# Reproduction script template for ASI-T2 releases
# This is a template - actual scripts will be version-specific

set -e  # Exit on error

RELEASE_VERSION="${1:-v0.1.0}"
REPO_URL="https://github.com/Robbbo-T/IDEALE-EU.git"

echo "=========================================="
echo "ASI-T2 Release Reproduction Script"
echo "=========================================="
echo "Version: ${RELEASE_VERSION}"
echo "Date: $(date)"
echo ""

# Step 1: Environment Check
echo "[1/7] Checking environment..."
if ! command -v git &> /dev/null; then
    echo "Error: git is required but not installed."
    exit 1
fi

if ! command -v sha256sum &> /dev/null; then
    echo "Error: sha256sum is required but not installed."
    exit 1
fi

echo "✓ Environment check passed"
echo ""

# Step 2: Clone Repository (if not already in repo)
if [ ! -d ".git" ]; then
    echo "[2/7] Cloning repository..."
    git clone "${REPO_URL}" asi-t2
    cd asi-t2
else
    echo "[2/7] Already in repository, skipping clone..."
fi
echo ""

# Step 3: Checkout Release
echo "[3/7] Checking out release ${RELEASE_VERSION}..."
git fetch --tags
git checkout "${RELEASE_VERSION}"
echo "✓ Checked out ${RELEASE_VERSION}"
echo ""

# Step 4: Verify Signature
echo "[4/7] Verifying git tag signature..."
if git tag -v "${RELEASE_VERSION}" &> /dev/null; then
    echo "✓ Signature verified"
else
    echo "⚠ Warning: Could not verify signature (GPG key may not be imported)"
fi
echo ""

# Step 5: Verify SBOM
echo "[5/7] Verifying SBOM..."
SBOM_FILE="evidence/sboms/sbom-${RELEASE_VERSION}.spdx.json"
if [ -f "${SBOM_FILE}" ]; then
    if [ -f "evidence/hashes/${SBOM_FILE##*/}.sha256" ]; then
        cd evidence/hashes
        sha256sum -c "${SBOM_FILE##*/}.sha256"
        cd ../..
        echo "✓ SBOM verified"
    else
        echo "⚠ Warning: SBOM hash file not found"
    fi
else
    echo "⚠ Warning: SBOM not found (may not be available for this release)"
fi
echo ""

# Step 6: Verify UTCS Bundle
echo "[6/7] Verifying UTCS bundle..."
UTCS_FILE="evidence/utcs_bundles/utcs-${RELEASE_VERSION}.yaml"
if [ -f "${UTCS_FILE}" ]; then
    if [ -f "evidence/hashes/${UTCS_FILE##*/}.sha256" ]; then
        cd evidence/hashes
        sha256sum -c "${UTCS_FILE##*/}.sha256"
        cd ../..
        echo "✓ UTCS bundle verified"
    else
        echo "⚠ Warning: UTCS bundle hash file not found"
    fi
else
    echo "⚠ Warning: UTCS bundle not found (may not be available for this release)"
fi
echo ""

# Step 7: Run Tests (if available)
echo "[7/7] Running tests..."
if [ -f "scripts/test-${RELEASE_VERSION}.sh" ]; then
    echo "Running version-specific tests..."
    bash "scripts/test-${RELEASE_VERSION}.sh"
    echo "✓ Tests completed"
elif [ -f "scripts/test.sh" ]; then
    echo "Running general tests..."
    bash "scripts/test.sh"
    echo "✓ Tests completed"
else
    echo "ℹ No test script found for this release"
fi
echo ""

# Summary
echo "=========================================="
echo "Reproduction Summary"
echo "=========================================="
echo "Release: ${RELEASE_VERSION}"
echo "Status: Verification completed"
echo ""
echo "Next steps:"
echo "1. Review evidence in evidence/ directory"
echo "2. Check demos in evidence/videos_logs/"
echo "3. Examine product documentation"
echo "4. Run simulations (if applicable)"
echo ""
echo "For questions or issues:"
echo "https://github.com/Robbbo-T/IDEALE-EU/issues"
echo ""
echo "=========================================="
