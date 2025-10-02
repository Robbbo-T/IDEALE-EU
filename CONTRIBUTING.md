# Contributing to ASI-T2

Thank you for your interest in contributing to the ASI-T2 ecosystem!

## Before You Start

### Read the Master Whitepaper
Familiarize yourself with the [Master Whitepaper](../README.md) to understand:
- Architecture (TFA V2)
- Governance (MAL-EEM)
- Evidence requirements
- Standards and compliance

### Code of Conduct
All contributors must follow the [Code of Conduct](./CODE_OF_CONDUCT.md).

### Ethics Review
Contributions involving sensitive capabilities require **MAL-EEM** ethics review:
- Dual-use technologies
- Defense-related systems
- AI/ML decision systems
- Export-controlled items

## How to Contribute

### 1. Issues and Discussions
- Check existing issues before creating new ones
- Use issue templates (when available)
- Provide clear, reproducible descriptions
- Tag appropriately (bug, enhancement, documentation, etc.)

### 2. Pull Requests

#### Before Submitting
- Fork the repository
- Create a feature branch: `git checkout -b feature/your-feature-name`
- Follow TFA V2 architecture and naming conventions
- Add tests (if applicable)
- Update documentation

#### Commit Guidelines
- Use clear, descriptive commit messages
- Reference issues: `Fix #123: Description`
- Sign commits: `git commit -s`
- Keep commits atomic and focused

#### Pull Request Process
1. Ensure all tests pass
2. Update relevant documentation
3. Include evidence artifacts (if applicable)
4. Request review from maintainers
5. Address review feedback
6. Wait for approval before merging

### 3. Documentation
- Follow Markdown best practices
- Keep language clear and concise
- Include examples where helpful
- Update CITATION.cff if adding citable work

## TFA V2 Architecture Compliance

All contributions must follow the TFA V2 path grammar:

```
domains/<DOMAIN_CODE>/ATA-XX/<XX-XX>_<DESCRIPTION>/S1000D/<LAYER>/<PACK>/<SUBPACK>
```

### Requirements
- **Domain codes**: ALL-CAPS (AAA, AAP, CCC, etc.)
- **ATA chapters**: Standard numbering (ATA-20, ATA-57, etc.)
- **S1000D**: Structured technical documentation
- **Layers**: QS, FWD, UE, FE, CB, QB (as applicable)
- **Packs**: CAx, QOx, PAx

### CI Gates
Pull requests must pass:
- **FCR-1 Lite**: Basic structure, linting, SBOM generation
- **FCR-2 Lite**: Tests, coverage, attestations (for major features)

## Standards and Quality

### Code Quality
- Follow language-specific style guides
- Use linters and formatters
- Write clear, maintainable code
- Include inline documentation for complex logic

### Testing
- Unit tests for new functions
- Integration tests for system interactions
- Simulation tests for aerospace systems
- Document test scenarios and expected outcomes

### Safety and Compliance
- Follow relevant standards (ARP4754A, DO-178C, etc.)
- Document safety considerations
- Include hazard analysis for safety-critical changes
- Ensure ALARP principle compliance

## Evidence and Provenance

For significant contributions, provide:
1. **SBOM**: Dependencies and versions
2. **Hashes**: SHA-256 of artifacts
3. **Tests**: Verification results
4. **Documentation**: Usage and design docs
5. **UTCS Bundle**: Threading metadata

## License and Copyright

### Contributor License
By contributing, you agree to:
- License your contributions under the project license
- Certify you have the right to contribute the work
- Allow redistribution and modification
- Retain references to MAL-EEM and ethical use restrictions

### Copyright
- Retain your copyright
- Grant perpetual, worldwide license to the project
- Allow sublicensing consistent with project goals

### Sign-off
All commits require Developer Certificate of Origin (DCO) sign-off:
```bash
git commit -s
```

## Getting Help

### Resources
- [Master Whitepaper](../README.md)
- [Product Specification Template](../schemas/PRODUCT_SPEC_TEMPLATE.yaml)
- [Evidence Guide](../evidence/README.md)

### Contact
- Open an issue for technical questions
- Use discussions for general questions
- Email maintainers for private matters

## Recognition

Contributors will be recognized in:
- CONTRIBUTORS.md (when created)
- Release notes
- Academic citations (for significant contributions)

## IDEALE-EU Alignment

Contributions should advance the **IDEALE-EU** mission:
- EU sovereign capabilities
- ESG-EU standards
- Sustainable innovation
- Resilient systems
- Public interest R&D

## Review Timeline

- **Initial Review**: Within 7 days
- **Feedback Cycle**: 3-5 days per iteration
- **Final Approval**: After all checks pass and 2+ approvals

## Thank You!

Your contributions help build a verifiable, reproducible, and ethically governed aerospace & defense ecosystem.

---

*Last Updated: 2025-01-02*
