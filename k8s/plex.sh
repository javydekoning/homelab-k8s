API_TOKEN_CLEAN=claim-superdupersecret
API_TOKEN_OPAQUE=$(echo -n ${API_TOKEN_CLEAN} | base64)