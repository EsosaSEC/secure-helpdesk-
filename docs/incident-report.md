# 🔐 Incident Report: Account Lockout Investigation

## 📌 Incident Summary
A user (Anita Doe, HR Department) reported inability to log in after multiple failed login attempts in a domain environment.

---

## 🧾 Ticket Information
- **Ticket ID:** 002
- **User:** Anita Doe
- **Department:** HR
- **Priority:** Medium
- **Status:** Resolved

---

## ⏰ Timeline of Events
| Time | Event |
|------|------|
| T1 | Multiple failed login attempts initiated |
| T2 | User unable to access account |
| T3 | Investigation started in Splunk |
| T4 | Password reset performed via PowerShell |
| T5 | Successful login confirmed |

---

## 🔍 Investigation Details

### Log Analysis
Logs were analyzed using Splunk SIEM.

**Key Event IDs:**
- **4625** → Failed login attempts
- **4624** → Successful login

### Splunk Queries Used:
```
index=endpoint EventCode=4625 Account_Name="Anita Doe"
```
```
index=endpoint EventCode=4625 Account_Name="Anita Doe"
```
### Findings:
- Multiple failed login attempts detected
- Attempts originated from the user’s workstation
- No external or suspicious IP activity observed

---

## ⚠️ Root Cause Analysis
The issue was determined to be:
- Incorrect password entered multiple times by the user

No evidence of:
- Brute-force attack
- Unauthorized access
- External threat actor

---

## 🛠️ Remediation Actions

1. Reset user password using PowerShell:
```
Set-ADAccountPassword -Identity "Anita Doe" -Reset -NewPassword (ConvertTo-SecureString "TempP@ss123!" -AsPlainText -Force)
``` 
2. Forced password change at next login:
```
Set-ADUser -Identity "Anita Doe" -ChangePasswordAtLogon $true
```

3. Verified successful login (Event ID 4624)

---

## ✅ Resolution
- User regained access to the account
- System confirmed successful authentication
- No further suspicious activity detected

---

## 🛡️ Security Recommendations
- Educate users on proper password handling
- Implement account lockout after multiple failed login attempts.
- Monitor repeated failed login attempts
- Enable alerting in SIEM for suspicious login patterns

---

## 🧠 Lessons Learned
- Not all login failures indicate an attack
- Log analysis is critical before remediation
- Automation (PowerShell) improves efficiency
- Help desk and SOC roles often overlap in real-world scenarios

---

## 📎 Supporting Evidence
- Splunk logs (Event ID 4625 & 4624)
- PowerShell script used for password reset
- Screenshots (see /screenshots folder)
