
import frappe

def run():
    companies = [
        {"name": "EDD﻿JI", "domain": "eddji.com"},
        {"name": "E-Cab Service", "domain": "e-cab-service.fr"},
        {"name": "E-Capital CI", "domain": "e-capital-ci.com"},
    ]
    for comp in companies:
        if not frappe.db.exists("Company", comp["name"]):
            doc = frappe.get_doc({"doctype": "Company", "company_name": comp["name"]})
            doc.insert(ignore_permissions=True)
            print(f"Company created: {comp['name']}")
    frappe.db.commit()
