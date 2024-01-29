import subprocess
import json

def check_storage_account_exists(account_name):
    try:
        
        result = subprocess.run(
            f"az storage account check-name --name {account_name} --output json",
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            shell=True
        )
        # print(command)
        output = json.loads(result.stdout)
        print(output)
        # return not output['nameAvailable']
    except subprocess.CalledProcessError as e:
        print(f"An error occurred: {e}")
        return False

def deploy_storage_account(resource_group, template_file, account_name):
    parameters = {
        "storageAccountName": account_name
    }
    parameters_args = ["--parameters"] + [f"{key}={value}" for key, value in parameters.items()]

    command = [
        "az", "deployment", "group", "create",
        "--name", "StorageAccountDeployment",
        "--resource-group", resource_group,
        "--template-file", template_file
    ] + parameters_args

    try:
        # subprocess.run(command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        print(command)
    except subprocess.CalledProcessError as e:
        print(f"Storage Account deployment failed: {e}")

# 主逻辑
storage_account_name = "mystorageaccount"
resource_group_name = "AI-Poc"
template_file = "storageAccount.bicep"
 # 确保这个文件在您的脚本运行目录

# 检查 Storage Account 是否存在
if check_storage_account_exists(storage_account_name):
    print(f"Storage Account '{storage_account_name}' already exists. Skipping creation.")
else:
    print(f"Storage Account '{storage_account_name}' does not exist. Creating...")
    # deploy_storage_account(resource_group_name, template_file, storage_account_name)
