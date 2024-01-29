# napir-ai-poc
azure-becip
# check subscription which is available
az account list --output table

# 最初の初期化項目: 最初に azd を使用して新しい項目を初期化します。これが定例会議棟の基本的な配置です
azd init


# このセッションで実行するすべての Azure CLI コマンドに対して、既定のサブスクリプションを設定します。
az account set --subscription SubscriptionId
# Azure CLI を使用する場合は、既定のリソース グループを設定し、この演習の残りの Azure CLI コマンドでパラメーターを省略できます。 サンドボックス環境で自分用に作成されたリソース グループに、既定値を設定します。
az configure --defaults group=AI-Poc
# Visual Studio Code のターミナルから次のコードを実行して、Bicep テンプレートを Azure にデプロイします。 この操作が完了して、デプロイが成功したことがわかるまで 1、2 分かかる可能性があります
az deployment group create --template-file main.bicep


