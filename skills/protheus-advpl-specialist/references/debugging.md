# ADVPL and TLPP Debugging

Use this reference when diagnosing compile, runtime, lock, or performance problems.

## Triage Order

1. Capture the exact error text, failing routine, and reproduction path.
2. Decide whether the issue is compile-time, runtime, DB/lock, or performance.
3. Inspect variable types, active aliases, index order, filial filter, and lock handling near the failing line.
4. Add temporary logging only where it narrows the failure path.
5. Validate the fix and remove noisy diagnostics.

## Fast Checks

| Symptom | First Check |
|---|---|
| `Variable does not exist` | declaration typo, scope, branch not entered |
| type mismatch or NIL access | `ValType()` and nullability before the operation |
| invalid alias | `DbSelectArea()` order and whether the alias is open |
| lock timeout | `RecLock(cAlias, .F.)`, unlock path, concurrent editor |
| slow routine | wrong `DbSetOrder()`, table scan, looped queries, array growth |

## Logging

- Use `Conout()` for short-lived local debugging.
- Prefer `FWLogMsg()` for structured application diagnostics.
- Avoid `MsgAlert()` for server-side troubleshooting.

## Error Capture Pattern

```advpl
Local oError
Local bOldError := ErrorBlock({|e| oError := e, Break(e)})

Begin Sequence
    // risky code
Recover Using oError
    Conout("Erro: " + oError:Description)
End Sequence

ErrorBlock(bOldError)
```

## Lock Checklist

- Always test the return from `RecLock()`.
- Always `MsUnlock()` after a successful lock.
- Keep the lock window short.
- Lock records in a consistent order when more than one record is touched.

## Performance Checklist

- Confirm the search key matches the active index.
- Prefer one SQL query over N repeated lookups inside loops.
- Use Embedded SQL for complex filtering and aggregation.
- Close temporary aliases promptly.
