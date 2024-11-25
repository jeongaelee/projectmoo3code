@description('The description of the OpenAI backend pool')
param openAIBackendPoolDescription string = 'Load balancer for multiple OpenAI endpoints'

resource backendPoolOpenAI 'Microsoft.ApiManagement/service/backends@2023-09-01-preview' = {
    name: '{your-api-name}/openai-instance-backend-pool'
    properties: {
        description: openAIBackendPoolDescription
        type: 'Pool'
        pool: {
        services: [
            {
            id: '/subscriptions/{your-subscription-id}/resourceGroups/{your-resource-group-name}/providers/Microsoft.ApiManagement/service/{your-api-name}/backends/{your-open-ai-1}'
            priority: 1
            weight: 3
            }
            {
            id: '/subscriptions/{your-subscription-id}/resourceGroups/{your-resource-group-name}/providers/Microsoft.ApiManagement/service/{your-api-name}/backends/{your-open-ai-2}'
            priority: 1
            weight: 1
            }
        ]
        }
    }
}
