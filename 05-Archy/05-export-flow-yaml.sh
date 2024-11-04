archy export \
    --clientId $TF_VAR_SOURCE_CLIENTID \
    --clientSecret $TF_VAR_SOURCE_CLIENTSECRET \
    --location $TF_VAR_SOURCE_ORG \
    --flowName CXaC_VoiceInbound_Simple \
    --flowType inboundcall \
    --exportType yaml \
    --outputDir .