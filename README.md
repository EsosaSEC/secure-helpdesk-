
# 🔐 Secure Help Desk + SOC Lab

## 📌 Overview
This project simulates a real-world IT support and cybersecurity scenario involving failed login attempts and account recovery in an Active Directory environment.

## 🎯 Objectives
- Simulate failed login attempts on a domain user
- Investigate logs using Splunk with basic queries
- Reset and unlock account using PowerShell
- Verify successful authentication after remediation


## 🧱 Lab Environment
- Windows Server 2022 (Active Directory Domain Controller)
- Windows 10 client (TARGET-PC1) joined to the domain
- Splunk (for log monitoring)
- PowerShell for automation

## 🧪 Scenario:
**User:** Anita Doe (HR Department)  
**Issue:** Unable to log in after multiple failed attempts. User forgot password.

## 🔍 Investigation
Used the following basic Splunk queries:

**Failed Logon Attempts:**
```
Index=endpoint host="TARGET-PC1" EventCode=4625, Account_Name=Anita
```

**Successful Logon Attempts:**
```
Index=endpoint host="TARGET-PC1" EventCode=4624, Account_Name=Anita
```

**Findings:**
- Multiple Event ID 4625 (failed logins) detected
- Failure reasons observed on Splunk:
  - Unknown username or bad password
- All attempts originated from the user’s own workstation (TARGET-PC1)
- No external IPs detected → Likely user error (forgotten/expired password)

## 🔐 Remediation
- Reset password using PowerShell script
- Forced user to change password at next login

## ✅ Verification
- Successful login confirmed via Event ID 4624
- User able to set new strong password

## 🛠️ Tools Used
- Active Directory
- Splunk (SIEM)
- PowerShell
- Windows Event Logs

## 🧠 Key Takeaways
- Help desk tasks can reveal important security insights
- Log analysis helps distinguish between user error and real attacks
- Simple, clear Splunk queries are effective for daily SOC work
- Proper documentation is key for both resolution and prevention

## 🚀 Future Improvements
- Simulate real brute-force attack from Kali Linux (Ticket #003)
- Add Sysmon for richer logs
- Create Splunk alerts for repeated failed logins
- Implement MFA and stronger Group Policy settings

---

Made with ❤️ in Lagos, Nigeria  
Last updated: April 2026
