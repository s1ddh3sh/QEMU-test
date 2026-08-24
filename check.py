import json

c = json.load(open("tests_dilithium/pqcrystals_dilithium2_ref_signature_internal/dist/correct_trial000000.json"))
f = json.load(open("tests_dilithium/pqcrystals_dilithium2_ref_signature_internal/dist/faulty_trial000000.json"))

for key in c["captured"]:
    cv, fv = c["captured"][key], f["captured"][key]
    if cv != fv:
        print(f"DIFFERS: {key}")
    else:
        print(f"identical: {key}")