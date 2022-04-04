#Get CompartmentID
oci iam compartment list | grep compartment-id > compartment-id.txt ; cut -f 2 -d ":" compartment-id.txt | tr -d ' ','"',',' | tee compartment-id-tee.txt &>/dev/null ; compartment_id=`cat ./compartment-id-tee.txt` ; rm -rf ./compartment-id* ; echo ${compartment_id}
#Create Policy
oci iam policy create --name OCI_DevOps_Policy_Functions --description OCI_DevOps_Policy_Functions --compartment-id "${compartment_id}" --statements '["Allow dynamic-group OCI_DevOps_Dynamice_Group to manage functions-family in compartment id '${compartment_id}'"]'