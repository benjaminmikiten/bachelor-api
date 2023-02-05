[
   {
      "essential": true,
      "name": "${APP_NAME}",
      "image": "${REPOSITORY_URL}",
      "portMappings": [
         {
            "containerPort": 3000,
            "hostPort": 3000,
            "protocol": "tcp"
         }
      ],
      "environment": [
         {
            "name": "POSTGRES_USER",
            "value": "${POSTGRES_USERNAME}"
         },
         {
            "name": "POSTGRES_PASSWORD",
            "value": "${POSTGRES_PASSWORD}"
         },
         {
            "name": "POSTGRES_ENDPOINT",
            "value": "${POSTGRES_ENDPOINT}"
         },
         {
            "name": "POSTGRES_DATABASE",
            "value": "${POSTGRES_DATABASE}"
         },
         {
            "name": "APP_PORT",
            "value": "${APP_PORT}"
         }
      ]
   }
]