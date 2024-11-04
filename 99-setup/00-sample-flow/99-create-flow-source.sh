archy create \
    --recreate \
    --forceUnlock \
    --file CXaC_VoiceInbound_Simple_v1-0.yaml \
    --clientId $TF_VAR_SOURCE_CLIENTID \
    --clientSecret $TF_VAR_SOURCE_CLIENTSECRET \
    --location $TF_VAR_SOURCE_ORG \
    --outputDir .