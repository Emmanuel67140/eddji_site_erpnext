
import frappe
import csv
import os

def run():
    csv_path = os.path.join(os.path.dirname(__file__), 'users.csv')
    with open(csv_path, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            email = row['email']
            full_name = row['full_name']
            role = row['role']
            password = row['password']
            # create or update
            if not frappe.db.exists("User", email):
                user = frappe.new_doc("User")
                user.email = email
                user.first_name = full_name
                user.new_password = password
                user.insert(ignore_permissions=True)
                user.add_roles(role)
                frappe.db.commit()
                print(f"Utilisateur créé : {email} / {role}")
            else:
                user = frappe.get_doc("User", email)
                user.first_name = full_name
                user.new_password = password
                user.save(ignore_permissions=True)
                user.set_password(password)
                frappe.db.commit()
                print(f"Utilisateur mis à jour : {email} / {role}")
                # check role
                if not frappe.db.get_value("Has Role", {"parent": email, "role": role}):
                    user.add_roles(role)
    print("Tous les utilisateurs ont été traités avec succès.")
