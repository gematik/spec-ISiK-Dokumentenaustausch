Invariant: val-audit-source
Description: "The Audit Source is this agent too."
Severity: #error
Expression: "$this.who = %resource.source.observer"